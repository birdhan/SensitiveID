package cn.yh.books.order.web.servlet;



import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.yh.books.book.domain.Book;
import cn.yh.books.ci.domain.CartItem;
import cn.yh.books.ci.service.CartItemService;
import cn.yh.books.order.dao.PaymentUtil;
import cn.yh.books.order.domain.Order;
import cn.yh.books.order.domain.OrderItem;
import cn.yh.books.order.service.OrderService;
import cn.yh.books.page.domain.PageBean;
import cn.yh.books.user.domain.User;
import cn.yh.tools.commons.CommonUtils;
import cn.yh.tools.servlet.BaseServlet;

public class OrderServlet extends BaseServlet {
   private OrderService orderservice=new OrderService();
   private CartItemService cis=new CartItemService();
   
   
   /**
	 * 私有方法，获取当前页
	 * @param request
	 * @return
	 */
	private int getPC(HttpServletRequest request){
		int pc=1;
		String param=request.getParameter("pc");
		if(param!=null&&!param.trim().isEmpty()){
			try{
			pc=Integer.parseInt(param);
			}catch(RuntimeException e){		
			}
		}
		return pc;
		
	}
	/**
	 * 私有方法，获取请求
	 * @param request
	 * @return
	 */
	private String getUrl(HttpServletRequest request){
		String url=request.getRequestURI()+"?"+request.getQueryString();
		int index=url.lastIndexOf("&pc=");
		if(index!=-1){
			url=url.substring(0,index);
		}
		return url;
	}
	
	public String myOrder(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		//1.得到pc，如果页面传递了，使用页面传递，如果没有，pc=1;
		int pc=this.getPC(request);
		//2.得到url
		String url=this.getUrl(request);
		//3.获得查询条件，当前用户uid
		String uid=((User)(request.getSession().getAttribute("user"))).getUid();
		//4.使用pc和uid完成查询
		PageBean<Order> pb=orderservice.myorder(uid, pc);
		//5. 给pb设置url,把pb保存到请求中，返回显示图书页面
		pb.setUrl(url);
		request.setAttribute("tp", pb.getTP());
		request.setAttribute("pb", pb);
		return "f:/jsps/order/list.jsp";
		
	}
	/**
	 * 添加订单到数据库
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public String add(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		//1.获取购物车中所有条目编号
		String cartItemIds=request.getParameter("cartItemIds");
		List<CartItem> cartitemlist=cis.loadCI(cartItemIds);
		//2.创建ORDER
		Order order=new Order();
		order.setOid(CommonUtils.uuid());
		order.setOrdertime(String.format("%tF %<tT", new Date()));
		BigDecimal total=new BigDecimal("0");
	    for(CartItem cartitem: cartitemlist){
	    	total=total.add(new BigDecimal(cartitem.getTotal()+""));
	    }
		order.setTotal(total.doubleValue());
		order.setStatus(1);
		order.setAddress(request.getParameter("address"));
		order.setUser((User)request.getSession().getAttribute("user"));
		
		//3. 创建list<orderItem> 储存对应的条目信息
		List<OrderItem> itemList=new ArrayList<OrderItem>();
		for(CartItem cartitem:cartitemlist){
			OrderItem orderitem=new OrderItem();
			orderitem.setOrderItemId(CommonUtils.uuid());
			orderitem.setQuantity(cartitem.getQuantity());
			orderitem.setSubtotal(cartitem.getTotal());
			orderitem.setBid(cartitem.getBook().getBid());
			orderitem.setBname(cartitem.getBook().getBname());
			orderitem.setCurrPrice(cartitem.getBook().getCurrPrice());
			orderitem.setImage_b(cartitem.getBook().getImage_b());
			orderitem.setOrder(order);	
			itemList.add(orderitem);
		}
		order.setItemList(itemList);
		orderservice.add(order);	
		//4.保存信息，并返回
		request.setAttribute("order", order);
		return "f:/jsps/order/ordersucc.jsp";
	}
	/**
	 * 加载订单详情页待处理
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String load(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		String oid=request.getParameter("oid");
		String btn=request.getParameter("btn");
		Order order=orderservice.load(oid);
		request.setAttribute("order", order);
		request.setAttribute("btn", btn);
		return "f:/jsps/order/desc.jsp";
		
	}
	/**
	 * 取消订单
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String cancel(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		String oid=request.getParameter("oid");
		int status=orderservice.findStatus(oid);
		if(status!=1){
			request.setAttribute("code", "error");
			request.setAttribute("msg", "状态不对，不能取消");
			return "f:/jsps/msg.jsp";
		}
		orderservice.UpdateStatus(oid, "5");
		request.setAttribute("code", "success");
		request.setAttribute("msg", "您已取消该订单");
		return "f:/jsps/msg.jsp";
	}
	/**
	 * 确认收货
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String confirm(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		String oid=request.getParameter("oid");
		int status=orderservice.findStatus(oid);
		if(status!=3){
			request.setAttribute("code", "error");
			request.setAttribute("msg", "状态不对");
			return "f:/jsps/msg.jsp";
		}
		orderservice.UpdateStatus(oid, "4");
		request.setAttribute("code", "success");
		request.setAttribute("msg", "您已确认收货");
		return "f:/jsps/msg.jsp";
	}
	/**
	 * 支付准备
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String pay(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		String oid=request.getParameter("oid");
		Order order=orderservice.load(oid);
		request.setAttribute("order", order);
		return "f:/jsps/order/pay.jsp";
	}
	/**
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String payment(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		Properties props = new Properties();
		props.load(this.getClass().getClassLoader().getResourceAsStream("payment.properties"));
		/*
		 * 1. 准备13个参数
		 */
		String p0_Cmd = "Buy";//业务类型，固定值Buy
		String p1_MerId = props.getProperty("p1_MerId");//商号编码，在易宝的唯一标识
		String p2_Order = request.getParameter("oid");//订单编码
		String p3_Amt = "0.01";//支付金额
		String p4_Cur = "CNY";//交易币种，固定值CNY
		String p5_Pid = "";//商品名称
		String p6_Pcat = "";//商品种类
		String p7_Pdesc = "";//商品描述
		String p8_Url = props.getProperty("p8_Url");//在支付成功后，易宝会访问这个地址。
		String p9_SAF = "";//送货地址
		String pa_MP = "";//扩展信息
		String pd_FrpId = request.getParameter("yh");//支付通道,银行
		String pr_NeedResponse = "1";//应答机制，固定值1
		
		/*
		 * 2. 计算hmac
		 * 需要13个参数
		 * 需要keyValue
		 * 需要加密算法
		 */
		String keyValue = props.getProperty("keyValue");
		String hmac = PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt,
				p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP,
				pd_FrpId, pr_NeedResponse, keyValue);
		
		/*
		 * 3. 重定向到易宝的支付网关
		 */
		StringBuilder sb = new StringBuilder("https://www.yeepay.com/app-merchant-proxy/node");
		sb.append("?").append("p0_Cmd=").append(p0_Cmd);
		sb.append("&").append("p1_MerId=").append(p1_MerId);
		sb.append("&").append("p2_Order=").append(p2_Order);
		sb.append("&").append("p3_Amt=").append(p3_Amt);
		sb.append("&").append("p4_Cur=").append(p4_Cur);
		sb.append("&").append("p5_Pid=").append(p5_Pid);
		sb.append("&").append("p6_Pcat=").append(p6_Pcat);
		sb.append("&").append("p7_Pdesc=").append(p7_Pdesc);
		sb.append("&").append("p8_Url=").append(p8_Url);
		sb.append("&").append("p9_SAF=").append(p9_SAF);
		sb.append("&").append("pa_MP=").append(pa_MP);
		sb.append("&").append("pd_FrpId=").append(pd_FrpId);
		sb.append("&").append("pr_NeedResponse=").append(pr_NeedResponse);
		sb.append("&").append("hmac=").append(hmac);
		
		response.sendRedirect(sb.toString());
		return null;
	}
	
	public String back(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		/*
		 * 1. 获取12个参数
		 */
		String p1_MerId = request.getParameter("p1_MerId");
		String r0_Cmd = request.getParameter("r0_Cmd");
		String r1_Code = request.getParameter("r1_Code");
		String r2_TrxId = request.getParameter("r2_TrxId");
		String r3_Amt = request.getParameter("r3_Amt");
		String r4_Cur = request.getParameter("r4_Cur");
		String r5_Pid = request.getParameter("r5_Pid");
		String r6_Order =request.getParameter("r6_Order");
		String r7_Uid = request.getParameter("r7_Uid");
		String r8_MP = request.getParameter("r8_MP");
		String r9_BType = request.getParameter("r9_BType");
		String hmac = request.getParameter("hmac");
		/*
		 * 2. 获取keyValue
		 */
		Properties props = new Properties();
		props.load(this.getClass().getClassLoader().getResourceAsStream("payment.properties"));
		String keyValue = props.getProperty("keyValue");
		/*
		 * 3. 调用PaymentUtil的校验方法来校验调用者的身份
		 *   >如果校验失败：保存错误信息，转发到msg.jsp
		 *   >如果校验通过：
		 *     * 判断访问的方法是重定向还是点对点，如果要是重定向
		 *     修改订单状态，保存成功信息，转发到msg.jsp
		 *     * 如果是点对点：修改订单状态，返回success
		 */
		boolean bool = PaymentUtil.verifyCallback(hmac, p1_MerId, r0_Cmd, r1_Code, r2_TrxId,
				r3_Amt, r4_Cur, r5_Pid, r6_Order, r7_Uid, r8_MP, r9_BType,
				keyValue);
		if(!bool) {
			request.setAttribute("code", "error");
			request.setAttribute("msg", "无效的签名，支付失败！（你不是好人）");
			return "f:/jsps/msg.jsp";
		}
		if(r1_Code.equals("1")) {
			orderservice.UpdateStatus(r6_Order, "2");
			if(r9_BType.equals("1")) {
				request.setAttribute("code", "success");
				request.setAttribute("msg", "恭喜，支付成功！");
				return "f:/jsps/msg.jsp";				
			} else if(r9_BType.equals("2")) {
				response.getWriter().print("success");
			}
		}
		return null;
	}
	
}

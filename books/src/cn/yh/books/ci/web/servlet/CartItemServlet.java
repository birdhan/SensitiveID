package cn.yh.books.ci.web.servlet;



import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.yh.books.book.domain.Book;
import cn.yh.books.ci.domain.CartItem;
import cn.yh.books.ci.service.CartItemService;
import cn.yh.books.user.domain.User;
import cn.yh.tools.commons.CommonUtils;
import cn.yh.tools.servlet.BaseServlet;

public class CartItemServlet extends BaseServlet {
	private CartItemService cis=new CartItemService();
	
	/**
	 * 我的购物车
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String mycart(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		//1.得到当前登录用户uid
		User user=(User)request.getSession().getAttribute("user");
		String uid=user.getUid();
        //2.调用Sevice层的findByUser()方法得到该用户的购物车
		List<CartItem> cilist=cis.findByUser(uid);
		//3.把该用户的购物车装载到请求中，转发回我的购物车页面list.jsp
		request.setAttribute("cilist", cilist);
		return "f:/jsps/cart/list.jsp";
	}
	/**
	 * 添加
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String add(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		//1.封装表单数据到CartItem
		CartItem ci=CommonUtils.toBean(request.getParameterMap(), CartItem.class);
		Book book=CommonUtils.toBean(request.getParameterMap(), Book.class);
		User user=(User) request.getSession().getAttribute("user");
		ci.setBook(book);
		ci.setUser(user);
		//2.调用业务层方法实现添加操作
		cis.add(ci);
		//3.查询购物车，显示
		return mycart(request,response);
		
	}
	/**
	 * 删除，批量删除
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String batchDelete(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		//1.从页面中获取要删除的记录的ids
		String cartItemIds=request.getParameter("cartItemIds");
		//2.执行删除
		cis.batchDelete(cartItemIds);
		//3.并返回
		return this.mycart(request, response);
	}
	/**
	 * 通过+ - 按钮修改数量
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String updateQuantity(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		String cartItemId=request.getParameter("cartItemId");
		int quantity=Integer.parseInt(request.getParameter("quantity"));
		CartItem ci=cis.updateQuantity(cartItemId, quantity);
		//给客户端返回一个json对象
		StringBuilder sb=new StringBuilder("{");   //{"quantity":3,"subtotal":23.5}
		sb.append("\"quantity\"").append(":").append(ci.getQuantity());  
		sb.append(",");
		sb.append("\"subtotal\"").append(":").append(ci.getTotal());
		sb.append("}");
		
		response.getWriter().print(sb);
		return sb.toString();	
	}
	
	/**
	 * 结算
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String loadCI(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		//1.获取请求数据
		String cartItemIds=request.getParameter("cartItemIds");
		Double z_total=Double.parseDouble(request.getParameter("hiddenTotal"));
		//2.执行
		List<CartItem> cilist=cis.loadCI(cartItemIds);
		//3.保存，返回
		request.setAttribute("cilist", cilist);
		request.setAttribute("z_total", z_total);
		request.setAttribute("cartItemIds", cartItemIds);
		
		return "f:/jsps/cart/showitem.jsp";
		
		
		
		
	}
}

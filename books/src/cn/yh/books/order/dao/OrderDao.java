package cn.yh.books.order.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;



import cn.yh.books.book.domain.Book;
import cn.yh.books.order.domain.Order;
import cn.yh.books.order.domain.OrderItem;
import cn.yh.books.page.domain.Expression;
import cn.yh.books.page.domain.PageBean;
import cn.yh.books.page.domain.PageConstants;
import cn.yh.tools.commons.CommonUtils;
import cn.yh.tools.jdbc.TxQueryRunner;

public class OrderDao {
private TxQueryRunner tqr=new TxQueryRunner();
	
	/**
	 * 公共查询方法
	 * @param explist
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Order> findByCriteria(List<Expression> explist,int pc) throws SQLException{
		//1.得到ps,当前页要显示的记录数
		//得到当前页要显示的最多记录数
		int ps=PageConstants.Book_PAGE_SIZE;
		//2.通过Expression生成WHERE子句  where bname=? and cid = ?  and pid is null
		StringBuilder wheresql=new StringBuilder();
		wheresql.append(" where 1=1");
		List<Object> params=new ArrayList<Object>();
		for(Expression expr:explist){
			wheresql.append(" and ").append(expr.getName()).append(" ").append(expr.getOperator()).append(" ");
			if(!expr.getOperator().equals("is null")){
				wheresql.append("?");	
				params.add(expr.getValue());
			}	
		}
	    //3.得到要显示的总记录数tr
		String countsql="select count(*) from t_Order "+wheresql;
		Number number=(Number)tqr.query(countsql,new ScalarHandler(), params.toArray());
		int tr=number.intValue();		
		//4.得到BeanList ,也就是当前页的的所有记录  ps*(pc-1)
		String sql="select * from t_Order"+wheresql+" order by ordertime limit ?,?";	
		params.add((pc-1)*ps);//当前要显示的页的起始行
		params.add(ps);
		List<Order> beanList=tqr.query(sql, new BeanListHandler<Order>(Order.class), params.toArray());
		//遍历每个订单，为他添加它的条目信息
		for(Order order:beanList){
			this.loadOrderItem(order);
		}
		//5.创建PageBean ,得到参数，其中没有URL,直接交给Servlet处理。
		PageBean<Order> pb=new PageBean<Order>();
		pb.setBeanList(beanList);
		pb.setPc(pc);
		pb.setPs(ps);
		pb.setTr(tr);
		return pb;
	}
	/**
	 * 关联订单条目到指定Order对象上
	 * @param order
	 * @throws SQLException
	 */
	private void loadOrderItem(Order order) throws SQLException{
		String sql="select * from t_orderitem where oid=?";
		List<Map<String,Object>> maplist=tqr.query(sql, new MapListHandler(),order.getOid());
		List<OrderItem> orderItemList=this.toOrderItemList(maplist);
		
		order.setItemList(orderItemList);
	}
	/**
	 * 映射多个map,转换成OrderItem
	 * @param maplist
	 * @return
	 */
	private List<OrderItem> toOrderItemList(List<Map<String,Object>> maplist){
		List<OrderItem> orderItemList=new ArrayList<OrderItem>();
		for(Map<String,Object> map:maplist){
			OrderItem orderitem=this.toOrderItem(map);
			orderItemList.add(orderitem);
		}
		return orderItemList;
	}
	/**
	 * 关联书籍信息到订单条目对象中
	 * @param map
	 * @return
	 */
	private OrderItem toOrderItem(Map<String,Object> map){
		OrderItem orderItem=new OrderItem();
		Book book=CommonUtils.toBean(map,Book.class);
		orderItem.setBid(book.getBid());
		orderItem.setBname(book.getBname());
		orderItem.setCurrPrice(book.getCurrPrice());
		orderItem.setImage_b(book.getImage_b());
		orderItem.setQuantity((Integer)map.get("quantity"));//从MAP中直接提取数量
	    orderItem.setSubtotal(orderItem.getCurrPrice()*orderItem.getQuantity());//计算的小计
		
		return orderItem;
	}
	
	/**
	 * 按当前用户查询他的所有订单
	 * @param uid
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Order> findByUid(String uid,int pc) throws SQLException{
		List<Expression> explist=new ArrayList<Expression>();
		explist.add(new Expression("uid","=",uid));
		return this.findByCriteria(explist, pc);
		
	}
	/**
	 * 添加订单到数据库中
	 * @param order
	 * @throws SQLException
	 */
	public void add(Order order) throws SQLException{
		//1.添加订单信息到ORDER表
		String sql="insert into t_order values(?,?,?,?,?,?)";
		Object[] params={order.getOid(),order.getOrdertime(),order.getTotal(),order.getStatus(),order.getAddress(),order.getUser().getUid()};
		tqr.update(sql, params);
		//2.添加订单的详细条目信息到条目表
		sql="insert into t_orderitem values(?,?,?,?,?,?,?,?)";
		int len=order.getItemList().size();
		Object[][] objs=new Object[len][];
		for(int i=0;i<len;i++){
			OrderItem item=order.getItemList().get(i);
			objs[i]=new Object[]{item.getOrderItemId(),item.getQuantity(),item.getSubtotal(),item.getBid(),item.getBname(),item.getCurrPrice(),item.getImage_b(),item.getOrder().getOid()};
		}
		tqr.batch(sql, objs);
	}
	/**
	 * 查询当前订单状态
	 * @param oid
	 * @return
	 * @throws SQLException
	 */
	public int findStatus(String oid) throws SQLException{
		String sql="select status from t_order where oid=?";
		Number number=(Number)tqr.query(sql, new ScalarHandler(), oid);
		return number.intValue();
		
	}
	/**
	 * 修改订单状态
	 * @param oid
	 * @param status
	 * @throws SQLException
	 */
	public void UpdateStatus(String oid,String status) throws SQLException{
		String sql="update t_order set status=? where oid=?";
		tqr.update(sql,status,oid);
		
	}
	/**
	 * 加载订单
	 * @param oid
	 * @return
	 * @throws SQLException
	 */
	public Order load(String oid) throws SQLException{
		String sql="select * from t_order where oid=?";
		Order order=tqr.query(sql,new BeanHandler<Order>(Order.class), oid);
		this.loadOrderItem(order);
		return order;
	}
	

}

package cn.yh.books.order.service;

import java.sql.SQLException;

import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.yh.books.order.dao.OrderDao;
import cn.yh.books.order.domain.Order;
import cn.yh.books.page.domain.PageBean;
import cn.yh.tools.jdbc.JdbcUtils;

public class OrderService {
   private OrderDao orderdao=new OrderDao();
   /**
    * 我的订单功能
    * @param uid
    * @param pc
    * @return
    */
   public PageBean<Order> myorder(String uid,int pc){
	   try {
		JdbcUtils.beginTransaction();
		PageBean<Order> pb=orderdao.findByUid(uid, pc);
		try{
		 JdbcUtils.commitTransaction();
		}catch(SQLException e){
			JdbcUtils.rollbackTransaction();
		}
		return pb;
	} catch (SQLException e) {
		throw new RuntimeException(e);
	}
	   
   }
   /**
    * 添加订单到数据库中
    * @param order
    */
   public void add(Order order){
	   try {
		JdbcUtils.beginTransaction();
		orderdao.add(order);
		try{
			 JdbcUtils.commitTransaction();
			}catch(SQLException e){
			 JdbcUtils.rollbackTransaction();
			}
	} catch (SQLException e) {
		throw new RuntimeException(e);
	}
   }
   
   
/**
 * 查询待处理的订单
 * @param oid
 * @return
 */
	public int findStatus(String oid) {
		try {
			return orderdao.findStatus(oid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
	}
	/**
	 * 修改订单状态
	 * @param oid
	 * @param status
	 */
	public void UpdateStatus(String oid,String status) {
		try {
			orderdao.UpdateStatus(oid, status);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 加载订单
	 * @param oid
	 * @return
	 */
	public Order load(String oid){
		try {
			return orderdao.load(oid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}

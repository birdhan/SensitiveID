package cn.yh.books.ci.service;

import java.sql.SQLException;
import java.util.List;

import cn.yh.books.ci.dao.CartItemDao;
import cn.yh.books.ci.domain.CartItem;

public class CartItemService {
	private CartItemDao cidao=new CartItemDao();
	
	/**
	 * 加载我的购物车信息
	 * @param uid
	 * @return
	 */
	public List<CartItem> findByUser(String uid) {
		try {
			return cidao.findByUser(uid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 添加购物车
	 * @param ci
	 */
	public void add(CartItem ci) {
		try {
			//1.使用findByUidWAndBid的方法查找记录
			CartItem isci=cidao.findByUidAndBid(ci.getUser().getUid(), ci.getBook().getBid());
			//2.根据结果判断当前购物车中该用户是否已经选则了该本书
			if(isci==null){
				cidao.add(ci);
			}else{
				cidao.updateQuantity(isci.getCartItemId(), isci.getQuantity()+ci.getQuantity());
			}
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 删除与批量删除
	 * @param cartItemIds
	 */
	 public void batchDelete(String cartItemIds){
		 try {
			cidao.batchDelete(cartItemIds);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	 }
	 
	 /**
	  * 点击加，减按钮修改数量
	  * @param cartItemId
	  * @param quantity
	  */
	 public CartItem updateQuantity(String cartItemId,int quantity) {
		 try {
			cidao.updateQuantity(cartItemId, quantity);
			return cidao.findByCartItem(cartItemId);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	 }
	 /**
	  * 结算
	  * @param cartItemIds
	  * @return
	  */
	 public List<CartItem> loadCI(String cartItemIds){
		 try {
			return cidao.loadCI(cartItemIds);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		 
	 }
}

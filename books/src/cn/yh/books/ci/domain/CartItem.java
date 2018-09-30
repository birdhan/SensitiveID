package cn.yh.books.ci.domain;

import java.math.BigDecimal;

import cn.yh.books.book.domain.Book;
import cn.yh.books.user.domain.User;

public class CartItem {
   private String cartItemId;//主键，id
   private int quantity;//购物车中已选的该商品的数量
   private Book book;//外键关联实体，书
   private User user;//外键关联实体，用户
   
   private double total;//小计
   
   
 public void setTotal() {
	   //解决double类型不精确地问题
	   BigDecimal b1=new BigDecimal(book.getCurrPrice()+"");
	   BigDecimal b2=new BigDecimal(quantity+"");
	   BigDecimal b3=b1.multiply(b2);
	   this.total=b3.doubleValue();
 }
 
public double getTotal() {
	return total;
}


public String getCartItemId() {
	return cartItemId;
}

public void setCartItemId(String cartItemId) {
	this.cartItemId = cartItemId;
}

public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}
public Book getBook() {
	return book;
}
public void setBook(Book book) {
	this.book = book;
}
public User getUser() {
	return user;
}
public void setUser(User user) {
	this.user = user;
}
   
   
   
}

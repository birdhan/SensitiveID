package cn.yh.books.order.domain;

public class OrderItem {
   private String orderItemId;//订单条目编号
   private int quantity;//当前条目购买书籍的数量
   private double subtotal;//小计
   private String bid;//书籍信息  
   private String bname;//书名
   private double currPrice;//购买价格
   private String image_b;//图书的小图
   
   private Order order;//外键关联的实体
   
   
   
 public String getBid() {
	return bid;
}

public void setBid(String bid) {
	this.bid = bid;
}
public String getOrderItemId() {
	return orderItemId;
}

public void setOrderItemId(String orderItemId) {
	this.orderItemId = orderItemId;
}

public int getQuantity() {
	return quantity;
}

public void setQuantity(int quantity) {
	this.quantity = quantity;
}



public double getSubtotal() {
	return subtotal;
}

public void setSubtotal(double subtotal) {
	this.subtotal = subtotal;
}

public String getBname() {
	return bname;
}

public void setBname(String bname) {
	this.bname = bname;
}

public double getCurrPrice() {
	return currPrice;
}

public void setCurrPrice(double currPrice) {
	this.currPrice = currPrice;
}

public String getImage_b() {
	return image_b;
}

public void setImage_b(String image_b) {
	this.image_b = image_b;
}

public Order getOrder() {
	return order;
}

public void setOrder(Order order) {
	this.order = order;
}

@Override
public String toString() {
	return "OrderItem [orderItemId=" + orderItemId + ", quantity=" + quantity
			+ ", subtotal=" + subtotal + ", bname=" + bname + ", currPrice="
			+ currPrice + ", image_b=" + image_b + ", order=" + order + "]";
}
   
   
}

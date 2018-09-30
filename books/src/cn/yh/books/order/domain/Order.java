package cn.yh.books.order.domain;

import java.util.List;

import cn.yh.books.user.domain.User;

public class Order {
	private String oid;//主键
	private String ordertime;//下订单的时间
	private double total;//总计
	private int status;//订单状态：1：未付款，2：已付款但未发货，3：已发货未确认收货，4：确认收货，交易成功，5：已取消
	private String address;//地址
	
	private User user;//订单的拥有者，对外的依赖，用外部实体来声明
	private List<OrderItem> itemList;//订单的详细，被依赖，用集合来声明
	
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public String getOrdertime() {
		return ordertime;
	}
	public void setOrdertime(String ordertime) {
		this.ordertime = ordertime;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<OrderItem> getItemList() {
		return itemList;
	}
	public void setItemList(List<OrderItem> itemList) {
		this.itemList = itemList;
	}
	@Override
	public String toString() {
		final int maxLen = 10;
		return "Order [oid="
				+ oid
				+ ", ordertime="
				+ ordertime
				+ ", total="
				+ total
				+ ", status="
				+ status
				+ ", address="
				+ address
				+ ", user="
				+ user
				+ ", itemList="
				+ (itemList != null ? itemList.subList(0,
						Math.min(itemList.size(), maxLen)) : null) + "]";
	}
	
	

}

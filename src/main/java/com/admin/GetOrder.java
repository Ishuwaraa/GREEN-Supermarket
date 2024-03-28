package com.admin;

public class GetOrder {
	private int orderId, customerId, productId, quantity;
	private String date;
	
	public GetOrder() {
	}
	public GetOrder(int orderId, int customerId, int productId, int quantity, String date) {
		this.orderId = orderId;
		this.customerId = customerId;
		this.productId = productId;
		this.quantity = quantity;
		this.date = date;
	}
	public int getOrderId() {
		return orderId;
	}
	public int getCustomerId() {
		return customerId;
	}
	public int getProductId() {
		return productId;
	}
	public int getQuantity() {
		return quantity;
	}
	public String getDate() {
		return date;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	
}

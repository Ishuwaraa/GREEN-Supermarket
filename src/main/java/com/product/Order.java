package com.product;

public class Order extends Product{
	//private int productId;
	private int customerId;
	private int orderQty;
	
	public Order() {
	}

//	public Order(int productId, int customerId, int orderQty) {
//		this.productId = productId;
//		this.customerId = customerId;
//		this.orderQty = orderQty;
//	}

	public Order(int customerId, int orderQty) {
		this.customerId = customerId;
		this.orderQty = orderQty;		
	}

//	public int getProductId() {
//		return productId;
//	}

	public int getCustomerId() {
		return customerId;
	}

	public int getOrderQty() {
		return orderQty;
	}

//	public void setProductId(int productId) {
//		this.productId = productId;
//	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public void setOrderQty(int orderQty) {
		this.orderQty = orderQty;
	}

	@Override
	public String toString() {
		//return "Order [productId=" + productId + ", customerId=" + customerId + ", orderQty=" + orderQty + " ]";
		return "Order [customerId=" + customerId + ", orderQty=" + orderQty + " ]";
	}
		
}

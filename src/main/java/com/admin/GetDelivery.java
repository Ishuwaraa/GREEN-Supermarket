package com.admin;

public class GetDelivery {
	private int orderId, customerId;
	private String customerName, contact, address;
	private double totalBill;
	
	public GetDelivery() {
	}

	public GetDelivery(int orderId, int customerId, String customerName, String contact, String address, double totalBill) {
		this.orderId = orderId;
		this.customerId = customerId;
		this.customerName = customerName;
		this.contact = contact;
		this.address = address;
		this.totalBill = totalBill;
	}

	public int getOrderId() {
		return orderId;
	}

	public int getCustomerId() {
		return customerId;
	}

	public String getCustomerName() {
		return customerName;
	}

	public String getContact() {
		return contact;
	}

	public String getAddress() {
		return address;
	}

	public double getTotalBill() {
		return totalBill;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setTotalBill(double totalBill) {
		this.totalBill = totalBill;
	}
	
	
}

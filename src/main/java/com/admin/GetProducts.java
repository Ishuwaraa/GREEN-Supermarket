package com.admin;

public class GetProducts {
	private int prodId, categoryId;
	private String prodName, prodSize, image;
	private double prodPrice;
	
	public GetProducts() {
	}

	public GetProducts(int prodId, int categoryId, String prodName, String prodSize, String image, double prodPrice) {
		this.prodId = prodId;
		this.categoryId = categoryId;
		this.prodName = prodName;
		this.prodSize = prodSize;
		this.image = image;
		this.prodPrice = prodPrice;
	}

	public int getProdId() {
		return prodId;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public String getProdName() {
		return prodName;
	}

	public String getProdSize() {
		return prodSize;
	}

	public String getImage() {
		return image;
	}

	public double getProdPrice() {
		return prodPrice;
	}

	public void setProdId(int prodId) {
		this.prodId = prodId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public void setProdSize(String prodSize) {
		this.prodSize = prodSize;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public void setProdPrice(double prodPrice) {
		this.prodPrice = prodPrice;
	}
	
	
}

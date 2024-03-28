package com.product;

public class Product {
	private int id;
	private String name, size, image;
	private double price;
	
	public Product() {
		super();
	}
	
	public Product(int id, String name, String size, double price, String image) {
		super();
		this.id = id;
		this.name = name;
		this.size = size;
		this.price = price;
		this.image = image;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getSize() {
		return size;
	}

	public double getPrice() {
		return price;
	}

	public String getImage() {
		return image;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", size=" + size + ", price=" + price + ", image=" + image
				+ "]";
	}
	
}

package com.admin;

public class GetFeedback {
	private int id;
	private String name, email, phone, feedback;

	public GetFeedback() {
	}
	
	public GetFeedback(int id, String name, String email, String phone, String feedback) {
		this.id = id;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.feedback = feedback;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getEmail() {
		return email;
	}

	public String getPhone() {
		return phone;
	}

	public String getFeedback() {
		return feedback;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}
	
	
}

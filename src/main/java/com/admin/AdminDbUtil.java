package com.admin;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.customer.DbConnect;
//import com.admin.GetProducts;

public class AdminDbUtil {
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	public static Admin adminLogin(String username, String password) {
		Admin admin = null;
		try {
			con = DbConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from admin where username = '"+username+"' and password = '"+password+"' ";
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				 admin = new Admin();
				 admin.setUsername(rs.getString(2));
				 admin.setPassword(rs.getString(3));				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return admin;
	}
	
	public static List<GetProducts> displayProducts(){
		List<GetProducts> getProduct = new ArrayList<GetProducts>();
		try {
			con = DbConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from product";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				GetProducts row = new GetProducts();
				row.setProdId(rs.getInt(1));
				row.setProdName(rs.getString(2));
				row.setProdSize(rs.getString(3));
				row.setProdPrice(rs.getDouble(4));
				row.setImage(rs.getString(5));
				row.setCategoryId(rs.getInt(6));
				getProduct.add(row);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return getProduct;
	}
	
	public static boolean addProduct(String name, String size, double price, String image, int cId) {
		try {
			con = DbConnect.getConnection();
			stmt= con.createStatement();
			String sql = "insert into product values (0, '"+name+"', '"+size+"', '"+price+"', '"+image+"', '"+cId+"') ";
			int rs = stmt.executeUpdate(sql);
			
			if(rs>0) {
				isSuccess = true;
			}else {
				isSuccess = false;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	public static boolean deleteProduct(int id) {
		try {
			con = DbConnect.getConnection();
			stmt = con.createStatement();
			String sql = "delete from product where product_id = '"+id+"' ";
			int rs = stmt.executeUpdate(sql);
			
			if(rs>0) {
				isSuccess = true;
			}else {
				isSuccess = false;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	public static boolean editPrice(int id, double price) {
		try {
			con = DbConnect.getConnection();
			stmt = con.createStatement();
			String sql = "update product set price = '"+price+"' where product_id = '"+id+"' ";
			int rs = stmt.executeUpdate(sql);
			
			if(rs>0) {
				isSuccess = true;
			}else {
				isSuccess = false;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	public static boolean editSize(int id, String size) {
		try {
			con = DbConnect.getConnection();
			stmt = con.createStatement();
			String sql = "update product set size = '"+size+"' where product_id = '"+id+"' ";
			int rs = stmt.executeUpdate(sql);
			
			if(rs>0) {
				isSuccess = true;
			}else {
				isSuccess = false;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	public static List<GetOrder> displayOrder(){
		List<GetOrder> getOrder = new ArrayList<GetOrder>();
		try {
			con = DbConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from greensuperdb.order";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				GetOrder row = new GetOrder();
				row.setOrderId(rs.getInt(1));
				row.setCustomerId(rs.getInt(2));
				row.setProductId(rs.getInt(3));
				row.setQuantity(rs.getInt(4));
				row.setDate(rs.getString(5));
				getOrder.add(row);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return getOrder;
	}
	
	public static List<GetDelivery> displayDelivery(){
		List<GetDelivery> getDelivery = new ArrayList<GetDelivery>();
		try {
			con = DbConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from delivery";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				GetDelivery row = new GetDelivery();
				row.setOrderId(rs.getInt(1));
				row.setCustomerId(rs.getInt(2));
				row.setCustomerName(rs.getString(3));
				row.setContact(rs.getString(4));
				row.setAddress(rs.getString(5));
				row.setTotalBill(rs.getDouble(6));
				getDelivery.add(row);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return getDelivery;
	}
	
	public static List<GetFeedback> displayFeedback(){
		List<GetFeedback> getFeedback = new ArrayList<GetFeedback>();
		try {
			con = DbConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from feedback";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				GetFeedback row = new GetFeedback();
				row.setId(rs.getInt(1));
				row.setName(rs.getString(2));
				row.setEmail(rs.getString(3));
				row.setPhone(rs.getString(4));
				row.setFeedback(rs.getString(5));
				getFeedback.add(row);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return getFeedback;
	}
}

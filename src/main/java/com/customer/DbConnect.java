package com.customer;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnect {

	private static String dburl = "jdbc:mysql://greensuperprod.mysql.database.azure.com:3306/greensuperdb";
	private static String dbuser = "dbadmin";
	private static String dbpass = "admin@123";
	private static String dbdriver = "com.mysql.jdbc.Driver";
	private static Connection con;
	
	public static Connection getConnection() {
		
		try {
			Class.forName(dbdriver);
			
			con = DriverManager.getConnection(dburl, dbuser, dbpass);
			
		}catch(Exception e) {
			System.out.println("Database connection is not success");
		}
		
		return con;
	}
	
}

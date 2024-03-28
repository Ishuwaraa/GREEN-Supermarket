<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.customer.Customer"%>
<%@page import="com.product.ProductDbUtil"%>
<%@page import="com.product.Product"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.product.Cart"%>
<%
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	Customer authenticate = (Customer) request.getSession().getAttribute("authenticate");
	if(authenticate != null){
		request.setAttribute("authenticate", authenticate);
	}
	
	List<Product> products = ProductDbUtil.getProducts(2);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GREEN Supermarket</title>
<link rel="icon" type="image/x-icon" href="./assets/logo/favicon.ico">
	<!--Link Css-->
    <link rel="stylesheet" href="categories.css">
    <link rel="stylesheet" href="footer.css">

    <!--Box icons-->
    <link rel="stylesheet"href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">

    <!--Bootstrap link-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
</head>
<body>
	<%@include file="navbar.jsp" %>
<br><br>
	
	<section class="products" id="products">
        <div class="heading"><h1>All Fruits<br><span>Products</span></h1></div>

        <!--product Content-->
        <div class="products-container">
        
        	<%
        		if(!products.isEmpty()){
        			for(Product p:products){ %>
        				<div class="box">
	                    	<img src="assets/images/products/<%=p.getImage()%>" alt="<%= p.getName() %>">
	                        <h2><%= p.getName() %><br><%= p.getSize() %></h2>
	                        <h3 class="price">Rs.<%= p.getPrice() %>/=</h3>
	                        <a href="cart?id=<%= p.getId() %>&page=fruits" class="btn"><i class='bx bx-cart'></i></a>          
                    	</div>
        			<%}
        		}
        	%>
            
        </div>
    </section>

	<!--footer-->
    <%@include file="footer.jsp" %>
</body>
</html>
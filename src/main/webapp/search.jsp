<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.customer.Customer"%>
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
	
	List<Product> searchProd = (List<Product>) request.getSession().getAttribute("searchProd");

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GREEN Supermarket</title>
<link rel="icon" type="image/x-icon" href="./assets/logo/favicon.ico">
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
	
	<section class="products" style="margin-top: 100px" id="products">
        <div class="heading ms-2"><h1>Search <span> Results</span></h1></div>

        <!--product Content-->
        <div class="products-container mx-3">        
        
        	<%
        		if(!searchProd.isEmpty()){
        			for(Product p:searchProd){ %>
        				<div class="box">
	                    	<img src="assets/images/products/<%=p.getImage()%>" alt="<%= p.getName() %>">
	                        <h2><%= p.getName() %><br><%= p.getSize() %></h2>
	                        <h3 class="price">Rs.<%= p.getPrice() %>/=</h3>
	                        <a href="cart?id=<%= p.getId() %>&page=search" class="btn"><i class='bx bx-cart'></i></a>          
                		</div>
        			<%}
        		}else{%>
        			<div class="heading justify-content-center"><h6>Sorry! No Products Found For Your Search</h6></div>
        		<%}
        	%>
        	
        </div>
    </section>
	
	<!--footer-->
    <%@include file="footer.jsp" %>
</body>
</html>
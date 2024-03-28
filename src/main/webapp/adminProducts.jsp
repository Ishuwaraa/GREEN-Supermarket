<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.admin.AdminDbUtil"%>
<%@page import="com.admin.GetProducts"%>
<%@page import="com.admin.Admin"%>
<%@page import="java.util.List"%>
<%
	Admin authenticate = (Admin) request.getSession().getAttribute("authenticate");
	if(authenticate != null){
		request.setAttribute("authenticate", authenticate);
	}
	List<GetProducts> getProducts = AdminDbUtil.displayProducts();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="admin.css">
<title>GREEN Supermarket</title>
<link rel="icon" type="image/x-icon" href="./assets/logo/favicon.ico">
</head>
<body>
    <main class="table" id="customers_table">
        <section class="table__header">            
            <div class="input-group">
                <input type="search" placeholder="Search Data...">
                <img src="assets/images/search.png" alt="search">
            </div>
         	<h3>Product List</h3>
            <div class="table__new">
                <a href="adminAddProduct.jsp">Add/Del/Edit Products</a>
            </div>
            <div class="table__new">
                <a href="adminOrder.jsp">Orders</a>
            </div>
            <div class="table__new">
                <a href="adminDelivery.jsp">Delivery details</a>
            </div>
            <div class="table__new">
                <a href="adminFeedback.jsp">Feedback</a>
            </div>
            <div class="table__new">
            	<% if(authenticate!=null){%>
                <a href="adminLogout" class="active">Log Out</a>
                <%}else{ %>
                <a href="adminLogin.jsp" class="active">Log in</a>
                <%} %>
            </div>
          
        </section>
        
        <section class="table__body">
            <table>
                <thead>
                    <tr>
                        <th> Product Id </th>
                        <th> Product Name </th>
                        <th> Size </th>
                        <th> Price </th>
                        <th> Image </th>
                        <th> Category id </th>
                    </tr>
                </thead>

                <tbody>
                
                	<%if(authenticate!=null){
	                	if(!getProducts.isEmpty()){
	            			for(GetProducts p:getProducts){ %>
	            				<tr>
			                        <td><strong><%=p.getProdId() %></strong></td>
			                        <td><%= p.getProdName() %></td>
			                        <td> <%= p.getProdSize() %> </td>
			                        <td> <%= p.getProdPrice() %> </td>
			                        <td><%= p.getImage() %></td>
			                        <td><strong><%= p.getCategoryId() %></strong></td>
			                    </tr>
	            			<%}
	            		}                	
                	}%>
                    
                </tbody>				
			</table>
		</section>
    </main>
    <script src="adminpages.js"></script>

</body>
</html>
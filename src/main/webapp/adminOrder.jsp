<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.admin.AdminDbUtil"%>
<%@page import="com.admin.GetOrder"%>
<%@page import="com.admin.Admin"%>
<%@page import="java.util.List"%>
<%
	Admin authenticate = (Admin) request.getSession().getAttribute("authenticate");
	if(authenticate != null){
		request.setAttribute("authenticate", authenticate);
	}
	List<GetOrder> getOrder = AdminDbUtil.displayOrder();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GREEN Supermarket</title>
<link rel="icon" type="image/x-icon" href="./assets/logo/favicon.ico">
<link rel="stylesheet" type="text/css" href="admin.css">
</head>
<body>
    <main class="table" id="customers_table">
        <section class="table__header">            
             <div class="input-group">
                <input type="search" placeholder="Search Data...">
                <img src="assets/images/search.png" alt="search">
            </div>          
            <div class="table__new">
                <a href="adminProducts.jsp" >Products List</a>
            </div>          
            <div class="table__new">
                <a href="adminAddProduct.jsp">Add/Del/Edit Products</a>
            </div>
            <h3>Orders</h3>
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
                        <th> Order Id </th>
                        <th> Customer Id</th>
                        <th> Product Id </th>
                        <th> Quantity </th>
                        <th> Order Date </th>                    
                    </tr>
                </thead>
                
                <tbody>
                	<%if(authenticate!=null){
	                	if(!getOrder.isEmpty()){
	            			for(GetOrder p:getOrder){ %>
			                    <tr>
			                        <td><strong><%= p.getOrderId() %></strong></td>
			                        <td><strong><%= p.getCustomerId() %></strong></td>
			                        <td><%= p.getProductId() %></td>
			                        <td> <%= p.getQuantity() %> </td>
			                        <td><%= p.getDate() %></td>                     
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
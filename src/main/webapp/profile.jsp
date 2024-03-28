<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.customer.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.product.Cart"%>
<%   
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    Customer authenticate = (Customer) request.getSession().getAttribute("authenticate");
	if(authenticate != null){
		request.setAttribute("authenticate", authenticate);
	}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Green Supermarket</title>
    <link rel="icon" type="image/x-icon" href="./assets/logo/favicon.ico">
    <link rel="stylesheet" href="profile.css">
    <link rel="stylesheet" href="footer.css">

    <!--bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">

    <!--Box icons-->
    <link rel="stylesheet"href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    
</head>
<body>
 
	<%@include file="navbar.jsp" %>
    <br><br>
    
    <div class="container light-style flex-grow-1">
        <h4 class="font-weight-bold py-3 mb-3" style=" font-size: 1.6rem;
        font-weight: 600;">
           Profile <span style="color:#3cb815;">settings</span>
        </h4>
        <div class="card overflow-hidden" style="background: #e9f4ea;;">
            <div class="row no-gutters row-bordered row-border-light">
                <div class="col-md-3 pt-0">
                    <div class="list-group list-group-flush account-settings-links">
                        <a class="list-group-item list-group-item-action active" data-toggle="list"
                            href="#account-general" style="background: #e9f4ea; color: black;">My Account</a>
                        <a class="list-group-item list-group-item-action" data-toggle="list"
                            href="#account-info" style="background: #e9f4ea;">Edit Profile</a>
                        <a class="list-group-item list-group-item-action" data-toggle="list"
                            href="#account-change-password" style="background: #e9f4ea;">Change Password</a>
                    </div>
                </div>

                <div class="col-md-9">
                    <div class="tab-content">
                    	<div class="tab-pane fade active show" id="account-general"> 
                            <hr class="border-light m-0">
                            <div class="card-body">
                            <% if(authenticate != null){ %>
                                <form action="customerDelete" method="post"> 
                                	<div class="form-group d-none">
                                        <label class="form-label">id</label>
                                        <input readonly type="text" name="id" class="form-control mb-1" value="<%= authenticate.getId() %>" style="border-top-right-radius: 1rem; border-bottom-left-radius: 1rem;">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Name</label>
                                        <input readonly type="text" name="name" class="form-control mb-1" value="<%= authenticate.getName() %>" style="border-top-right-radius: 1rem; border-bottom-left-radius: 1rem;">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">E-mail</label>
                                        <input readonly type="email" name="email" class="form-control mb-1" value="<%= authenticate.getEmail() %>" style="border-top-right-radius: 1rem; border-bottom-left-radius: 1rem;">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Username</label>
                                        <input readonly type="text" name="username" class="form-control" value="<%= authenticate.getUsername() %>" style="border-top-right-radius: 1rem; border-bottom-left-radius: 1rem;">
                                    </div>                      
                                    <div class="form-group">
                                        <label class="form-label">Phone</label>
                                        <input readonly type="text" name="phone" class="form-control" value="<%= authenticate.getPhone() %>" style="border-top-right-radius: 1rem; border-bottom-left-radius: 1rem;">
                                    </div>
                                    <div class="text-right mt-3">
                                        <button type="submit" class="mbtn"  style="border-top-right-radius: 1rem; border-bottom-left-radius: 1rem;">Delete my Account</button>&nbsp;
                                    </div>
                                    <small class="mt-3" style="color: red">*For security reasons you will be logged out of this session.</small>                                                                                                        
                                </form>                              
                            <%} %>                              
                            </div>
                        </div>
                        
                        <div class="tab-pane fade" id="account-info">
                            <div class="card-body pb-2">
                            <% if(authenticate != null){ %>
                                <form action="updateDetails" method="post"> 
                                	<div class="form-group d-none">
                                        <label class="form-label">id</label>
                                        <input readonly type="text" name="id" class="form-control mb-1" value="<%= authenticate.getId() %>" style="border-top-right-radius: 1rem; border-bottom-left-radius: 1rem;">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Name</label>
                                        <input type="text" name="name" class="form-control mb-1" value="<%= authenticate.getName() %>" style="border-top-right-radius: 1rem; border-bottom-left-radius: 1rem;">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">E-mail</label>
                                        <input type="email" name="email" class="form-control mb-1" value="<%= authenticate.getEmail() %>" style="border-top-right-radius: 1rem; border-bottom-left-radius: 1rem;">                                        
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Username</label>
                                        <input type="text" name="username" class="form-control" value="<%= authenticate.getUsername() %>" style="border-top-right-radius: 1rem; border-bottom-left-radius: 1rem;">
                                    </div>                                                                        
                                    <div class="form-group">
                                        <label class="form-label">Phone</label>
                                        <input type="text" name="phone" class="form-control" value="<%= authenticate.getPhone() %>" style="border-top-right-radius: 1rem; border-bottom-left-radius: 1rem;">
                                    </div>                                                                      
                                    <div class="text-right mt-3">
                                        <button type="submit" class="mbtn"  style="border-top-right-radius: 1rem; border-bottom-left-radius: 1rem;">Save changes</button>&nbsp;
                                        <button type="reset" class="mbtn"  style="border-top-right-radius: 1rem; border-bottom-left-radius: 1rem;">Clear changes</button>&nbsp;                                  
                                    </div> 
                                    <small class="mt-3" style="color: red">*For security reasons you will be logged out of this session.</small>                                  
                                </form> 
                            <%} %>                                                            
                            </div>
                        </div>
                        
                        <div class="tab-pane fade" id="account-change-password">
                            <div class="card-body pb-2">
                            <% if(authenticate != null){ %>
                                <form action="updateDetailsPass" method="post">
                                <div class="form-group d-none">
                                        <label class="form-label">id</label>
                                        <input readonly type="text" name="id" class="form-control mb-1" value="<%= authenticate.getId() %>" style="border-top-right-radius: 1rem; border-bottom-left-radius: 1rem;">
                                    </div>
                                <div class="form-group">
                                    <label class="form-label">Current password</label>
                                    <input required type="password" class="form-control" name="curPassword" placeholder="Current password" style="border-top-right-radius: 1rem; border-bottom-left-radius: 1rem;">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">New password</label>
                                    <input required type="password" class="form-control" name="password" placeholder="password" style="border-top-right-radius: 1rem; border-bottom-left-radius: 1rem;">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Confirm new password</label>
                                    <input required type="password" class="form-control" name="conPassword" placeholder="confirm password" style="border-top-right-radius: 1rem; border-bottom-left-radius: 1rem;">
                                </div>
                                <div class="text-right mt-3">
                                    <button type="submit" class="mbtn" style="border-top-right-radius: 1rem; border-bottom-left-radius: 1rem;">Save changes</button>&nbsp;
                                    <button type="reset" class="mbtn"  style="border-top-right-radius: 1rem; border-bottom-left-radius: 1rem;">Clear changes</button>&nbsp;                                  
                                </div>
                                <small class="mt-3" style="color: red">*For security reasons we recommend logging out.</small>                                                                 
                               </form>
                            <%} %>
                            </div>
                        </div>                                                                                                              
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--footer-->
    <%@include file="footer.jsp" %>
    
    <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
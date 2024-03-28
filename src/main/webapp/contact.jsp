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
<title>GREEN Supermarket</title>
<link rel="icon" type="image/x-icon" href="./assets/logo/favicon.ico">
	<link rel="stylesheet" href="footer.css">
	<!--  -->
	<link rel="stylesheet" href="contact.css">

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <!--Bootstrap link-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
    
    <!-- Box icons -->
    <link rel="stylesheet"href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
</head>
<body>
	<%@include file="navbar.jsp" %>
	<br><br>
	
	<div class="heading"><h1>Contact Us <br><span></span></h1></div>
	
	<div class="containter" >
        <p style=" margin: 0.5rem 0 1rem; text-align: center; font-weight: 500; margin-top: -6rem;">Our Customer Care team is here to assist you (Refer below for the ways to contact us)</p>
        <br>
        <div class="row">
            <div class="col-md-4">
                <div class="main d-flex justify-content-center">
                    <div class="address" style="width: 300px; height: 350px; ">
                        <div class="address-logo">
                            <img src="assets/images/contact/placeholder.png" alt="store">
                        </div>
                        <h4>Address</h4>
                        <p style="font-size: 1rem; font-family: 'Poppins',sans-serif; color: #fff; font-style: italic; ">Mahenwaththa, Pitipana, <br>Homagama,<br>Sri lanka.</p>                            
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="main d-flex justify-content-center">
                    <div class="address" style="width: 300px; height: 350px;">
                        <div class="address-logo">
                            <img src="assets/images/contact/phone.png" alt="phone">
                        </div>
                        <h4>Customer Service</h4>
                        <p style="font-size: 1rem; font-family: 'Poppins',sans-serif; color: #fff; font-style: italic; ">+94 11 234 5678 <br> +94 11 234 5678<br></p>                       
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="main d-flex justify-content-center">
                    <div class="address" style="width: 300px; height: 350px;">
                        <div class="address-logo">
                            <img src="assets/images/contact/email.png" alt="email">
                        </div>
                        <h4>Email</h4>                        
                        <p style="font-size: 1rem; font-family: 'Poppins',sans-serif; color: #fff; font-style: italic; "> greensupermarket246@gmail.com<br> <br></p>                                           
                    </div>
                </div>
            </div>                              
        </div>
    </div>
    
    <!--feedback form-->
    <div class="heading"><h1>Feedback<br><span></span></h1></div>
    <div class="containter">
        <p style=" margin: 0.5rem 0 1rem; text-align: center; margin-top: -6rem;">Your feedback will help us continuously improve ourselves to make it better for you and our other valued Customers.</p>
        <div class="contact-box">
            <div class="contact-left" style="background:linear-gradient(#7ED63F,#3cb815,#c0eb7b); background-size: 100% -100%; border-radius: 0.5rem;">
                <h3 style="font-size: 1.5rem; font-weight: 500; text-align:left;">Send your feedback</h3>
                <br>
                <form action="feedback" method="post" autocomplete="off">
                    <div class="input-row">
                        <div class="input-group">
                            <label for="name">Name</label>
                            <input name="name" type="text" placeholder=" Your name" style="border-top-right-radius: 0.5rem; border-bottom-left-radius: 0.5rem;">
                        </div>
                    </div>
                    <div class="input-row">
                        <div class="input-group">
                            <label for="name">Contact Number</label>
                            <input name="phone" type="text" placeholder=" e.g. 0774356234" style="border-top-right-radius: 0.5rem; border-bottom-left-radius: 0.5rem;">
                        </div>                    
                    </div>
                    <div class="input-row">
                        <div class="input-group">
                            <label for="name">Email <span style="color: red">*</span></label>
                            <input required name="email" type="email" placeholder=" e.g. greensupermarket246@gmail.com" style="border-top-right-radius: 0.5rem; border-bottom-left-radius: 0.5rem;">
                        </div>                                       
                    </div>
                    <label for="messege">Message</label>
                    <textarea name="message" cols="52" rows="3" placeholder="Type your message" style="border-top-right-radius: 0.5rem; border-bottom-left-radius: 0.5rem; border: none;"></textarea>
                    <button class="btn-1x" type="submit">Submit Feedback<i class='bx bx-right-arrow-alt'></i></button>                                      
                </form>
            </div>
        </div>
    </div>

	<%@include file="footer.jsp" %>
</body>
</html>
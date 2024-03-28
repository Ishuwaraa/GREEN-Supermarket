<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.customer.Customer"%>
<%@page import="com.product.Cart"%>
<%@page import="com.product.ProductDbUtil"%>
<%@page import="com.product.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>

<%
	DecimalFormat dcf = new DecimalFormat("#.##");
	request.setAttribute("dcf", dcf);

	Customer authenticate = (Customer) request.getSession().getAttribute("authenticate");
	if(authenticate != null){
		request.setAttribute("authenticate", authenticate);
	}
	
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list"); //retrieving the session which has the list of items in the cart
	List<Cart> cartProduct = null; //Declares a variable to hold the list of Cart objects representing products in the cart.	
	
	if(cart_list != null){
		cartProduct = ProductDbUtil.getCartProducts(cart_list);
		request.setAttribute("cart_list", cart_list); //making the cart_list available for further processing in the JSP page.
		
		double total = ProductDbUtil.cartTotal(cart_list);						
		double tax = total*5/100;
		double shipping = 100.0;
		double payable = tax + shipping + total;
		
		request.setAttribute("total", total);
		request.setAttribute("tax", tax);
		request.setAttribute("shipping", shipping);
		request.setAttribute("payable", payable);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GREEN Supermarket</title>
<link rel="icon" type="image/x-icon" href="./assets/logo/favicon.ico">
	<link rel="stylesheet" href="cart.css">
    <!--Box icons-->
    <link rel="stylesheet"href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    
</head>
<body>
    <!--main container-->
    <main class="container">
    	<div class="head" style="border-bottom: 1px solid var(--gainsbro);">
	        <h1 class="heading" >
	           Shopping <span style="color: #3cb815;"> Cart</span><ion-icon name="cart-outline" style="color: #3cb815;"></ion-icon>	           
	        </h1>
	        <a href="home.jsp" class="heading"><button>View Store</button></a>
        </div>

        <div class="item-flex">
            <!--Checkout section-->
            <section class="checkout">
                <h2 class="section-heading">Delivery Details</h2>

                <div class="payment-form">
                	<form action="authorize" method="post">
                    <!-- <form action="checkout" method="post">-->
                        <div class="cardholder-name">
                            <label for="name" class="labale-default">Full Name<span style="color: red">*</span></label>
                            <input <%if(authenticate!=null) {%> required <%} %> type="text" name="dname" id="name" class="input-default" placeholder="Full Name">
                        </div>
                        <div class="cardholder-name">
                            <label for="address" class="labale-default">Address<span style="color: red">*</span></label>
                            <input <%if(authenticate!=null) {%> required <%} %>  type="text" name="daddress" id="address" class="input-default" placeholder="Address">
                        </div>                                                   
                        <div class="card-number">
                            <label for="phone" class="labale-default">Mobile Number</label>
                            <input type="text" name="dphone" id="phone" class="input-default" placeholder="Mobile Number">
                        </div>
                        <div class="card-number" style="display: none">
	                        <input type="text" name="total" class="input-default" value="${total}">
	                        <input type="text" name="payable" class="input-default" value="${payable}">
	                        <input type="text" name="shipping" class="input-default" value="${shipping}">
                            <input type="text" name="tax" class="input-default" value="${tax}">
                        </div>
                        
                        <%if(authenticate == null){ %>
                        	<a href="login.jsp" class="btn btn-secondary" style="width: 100px">Log in</a>
                        	<small style="color: red; margin-bottom: 10px">*You need to be logged in to place an order.</small> 
                        <%}else{ %>
	                        <!-- !null - session is there. isEmpty - no products -->
	                        <button type="submit" class="btn btn-secondary" style="display:<%= (cart_list != null && !cart_list.isEmpty()) ? "flex" : "none" %>">
			                    <b>Checkout</b><i class='bx bx-right-arrow-alt'></i>
			                </button>
			            <%} %>	 	                
                    </form>
                    
                </div>

                
            </section>

            <!--Cart section-->
            <section class="cart">

                <div class="cart-item-box">
                    <h2 class="section-heading">Order Summary</h2>
                    
                    <%
                    if(cart_list != null){ 
                    	for(Cart c:cartProduct){ %>
                    		<div class="product-card">
								<div class="card">
									<div class="img-box">
										<img src="assets/images/products/<%=c.getImage()%>" alt="<%= c.getName() %>" width="80px" class="product-img">
									</div>
		
									<div class="detail">
										<h4 class="product-name"><%=c.getName()%></h4>
										<div class="wrapper">
											<div class="product-qty">
												<a href="quantity?action=dec&id=<%=c.getId() %>" class="" style="background-color: transparent; color: black;"><ion-icon name="remove-outline"></ion-icon></a>
                                        		<input type="text" value="<%= c.getQuantity() %>" style="width: 40px; border: none; padding-left: 10px;">
                                        		<a href="quantity?action=inc&id=<%=c.getId() %>" class="btn btn-incre btn-sm" style="background-color: transparent; color: black;"><ion-icon name="add-outline"></ion-icon></a>
											</div>
											<div class="price">
												Rs. <span id="price"><%=c.getPrice()%></span>
											</div>
										</div>
									</div>
									<a href="removeProduct?id=<%=c.getId()%>"
										class="btn product-close-btn"
										style="background-color: transparent"> <ion-icon name="close-outline"></ion-icon>
									</a>
								</div>
							</div>
                    	<%}
                    	}%>                                                 
                </div>

                <div class="wrapper">
                    <div class="amount">
                        <div class="subtotal">
                            <span>Subtotal</span> <span id="subtotal">Rs.  ${(total>0)? dcf.format(total): 0} /=</span>
                        </div>
                        <div class="tax">
                            <span>Tax (5%)</span> <span id="tax">Rs. ${(total>0)? dcf.format(tax): 0}/=</span>
                        </div>
                        <div class="shipping">
                            <span>Delivery</span> <span id="shipping">Rs. ${(total>0)? shipping: 0}/=</span>
                        </div>
                        <div class="total">
                            <span>Total</span> <span id="total">Rs. ${(total>0)? dcf.format(payable): 0}/=</span>
                        </div>
                    </div>
                </div>

            </section>
        </div>
    </main>

    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
        

</body>
</html>
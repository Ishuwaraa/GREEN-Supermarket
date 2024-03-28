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

	<!--Link Css-->
    <link rel="stylesheet" href="home.css">
    <link rel="stylesheet" href="footer.css">

    <!--Box icons-->
    <link rel="stylesheet"href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">

    <!--Link Swiper's CSS-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />

    <!--Bootstrap link-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
    
</head>
<body>
	<%@include file="navbar.jsp" %>
<br><br>

    <!--Home Page-->
    <section class="home swiper" id="home">
        <div class="swiper-wrapper">
            <!--Box 1-->
            <div class="swiper-slide conatiner">
                <img src="assets/images/slide/slide1.jpg" alt="slider" class="main-img">
                <div class="home-textx" style="min-width: 340px;"></div>
            </div>
            <!--Box 2-->
            <div class="swiper-slide conatiner">
                <img src="assets/images/slide/slide2.jpg" alt="slider">
                <div class="home-textx"></div>
            </div>
            <!--Box 3-->
            <div class="swiper-slide conatiner">
                <img src="assets/images/slide/slide3.jpg" alt="slider">
                <div class="home-textx"></div>
            </div>
			<!--Box 4-->
			<div class="swiper-slide conatiner">
				<img src="assets/images/slide/slide4.jpg" alt="slider">
				<div class="home-textx"></div>
			</div>
		</div>
        <div class="swiper-pagination"></div>
    </section> 


     <!--Categories-->
     <section class="categories" id="categories">
        <div class="heading"><h1>Browse Our <span> Categories</h1></div>
        
        <div class="container mt-2">
            <div class="row mb-3 justify-content-center align-items-center">
                <div class="col-8 col-md-4 mb-2">
                    <div class="box box2">
                        <img src="assets/images/Categories/c1.png" alt="category">
                        <h2>Vegetables</h2>
                        <span>12 Items</span>
                       <a href="vegetables.jsp"><i class='bx bx-right-arrow-alt'></i></a>         
                    </div>
                </div>
                <div class="col-8 col-md-4 mb-2">
                    <div class="box box1">
                        <img src="assets/images/Categories/c2.png" alt="category">
                        <br>
                        <h2>Fruits</h2>
                        <span>12 Items</span>
                       <a href="fruits.jsp"><i class='bx bx-right-arrow-alt'></i></a>         
                    </div>
                </div>
                <div class="col-8 col-md-4 mb-2">
                    <div class="box box3">
                        <img src="assets/images/Categories/c3.png" alt="category">
                        <h2>Beverages</h2>
                        <span>12 Items</span>
                        <a href="beverages.jsp"><i class='bx bx-right-arrow-alt'></i></a>        
                    </div>
                </div>
            </div>

            <div class="row justify-content-center align-items-center">
                <div class="col-8 col-md-4 mb-2">
                    <div class="box box4">
                        <img src="assets/images/Categories/c4.png" alt="category">
                        <h2>Meat & Fish</h2>
                        <span>6 Items</span>
                        <a href="meat.jsp"><i class='bx bx-right-arrow-alt'></i></a>        
                    </div>
                </div>
                <div class="col-8 col-md-4 mb-2">
                    <div class="box box5">
                        <img src="assets/images/Categories/c5.png" alt="category">
                        <h2>Bakery</h2>
                        <span>9 Items</span>
                        <a href="bakery.jsp"><i class='bx bx-right-arrow-alt'></i></a>        
                    </div>
                </div>
                <div class="col-8 col-md-4 mb-2">
                    <div class="box box6">
                        <img src="assets/images/Categories/c6.png" alt="category">
                        <h2>Snacks</h2>
                        <span>6 Items</span>
                        <a href="snacks.jsp"><i class='bx bx-right-arrow-alt'></i></a>
                    </div>
                </div>
            </div>
        </div>              
       
    </section>
  
     <!--Products-->
    <section class="products" id="products">
        <div class="heading"><h1>Explore Our Best <span>Products</span></h1></div>
        <!--product Content-->
        <div class="products-conatiner">
			<div class="box">
				<img src="assets/images/products/v4.png" alt="carrot"> <span>Vegetables</span>
				<h2>
					Carrot<br> 250g
				</h2>
				<h3 class="price">Rs.550.0/=</h3>
				<a href="cart?id=4&page=home" class="btn"><i class='bx bx-cart'></i></a>
			</div>
			<div class="box">
				<img src="assets/images/products/f5.png" alt="banana"> <span>Fruits</span>
				<h2>
					Banana<br>
				</h2>
				<h3 class="price">Rs.60.0/=</h3>
				<a href="cart?id=19&page=home" class="btn"><i class='bx bx-cart'></i></a>
			</div>
			<div class="box">
				<img src="assets/images/products/v5.png" alt="tomato"> <span>Vegetables</span>
				<h2>
					Tomato<br>250g
				</h2>
				<h3 class="price">Rs.150.0/=</h3>
				<a href="cart?id=5&page=home" class="btn"><i class='bx bx-cart'></i></a>
			</div>
			<div class="box">
				<img src="assets/images/products/b9.jpeg" alt="peach & mango iced tea"> <span>Beverages</span>
				<h2>
					Peach & Mango Iced Tea<br>1000ml
				</h2>
				<h3 class="price">Rs.1590.0/=</h3>
				<a href="cart?id=50&page=home" class="btn"><i class='bx bx-cart'></i></a>
			</div>
			<div class="box">
				<img src="assets/images/products/m3.jpeg" alt="pork for roasting"> <span>Meat</span>
				<h2>
					Pork For Roasting<br>1000g
				</h2>
				<h3 class="price">Rs.2900.0/=</h3>
				<a href="cart?id=29&page=home" class="btn"><i class='bx bx-cart'></i></a>
			</div>
			<div class="box">
				<img src="assets/images/products/s1.jpeg" alt="prime nuts almonds salted"> <span>Snacks</span>
				<h2>
					Prime Nuts Almonds Salted <br>100g
				</h2>
				<h3 class="price">Rs.1400.0/=</h3>
				<a href="cart?id=55&page=home" class="btn"><i class='bx bx-cart'></i></a>
			</div>
		</div>	
    </section>
    
    <div style="max-width: 968px; border-radius: 0.5rem; margin-left:auto; margin-right: auto; margin-bottom: 2rem;">
        <img src="assets/images/banner.png" alt="">
    </div>
    <br>
  
    <!--About us-->
    <section class="about box10" id="aboutus" style="border-radius: 0.5rem;">
        <img src="assets/logo/logo.png" alt="green supermarket" style="height: 340px; width: 340px;">
        <div class="about-text" style="text-align: justify; padding-right: 10px">
            <span>About Us</span>
            <p>Established in 2002, GREEN Supermarket stands tall as a premier name in the retail supermarket industry, setting new standards and concepts on sustainable eco-friendly commerce.
            GREEN Supermarket has consistently curated a shopping a experience which goes beyond expectations of our beloved customers.</p>
            <p>To decades into its journey, GREEN Supermarket still remains, as the No.1 destination for shoppers, offering a diverse range of products that blend quality,
             affordability and satisfaction and also focuses on a commitment to a Greener planet.</p>
        </div>
    </section>
	
	<!--footer-->
    <%@include file="footer.jsp" %>
	<!--Swiper JS-->
   <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
   
   <script>
   		var swiper = new Swiper(".home", {
		    spaceBetween: 30,
		    centeredSlides:true,
		    autoplay: {
		      delay: 5000,
		      disableOnInteraction:false,
		    },
		    pagination: {
		      el: ".swiper-pagination",
		      clickable:true,
		    },	   
	  	});   
   </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="com.customer.Customer" %>
<%
	Customer authenticate = (Customer) request.getSession().getAttribute("authenticate");
	if(authenticate != null){
		request.setAttribute("authenticate", authenticate);
		//response.sendRedirect("home.jsp");
	}
%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>GREEN Supermarket</title>
	<link rel="icon" type="image/x-icon" href="./assets/logo/favicon.ico">
	
	<!--Bootstrap link-->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
		crossorigin="anonymous">
		
	
	<style>
		body {
			background-image: url(./assets/images/bg-light.png);
			background-size: cover;
			background-repeat: no-repeat;
			min-height: 100vh;
			display: flex;
		}
		.main{
			position: fixed;
            top: 50%;
            left: 50%;
            width: calc(100% - 30px);
            margin: 0 auto;
            transform: translate(-50%, -50%);
		}
	</style>
</head>
<body>
	<div class="container-lg main overflow-hidden">
		<div class="row justify-content-center align-items-center">
			<div class="col-8 col-md-4 mb-3">
				<div class="card border-0 px-3" style="background-color: #2d5d1e; border-top-right-radius: 5rem; border-bottom-left-radius: 5rem; height: 110px">
					<div class="card-body text-center text-white">
						<h4 class="card-title">Already Registered?</h4>
						<a href="login.jsp"
							class="link-light link-offset-2 link-offset-3-hover link-underline link-underline-opacity-0 link-underline-opacity-75-hover">
							Login here </a>
					</div>
				</div>
			</div>
			<div class="col-8 col-md-4 mb-3">
				<div class="card border-0 px-3" style="background-color: #2d5d1e; border-top-right-radius: 5rem; border-bottom-left-radius: 5rem; height: 110px">
					<div class="card-body text-center text-white">
						<h4 class="card-title">New to GREEN Supermarket?</h4>
						<a href="register.jsp"
							class="link-light link-offset-2 link-offset-3-hover link-underline link-underline-opacity-0 link-underline-opacity-75-hover">
							Register here </a>
					</div>
				</div>
			</div>
			<div class="col-8 col-md-4 mb-3">
				<div class="card border-0 px-3" style="background-color: #2d5d1e; border-top-right-radius: 5rem; border-bottom-left-radius: 5rem; height: 110px">
					<div class="card-body text-center text-white">
						<h4 class="card-title">Browse store</h4>
						<a href="home.jsp"
							class="link-light link-offset-2 link-offset-3-hover link-underline link-underline-opacity-0 link-underline-opacity-75-hover">
							Click here </a>
					</div>
				</div>
			</div>
		</div>
	</div>

    <!--Bootstrap js-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

</body>
</html>
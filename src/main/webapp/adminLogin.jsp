<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.admin.Admin"%>
<%
	Admin authenticate = (Admin) request.getSession().getAttribute("authenticate");
	if(authenticate != null){
		request.setAttribute("authenticate", authenticate);
		response.sendRedirect("adminProducts.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GREEN Supermarket</title>
<link rel="icon" type="image/x-icon" href="./assets/logo/favicon.ico">
	<!--Box icons-->
     <link rel="stylesheet"href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
	<!--Bootstrap link-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">

    <style>
        /*Google Fonts*/
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;500;600;700;900&display=swap');
         *{
            font-family: 'Poppins',sans-serif;
            scroll-behavior: smooth;
         }
         body{
            background: url(assets/images/bg-dark.png);  
            background-size: cover;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
         }
        .login-main{
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            opacity: 0; 
            animation: slideDown 0.5s ease-in-out 0.3s forwards; 
        }
        .btn-login {
            background-color: #3cb815;
            border-radius: 0.5rem;
            color:#fff;        
            display: flex;
            align-items: center;
            justify-content:space-between;
            column-gap: 00.5rem;
            max-width: 220px;
        }
        .btn-login .bx{
            padding: 4px;
            background: #fff;
            color: #1a2428;
            border-radius: 1rem;
            font-size: 15px;
            margin: auto;
        }        
        .btn-login:hover {
            background-color: #ff7e00;
            border-color: #ff7e00;
            transition: 0.2s ease;
        }
        .input-group-text .bi{
            padding: 4px;
            background: #fff;
            border-radius: 0.5rem;
            font-size: 15px;
            margin: auto;
        }
        .input-group-text:hover {
            background-color: #ff7e00;
            border-color: #ff7e00;
            transition: 0.2s ease;
        }

        @keyframes slideDown {
            from {
                transform: translate(-50%, -60%); 
                opacity: 0; 
            }
            to {
                transform: translate(-50%, -50%);
                opacity: 1; 
            }
        }
    </style>
</head>
<body>
    <div class="container-lg login-main border border-1" style="background:#e9f4ea; border-radius: 0.5rem; " >
        <div class="row justify-content-center align-items-center py-4">
            <div class="col-8">
                <form action="adminLogin" method="post" >
                    <label for="username" class="form-label">Username</label>
                    <div class="input-group mb-3">
                        <span class="input-group-text"><i class="bi bi-person-fill"></i></span>
                        <input type="text" name="username" class="form-control" id="username" placeholder="enter username" required>
                    </div>

                    <label for="password" class="form-label">Password</label>
                    <div class="input-group mb-3">
                        <span class="input-group-text"><i class="bi bi-lock-fill"></i></span>
                        <input type="password" name="password" class="form-control" id="password" placeholder="password" required>
                    </div>
                    <div class="d-flex justify-content-end">
                        <button class="btn btn-login" type="submit">Log in<i class='bx bx-right-arrow-alt'></i></button>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <!--Bootstrap js-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    
</body>
</html>
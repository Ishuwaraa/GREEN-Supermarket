<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@page import="com.customer.Customer" %>

    
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
        }
        body{
            background:url(./assets/images/bg-light.png);
			background-size: cover;
			min-height: 100vh;
			display: flex;
			justify-content: center;
			align-items: center;            
        }
        .register-main{
            position: fixed;
            top: 50%;
            left: 50%;
            width: calc(100% - 30px);
            margin: 0 auto;
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
    <div class="container-lg register-main border border-1 " style="background:#fef4ea; border-radius: 0.5rem;" >
        <div class="row justify-content-center align-items-center py-4">
            <div class="col-8 col-md-4 mb-5">
                <h4 class="fw-bold"style="color: #3cb815;">GREEN Supermarket</h4>
                <p class="fw-bold" >Create Account</p>
                <div class="mt-3" >
                    <h6 style="color: #ff7e00; font-family: 'Poppins',sans-serif; font-weight:200 ;">Already has an account?</h6> 
                    <a href="login.jsp" class="btn btn-login">Click here to Log in<i class='bx bx-right-arrow-alt'></i></a>
                    <br>
                    <p style="font-weight: 200;">(Daily operating hourse 8.00a.m to 8.00p.m)</p>
                </div>
            </div>
            <div class="col-8 col-md-6">
                <form action="register" method="post"> 
                    <label for="name" class="form-label">Name <span style="color: red">*</span></label>
                    <div class="input-group mb-3">
                        <span class="input-group-text"><i class="bi bi-person-fill"></i></span>
                        <input type="text" class="form-control" name="name" id="name" placeholder="enter name" required>
                    </div>

                    <label for="email" class="form-label">Email <span style="color: red">*</span></label>
                    <div class="input-group mb-3">
                        <span class="input-group-text"><i class="bi bi-envelope-fill"></i></span>
                        <input type="email" class="form-control" name="email" id="email" placeholder="e.g. greensupermarket246@gmail.com" required>
                    </div>

                    <label for="phone" class="form-label">Mobile Number</label>
                    <div class="input-group mb-3">
                        <span class="input-group-text"><i class="bi bi-telephone-fill"></i></span>
                        <input type="text" class="form-control" name="phone" id="phone" placeholder="e.g. 0774435667">
                    </div>

                    <label for="username" class="form-label">Username</label>
                    <div class="input-group mb-3">
                        <span class="input-group-text"><i class="bi bi-person-fill"></i></span>
                        <input type="text" class="form-control" name="username" id="username" placeholder="enter username">
                    </div>

                    <label for="password" class="form-label">Password <span style="color: red">*</span></label>
                    <div class="input-group mb-3">
                        <span class="input-group-text"><i class="bi bi-lock-fill"></i></span>
                        <input type="password" class="form-control" name="password" id="password" placeholder="password" required>
                    </div>

                    <!-- <label for="confirm" class="form-label">Confirm password</label>
                    <div class="input-group mb-3">
                        <span class="input-group-text"><i class="bi bi-lock-fill"></i></span>
                        <input type="password" class="form-control" id="confirm" placeholder="confirm password" required>
                    </div> -->
                    <div class="d-flex justify-content-end">
                        <button class="btn btn-login" type="submit">Register<i class='bx bx-right-arrow-alt'></i></button>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <!--Bootstrap js-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>  
    
</body>
</html>
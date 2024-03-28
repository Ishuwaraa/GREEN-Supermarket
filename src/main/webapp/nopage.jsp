<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--Box icons-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
<title>Error 404</title>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    :root{
    --green-color:#3cb815;
    --light-green-color:#c0eb7b;
    --orange-color:#ff7e00;
    --light-orange-color:#f75f1d;
    --text-color:#1a2428;
    --bg-color:#fff;
    }
    .frem{
        width: 100%;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        background: url('assets/images/error404.gif');
        background-position: center;
        background-repeat: no-repeat;
    }
    .frem p{
        position: absolute;
        top: 3rem;
        font-size: 6rem;
        color: #00000063;
        font-weight: 500;
        text-align: center;
    }
    .frem h2{
        position: absolute;
        bottom: 8rem;
        font-size: 34px;
    }
    .frem h5{
        position: absolute;
        bottom: 6rem;
        color: #00000063;
    }
    .frem a{
        position: absolute;
        bottom: 1rem;        
        padding: 12px;
        color: white;
        text-decoration: none;
        font-size: 23px;   
    }

    .btn{
        padding: 0.6rem 1rem;
        background: var(--green-color);
        color: var(--bg-color);
        font-weight: 400;
        border-radius: 5rem;
        display: flex;
        align-items: center;
        justify-content:space-between;
        column-gap: 00.5rem;
        max-width: 290px;
        position: absolute;
        bottom: 1rem;
    }
    .btn .bx{
        padding: 4px;
        background: var(--bg-color);
        color: var(--text-color);
        border-radius: 1rem;
        font-size: 20px;
        margin: auto;
    }
    .btn:hover{
        background: var(--light-orange-color);
        transition: 0.2s ease;
    }
</style>
</head>
<body>
    <div class="frem">
        <p>404 <br></p>
        <h2>Oops Page Not Found!</h2>
        <h5>The page you are looking for is not available!</h5>
        <a href="home.jsp" class="btn">Back to Home<i class='bx bx-right-arrow-alt'></i></a>      
    </div>
</body>

</html>
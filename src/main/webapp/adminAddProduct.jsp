<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.admin.AdminDbUtil"%>
<%@page import="com.admin.Admin"%>
<%
	Admin authenticate = (Admin) request.getSession().getAttribute("authenticate");
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
<link rel="stylesheet" type="text/css" href="admin.css">
<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
    <main class="table" id="customers_table">
        <section class="table__header">
            <div class="table__new">
                <a href="adminProducts.jsp" class="">Products List</a>
            </div>
            <h3>Add/Del/Edit Products</h3>
            <div class="table__new">
                <a href="adminOrder.jsp" class="">Orders</a>
            </div>
            <div class="table__new">
                <a href="adminDelivery.jsp" class="">Delivery details</a>
            </div>
            <div class="table__new">
                <a href="adminFeedback.jsp" class="">Feedback</a>
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
                <div class="new">
                <%if(authenticate!=null){%>
                    <form action="addProduct" method="post" enctype="multipart/form-data" class="form" autocomplete="off">
                        <div class="container">
                            <label for="name" class="labale">Product Name:<span style="color: red">*</span></label>
                            <input type="text" id="name" name="name" required class="input" placeholder="e.g. Bell Pepper">

                            <label for="size" class="labale">Product Size:</label>
                            <input type="text" id="size" name="size" class="input" placeholder="e.g. 250g/500ml">

                            <label for="price" class="labale">Product Price (Rs.):<span style="color: red">*</span></label>
                            <input type="text" id="price" name="price" required class="input" placeholder="250">

                            <label for="category" class="labale">Category:<span style="color: red">*</span></label>
                            <select id="category" name="category" class="input">
                            	<option value="1">Vegetables</option>
								<option value="2">Fruits</option>
								<option value="3">Meat & Fish</option>
								<option value="4">Bakery</option>
								<option value="5">Beverages</option>
								<option value="6">Snacks</option>
                            </select>

                            <label for="productImage" class="labale">Product Image:<span style="color: red">*</span></label><br>
                            <input type="file" id="file" name="image" accept="image/*" hidden required > 
                            <div class="img-area" data-img="">
                                <i class='bx bxs-cloud-upload icon'></i>
                                <h3>Upload Image</h3>
                                <p>Image size must be less than <span>5MB</span></p>
                            </div>
                            <button class="select-image">Select Image</button>
                            <br><br>
                            <input type="submit" value="Add Product" class="select-image">
                        
                        </div>              
                    </form>
                    
					<form action="deleteProduct" method="post" class="form" style="margin: 20px 0">
						<div class="container">
							<label for="pid">Product id:</label> 
							<input type="text" id="pid" name="pid" placeholder="1" 
								style="background: var(--platinum);
							    border-bottom-left-radius: 0.5rem;
							    border-top-right-radius: 0.5rem;
							    color: var(--davys-gray);
							    border: none;
							    padding: 10px">
							<button type="submit" style="background-color: #3cb815; border: none; border-radius: 15px; padding: 10px; color: white">Delete Product</button>
						</div>
					</form>
					
					<form action="editPrice" method="post" class="form" style="margin: 20px 0">
						<div class="container">
							<label for="pid">Product id:</label> 
							<input type="text" id="pid" name="pid" placeholder="1" 
								style="background: var(--platinum);
							    border-bottom-left-radius: 0.5rem;
							    border-top-right-radius: 0.5rem;
							    color: var(--davys-gray);
							    border: none;
							    padding: 10px">
							<label for="pprice">Product price:</label> 
							<input type="text" id="pprice" name="pprice" placeholder="250" 
								style="background: var(--platinum);
							    border-bottom-left-radius: 0.5rem;
							    border-top-right-radius: 0.5rem;
							    color: var(--davys-gray);
							    border: none;
							    padding: 10px">
							<button type="submit" style="background-color: #3cb815; border: none; border-radius: 15px; padding: 10px; color: white">Edit price</button>
						</div>
					</form>
					
					<form action="editSize" method="post" class="form" style="margin: 20px 0">
						<div class="container">
							<label for="pid">Product id:</label> 
							<input type="text" id="pid" name="pid" placeholder="1" 
								style="background: var(--platinum);
							    border-bottom-left-radius: 0.5rem;
							    border-top-right-radius: 0.5rem;
							    color: var(--davys-gray);
							    border: none;
							    padding: 10px">
							<label for="psize">Product price:</label> 
							<input type="text" id="psize" name="psize" placeholder="250g" 
								style="background: var(--platinum);
							    border-bottom-left-radius: 0.5rem;
							    border-top-right-radius: 0.5rem;
							    color: var(--davys-gray);
							    border: none;
							    padding: 10px">
							<button type="submit" style="background-color: #3cb815; border: none; border-radius: 15px; padding: 10px; color: white">Edit size</button>
						</div>
					</form>
					<%
					}
					%>
                </div>               
            </table>
        </section>

    </main>
    <script src="adminpages.js"></script>
    <script>
	    const selectImage = document.querySelector('.select-image');
	    const inputFile = document.querySelector('#file');
	    const imgArea = document.querySelector('.img-area');
	
	    selectImage.addEventListener('click', function () {
	    	inputFile.click();
	    })
	
	    inputFile.addEventListener('change', function () {
	    	const image = this.files[0]
	    	if(image.size < 5000000) {
	    		const reader = new FileReader();
	    		reader.onload = ()=> {
	    			const allImg = imgArea.querySelectorAll('img');
	    			allImg.forEach(item=> item.remove());
	    			const imgUrl = reader.result;
	    			const img = document.createElement('img');
	    			img.src = imgUrl;
	    			imgArea.appendChild(img);
	    			imgArea.classList.add('active');
	    			imgArea.dataset.img = image.name;
	    		}
	    		reader.readAsDataURL(image);
	    	} else {
	    		alert("Image size more than 5MB");
	    	}
	    })
    </script>   

</body>
</html>
<nav class="navbar navbar-expand-lg  fixed-top" style="background-color: #3cb815;">
		<div class="container-lg">
			<a href="home.jsp" class="navbar-brand d-block d-md-inline order-0"> 
				<img src="./assets/logo/logo-white.png" alt="greensupermarket" style="height: 25px; width: 25px;">
				<span class="fw-bold" style="color: white">GREEN Supermarket</span>
			</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
				data-bs-target="#toggle-links" aria-controls="navbarSupportedContent"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-end align-center" id="toggle-links">
				<div class="navbar-nav">
					<a href="home.jsp" class="nav-link text-white">Home</a> <a href="cart.jsp" class="nav-link text-white d-block d-lg-none">Cart</a>
					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle text-white" role="button" data-bs-toggle="dropdown">Categories</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="vegetables.jsp">Vegetables</a></li>
							<li><a class="dropdown-item" href="fruits.jsp">Fruits</a></li>
							<li><a class="dropdown-item" href="beverages.jsp">Beverages</a></li>
							<li><a class="dropdown-item" href="meat.jsp">Meat & Fish</a></li>
							<li><a class="dropdown-item" href="bakery.jsp">Bakery</a></li>
							<li><a class="dropdown-item" href="snacks.jsp">Snacks</a></li>
						</ul>
					</div>
					
					<%
					if(authenticate != null){ %>
						<div class="nav-item dropdown">
		                	<a href="#" class="nav-link dropdown-toggle text-white d-block d-lg-none" role="button" data-bs-toggle="dropdown">My Account</a>
		                    <a href="#" class="nav-link dropdown-toggle text-white d-none d-lg-block" role="button" data-bs-toggle="dropdown"><i class="bi bi-person-circle"></i></a>
		                    <ul class="dropdown-menu">
		                    	<li><a class="dropdown-item" href="profile.jsp">My profile</a></li>
		                        <li><a class="dropdown-item" href="logout">Logout</a></li>
		                    </ul>
	                    </div>
					<%
					}else{ %>
						<a href="login.jsp" class="nav-link text-white">Login</a> 
						<a href="register.jsp" class="nav-link text-white">Sign up</a>
					<% }%>
					
					<form action="search" method="post" class="nav-item ms-lg-4" role="search">
						<div class="input-group">
							<input name="name" class="form-control" type="search" placeholder="Search products">
							<button class="btn bg-white border" type="submit"><i class="bi bi-search"></i></button>
						</div>
					</form>
				</div>
			</div>
			<a href="cart.jsp" class="nav-item nav-link ms-4 d-none d-lg-block">
				<%if(cart_list != null && !cart_list.isEmpty()) {%>
				<i class="bi bi-cart-check-fill" style="color: white"></i>
				<%}else{ %>
				<i class="bi bi-cart2 text-white"></i>
				<%} %>
			</a>
		</div>
	</nav>
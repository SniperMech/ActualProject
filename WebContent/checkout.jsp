<%@ page import="java.sql.*, SQLCommands.*, Model.*, java.util.*, java.io.*, javax.servlet.*, java.text.*"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1">
		
		<title>SP Game Store</title>

		<!-- Loading third party fonts -->
		<link href="http://fonts.googleapis.com/css?family=Roboto:100,300,400,700|" rel="stylesheet" type="text/css">
		<link href="fonts/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link href="fonts/lineo-icon/style.css" rel="stylesheet" type="text/css">

		<!-- Loading main css file -->
		<link rel="stylesheet" href="style.css">
		
		<!--[if lt IE 9]>
		<script src="js/ie-support/html5.js"></script>
		<script src="js/ie-support/respond.js"></script>
		<![endif]-->

	</head>


	<body>
		
		<div id="site-content">
			<div class="site-header">
				<div class="container">
					<a href="index.html" id="branding">
						<img src="images/logo.png" alt="" class="logo">
						<div class="logo-text">
							<h1 class="site-title">SP Game Store</h1>
							<small class="site-description">Affordable Games At Your Doorstep</small>
						</div>
					</a> <!-- #branding -->

					<div class="right-section pull-right">
						<a href="cart.html" class="cart"><i class="icon-cart"></i> 0 items in cart</a>
					</div> <!-- .right-section -->

					<div class="main-navigation">
						<button class="toggle-menu"><i class="fa fa-bars"></i></button>
						<ul class="menu">
							<li class="menu-item"><a href="index.html"><i class="icon-home"></i></a></li>
							<li class="menu-item"><a href="products.jsp">Products</a></li>
							<li class="menu-item home current-menu-item"><a href="about.html">About</a></li>
							<li class="menu-item"><a href="login.jsp">Login/Register</a></li>
						</ul> <!-- .menu -->

						<div class="mobile-navigation"></div> <!-- .mobile-navigation -->
					</div> <!-- .main-navigation -->
					<div class="breadcrumbs">
						<div class="container">
							<a href="index.html">Home</a>
							<p>About</p>
						</div>
					</div>
				</div> <!-- .container -->
			</div> <!-- .site-header -->
			<main class="main-content">
				<div class="container">
					<div class="page">
						<table class="cart">
							<thead>
								<tr>
									<th class="product-name">Product Name</th>
									<th class="product-price">Price</th>
									<th class="product-qty">Quantity</th>
									<th class="product-total">Total</th>
								</tr>
							</thead>
							<tbody>
							<%
						//CartItemBean item = (CartItemBean)request.getAttribute("addItems");
						ArrayList<CartItemBean> carts = (ArrayList<CartItemBean>)session.getAttribute("addSuccess");
						
						if (carts!= null){
							double total = 0;
							for (CartItemBean cart: carts){
								total = total + cart.getTotal();
						%>
								<tr>
									<td class="product-name">
										<div class="product-detail">
											<h3 class="product-title"><%=cart.getTitle() %></h3>
											
										</div>
									</td>
									<td class="product-price">$<%=""+cart.getPrice() %></td>
									<td class="product-qty"><%=cart.getStock()%></td>
									<td class="product-total">$<%=cart.getTotal() %></td>
								</tr>
							</tbody>
							<tbody>
						<%			

						}
						%>	<tr><div><p class="total"><strong>Total: $<%=total %></strong></p></div></tr>
						<% 
							}
						%>
						
							</tbody>
						</table> <!-- .cart -->
						<form>
								<ul>
								<li><label>Name:</label></li>
								<li><input type="text" name="name"></li>
								<li><label>Credit number:</label></li>
								<li><input type="text" name="name"></li>
								<li><label>Expiration Date:</label>
								<li><input type="text" name="email"></li>
								<li><label>Security Code:</label>
								<li><input type="text" name="contact"></li>
								</ul>
								</form>
						<div class="cart-total">
							<p>
								<a href="products.jsp" class="button muted">Continue Shopping</a><a>     </a>
								<form method="get" action="insertTransaction">
								<input type="hidden" name="userid" value="1">
								<input type="hidden" name="gameid" value="1">
								<input type="hidden" name="quantity" value="1">
								<input type="hidden" name="price" value="1">
								<button type="submit"><a href="#" class="button">Confirm Purchase</a></button>
								</form>
							</p>
						</div> 
					</div>
				</div> <!-- .container -->
			</main> <!-- .main-content -->

			<div class="site-footer">
				<div class="container">
					
					<div class="colophon">
						<div class="copy">Copyright 2016 SP Game Store. Designed by Themezy. All rights reserved.</div>
						<div class="social-links square">
							<a href="#"><i class="fa fa-facebook"></i></a>
							<a href="#"><i class="fa fa-twitter"></i></a>
							<a href="#"><i class="fa fa-google-plus"></i></a>
							<a href="#"><i class="fa fa-pinterest"></i></a>
						</div> <!-- .social-links -->
					</div> <!-- .colophon -->
				</div> <!-- .container -->
			</div> <!-- .site-footer -->
		</div>

		<div class="overlay"></div>

		<div class="auth-popup popup">
			<a href="#" class="close"><i class="fa fa-close"></i></a>
			<div class="row">
				<div class="col-md-6">
					<h2 class="section-title">Login</h2>
					<form action="#">
						<input type="text" placeholder="Username...">
						<input type="password" placeholder="Password...">
						<input type="submit" value="Login">
					</form>
				</div> <!-- .column -->
				<div class="col-md-6">
					<h2 class="section-title">Create an account</h2>
					<form action="#">
						<input type="text" placeholder="Username...">
						<input type="text" placeholder="Email address...">
						<input type="submit" value="register">
					</form>
				</div> <!-- .column -->
			</div> <!-- .row -->
		</div> <!-- .auth-popup -->

		<script src="js/jquery-1.11.1.min.js"></script>
		<script src="js/plugins.js"></script>
		<script src="js/app.js"></script>
		
	</body>

</html>
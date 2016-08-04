<%@ page import="java.sql.*, SQLCommands.*, model.*, java.util.*"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1">
		
		<title>SP Game Store</title>

		<!-- Loading third party fonts -->
		<link href="http://fonts.googleapis.com/css?family=Roboto:400,700|" rel="stylesheet" type="text/css">
		<link href="fonts/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link href="fonts/lineo-icon/style.css" rel="stylesheet" type="text/css">

		<!-- Loading main css file -->
		<link rel="stylesheet" href="style.css">
		
		<!--[if lt IE 9]>
		<script src="js/ie-support/html5.js"></script>
		<script src="js/ie-support/respond.js"></script>
		<![endif]-->

	</head>
<%
if (((String)request.getAttribute("checked") != "checked")){
	%><jsp:forward page="/SetUserAccess"/><%
}%>

	<body>
		<div id="site-content">
			<div class="site-header">
				<div class="container">
					<a href="index.html" id="branding">
						<img src="images/logo.png" alt="" class="logo">
						<div class="logo-text">
							<h1 class="site-title">SP Game Store</h1>
							<small class="site-description">Affordable Games At Your
							Doorstep</small>
						</div>
					</a> <!-- #branding -->

					<div class="right-section pull-right">
						<a href="cart.html" class="cart"><i class="icon-cart"></i> 0 items in cart</a>
					</div> <!-- .right-section -->

					<div class="main-navigation">
						<button class="toggle-menu"><i class="fa fa-bars"></i></button>
						<ul class="menu">
						<li class="menu-item"><a href="index.html"><i
								class="icon-home"></i></a></li>
						<li class="menu-item home current-menu-item"><a
							href="products.jsp">Products</a></li>
						<li class="menu-item"><a href="about.html">About</a></li>
						<li class="menu-item"><a href="login.jsp">Login/Register</a></li>
						</ul> <!-- .menu -->
						<div class="search-form">
							<label><img src="images/icon-search.png"></label>
							<input type="text" placeholder="Search...">
						</div> <!-- .search-form -->

						<div class="mobile-navigation"></div> <!-- .mobile-navigation -->
					</div> <!-- .main-navigation -->

					<div class="breadcrumbs">
						<div class="container">
							<a href="index.html">Home</a>
							<span>Cart</span>
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
									<th class="action"></th>
								</tr>
							</thead>
							<tbody>
							<%
						//CartItemBean item = (CartItemBean)request.getAttribute("addItems");
							int UserID = (int)session.getAttribute("UserID");
							System.out.println("This is the UserID from cart : "+ UserID);
						ArrayList<CartItemBean> carts = (ArrayList<CartItemBean>)session.getAttribute("addSuccess");
						
						if (carts!= null){
							double total = 0;
							for (CartItemBean cart: carts){
						%>
								<tr>
									<td class="product-name">
										<div class="product-thumbnail">
											<img src="<%=cart.getLogoURL() %>" alt="" width="200px" height="200px">
										</div>
										<div class="product-detail">
											<h3 class="product-title"><%=cart.getTitle() %></h3>
											<p><%=cart.getDescription() %></p>
										</div>
									</td>
									<td class="product-price">$<%=""+cart.getPrice() %></td>
									<td class="product-qty">
									<form method="post" action="addCart">
									<input name="Stock" placeholder="<%=cart.getStock()%>" style="width:80px;">
									<input type="hidden" name="GameID" value="<%=cart.getGameID()%>" />
									<input type="hidden" name="Title" value="<%=cart.getTitle()%>" />
									<input type="hidden" name="Descrition" value="<%=cart.getDescription()%>" />
									<input type="hidden" name="logoURL" value="<%=cart.getLogoURL()%>" />
									<input type="hidden" name="price" value="<%=cart.getPrice()%>" />
									
									<input type="submit" style="visibility: hidden; width:10px;" />
									</form>
									</td>
									<td class="product-total">$<%=cart.getTotal() %></td>
									<td class="action">
									<form method="get" action="deleteCart">
									<input type="hidden" name="GameID" value="<%=cart.getGameID()%>">
									<button type="submit"><i class="fa fa-times"></i></button></td>		
									</form>
								</tr>
						<%			

						}
						%>
						<% 
							}
						%>
						
							</tbody>
						</table> <!-- .cart -->
						
						<div class="cart-total"> 
							<p>
								<a href="products.jsp" class="button muted">Continue Shopping</a>
								<form method="post" action="GetUserInfo">
								<input type="hidden" name="UserID" value="<%=UserID%>">
								<button type="submit"><a href="checkout.jsp" class="button">Checkout</a></button>
								</form>
							</p>
							
						</div> 

						<!-- .cart-total -->

					</div>
				</div> <!-- .container -->
			</main> <!-- .main-content -->

			<div class="site-footer">
				<div class="container">
					<div class="row">
						<div class="col-md-2">
							<div class="widget">
								<h3 class="widget-title">Information</h3>
								<ul class="no-bullet">
									<li><a href="#">Site map</a></li>
									<li><a href="#">About us</a></li>
									<li><a href="#">FAQ</a></li>
									<li><a href="#">Privacy Policy</a></li>
									<li><a href="#">Contact</a></li>
								</ul>
							</div> <!-- .widget -->
						</div> <!-- column -->
						<div class="col-md-2">
							<div class="widget">
								<h3 class="widget-title">Consumer Service</h3>
								<ul class="no-bullet">
									<li><a href="#">Secure</a></li>
									<li><a href="#">Shipping &amp; Returns</a></li>
									<li><a href="#">Shipping</a></li>
									<li><a href="#">Orders &amp; Returns</a></li>
									<li><a href="#">Group Sales</a></li>
								</ul>
							</div> <!-- .widget -->
						</div> <!-- column -->
						<div class="col-md-2">
							<div class="widget">
								<h3 class="widget-title">My Account</h3>
								<ul class="no-bullet">
									<li><a href="#">Login/Register</a></li>
									<li><a href="#">Settings</a></li>
									<li><a href="#">Cart</a></li>
									<li><a href="#">Order Tracking</a></li>
									<li><a href="#">Logout</a></li>
								</ul>
							</div> <!-- .widget -->
						</div> <!-- column -->
						<div class="col-md-6">
							<div class="widget">
								<h3 class="widget-title">Join our newsletter</h3>
								<form action="#" class="newsletter-form">
									<input type="text" placeholder="Enter your email...">
									<input type="submit" value="Subsribe">
								</form>
							</div> <!-- .widget -->
						</div> <!-- column -->
					</div><!-- .row -->

					<div class="colophon">
						<div class="copy">Copyright 2014 Company name. Designed by Themezy. All rights reserved.</div>
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
			<a href="#" class="close"><i class="fa fa-times"></i></a>
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
		
		<script>
			function myFunction() {
    		alert("I am an alert box!");
			}
		</script>
		
	</body>

</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		
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

	<body class="slider-collapse">
		
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
							<li class="menu-item home current-menu-item"><a href="index.html"><i class="icon-home"></i></a></li>
							<li class="menu-item"><a href="products.jsp">Products</a></li>
							<li class="menu-item"><a href="about.html">About</a></li>
							<li class="menu-item">
							<%
							if (session.getAttribute("UserName") == null){
								%><a href="login.jsp">Login</a><%
							}
							else {
								%><a href="UpdateProfileView.jsp"><%=(String)session.getAttribute("UserName")%></a><%
							}
							%>
							</li>
							
						</ul> <!-- .menu -->


						<div class="mobile-navigation"></div> <!-- .mobile-navigation -->
					</div> <!-- .main-navigation -->
				</div> <!-- .container -->
			</div> <!-- .site-header -->

			<div class="home-slider">
				<ul class="slides">
					<li data-bg-image="dummy/slide-1.jpg" >
						<div class="container">
							<div class="slide-content">
								<h2 class="slide-title">NBA 2K16</h2>
								<small class="slide-subtitle">$55.00</small>
								
								<p>NBA 2K16 is a basketball simulation video game based on the National Basketball Association. Like past games in the series, NBA 2K16 simulates the experience of the NBA. Players play NBA games with any real life or custom team, and can customize many aspects.</p>
								
								<a href="cart.html" class="button">Add to cart</a>
							</div>

							<img src="EAD_Images/NBA/logo.jpg" class="slide-image">
						</div>
					</li>
					<li data-bg-image="dummy/slide-2.jpg">
						<div class="container">
							<div class="slide-content">
								<h2 class="slide-title">Minecraft</h2>
								<small class="slide-subtitle">$29.00</small>
								
								<p>Minecraft is a game about placing blocks and going on adventures. Explore randomly generated worlds and build amazing things from the simplest of homes to the grandest of castles. Play in Creative Mode with unlimited resources or mine deep in Survival Mode, crafting weapons and armor to fend off dangerous mobs. Do all this alone or with friends.</p>
								
								<a href="cart.html" class="button">Add to cart</a>
							</div>

							<img src="EAD_Images/Minecraft/logo.jpg" class="slide-image">
						</div>
					</li>
					<li data-bg-image="dummy/slide-3.jpg">
						<div class="container">
							<div class="slide-content">
								<h2 class="slide-title">Dragon Quest VIII</h2>
								<small class="slide-subtitle">$49.00</small>
								
								<p>Better known to American as Dragon Warrior 8, Dragon Quest VIII brings the long-running RPG series to the PlayStation 2 for the first time. In it, players are able to capture monsters that inhabit the battlefield. Other new additions to the series include full day and night cycles for towns.</p>
								
								<a href="cart.html" class="button">Add to cart</a>
							</div>

							<img src="EAD_Images/DragonQuest VIII/logo.jpg" class="slide-image">
						</div>
					</li>
				</ul> <!-- .slides -->
			</div> <!-- .home-slider -->

			<main class="main-content">
				<div class="container">
					<div class="page">
						<section>
							<header>
								<h2 class="section-title">Featured Products</h2>
								<a href="products.html" class="all">Show All</a>
							</header>

							<div class="product-list">
								<div class="product">
									<div class="inner-product">
										<div class="figure-image">
											<a href="single.html"><img src="EAD_Images/Sims3/logo.jpg" alt="Game 1"></a>
										</div>
										<h3 class="product-title"><a href="#">The Sims 3</a></h3>
										<small class="price">$49.00</small>
										<p>The Sims 3 is the third major title in the life simulation video game. The freedom of 
										it will inspire you with endless creative possibilities and amuse you 
										with surprises.</p>
										<a href="cart.html" class="button">Add to cart</a>
										<a href="#" class="button muted">Read Details</a>
									</div>
								</div> <!-- .product -->

								<div class="product">
									<div class="inner-product">
										<div class="figure-image">
											<a href="single.html"><img src="EAD_Images/Final Fantasy/logo.jpg" alt="Game 2"></a>
										</div>
										<h3 class="product-title"><a href="#">Final Fantasy XIII</a></h3>
										<small class="price">$69.50</small>
										<p>Final Fantasy XIII begins in Cocoon as the citizens of the town of Bodhum are being evicted, or Purged,
										 from Cocoon after coming in contact with something from Pulse.</p>
										<a href="cart.html" class="button">Add to cart</a>
										<a href="#" class="button muted">Read Details</a>
									</div>
								</div> <!-- .product -->

								<div class="product">
									<div class="inner-product">
										<div class="figure-image">
											<a href="single.html"><img src="EAD_Images/Persona 5/logo.jpg" alt="Game 3"></a>
										</div>
										<h3 class="product-title"><a href="#">Persona 5</a></h3>
										<small class="price">$63.00</small>
										<p>Persona 5 is a role-playing game in which players live out a year in the life of a high
										 school boy who gains the ability to summon facets of his psyche, known as Personas.
										 </p>
										<a href="cart.html" class="button">Add to cart</a>
										<a href="#" class="button muted">Read Details</a>
									</div>
								</div> <!-- .product -->

								<div class="product">
									<div class="inner-product">
										<div class="figure-image">
											<a href="single.html"><img src="EAD_Images/WOW/logo.jpg" alt="Game 4"></a>
										</div>
										<h3 class="product-title"><a href="#">World Of Warcraft</a></h3>
										<small class="price">$45.00</small>
										<p>World of Warcraft requires the player to pay for a subscription, either by buying 
										prepaid game cards for a selected amount of playing time or pay using credit card.</p>
										<a href="cart.html" class="button">Add to cart</a>
										<a href="#" class="button muted">Read Details</a>
									</div>
								</div> <!-- .product -->

							</div> <!-- .product-list -->

						</section>

						
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
		<%if (request.getAttribute("display") != null){
			%>alert("<%=(String)request.getAttribute("display")%>")<%
		}%>
		</script>
		
	</body>
</html>
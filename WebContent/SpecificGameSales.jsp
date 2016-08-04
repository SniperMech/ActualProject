<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="model.*, java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% sales display = (sales)request.getAttribute("GameSales"); %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1">
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
		
		<script type="text/javascript">
		window.onload = function () {
			var chart = new CanvasJS.Chart("chartContainer", {
				title: {
					text: "Overall All Time Game Sales For <%=display.getGameName()%>"
				},
				data: [{
					type: "column",
					dataPoints: [
					  { label: "<%=display.getGameName()%>" , y: <%=display.getCost() %>, indexLabel: "Cost" }
					]
				}, {
					type: "column",
					dataPoints: [
					  { label: "<%=display.getGameName()%>" , y: <%=display.getRevenue() %>, indexLabel: "Revenue" }
					]
				}, {
					type: "column",
					dataPoints: [
					  { label: "<%=display.getGameName()%>" , y: <%=display.getProfit() %>, indexLabel: "Profit" }
					]
				}, {
					type: "column",
					dataPoints: [
					  { label: "<%=display.getGameName()%>" , y: <%=display.getSold()%>, indexLabel: "Sold" }
					]
				}]
			});
			chart.render();
		}
	</script>
	<script src="canvasjs.min.js"></script>
		
		
<style>
table, th {
    border: 1px solid black;
}
</style>

<title>Insert title here</title>
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
						
						<div id="chartContainer" style="height: 500px; width: 100%;"></div>

<h2>The Game chosen is <%=display.getGameName() %> </h2>

<h2>There is a total of <%=display.getntransactions() %> transactions for this game  </h2>

<h2>The initial cost used to purchase the set amount of the games is <%=display.getCost() %> </h2>

<h2>The revenue generated for this game is <%=display.getRevenue() %> </h2>

<h2>Hence the evaluated profit is <%=display.getRevenue() %> - <%=display.getCost()%> = <%=display.getProfit() %></h2>
						
						
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



</body>
</html>
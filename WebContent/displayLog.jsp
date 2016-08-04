<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="model.*, java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
		
<style>
table, th {
    border: 1px solid black;
}
</style>

<% ArrayList<log> display = (ArrayList<log>)request.getAttribute("logs"); %>

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
						
						<table cellspacing = "30", cellpadding = "4">
<tr>
<th> UserID</th>
<th> Username</th>
<th> Email</th>
<th> IPaddress</th>
<th> Time of Access</th>
</tr>
<% 

for (log data: display){
	
%>	
<tr>
    <td> <%=data.getUserID()%></td>
    <td> <%=data.getUsername()%></td>
    <td> <%=data.getEmail()%></td>
    <td> <%=data.getIPaddr()%></td>
    <td> <%=data.getDatetime()%></td>
    </tr>
<%
}
%>
</table>
						
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
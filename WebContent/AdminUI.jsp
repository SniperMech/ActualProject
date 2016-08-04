<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, SQLCommands.*, Model.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Administrator User Interface</title>
<link
	href="http://fonts.googleapis.com/css?family=Roboto:100,300,400,700|"
	rel="stylesheet" type="text/css">
<link href="fonts/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="fonts/lineo-icon/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="style.css">

</head>
<body>
<%
if ((session.getAttribute("UserID") == null)){
	%><jsp:forward page="/AdminAccessFail"/><%
}else if(((int)session.getAttribute("UserID") != 1)){
	%><jsp:forward page="/AdminAccessFail"/><%
}%>

<%
if ((request.getAttribute("gameslist") == null)){
	%><jsp:forward page="/DropDownList"/><%} %>

	<div id="site-content">
		<div class="site-header">
			<div class="container">
				<a href="index.html" id="branding"> <img src="images/logo.png"
					alt="" class="logo">
					<div class="logo-text">
						<h1 class="site-title">SP Game Store</h1>
						<small class="site-description">Affordable Games At Your
							Doorstep</small>
					</div>
				</a>
				<!-- #branding -->

				<div class="right-section pull-right">
					<a href="cart.html" class="cart"><i class="icon-cart"></i> 0
						items in cart</a>
				</div>
				<!-- .right-section -->

				<div class="main-navigation">
					<button class="toggle-menu">
						<i class="fa fa-bars"></i>
					</button>
					<ul class="menu">
						<li class="menu-item"><a href="index.html"><i
								class="icon-home"></i></a></li>
						<li class="menu-item"><a href="products.jsp">Products</a></li>
						<li class="menu-item home current-menu-item"><a
							href="about.html">About</a></li>
						<li class="menu-item"><a href="login.jsp">Login/Register</a></li>
						<form action = "LogoutServlet" method = "post">
						<button value="Logout" name="Logout"></button>
						</form>
					</ul>
					<!-- .menu -->

					<div class="mobile-navigation"></div>
					<!-- .mobile-navigation -->
				</div>
				<!-- .main-navigation -->
				<div class="breadcrumbs">
					<div class="container">
						<a href="index.html">Home</a>
						<p>AdminUI</p>
					</div>
				</div>
			</div>
			<!-- .container -->
		</div>
		<!-- .site-header -->
		<main class="main-content">
		<div class="container">
			<div class="page">
				<h1>Sales Report:</h1>
				<%ArrayList<games> gamelist = (ArrayList<games>)request.getAttribute("gameslist"); %>
				<h3>Generate Sales</h3>
					<form action="ObtainSalesDatabyGameID" method="POST">
					Generate Total Sales For GameID: 
					<select name="GameID">
					<%for(games gameslist : gamelist){
					%>
					<option value = <%=gameslist.getGameID()%> >
					<%out.println(gameslist.getTitle()); %>
					</option>
					<%} %>
					</select>
					<input type="submit" name="generate" value="generate">
					</form>
					<br/>
					<br/>
					<br/>
					<form action="ObtainSalesDatabyMonth" method="POST">
					<div>Generate Specific Month's Total Sales:</div>
					<%ArrayList<transaction> months = (ArrayList<transaction>)request.getAttribute("months");%>
					
					<select name="month">
					<%for(transaction transactionlist : months){
					%>
					<option value = <%=transactionlist.getMonth()%> >
					<%=transactionlist.getMonth() %>
					</option>
					<%} %>
					</select>
					<input type="submit" name="generate" value="generate">
					</form>

					<br/>
					<br/>
					<br/>

					<form action="CompareSalesDatabyMonth" method="POST">

					<div>Choose 1st Month For Comparison:</div> <select name="month">
					<%for(transaction transactionlist : months){
					%>
					<option value = <%=transactionlist.getMonth()%> >
					<%=transactionlist.getMonth() %>
					</option>
					<%} %>
					</select>
					<br/>
					<br/>
					<br/>
					<div>Choose 2nd Month For Comparison:</div> <select name="month2">
					<%for(transaction transactionlist : months){
					%>
					<option value = <%=transactionlist.getMonth()%> >
					<%=transactionlist.getMonth() %>
					</option>
					<%} %>
					</select>

					<input type="submit" name="generate" value="Compare">
					</form>
					<br/><br/>
					
				<h3>Generate Logs:</h3>
					<form action="LoggingServlet" method="POST">
					<input type="submit" name="generate" value="generate">
					</form>
					<br/><br/>
				
				
			
			</div>
		</div>
		<!-- .container --> </main>
		<!-- .main-content -->
		<div class="site-footer">
			<div class="container">

				<div class="colophon">
					<div class="copy">Copyright 2016 SP Game Store. Designed by
						Themezy. All rights reserved.</div>
					<div class="social-links square">
						<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
							class="fa fa-twitter"></i></a> <a href="#"><i
							class="fa fa-google-plus"></i></a> <a href="#"><i
							class="fa fa-pinterest"></i></a>
					</div>
					<!-- .social-links -->
				</div>
				<!-- .colophon -->
			</div>
			<!-- .container -->
		</div>
		<!-- .site-footer -->
	</div>
</body>
<IFRAME style="display: none" name="hidden-form"></IFRAME>
<style>
table {
	border-collapse: collapse;
}

table, td, th {
	border: 1px solid black;
}
</style>
<script>
	function reload() {
		history.go(0);
	}
</script>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, SQLCommands.*"%>
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
				<h1>Users:</h1>

				<h3>Add User:</h3>
				<form action="addUser.jsp" target="hidden-form">
					UserName: <input type="text" name="uname"> Password: <input
						type="password" name="psswd"> Email: <input type="text"
						name="email"> <input type="submit" name="btnSubmit"
						onclick="setTimeout(reload, 1000)" value="Add User">
				</form>
<br><br>
				<%
				DBConnection.getConnection();
				%>
				<h3>Delete User:</h3>
				<form action="deleteUser.jsp" target="hidden-form">
		  UserName: <select name="uname">
					<%
					String[] users=DBConnection.getLogins("uname");
					for(int i=0; i<users.length;i++){%>
						<option value=<%="\""+users[i]+"\"" %>><%=users[i]%></option>
						<%}%>
					</select>
<input type="submit" name="btnSubmit" onclick="setTimeout(reload, 1000)" value="Delete User">
				</form>
				<br>
				<br>
				<h3>Update User:</h3>
				<form action="modifyTable.jsp">
<table>
					<%
					DBConnection.getConnection();
					
						String[][] ArrayTable = DBConnection.tableToArray("logins");
						response.addCookie(new Cookie ("table", "logins"));
						
						int valuecount = 0;
						%><tr><%
						for(int columns = 0; columns < ArrayTable[0].length; columns++){
							%><th><%=ArrayTable[0][columns]%></th><%
						}
						%></tr><tr><%
							for (int rows = 0; rows < ArrayTable.length-1; rows++) {

								for (int columns = 0; columns < ArrayTable[0].length; columns++) {
							%><td><input type="text" name="value<%=valuecount%>" value=<%=ArrayTable[rows+1][columns]%>></td>
						<%
							valuecount++;
							}
						%>
					</tr>
					<%
						}
					%>
				</table>
				<input type="submit" value="submit"></form>
				<br>
				<br>

				<h1>Games:</h1>

				<h3>Add Game:</h3>
				<form action="addGame.jsp" target="hidden-form">
					Title: <input type="text" name="Title"> Company: <input
						type="text" name="Company"> Date: <input type="date"
						name="Date"> <br /> <br /> Description:
					<textarea name="Description" ROWS=3 COLS=40></textarea>
					Price: <input type="number" name="Price"> <br /> <br />
					Icon 1: <input type="file" name="icon1"> Icon 2: <input
						type="file" name="icon2"> Icon 3: <input type="file"
						name="icon3"> <br /> <br /> Image 1: <input type="file"
						name="image1"> Image 2: <input type="file" name="image2">
					Image 3: <input type="file" name="image3"> <br /> <br />
					Logo 1: <input type="file" name="logo"> Logo 2: <input
						type="file" name="logo2"> <br /> <br /> <input
						type="radio" name="preowned" value="Preowned">Preowned | <input
						type="radio" name="preowned" value="New">New <br /> <br />
					Genres: <br />

					<%
						String[] Genres = DBConnection.getGenres();
						String[] GenreIDs = DBConnection.getGenreIDs();
						for (int i = 0; i < Genres.length; i++) {
					%>
					<input type="checkbox" name="Genres" value=<%=GenreIDs[i]%> style="width:24px; height:24px;""> <%=Genres[i]%><br />
					<%
						}
					%>
					<br /> <br /> <input type="submit" name="btnSubmit"
						onclick="setTimeout(reload, 1000)" value="Add Game">
				</form>

				<br>
				<br>
				<h3>Delete Game:</h3>
				<form action="deleteGame.jsp" target="hidden-form">
					Game: <select name="Game"><%
					String[] Games = DBConnection.getValues("Title");
					for(int i=0; i<Games.length;i++){%>
						<option value="<%=Games[i] %>"><%=Games[i]%></option>
						<%}%></select>
			<input type="submit" name="btnSubmit" onclick="setTimeout(reload, 2000)" value="Delete Game">
				</form>
				<br>
				<br>


				<h3>Update Game:</h3>

				<form action="updateGame.jsp" target="hidden-form">
					Value to Update: <select name="ToUpdate">
						<option value="Title">Title</option>
						<option value="Company">Company</option>
						<option value="Date">Date</option>
						<option value="Decription">Description</option>
						<option value="Price">Price</option>
						<option value="Preowned">Preowned</option>
					</select> New Value: <input type="text" name="NewValue"> GameID of
					Game To Updated: <select name="Game"><%
					for(int i=0; i<Games.length;i++){%>
						<option value="<%=Games[i] %>"><%=Games[i]%></option>
						<%}%></select> <input
						type="submit" name="btnSubmit" onclick="setTimeout(reload, 1000)"
						value="Update Game">
				</form>
				<br />
				<br>
				<br>


				<form action=updateGameImage.jsp target="hidden-form">
					Image to Update: <select name="ToUpdate">
						<option value="icon1">icon1</option>
						<option value="icon2">icon2</option>
						<option value="icon3">icon3</option>
						<option value="image1">image1</option>
						<option value="image2">image2</option>
						<option value="image3">image3</option>
						<option value="logo">logo</option>
						<option value="logo2">logo2</option>
					</select> New Image: <input type="file" name="NewImage"> GameID of
					Game To Updated: <select name="Game"><%
					for(int i=0; i<Games.length;i++){%>
						<option value="<%=Games[i] %>"><%=Games[i]%></option>
						<%}%></select> <input
						type="submit" name="btnSubmit" onclick="setTimeout(reload, 1000)"
						value="Update Game">
				</form>
				<br/>
				<br/>
				<table cellpadding="30">
					
					<%
						ArrayTable = DBConnection.tableToArray("games");

						for (int rows = 0; rows < ArrayTable.length; rows++) {
					%><tr>
						<%
							for (int columns = 0; columns < ArrayTable[0].length; columns++) {
						%><th><%=ArrayTable[rows][columns]%></th>
						<%
							}
						%>
					</tr>
					<%
						}
					%>
				</table>
				<br>
				<br>
				<h1>Genres:</h1>

				<h3>Add Genre</h3>
				<form action=addGenre.jsp target="hidden-form">
					Genre: <input type="text" name="Genre"> <input
						type="submit" name="btnSubmit" onclick="setTimeout(reload, 1000)"
						value="Add Genre">
				</form>
				<br>
				<h3>Delete Genre</h3>
				<form action=deleteGenre.jsp target="hidden-form">
					GenreID: <select name="Genre"><%
					
					for(int i=0; i<Genres.length;i++){%>
						<option value="<%=Genres[i] %>"><%=Genres[i]%></option>
						<%}%></select> <input
						type="submit" name="btnSubmit" onclick="setTimeout(reload, 1000)"
						value="Delete Genre">
				</form>
				<br> <br>
				<table cellpadding="30">
					
					<%
						ArrayTable = DBConnection.tableToArray("Genre");

						for (int rows = 0; rows < ArrayTable.length; rows++) {
					%><tr>
						<%
							for (int columns = 0; columns < ArrayTable[0].length; columns++) {
						%><th><%=ArrayTable[rows][columns]%></th>
						<%
							}
						%>
					</tr>
					<%
						}
					%>
				</table>
				<br/>
				<br/>
				<h1>Comments:</h1>

				<h3>Add Comment</h3>
				<form action=addComment.jsp target="hidden-form">
					GameID: <input type="number" name="GameID"> Comment:
					<textarea name="Comment" ROWS=3 COLS=40></textarea>
					<input type="submit" name="btnSubmit"
						onclick="setTimeout(reload, 1000)" value="Add Comment">
				</form>

				<h3>Delete Comment</h3>
				<form action=deleteComment.jsp "
					target="hidden-form">
					CommentID: <input type="number" name="CommentID"> GameID: <input
						type="number" name="GameID"> <input type="submit"
						name="btnSubmit" onclick="setTimeout(reload, 1000)"
						value="Delete Comment">
				</form>
				<br/>
				
				<br/>
				<table cellpadding="30">
					
					<%
						ArrayTable = DBConnection.tableToArray("comments");

						for (int rows = 0; rows < ArrayTable.length; rows++) {
					%><tr>
						<%
							for (int columns = 0; columns < ArrayTable[0].length; columns++) {
						%><th><%=ArrayTable[rows][columns]%></th>
						<%
							}
						%>
					</tr>
					<%
						}
					%>
				</table>
				<br/>
				<br/>



			
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
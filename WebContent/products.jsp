
<%@ page import="java.sql.*, SQLCommands.*"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1">

<title>SP Game Store</title>

<!-- Loading third party fonts -->
<link href="http://fonts.googleapis.com/css?family=Roboto:100,400,700|"
	rel="stylesheet" type="text/css">
<link href="fonts/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="fonts/lineo-icon/style.css" rel="stylesheet" type="text/css">

<!-- Loading main css file -->
<link rel="stylesheet" href="style.css">

<!--[if lt IE 9]>
		<script src="js/ie-support/html5.js"></script>
		<script src="js/ie-support/respond.js"></script>
		<![endif]-->
		
<style type="text/css">
#results {
    display: none;
    position: absolute;
    width: 170px;
    left:10px;
    float:none;
}
#results div {
    position: absolute;
    width: 170px; 
    height: 20px;
    cursor: pointer;
    left:10px;
    float:none;
    font-weight:bold;
    color:black;
    font-size:18px;
}
#results div span {
    font-weight:normal;
    float:none;
}
</style>
</head>
<body>


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
						<li class="menu-item home current-menu-item"><a
							href="products.jsp">Products</a></li>
						<li class="menu-item"><a href="about.html">About</a></li>
						<li class="menu-item"><a href="login.jsp">Login/Register</a></li>
					</ul>
					<!-- .menu -->


					<div class="mobile-navigation"></div>
					<!-- .mobile-navigation -->
				</div>
				<!-- .main-navigation -->

				<div class="breadcrumbs">
					<div class="container">
						<a href="index.html">Home</a>
						<p>Play Station Games</p>
					</div>
				</div>

			</div>
			<!-- .container -->
		</div>
		<!-- .site-header -->
		<main class="main-content">
		<div class="container">
			<div class="page">
				<div class="filter-bar">
					<div class="filter">
						<form id="tfnewsearch" method="post" action="products.jsp">
								<fieldset>
								<ul>
									<li><input type="radio" name="preowned" value="New">
										New<br></li>
									<li><input type="radio" name="preowned" value="Preowned">
										Preowned</li>
								</ul>
								</fieldset>
						
								<fieldset class="genrelist">

									<select name="genre">
										<option value="">All</option>
										<%
											DBConnection.getConnection();
											String[] Genres = DBConnection.getGenres();
											for (int i = 0; i < Genres.length; i++) {
										%>
										<option value=<%="\""+Genres[i]+"\"" %>><%=Genres[i]%></option>
										<%
											}
										%>
									</select>
								</fieldset>
							

							<fieldset id="tfheader">
									
									<input type="text" class="tftextinput" name="search2">
									
										<input type="submit" value="search" class="tfbutton">
								<div class="tfclear"></div>
							</fieldset>
							<div id="results"></div>
						</form>
					</div>
					<!-- .filter -->
				</div>
				<!-- .filter-bar -->
				
				
				<div class="product-list">
								<%
								String[] GameID;
								String[] Games;
								
								if(request.getParameter("preowned")==null&&
									request.getParameter("genre")==null&&
									request.getParameter("search2")==null){
								GameID = DBConnection.getValues("GameID");
								Games = DBConnection.getValues("Title");
								
								}
								else{
									GameID = DBConnection.getSpecificGames("Ga.GameID", request.getParameter("preowned"), request.getParameter("genre"), request.getParameter("search2"));
									Games = DBConnection.getSpecificGames("Title", request.getParameter("preowned"), request.getParameter("genre"), request.getParameter("search2"));
								}
						for(int i=0;i<Games.length;i++){	
										%>
						<div class="product">
							<div class="inner-product">
								<div class="figure-image">
									<a href=<%="single.jsp?GameID="+GameID[i]%>><img src=<%= "EAD_Images/"+Games[i].replaceAll("\\s","_")+"/logo.jpg"%> alt="<%=Games[i]%> logo"></a>
								</div>
									<h3><%=Games[i] %></h3>
								
									
	
								<a href="#" class="button">Add to cart</a> <a href="single.html"
									class="button muted">Read Details</a>
							</div>

						</div>
						<!-- .product -->
				<%} %>
				</div>
				<!-- .product-list -->
				
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

	<div class="overlay"></div>

	<div class="auth-popup popup">
		<a href="#" class="close"><i class="fa fa-close"></i></a>
		<div class="row">
			<div class="col-md-6">
				<h2 class="section-title">Login</h2>
				<form action="#">
					<input type="text" placeholder="Username..."> <input
						type="password" placeholder="Password..."> <input
						type="submit" value="Login">
				</form>
			</div>
			<!-- .column -->
			<div class="col-md-6">
				<h2 class="section-title">Create an account</h2>
				<form action="#">
					<input type="text" placeholder="Username..."> <input
						type="text" placeholder="Email address..."> <input
						type="submit" value="register">
				</form>
			</div>
			<!-- .column -->
		</div>
		<!-- .row -->
	</div>
	<!-- .auth-popup -->

	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/plugins.js"></script>
	<script src="js/app.js"></script>

<script type="text/javascript">
(
  function()
  {

      var lookFor = [
        <%
        Games = DBConnection.getValues("Title");
        for (int i=0; i<Games.length ; i++){
        	%><%="\""+Games[i]+"\","%><%
        }
        %>
      ];

      var form = document.getElementById("tfnewsearch");
      var resultsDiv = document.getElementById("results");
      var tftextinput = form.search2;

      // first, position the results:
      var node = tftextinput;
      var x = 0;
      var y = 0;
      while ( node != null )
      {
          x += node.offsetLeft;
          y += node.offsetTop;
          node = node.offsetParent;
      }
      resultsDiv.style.left = x + "px";
      resultsDiv.style.top  = (y + 20) + "px";
      
      // now, attach the keyup handler to the search field:
      tftextinput.onkeyup = function()
      {
          var txt = this.value.toLowerCase();
          if ( txt.length == 0 ) return;

          var txtRE = new RegExp( "("+txt+")", "ig" );
          // now...do we have any matches?
          var top = 0;
          for ( var s = 0; s < lookFor.length; ++s )
          {
              var srch = lookFor[s];
              if ( srch.toLowerCase().indexOf(txt) >= 0 )
              {
                  srch = srch.replace( txtRE, "<span>$1</span>" );
                  var div = document.createElement("div");
                  div.innerHTML = srch;
                  div.onclick = function() {
                      tftextinput.value = this.innerHTML.replace(/\<\/?span\>/ig,"");
                      resultsDiv.style.display = "none";
                  };
                  div.style.top = top + "px";
                  top += 20;
                  resultsDiv.appendChild(div);
                  resultsDiv.style.display = "block";
              }
          }
      }
      // and the keydown handler:
      tftextinput.onkeydown = function() 
      {
          while ( resultsDiv.firstChild != null )
          {
              resultsDiv.removeChild( resultsDiv.firstChild );
          }
          resultsDiv.style.display = "none";
      }
     
  }
)();
</script>
</body>
</html>
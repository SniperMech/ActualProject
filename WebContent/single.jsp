<%@ page import="java.sql.*, SQLCommands.*"%>
<!DOCTYPE html>
<html lang="en">
		<%
		String logincon=request.getParameter("GameID");
		DBConnection.getConnection();
		String[] productValues = DBConnection.productPage(request.getParameter("GameID"));
		
	%>
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
							<li class="menu-item home current-menu-item"><a href="products.jsp">Products</a></li>
							<li class="menu-item"><a href="about.html">About</a></li>
							<li class="menu-item"><a href="login.jsp">Login/Register</a></li>
						</ul> <!-- .menu -->


						<div class="mobile-navigation"></div> <!-- .mobile-navigation -->
					</div> <!-- .main-navigation -->

					<div class="breadcrumbs">
						<div class="container">
							<a href="index.html">Home</a>
							<a href="products.jsp">Products</a>
							
						</div>
					</div>
				</div> <!-- .container -->
			</div> <!-- .site-header -->
			
			<main class="main-content">
				<div class="container">
					<div class="page">
						<div class="entry-content">
							<div class="row">
								<div class="col-sm-6 col-md-4">
									<div class="product-images">
										<figure class="large-image">
											<a href="<%out.println(productValues[12]);%>"><img src="<%out.println(productValues[11]);%>" alt=""></a>
										</figure>
										<div class="thumbnails">
											<a href="<%out.println(productValues[8]);%>"><img src="<%out.println(productValues[5]);%>" alt=""></a>
											<a href="<%out.println(productValues[9]);%>"><img src="<%out.println(productValues[6]);%>" alt=""></a>
											<a href="<%out.println(productValues[10]);%>"><img src="<%out.println(productValues[7]);%>" alt=""></a>
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-md-8">
									<h2 class="entry-title"><%out.println(productValues[1]);%></h2>
									<small class="price">$<%out.println(productValues[3]);%></small>

									<p><%out.println(productValues[13]);%></p>
									<br>
									<p class="preowned"><%out.println(productValues[4]);%></p>
									<div class="addtocart-bar">
										<form method="post" action="addCart">
											 <label for="#">Quantity</label>
											<select name="Stock">
											<%
											int[] quantity = new int[Integer.parseInt(productValues[14])];
											for(int i=0; i<quantity.length; i++){
											quantity[i] = 1 + i;
											%>
											<option value="<%=quantity[i]%>">
											<%
												out.println(quantity[i]);
											%>
											</option>
											<%
											}
											%>
											</select>
											
											<input type="hidden" name="GameID" value="<%=productValues[0]%>" />
											<input type="hidden" name="Title" value="<%=productValues[1]%>" />
											<input type="hidden" name="Descrition" value="<%=productValues[13]%>" />
											<input type="hidden" name="logoURL" value="<%=productValues[11]%>" />
											<input type="hidden" name="price" value="<%=productValues[3]%>" />
											<input type="submit" value="SubmitBtn">
										</form>
										<div class="social-links square">
											<strong>Share</strong>
											<a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
											<a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
											<a href="#" class="google-plus"><i class="fa fa-google-plus"></i></a>
											<a href="#" class="pinterest"><i class="fa fa-pinterest"></i></a>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<section>

							<header class="comment">

								<form action="addComment.jsp" method="post">
									<h1>Reviews</h1>
									<input type="hidden" name="GameID" value=<%=request.getParameter("GameID")%>>
									<div class="rating">
										
    									<span><input type="radio" name="rating" id="str5" value="5"><label for="str5"></label></span>
  									 	<span><input type="radio" name="rating" id="str4" value="4"><label for="str4"></label></span>
    									<span><input type="radio" name="rating" id="str3" value="3"><label for="str3"></label></span>
    									<span><input type="radio" name="rating" id="str2" value="2"><label for="str2"></label></span>
   										<span><input type="radio" name="rating" id="str1" value="1"><label for="str1"></label></span>
									</div>
									<fieldset class="comment-fieldset">
									<h2>Comment:</h2><textarea class="text" rows="4" cols="75" name="Comment" ></textarea>
									</fieldset>
									<br>
									</br>
									<input class="" type="submit" value="Submit">
								</form>
								<div class="media">
                <%
                Class.forName("com.mysql.jdbc.Driver");
        		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/gggameshop?user=root&password=root");
                String sql2="Select * from comments where GameID=?";
        		PreparedStatement pms=conn.prepareStatement(sql2);
        		pms.setInt(1,Integer.parseInt(request.getParameter("GameID")));
        		pms.execute();
        		ResultSet rs2 = pms.getResultSet();
        		if(!rs2.next())
        			out.println("<p>Comments have been disabled &#x2639</p>");
        		rs2.previous();
        		while(rs2.next()){
        			int commentid = rs2.getInt("CommentID");

            		String comment=rs2.getString("Comment");
            		
                %> 
                    <div class="media-body">
                        <h4 class="media-heading">
                            
                        </h4><%=comment %>
                        <p></p>
           
                        	&#x2605
                        <%
                        }
                        %>
                        
                        <br />
                        <hr />
                    </div>
              
                </div>
							</header>
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
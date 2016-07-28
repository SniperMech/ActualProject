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
<link
	href="http://fonts.googleapis.com/css?family=Roboto:100,300,400,700|"
	rel="stylesheet" type="text/css">
<link href="fonts/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="fonts/lineo-icon/style.css" rel="stylesheet" type="text/css">
<link rel='stylesheet' href='style.css' type='text/css' />
    <script src="js/jquery.js"></script>
    <script src="js/jquery.validate.js"></script>
<script>
$.validator.setDefaults({
    submitHandler: function() {
        alert("Thank You For Signing Up. A Verification Email Has Been Sent To Your Email Account");
    }
});

$().ready(function() {
    // validate the comment form when it is submitted
    $("#commentForm").validate();

    // validate signup form on keyup and submit
    $("#registration").validate({
        rules: {
            uname: {
                required: true,
                minlength: 2
            },  
            psswd: {
                required: true,
                minlength: 5
            },

            email: {
                required: true,
                email: true
            },
        messages: {
            
            uname: {
                required: "Please enter a username",
                minlength: "Your username must consist of at least 2 characters"
            },
            psswd: {
                required: "Please provide a password",
                minlength: "Must be at least 5 characters long"
            },
            
            email: "Please enter a valid email address",
        }
    }
    });

    

    //code to hide topic selection, disable for demo
    var newsletter = $("#newsletter");
    // newsletter topics are optional, hide at first
    var inital = newsletter.is(":checked");
    var topics = $("#newsletter_topics")[inital ? "removeClass" : "addClass"]("gray");
    var topicInputs = topics.find("input").attr("disabled", !inital);
    // show when newsletter is checked
    newsletter.click(function() {
        topics[this.checked ? "removeClass" : "addClass"]("gray");
        topicInputs.attr("disabled", !this.checked);
    });
});
</script>

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
						<li class="menu-item"><a href="about.html">About</a></li>
						<li class="menu-item home current-menu-item"><a
							href="login.jsp">Login/Register</a></li>
					</ul>
					<!-- .menu -->


					<div class="mobile-navigation"></div>
					<!-- .mobile-navigation -->
				</div>
				<!-- .main-navigation -->

				<div class="breadcrumbs">
					<div class="container">
						<a href="index.html">Home</a>
						<p>Login/Registration</p>
					</div>
				</div>
			</div>
			<!-- .container -->
		</div>
		<!-- .site-header -->

		<main class="main-content">
		<div class="container">
			<div class="page">

				<div class="entry-content">
					<div class="row">
						<div class="col-sm-6 col-md-4"></div>
					</div>
				</div>
			</div>

			<div class="loginpage2">
				<div class="signup">
					<h1>Sign Up</h1>
					<%
						DBConnection.getConnection();				
					%>
					<script type="text/javascript">
					function alert() {
    				alert("Successfully registered!");
					}
					</script>
	<%
		String logincon=request.getParameter("login");
		if(logincon != null && logincon.equals("pass"))
			out.println("Registration failed");
		else{
			out.println("Successfully registered!");
		}

	%>

					<form name="registration" onSubmit="return formValidation();"
						action="registerUser.jsp">
						<ul>
							<li><label for="username">User ID:</label></li>
							<li><input id="username" type="text" name="uname" size="30" /></li>
							<li><label for="password">Password:</label></li>
							<li><input type="password" name="psswd" size="30" /></li>
							<li><label for="email">Email:</label></li>
							<li><input type="text" name="email" size="30" /></li>
							<li><label for="securityQuestion">Security Question
									1:</label></li>
							<li><input type="text" name="securityQuestion" size="30" /></li>
							<li><label for="securityAnwer">Answer:</label></li>
							<li><input type="text" name="answer" size="30" /></li>
							<li><label for="securityQuestion">Security Question
									2:</label></li>
							<li><input type="text" name="securityQuestion" size="30" /></li>
							<li><label for="securityAnswer">Answer:</label></li>
							<li><input type="text" name="answer" size="30" /></li>
							<li><input type="submit" name="Sign Up" value="Submit" onclick="alert()"/></li>
						</ul>
					</form>
				</div>
				<div class="skyrim">
					<img src="images/skryimCharacter.png" alt="skyrim character"
						style="height: 600px; width: 600px;">
				</div>
				<div class="login">
					<h1>Login</h1>
<form action="checkLogin.jsp" method="post">
	Email: <input type="text" name="email">
	<br>
	Password: <input type="password" name="password">
	<br>
	<input type="submit" name="login" value="login">
</form>
				</div>

			</div>
			<section>
		</div>
	</div>
	<!-- .container -->
	</main>
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

</body>

</html>
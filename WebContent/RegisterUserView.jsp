<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
</head>
<body onload="pastSubmission()">

<form name="register" action="RegisterUserServlet" onsubmit="return validateForm()" method="post">

Username: <input name="uname" id="uname" type="text">
<br/><br/>
Email: <input name="email" id="email" type="email">
<br/><br/>
Address: <textarea name="address" id="address" rows="4" cols="50"></textarea>
<br/><br/>
Number: <input name="number" id="number" type="number">
<br/><br/>
Password: <input name="password" id="password" type="password">
<br/><br/>
<input value="Register" type="submit">
</form>
<br/>
<%
if (request.getAttribute("errors")!=null){
	String[] errorArray = (String[])request.getAttribute("errors");
	%>ERROR:<br><%
	for (int i = 0 ; i < errorArray.length ; i++){%>
		<%=errorArray[i]%><br><%
	}
}
if (request.getAttribute("insertSuccess")!=null){
	if ((boolean)request.getAttribute("insertSuccess")){%>
		Registration Successful<%
	}else{%>
		Registration Unsuccessful<%
	}
}
%>
<div id="success"></div>
</body>

<script>

function validateForm() {
	var uname = document.forms["register"]["uname"].value
	var email = document.forms["register"]["email"].value
	var address = document.forms["register"]["address"].value
	var number = document.forms["register"]["number"].value
	var password = document.forms["register"]["password"].value
	
	var splChars = "-*|,\":<>[]{}`\';()@&$#%";
	var splCharsemail = "-*|,\":<>[]{}`\';()&$#%";
	var splCharsaddress = "*|\":<>[]{}`\';()@&$%";
	var countat=0;
	var countdot=0;
	var countNumberNumber = 0;
	var countAlphabet=0;
	var countNumberPassword=0;

	
	if (uname==null || uname==""){
		document.getElementById("uname").focus();
		alert("Username must be filled in");
		return false
	}
	for (var i = 0; i < uname.length; i++) {
    	if (splChars.indexOf(uname.charAt(i)) != -1){
    		document.getElementById("uname").focus();
    		alert ("Illegal characters detected in Username!"); 
    		return false
    	}
	}
	
	
	if (email==null || email==""){
		document.getElementById("email").focus();
		alert("Email must be filled in");
		return false
	}
	for (var i = 0; i < email.length; i++) {
    	if (splCharsemail.indexOf(email.charAt(i)) != -1){
    		document.getElementById("email").focus();
    		alert ("Illegal characters detected in Email!"); 
    		return false
    	}
    	else if ("@" == email.charAt(i)){
    		countat = countat + 1;
    	}
    	else if ("." == email.charAt(i)){
    		countdot = countdot + 1;
    	}
	}
	if (countdot <= 0 || countat != 1){
    	document.getElementById("email").focus();
    	alert ("Please input a valid email address!"); 
    	return false
	}
	
	
	if (address==null || address==""){
		document.getElementById("address").focus();
		alert("Address must be filled in");
		return false
	}
	for (var i = 0; i < address.length; i++) {
    	if (splCharsaddress.indexOf(address.charAt(i)) != -1){
    		document.getElementById("address").focus();
    		alert ("Illegal characters detected in Address!"); 
    		return false
    	}
	}
	
	
	if (number==null || number==""){
		document.getElementById("number").focus();
		alert("Number must be filled in");
		return false
	}
	else if (number.length != 8){
		document.getElementById("number").focus();
		alert("Number must be 8 digits (Sorry to people living outside of Singapore lol)");
		return false
	}
	for (var i = 0; i < number.length; i++) {
    	if ("1234567890".indexOf(number.charAt(i)) == -1){
    		document.getElementById("number").focus();
    		alert ("Number must be purely numerical!"); 
    		return false
    	}
	}
	
	
	if (password==null || password==""){
		document.getElementById("password").focus();
		alert("Password must be filled in");
		return false
	}
	else if (password.length<8 || password.length>16){
		document.getElementById("password").focus();
		alert("Password must be inbetween 8 to 16 characters");
		return false
	}
	for (var i = 0; i < password.length; i++) {
    	if ("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".indexOf(password.charAt(i)) != -1){
    		countAlphabet=countAlphabet+1;
    	}
    	else if ("1234567890".indexOf(password.charAt(i)) != -1){
    		countNumberPassword = countNumberPassword+1;
    	}
	}
	if (password.length-countAlphabet == 0){
		document.getElementById("password").focus();
		alert("Password must contain numbers!");
		return false
	}
	else if (password.length-countNumberPassword == 0){
		document.getElementById("password").focus();
		alert("Password must contain letters!");
		return false
	}
}
</script>

</html>
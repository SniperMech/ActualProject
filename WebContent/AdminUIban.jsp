<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form action="processBan.jsp" method="post">
	Type in user you want to ban...
	<br>
	Ban UserID: <input type="text" name="buser">
	<br>
	Reason: 
	<textarea rows="4" cols="50" name="reason"></textarea>
	<br>
	<input type="submit" name="Ban" value="Ban">
</form>
<br>
<form action="processUnban.jsp" method="post">
    <br>
	Type in user you want to unban...
	<br>
	Unban UserID: <input type="text" name="ubuser">
	<input type="submit" name="unban" value="Unban">
</form>
</body>
</html>
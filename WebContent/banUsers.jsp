<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="BanServlet" method="post">
	Type in user you want to ban...
	<br>
	Ban Email: <input type="text" name="email">
	<br>
	Reason: 
	<textarea rows="4" cols="50" name="reason"></textarea>
	<br>
	<input type="submit" name="Ban" value="Ban">
</form>
<%if (request.getAttribute("display1") != null && (String)request.getAttribute("display1") != ""){
	%><%=(String)request.getAttribute("display1")%><%
}%>
<br>
<form action="UnbanServlet" method="post">
    <br>
	Type in user you want to unban...
	<br>
	Unban Email: <input type="text" name="email">
	<input type="submit" name="unban" value="Unban">
</form>
<%if (request.getAttribute("display2") != null && (String)request.getAttribute("display2") != ""){
	%><%=(String)request.getAttribute("display2")%><%
}%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String access = request.getParameter("access");
if (access == "deny")
	out.println("You have been banned from this website, please contact the system administrator");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="LoginServlet" method="post">
	Email: <input type="text" name="email">
	<br>
	Password: <input type="password" name="password">
	<br>
	<input type="submit" name="login" value="login">
</form>
</body>
<script>
<%if (request.getAttribute("display") != null){
	%>alert("<%=(String)request.getAttribute("display")%>")<%
}%>
</script>
</html>
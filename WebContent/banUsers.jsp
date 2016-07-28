<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String username = request.getParameter("username");
String password = request.getParameter("password");

Class.forName("com.mysql.jdbc.Driver");

String connURL = "jdbc:mysql://localhost/gggameshop?user=root&password=root";

Connection conn = DriverManager.getConnection(connURL);

Statement stmt = conn.createStatement();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
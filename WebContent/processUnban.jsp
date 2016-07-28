<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
try{
String ubuser = request.getParameter("ubuser");

Class.forName("com.mysql.jdbc.Driver");

String connURL = "jdbc:mysql://localhost/gggameshopv2?user=root&password=root";

Connection conn = DriverManager.getConnection(connURL);

PreparedStatement pstmt2 = conn.prepareStatement("delete from gggameshopv2.userbanned where UserID = ?");

pstmt2.setString(1,ubuser);

int count2 = pstmt2.executeUpdate();

out.println ("Successful Transaction");

} catch (Exception e) {
	out.println(e);
	out.println ("Unsuccessful Transaction");
}



%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
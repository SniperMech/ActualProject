<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
try{
String buser = request.getParameter("buser");
String reason = request.getParameter("reason");

Class.forName("com.mysql.jdbc.Driver");

String connURL = "jdbc:mysql://localhost/gggameshopv2?user=root&password=root";

Connection conn = DriverManager.getConnection(connURL);

PreparedStatement pstmt = conn.prepareStatement("insert into gggameshopv2.userbanned (UserID,reason) values (?,?)");

pstmt.setString(1,buser);
pstmt.setString(2,reason);

int count = pstmt.executeUpdate();

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
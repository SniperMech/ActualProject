<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%

String email = request.getParameter("email");
String passwd = request.getParameter("password");

Class.forName("com.mysql.jdbc.Driver");

String connURL = "jdbc:mysql://localhost/gggameshopv2?user=root&password=root";

Connection conn = DriverManager.getConnection(connURL);

PreparedStatement pstmt = conn.prepareStatement("select * from gggameshopv2.users where Email = ?");
PreparedStatement pstmt2 = conn.prepareStatement("select * from gggameshopv2.userbanned");

pstmt.setString(1,email);

ResultSet rs = pstmt.executeQuery();
ResultSet rs2 = pstmt2.executeQuery();


rs.next();
String userid = rs.getString("UserID");
String pwd = rs.getString("PassHash");
String buserid = "";

try{
while(rs2.next()){
buserid = rs2.getString("UserID");
if (userid.equals(buserid))
break;
}
} catch (Exception e){
	out.println(e);
}

if (userid.equals(buserid))
	response.sendRedirect("logins.jsp?access=deny");
else if (userid.equals("1")&& passwd.equals(pwd))
	response.sendRedirect("AdminUIban.jsp");
else 
	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
Hi <%=userid%>
</body>
</html>
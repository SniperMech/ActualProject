<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="SQLCommands.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
DBConnection.getConnection();
 ArrayList<String> arr= DBConnection.showGames(request.getParameter("Genre"));
for(int i=0 ; i<arr.size() ; i++){
	out.println(arr.get(i));
}
%>
</body>
</html>
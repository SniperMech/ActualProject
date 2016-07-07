<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="SQLCommands.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
DBConnection.getConnection();

String[] GenreString = request.getParameterValues("Genres");
int[] Genres= new int[GenreString.length];
for(int i=0; i<GenreString.length ; i++){
	Genres[i]=Integer.parseInt(GenreString[i]);
}


DBConnection.insertProduct(request.getParameter("Title"), request.getParameter("Company"),
		request.getParameter("Date"), request.getParameter("Description"),
		Double.parseDouble(request.getParameter("Price")), request.getParameter("icon1"),
		request.getParameter("icon2"), request.getParameter("icon3"),
		request.getParameter("image1"), request.getParameter("image2"), request.getParameter("image3"),
		request.getParameter("logo"), request.getParameter("logo2"),
		request.getParameter("preowned"), Genres);
%>
</body>
</html>
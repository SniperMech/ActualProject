<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, SQLCommands.*, Model.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form action="ObtainSalesDatabyGameID" method="POST">

Generate Total Sales For GameID: <input type="text" name="GameID"></input>
<input type="submit" name="generate" value="generate">

</form>

<form action="ObtainSalesDatabyMonth" method="POST">

Generate Specific Month's Total Sales: <select name="month">
<%for (int m = 1; m < 13; m++){
	%>
	<option value = <%=m%> > 
	<%out.println(m);%> 
	</option>
	<%}%>
</select>

<input type="submit" name="generate" value="generate">
</form>

<br>
<br>

<form action="CompareSalesDatabyMonth" method="POST">

Choose 1st Month For Comparison: <select name="month">
<%for (int m = 1; m < 13; m++){
	%>
	<option value = <%=m%> > 
	<%out.println(m);%> 
	</option>
	<%}%>
</select>

Choose 2nd Month For Comparison: <select name="month2">
<%for (int m = 1; m < 13; m++){
	%>
	<option value = <%=m%> > 
	<%out.println(m);%> 
	</option>
	<%}%>
</select>

<input type="submit" name="generate" value="Compare">
</form>

</body>
</html>
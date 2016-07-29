<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import= "Model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Stock Report</title>
</head>
<body>
<form action="StockReportServlet" method="post">
<br/>
Search below quantity: <input name="quantity" type="number">
<br/><br/>
<input value="search" type="submit">
</form>
<br/>
<%
if (request.getAttribute("GamesBelowQuantity") != null && (boolean)request.getAttribute("Success")){
	games[] Results = (games[])request.getAttribute("GamesBelowQuantity");
%>
<table>
<tr>
<th>GameID</th>
<th>Title</th>
<th>Price</th>
<th>Stock</th>
</tr>
<%
for (int rows = 0; rows < Results.length; rows++) {
	%><tr>
		<td><%=Results[rows].getGameID()%></td>
		<td><%=Results[rows].getTitle()%></td>
		<td><%=Results[rows].getPrice()%></td>
		<td><%=Results[rows].getStock()%></td>
	</tr>
	<%
		}
}
%>
</table>
</body>
<style>
table{
"border-collapse: collapse;
border: 1px solid"
}
td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}
</style>
</html>
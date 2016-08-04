
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import = "model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Transaction History</title>
</head>
<body>
<%
if (((String)request.getAttribute("checked") != "checked")){
	%><jsp:forward page="/MemberHistoryServlet"/><%
	}%>

<%
if (request.getAttribute("TransactionHistory") != null && (boolean)request.getAttribute("Success")){
	Object[] History = (Object[])request.getAttribute("TransactionHistory");
	transaction[] Transaction = (transaction[])History[0];
	games[] Game = (games[])History[1];
%>
<table>
<tr>
<th>TransactionID</th>
<th>Title</th>
<th>Price</th>
<th>Quantity</th>
<th>Date Purchased</th>
</tr>
<%
for (int rows = 0; rows < Transaction.length; rows++) {
	%><tr>
		<td><%=Transaction[rows].getTransactionID()%></td>
		<td><%=Game[rows].getTitle()%></td>
		<td><%=Transaction[rows].getPrice()%></td>
		<td><%=Transaction[rows].getQuantity()%></td>
		<td><%=Transaction[rows].getDatePurchased()%></td>
	</tr>
	<%
		}
}
%>
</table>
</body>
</html>
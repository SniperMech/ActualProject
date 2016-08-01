<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="Model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% sales display = (sales)request.getAttribute("GameSales"); %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript">
		window.onload = function () {
			var chart = new CanvasJS.Chart("chartContainer", {
				title: {
					text: "Overall All Time Game Sales For <%=display.getGameName()%>"
				},
				data: [{
					type: "column",
					dataPoints: [
					  { label: "<%=display.getGameName()%>" , y: <%=display.getCost() %>, indexLabel: "Cost" }
					]
				}, {
					type: "column",
					dataPoints: [
					  { label: "<%=display.getGameName()%>" , y: <%=display.getRevenue() %>, indexLabel: "Revenue" }
					]
				}, {
					type: "column",
					dataPoints: [
					  { label: "<%=display.getGameName()%>" , y: <%=display.getProfit() %>, indexLabel: "Profit" }
					]
				}, {
					type: "column",
					dataPoints: [
					  { label: "<%=display.getGameName()%>" , y: <%=display.getSold()%>, indexLabel: "Sold" }
					]
				}]
			});
			chart.render();
		}
	</script>
	<script src="canvasjs.min.js"></script>
	<title>CanvasJS Example</title> 
</head>
<body>

<div id="chartContainer" style="height: 500px; width: 100%;"></div>

<h2>The Game chosen is <%=display.getGameName() %> </h2>

<h2>There is a total of <%=display.getntransactions() %> transactions for this game  </h2>

<h2>The initial cost used to purchase the set amount of the games is <%=display.getCost() %> </h2>

<h2>The revenue generated for this game is <%=display.getRevenue() %> </h2>

<h2>Hence the evaluated profit is <%=display.getRevenue() %> - <%=display.getCost()%> = <%=display.getProfit() %></h2>

</body>
</html>
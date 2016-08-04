<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import = "model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
if (((String)request.getAttribute("checked") != "checked")){
	%><jsp:forward page="/SetProfileServlet"/><%
}
users user = (users)request.getAttribute("user");
String[] result ={};
if (request.getAttribute("result") != null){
	result = (String[])request.getAttribute("result");
}
%>

<form name="register" action="UpdateProfileServlet" onsubmit="return validateForm()" method="post">

Email: <input name="email" value=<%=user.getEmail()%> id="email" type="email">
<br/><br/>
Address: <textarea name="address" id="address" rows="4" cols="50"><%=user.getAddress()%></textarea>
<br/><br/>
Number: <input name="number" value=<%=user.getNumber()%> id="number" type="number">
<br/><br/>
<input value="Modify Value" type="submit">
</form>
<%for (int i = 0 ; i < result.length ; i++ ){
%><%=result[i]%><br><%
}%>
</body>
</html>
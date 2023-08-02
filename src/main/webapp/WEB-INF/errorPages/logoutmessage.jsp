<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logged out</title>
<style>
*
{
	background-color:black;
	color:#00b33c;
}
#redirectlogin
	{
		border:1px solid #00b33c;
		border-radius:5px;
		font-size:25px;
	
	}
form
{
	text-align:center;
}
</style>
</head>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
	
		response.setHeader("Pragma", "No-cache");
		response.setDateHeader("Expires", 0);
	%>
	<form id="uselessUsefull" action="main.html">
		<h2>You have been logged out....</h2>
		<button id="redirectlogin" form="uselessUsefull">return to main page</button>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Error</title>
<style>
	*{
    background-color:black;
    color:#00b33c;
	}
	#loginErrorPage{
		text-align:center;
		margin:100px;
	}
	h2
	{
		margin-bottom:100px;
	}
	#redirectlogin
	{
		border:1px solid #00b33c;
		border-radius:5px;
		font-size:25px;
	
	}
</style>
</head>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
	
		response.setHeader("Pragma", "No-cache");
		response.setDateHeader("Expires", 0);
	%>
	<form id="loginErrorPage" action="main.html">
		<h2>Wrong email or password</h2>
		
		<button id="redirectlogin">return to main page</button>
			

	</form>
</body>
</html>
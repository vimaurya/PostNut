<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Unauthorized</title>
<style>
*{
    background-color:black;
    color:#00b33c;
	}
	#deletepost{
		text-align:center;
		margin:100px;
	}
	h2
	{
		margin-bottom:100px;
	}
	#redirect
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
	<form id="deletepost" action="deletePost.jsp">
		<h2>you are not authorized to delete this post</h2>
		
		<button id="redirect">go back</button>
			

	</form>
</body>
</html>
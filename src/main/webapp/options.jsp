<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Options</title>
<style>
*{
    background-color:black;
    color:#00b33c;
	}

button
{
	background-color:#00b33c;
	color:white;
	font-size:25px;
	margin-right:20px;
}
.options
{
	text-align:center;
	margin:100px;
}

#logoutbutton {
    background-color:#00b33c;
    border: rebeccapurple;
    text-align: center;
    color:white;
    padding: 5px 15px;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    border-radius:5px;
    margin-left:80%;
 }
</style>
</head>
<body>
	
	
	<div id="outsideform">
		<c:out value="User : ${uname}"/>
		<button form="uselessUsefull" id="logoutbutton" formaction="logout" formmethod="post">log out</button>
	</div>
	<hr>
	
	<form id="uselessUsefull"></form>
	<form class="options">
		<button id="createpost" formaction="createPost.jsp" >Create post</button>
		<button id="seeposts" formaction="seePosts.jsp">See posts</button>
		<button id="deleteposts" formaction="deletePost.jsp">Delete post</button>
	</form>
</body>
</html>
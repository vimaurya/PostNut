<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>create post</title>
</head>
<style>
*{
 background-color:black;
 color:#00b33c;
}
form{
	text-align:center;
	margin:100px;
}
#content {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  box-sizing: border-box;
}
#title
{ 
	width:50%;
	height:30px;
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
 ul {
  list-style-type: none;
  margin-left:20px;
}
</style>
<body>
	
	<div id="outsideform">
		<c:out value="User : ${uname}"/>
		<button form="uselessUsefull" id="logoutbutton">log out</button>
	</div>
	<hr>
	<ul>
	  <li><a href="seePosts.jsp">See Posts</a></li>
	  <li><a href="deletePost.jsp">Delete Post</a></li>
	</ul>
	<form id="uselessUsefull" action="logout" method="post"></form>
	<form id="createpost" action="createpost" method="post">
		<h2>Create Post</h2><br>
		<label style="font-size:20px">Enter the title here : </label>
		<input type="text" name="title" id="title" required><br>
		<hr>
		<input type="text" name="content" id="content" placeholder="Enter the content here....">
		<button type="submit">Create post</button>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete post</title>
<style>
*
{
	background-color:black;
	color:#00b33c;
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
 #deleteButton {
    background-color:#00b33c;
    border: rebeccapurple;
    text-align: center;
    color:white;
    padding: 5px 15px;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    border-radius:5px;
    margin-left:20px;
 }
 #deletePost
 {
 	height:25px;
 	border-color:#00b33c;
 	border-radius:10px;
 }
 form
 {
 	text-align:center;
 }
 ul {
  list-style-type: none;
  margin-left:20px;
}
</style>
</head>
<body>
	
	<div id="outsideform">
		<c:out value="User : ${uname}"/>
		<button form="uselessUsefull" id="logoutbutton" formaction="logout" formmethod="post">log out</button>
	</div>
	<hr>
	<ul>
	  <li><a href="createPost.jsp">Create post</a></li>
	  <li><a href="seePosts.jsp">See Posts</a></li>
	</ul>
	<form id="uselessUsefull" action="logout" method="post"></form>
	<h2 style="text-align:center">Delete post</h2><hr>
	
	<form action="deletepost" method="post">
		<label><h3>Enter post id to delete : </h3></label>
		<input name="post_id" id="deletePost" type="number" required>
		
		<button type="submit" id="deleteButton">Delete</button>
	</form>
	
</body>
</html>
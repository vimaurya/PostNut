<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Comments</title>
<style>
*{
	background-color:black;
	color:#00b33c;
}

#submitComment{
    background-color:#00b33c;
    border: rebeccapurple;
    text-align: center;
    color:white;
    padding: 5px 15px;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    border-radius:5px;
   	margin-right:50%;
 }
 
#comment {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  box-sizing: border-box;
  border:1px solid #00b33c;
  border-radius:10px;
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
</head>
<body>
	<div id="outsideform">
		<c:out value="User : ${uname}"/>
		<button form="uselessUsefull" id="logoutbutton" formaction="logout" formmethod="post">log out</button>
	</div>
	<hr>
	<ul>
	  <li><a href="createPost.jsp">Create Post</a></li>
	  <li><a href="seePosts.jsp">See Posts</a></li>
	  <li><a href="deletePost.jsp">Delete Post</a></li>
	</ul>
	<form id="uselessUsefull" action="logout" method="post"></form>
	<h2 style="text-align:center">Comments</h2><hr>
	
	<h4>Post : </h4>
	<c:set var="post_id" value='${requestScope["post_id"]}' />
	<c:set var="user_id" value='${requestScope["user_id"]}' />
	<c:set var="title" value='${requestScope["title"]}' />
	<c:set var="post" value='${requestScope["post"]}' />
	
	
	<c:out value="Post Id : ${post_id}"/><br><br>
	<c:out value="Posted by : ${user_id}" /><br><br>
	<c:out value="Title : ${title}" /><br><br>
	<c:out value="Body : ${post}" /><br><br>
	
	<hr>
	
	<form id="commentForm" action="comment?id=${post_id}" method="post">
		<label><h4>Comment : </h4></label>
		<input type="text" name="comment" id="comment" required placeholder="Write your comment here..."><br>
		<button type="submit" id="submitComment">Comment</button>
	</form>
	<hr>
	<h3>Comments : </h3>
	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     	url="jdbc:mysql://localhost/jsp_and_servlets"  
     	user="root"  password="password"/>  
     	<sql:query var="rs" dataSource="${db}">
     		select * from comments where post_id="${post_id}";
     </sql:query>
     <c:forEach var="data" items="${rs.rows}">
			<hr>
			<c:out value="Posted by : ${data.user_id}"/><br><br>
			<c:out value="Title : ${data.comment}"/><br><br>
			<c:out value="Time : ${data.time}"/><br><br>
	</c:forEach>
</body>
</html>
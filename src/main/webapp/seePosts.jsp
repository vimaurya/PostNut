<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Posts</title>
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
	  <li><a href="deletePost.jsp">Delete Post</a></li>
	</ul>
	<form id="uselessUsefull" action="logout" method="post"></form>
	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     	url="jdbc:mysql://localhost/jsp_and_servlets"  
     	user="root"  password="password"/>  
     	<sql:query var="rs" dataSource="${db}">
     		select * from posts;
     </sql:query>
     <hr>
     <c:out value="Posts : "/><br>
	<div id="post">
		<c:forEach var="data" items="${rs.rows}">
			<hr>
			<c:out value="Post Id : ${data.post_id }"/><br><br>
			<c:out value="Posted by : ${data.user_id}"/><br><br>
			<c:out value="Title : ${data.title}"/><br><br>
			<c:out value="Body : ${data.post}"/><br><br>
			
			
			<a href = "seecomment?id=${data.post_id }" >
			<sql:query var="num" dataSource="${db}">
				select count(comment) as Comments from comments where post_id = "${data.post_id}";
			</sql:query>
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-dots" viewBox="0 0 16 16">
			  <path d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
			  <path d="m2.165 15.803.02-.004c1.83-.363 2.948-.842 3.468-1.105A9.06 9.06 0 0 0 8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.437 10.437 0 0 1-.524 2.318l-.003.011a10.722 10.722 0 0 1-.244.637c-.079.186.074.394.273.362a21.673 21.673 0 0 0 .693-.125zm.8-3.108a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 8c0-3.192 3.004-6 7-6s7 2.808 7 6c0 3.193-3.004 6-7 6a8.06 8.06 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a10.97 10.97 0 0 0 .398-2z"/>
			</svg>&nbsp;&nbsp;
			<c:forEach var="res" items="${num.rows}">
				<c:out value="${res}"/>
			</c:forEach>
			</a>
		</c:forEach>
	</div>
</body>
</html>
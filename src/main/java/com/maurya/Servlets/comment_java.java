package com.maurya.Servlets;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/seecomment")
public class comment_java extends HttpServlet
{
	Connection connection;
	PreparedStatement stmt;
	ResultSet rsltset;
	String Post, Title;
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{	

		String post = null,title = null, user_id = null;
		int id = Integer.parseInt(request.getParameter("id"));
		
		
		try
		{
			connection = new databaseConnection().getConnection();
			stmt = connection.prepareStatement("SELECT * FROM posts WHERE post_id=?");
			stmt.setInt(1, id);
			rsltset = stmt.executeQuery();
			
			while(rsltset.next())
			{
				title = rsltset.getString("title");
				user_id = rsltset.getString("user_id");
				post = rsltset.getString("post");
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		}
		request.setAttribute("post_id",id);
		request.setAttribute("user_id",user_id);
		request.setAttribute("post",post);
		request.setAttribute("title", title);
		
		
		System.out.println("This is post : "+post);
		RequestDispatcher rd = request.getRequestDispatcher("Comment.jsp");
		rd.forward(request, response);	
	}
}

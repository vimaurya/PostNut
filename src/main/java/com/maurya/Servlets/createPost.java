package com.maurya.Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns= {"/createpost"})
public class createPost extends HttpServlet
{
	Connection connection;
	PreparedStatement stmt;
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		System.out.println("This is title : "+title);
		System.out.println("This is content : "+content);
		
		HttpSession session = request.getSession();
		String uname = (String) session.getAttribute("uname");
	
		try
		{
			connection = new databaseConnection().getConnection();
			stmt = connection.prepareStatement("INSERT INTO posts(title, post , user_id) VALUES(?,?,?);");
			stmt.setString(1,title);
			stmt.setString(2,content);
			stmt.setString(3, uname);
			int rsltset = stmt.executeUpdate();
			if(rsltset>0)
			{
				System.out.println("The post has been created..");
				response.sendRedirect("seePosts.jsp");
			}
			else
			{
				System.out.println("Failed to create post due to some reason...");
			}
		} catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}

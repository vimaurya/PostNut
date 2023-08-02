package com.maurya.Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(urlPatterns= {"/comment"})
public class postcomment extends HttpServlet
{
	Connection connection;
	PreparedStatement stmt;
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("uname");
		String comment = request.getParameter("comment");
		int post_id = Integer.parseInt(request.getParameter("id"));
		
		
		try {
			connection = new databaseConnection().getConnection();
			stmt = connection.prepareStatement("INSERT INTO comments(user_id,post_id,comment) VALUES(?,?,?)");
			stmt.setString(1, user_id);
			stmt.setInt(2, post_id);
			stmt.setString(3, comment);
			
			int rsltset = stmt.executeUpdate();
			
			if(rsltset>0)
			{
				System.out.println("You have successfully commented....");
				response.sendRedirect("seecomment?id="+post_id);
			}
			else
			{
				
			}
		} catch (SQLException | ClassNotFoundException e) {
			
			e.printStackTrace();
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/errorPages/logoutmessage.jsp");
			rd.forward(request, response);
		}
	}

}

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
import javax.servlet.http.HttpSession;


@WebServlet("/deletepost")
public class deletePost extends HttpServlet
{
	Connection connection;
	PreparedStatement stmt;
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		HttpSession session = request.getSession();
		
		String uname = (String) session.getAttribute("uname");
		
		int post_id = Integer.parseInt(request.getParameter("post_id"));
		
		try {
			connection = new databaseConnection().getConnection();
			stmt = connection.prepareStatement("select * from posts where post_id = ?");
			stmt.setInt(1, post_id);
			
			ResultSet rsltset = stmt.executeQuery();
			
			while(true)
			{
				if(rsltset.next())
				{
					String user_id = rsltset.getString("user_id");
					
					if(uname.equals(user_id))
					{
						stmt= connection.prepareStatement("delete from posts where post_id = ?");
						stmt.setInt(1, post_id);
						
						int res = stmt.executeUpdate();
						if(res>0)
						{
							System.out.println("deleted successfully..");
							response.sendRedirect("seePosts.jsp");
						}
						else
						{
							response.setStatus(501);
						}
					}
					else
					{
						System.out.println("uname : "+uname+" user_id : "+user_id);
						System.out.println("you are not authorised to delete this post...");
						RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/errorPages/authorizationError.jsp");
			        	rd.forward(request,response);
					}
				}
				else
				{
					RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/errorPages/authorizationError.jsp");
		        	rd.forward(request,response);
				}
				break;
			}
			
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}
	

}

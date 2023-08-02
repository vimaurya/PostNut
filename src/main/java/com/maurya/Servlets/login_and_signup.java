package com.maurya.Servlets;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class login_and_signup
{
	PreparedStatement stmt;
	login_and_signup()
	{
		System.out.println("Signing Up...");
	}
	
	login_and_signup(Connection connection, HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException
	{
		HttpSession session = request.getSession();
		String uname =  (String) session.getAttribute("uname");
		String pword =  (String) session.getAttribute("pword");
		
		System.out.println("uname = "+uname+"and pword is "+pword);
		
		stmt = connection.prepareStatement("SELECT * FROM users WHERE uname = ? and pword = ?");
		stmt.setString(1, uname);
        stmt.setString(2, pword);
        ResultSet rsltset = stmt.executeQuery();
        
        System.out.println("I am in logincheck class");
        
        if(rsltset.next())
        {
        	response.sendRedirect("options.jsp");
        	
        }
        else
        {
        	RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/errorPages/loginError.jsp");
        	rd.forward(request,response);
        }
	}
	public void signup(Connection connection, HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException
	{
		HttpSession session = request.getSession();
		String uname =  (String) session.getAttribute("uname");
		String pword =  (String) session.getAttribute("pword");
		
		boolean duplicateEntry = checkDup(connection, uname, pword);
		
		if(duplicateEntry==false)
		{
			stmt = connection.prepareStatement("INSERT INTO users("+"uname"+", pword"+") VALUES(?,?)");
			stmt.setString(1,uname);
			stmt.setString(2, pword);
			
			int rsltset = stmt.executeUpdate();
			
			if(rsltset>0)
			{
	        	response.sendRedirect("options.jsp");
			}
			else {
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/errorPages/loginError.jsp");
	        	rd.forward(request,response);
			}
		}
		else
		{
			System.out.println("user already exists");
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/errorPages/signupError.jsp");
        	rd.forward(request,response);
		}	
	}
	public boolean checkDup(Connection connection, String uname, String pword) throws SQLException
	{
		stmt = connection.prepareStatement("SELECT * FROM users where uname=? and pword=?");
		stmt.setString(1, uname);
		stmt.setString(2, pword);
		ResultSet rsltset = stmt.executeQuery();
		if(rsltset.next())
		{
			return true;
		}
		return false;
	}

}

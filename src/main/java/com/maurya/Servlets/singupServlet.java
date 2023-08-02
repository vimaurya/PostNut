package com.maurya.Servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns={"/signup"})
public class singupServlet extends HttpServlet
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		String uname = request.getParameter("uname");
		String pword = request.getParameter("pword");
		

		System.out.println("uname = "+uname+"and pword is "+pword);
		
		HttpSession session = request.getSession();
		session.setAttribute("uname", uname);
		session.setAttribute("pword", pword);
		
		login_and_signup signup = new login_and_signup();
		try {
			signup.signup(new databaseConnection().getConnection(), request, response);
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		} catch (ServletException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}

}

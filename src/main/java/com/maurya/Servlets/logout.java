package com.maurya.Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns= {"/logout"})
public class logout extends HttpServlet
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		HttpSession session = request.getSession();
		session.removeAttribute("uname");
		session.removeAttribute("pword");
	
		response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");

		response.setHeader("progma", "no-cache");
		response.setDateHeader("Expires", 0);
		RequestDispatcher rd = request.getRequestDispatcher("main.html");
    	rd.forward(request,response);
	}

}

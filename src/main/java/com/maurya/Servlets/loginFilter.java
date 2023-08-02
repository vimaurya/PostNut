package com.maurya.Servlets;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebFilter(urlPatterns={"/seecomment","/options.jsp","/seePosts.jsp","/createPost.jsp","/deletePost.jsp","/createpost"})
public class loginFilter extends HttpFilter implements Filter {
       
   
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletResponse res = (HttpServletResponse)response;
		
		res.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
		
		res.setHeader("Pragma", "No-cache");
		res.setDateHeader("Expires", 0);
		
		System.out.println("I am in filter");
		HttpSession session =  ((HttpServletRequest)request).getSession();
		String uname = (String)session.getAttribute("uname");
		System.out.println("This is uname in filter : "+uname);
		if(uname==null)
		{
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/errorPages/logoutmessage.jsp");
			rd.forward(request, response);
		}
		else
		{
			chain.doFilter(request, response);
		}
	}
}

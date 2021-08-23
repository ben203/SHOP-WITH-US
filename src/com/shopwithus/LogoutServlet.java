package com.shopwithus;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.validator.routines.EmailValidator;
 


 

/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet("/Logout")
public class LogoutServlet extends HttpServlet {
	 
	Map <String, ArrayList<ArrayList<String>>> savedcartdata =  new HashMap <String, ArrayList<ArrayList<String>>>();	
	
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session  = request.getSession();
		
		String email = (String) session.getAttribute("email");
		
		//obtain cart data of the user
		 ArrayList<ArrayList<String>> cart = ( ArrayList<ArrayList<String>>) session.getAttribute("cart");
		
		//save cart data of the user 
		savedcartdata.put(email,cart);
  
		session.setAttribute("savedcartdata", savedcartdata);
		 
		
		//so that when another user logs in 
		//they won't get previous session cart data
		 session.setAttribute("cart", null);
		 
		 
		 session.setAttribute("email", null);
		 
		 //go the home page
		 response.sendRedirect("home.jsp");
	 
 
		
 
		
	}
	}
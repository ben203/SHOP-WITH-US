package com.shopwithus;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

 
@WebServlet("/deletecartitem")
public class DeleteCartItemServlet extends HttpServlet {
 
	
	ArrayList<Integer> deletedindexes  = new ArrayList<Integer>();
 
	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 
		 HttpSession session = request.getSession();
		  
		//obtain the cart items
		ArrayList<ArrayList<String>> cart=(ArrayList<ArrayList<String>>) session.getAttribute("cart");
		
		//if the request is to delete an order
		if(request.getParameter("indextodelete")!=null) {
			
		//get the index of the order to be deleted	
		int indextoDelete= Integer.valueOf(request.getParameter("indextodelete"));
		 
		// the amount needed to be subtracted in order to adjust the index when deleting 
		int diff = 0;
		
		 //deleted indexes to be compared later
		deletedindexes.add(indextoDelete);
		  
 
	  
 
		for(int i=0; i<deletedindexes.size(); i++) {
			

			
			//increment the subtracted amount if the index to be deleted is greater
			if(indextoDelete>deletedindexes.get(i)) {
		 
				diff++;
			
			}
			
		}
		
		//if the last index to be deleted clear the deleted indexes 
		//since cart is going to be empty
		 if(cart.size()==1) {
			  
			  deletedindexes.clear();
		  }
 
		 //obtain the correct index to delete and remove
		cart.remove(indextoDelete - diff);
  
	 
		//back to the cart page
		response.sendRedirect("cart.jsp");
		
	 
	 
		}else {
		
		//clear cart since second request would be to clear the cart	
 		cart.clear();
 		
 		//clear deleted indexes since cart is empty 
 		deletedindexes.clear();
 		
 		//reset the indexes to start from zero 
 		session.setAttribute("resetIndex", "reset");
 		
 	 
 		
 			//back to the cart page
			response.sendRedirect("cart.jsp");
			 
		}
		
	}

 

}

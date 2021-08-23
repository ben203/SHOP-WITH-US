package com.shopwithus;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/additemstocart")
public class AdditemstocartServlet extends HttpServlet {

	// cart items sorted in a way we can get access to each component of the order 
	ArrayList<ArrayList<String>> cart = new ArrayList<ArrayList<String>>();

	//used when deleting item from cart
	int index = 0;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		// individual orders by type
		ArrayList<String> border = new ArrayList<String>();
		ArrayList<String> eorder = new ArrayList<String>();
		ArrayList<String> gmorder = new ArrayList<String>();
		ArrayList<String> gtorder = new ArrayList<String>();
		ArrayList<String> torder = new ArrayList<String>();

		HttpSession session = request.getSession();

		// get the email of the user that logged in
		String email = (String) session.getAttribute("email");

		//if the user has logged in
		if (email != null) {
			
			//if the index needs to be adjusted to get the correct index
			if(session.getAttribute("resetIndex")!=null) {
				
				index=0;
				session.setAttribute("resetIndex", null);
			}
			//so that the user don't lose cart data from previous session 
			if(session.getAttribute("cart")!=null) {
				cart = (ArrayList<ArrayList<String>> ) session.getAttribute("cart");
				
			}
			// get the type of order requested to be added in the cart
			String buttonType = request.getParameter("formname");
			
			//if the order is a book
			if (buttonType.equals("bookorder")) {

				//get the components of the order 
				String title = (String) request.getParameter("title");
				String author = (String) request.getParameter("author");
				String price = (String) request.getParameter("price");
				
				//create the delete button in the cart page
				String delteButton = "<form   action = " + '"' + "deletecartitem" + '"' + " method=" + '"' + "get" + '"'
						+ "> " + "<input name=" + '"' + "indextodelete" + '"' + "type= " + '"' + "hidden" + '"'
						+ "value= " + String.valueOf(index) + ">" + "<input name=" + '"' + "deletebutton" + '"'
						+ "class=" + '"' + "rbutton" + '"' + "value=" + '"' + " Remove" + '"' + "type=" + '"' + "submit"
						+ '"' + '/' + " > " + "<" + '/' + "form>";
				
				//get the date of the order 
				LocalDate date = LocalDate.now();

				//add the info about the order 
				border.add(date.toString());
				border.add("&emsp;" + "&emsp;");
				border.add("Book: " + title);
				border.add("Author: " + author);
				border.add("Price: $" + price);
				border.add(delteButton);
				
				//add the order info to be displayed later 
				cart.add(border);

				//keep track of the index if deletion is requested
				index++;

				//order added to cart
				session.setAttribute("cart", cart);

				//back on the books ordering page
				response.sendRedirect("books.jsp");

				//if the order is a toy
			} else if (buttonType.equals("toyoder")) {

				//get the components of the order 
				String item = (String) request.getParameter("item");
				String price = (String) request.getParameter("price");

				//create the delete button in the cart page
				String delteButton = "<form   action = " + '"' + "deletecartitem" + '"' + " method=" + '"' + "get" + '"'
						+ "> " + "<input name=" + '"' + "indextodelete" + '"' + "type= " + '"' + "hidden" + '"'
						+ "value= " + String.valueOf(index) + ">" + "<input name=" + '"' + "deletebutton" + '"'
						+ "class=" + '"' + "rbutton" + '"' + "value=" + '"' + " Remove" + '"' + "type=" + '"' + "submit"
						+ '"' + '/' + " > " + "<" + '/' + "form>";
				
				//get the date of the order
				LocalDate date = LocalDate.now();
				
				//add the info about the order 
				torder.add(date.toString());
				torder.add("&emsp;" + "&emsp;");
				torder.add("Toy: " + item);
				torder.add("Price: $" + price);
				torder.add(delteButton);

				//add the order info to be displayed later
				cart.add(torder);
				
				//keep track of the index of the item in case deletion is requested 
				index++;

				//order added to cart
				session.setAttribute("cart", cart);

				//back to the toys page
				response.sendRedirect("toys.jsp");
				
				// if the order is for a video game
			} else if (buttonType.equals("gameorder")) {


				//get the components of the order
				String title = (String) request.getParameter("title");
				String console = (String) request.getParameter("console");
				String price = (String) request.getParameter("price");


				//create the delete button in the cart page
				String delteButton = "<form   action = " + '"' + "deletecartitem" + '"' + " method=" + '"' + "get" + '"'
						+ "> " + "<input name=" + '"' + "indextodelete" + '"' + "type= " + '"' + "hidden" + '"'
						+ "value= " + String.valueOf(index) + ">" + "<input name=" + '"' + "deletebutton" + '"'
						+ "class=" + '"' + "rbutton" + '"' + "value=" + '"' + " Remove" + '"' + "type=" + '"' + "submit"
						+ '"' + '/' + " > " + "<" + '/' + "form>";
				
				//get the date of the order
				LocalDate date = LocalDate.now();


				//add the info about the order 
				gmorder.add(date.toString());
				gmorder.add("&emsp;" + "&emsp;");
				gmorder.add("Game: " + title);
				gmorder.add("console: " + console);
				gmorder.add("Price: $" + price);
				gmorder.add(delteButton);

				//add the order info to be displayed later
				cart.add(gmorder);
				
				//keep track of the index of the item in case deletion is requested 
				index++;

				//order added to cart
				session.setAttribute("cart", cart);

				//back to the games ordering page
				response.sendRedirect("games.jsp");
				
				//if the order is a gift card
			} else if (buttonType.equals("giftorder")) {

				//get the components of the order 
				String cardname = (String) request.getParameter("card");
				String price = (String) request.getParameter("amount");

				//create the delete button in the cart page
				String delteButton = "<form   action = " + '"' + "deletecartitem" + '"' + " method=" + '"' + "get" + '"'
						+ "> " + "<input name=" + '"' + "indextodelete" + '"' + "type= " + '"' + "hidden" + '"'
						+ "value= " + String.valueOf(index) + ">" + "<input name=" + '"' + "deletebutton" + '"'
						+ "class=" + '"' + "rbutton" + '"' + "value=" + '"' + " Remove" + '"' + "type=" + '"' + "submit"
						+ '"' + '/' + " > " + "<" + '/' + "form>";
				
				//get the date of the order
				LocalDate date = LocalDate.now();

				//add the info about the order 
				gtorder.add(date.toString());
				gtorder.add("&emsp;" + "&emsp;");
				gtorder.add("Gift Card: " + cardname);
				gtorder.add("Price: $" + price);
				gtorder.add(delteButton);

				//add the order info to be displayed later
				cart.add(gtorder);
				
				//keep track of the index of the item in case deletion is requested 
				index++;

				//order added to cart
				session.setAttribute("cart", cart);

				//back to the gift card page
				response.sendRedirect("giftCards.jsp");
				
				//if the order is an electronics item 
			} else if (buttonType.equals("electronicorder")) {
				
				//get the components of the order 
				String item = (String) request.getParameter("item");
				String price = (String) request.getParameter("price");

				//create the delete button in the cart page
				String delteButton = "<form   action = " + '"' + "deletecartitem" + '"' + " method=" + '"' + "get" + '"'
						+ "> " + "<input name=" + '"' + "indextodelete" + '"' + "type= " + '"' + "hidden" + '"'
						+ "value= " + String.valueOf(index) + ">" + "<input name=" + '"' + "deletebutton" + '"'
						+ "class=" + '"' + "rbutton" + '"' + "value=" + '"' + " Remove" + '"' + "type=" + '"' + "submit"
						+ '"' + '/' + " > " + "<" + '/' + "form>";
				
				//get the date of the order
				LocalDate date = LocalDate.now();


				//add the info about the order 
				eorder.add(date.toString());
				eorder.add("&emsp;" + "&emsp;");
				eorder.add("Electronics: " + item);
				eorder.add("Price: $" + price);
				eorder.add(delteButton);

				//add the order info to be displayed later
				cart.add(eorder);
				
				//keep track of the index of the item in case deletion is requested 
				index++;

				//order added to cart
				session.setAttribute("cart", cart);

				//back to the electronics item ordering page
				response.sendRedirect("electronics.jsp");

			}

		} else {
			
			//if the user hasn't logged in display an error message 
			out.print("<script> alert(" + '"' + "please login to add the item to the cart" + '"' + "); </script>");
			out.print("<script>  window.history.back(); </script>");

		}
	}
}

package com.shopwithus;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

 
@WebServlet("/search")
public class SearchServlet extends HttpServlet {
 
 

 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchTerm = request.getParameter("search-bar");
		 
		
		String bookItems = " books The Mountain Is You Brianna Wiest GoodNight Moon James Clear "
				            + "The Last Thing He Told Me Laura Dave Razorblade Tears"
		                     + "Margaret Wise Brown Where's Spot? Eric Hill It Ends" 
				              +  "With Us Colleen Hoover Atomic Habits Cosby Corduroy"
				              + " Dan Freeman Checkmate In Berlin  Giles Milton";
		
		String toysItems = " toys Dinosaur Toys for 3 to 7 Year Old Boys   "
	            			+ "2 Pack LED Light Airplane,17.5 TOP BRIGHT Car  "
	            			+ "Toy Pickup Trucks for Boys Sonomo Toys for 6-9 Year Old Boys" 
	            			+  " iLearn 10pcs Baby Rattle Toys JUMELLA Lawn Mower Bubble Machine"
	            			+ "  Ramp Toy Prextex RC Fire Engine Truck ";
		
		String gamesItems = " Nintendo Switch pc games FIFA 21 Fortnite Mario Golf: Super Rush "
	            			 + "Minecraft MLB The Show 21 NBA 2K21 Need For Speed Sonic "
	            			 + "Generations (Platinum Hits) Spider-Man Miles Morals xbox one 360 playstation 4 ";
		
		String giftcardsItems = "giftcards giftcard Everything Apple Google Play Store Kohl's   "
								+ " Kohl's Mastercard Starbucks Taco Bell visa";
		
		String electronicsItems = "electronics electronic 2021 Apple 11-inch iPad Pro "
									+ " New Beats Studio Buds Bose SoundLink Headphones "
									+ " HP Stream 14-inch Laptop Apple MacBook Pro" 
									+  "SAMSUNG 55-inch Curved TV SAMSUNG Galaxy Tab S7"
									+ " Sony X80J 65 Inch TV Robot Vacuum Cleaner TOZO"
									+ "T6 True Wireless Earbuds";

		 
		  
		 

		 
		 
		 

		 
		  
		 
 
		 
 
		
		//simple search implementation 
		if(bookItems.toLowerCase().replace(" ", "").contains(searchTerm.toLowerCase().replace(" ", ""))) {
			response.sendRedirect("books.jsp");
		}	
		
		else if(toysItems.toLowerCase().replace(" ", "").contains(searchTerm.toLowerCase().replace(" ", ""))) {
			response.sendRedirect("toys.jsp");
		}		
		else if(gamesItems.toLowerCase().replace(" ", "").contains(searchTerm.toLowerCase().replace(" ", ""))) {
			response.sendRedirect("games.jsp");
		}
		else if(giftcardsItems.toLowerCase().replace(" ", "").contains(searchTerm.toLowerCase().replace(" ", ""))) {
			response.sendRedirect("giftCards.jsp");
		}
		else if(electronicsItems.toLowerCase().replace(" ", "").contains(searchTerm.toLowerCase().replace(" ", ""))) {
			response.sendRedirect("electronics.jsp");
		}
		 
	else {
		
		response.sendRedirect("searchNotFound.jsp");
	}
	
	
	
	}

 

}

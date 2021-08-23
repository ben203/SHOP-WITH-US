package com.shopwithus;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

 
@WebServlet("/LoginAuthenticator")
public class LoginAuthenticatorServlet extends HttpServlet {

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		//obtain login credentials 
		String email = request.getParameter("email").replace(" ","");
		String password = request.getParameter("password");
 
		//connect to the database 
		try {
			Class.forName("com.mysql.jdbc.Driver");
			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ShopWithUsDb", "root",
					"qaz1");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from usersdb where email='" + email + "' and password='" + password + "'");
			
			//if login credentials are authenticated 
			if (rs.next()) {

			 
				 	String firstName = rs.getString("first_name");
					String lastName = rs.getString("last_name");
					session.setAttribute("firstName",firstName);
					session.setAttribute("lastName",lastName);
					
					String fullName= (String) session.getAttribute("firstName") + " " +(String) session.getAttribute("lastName");

					 session.setAttribute("fullName", fullName);
					 
				 
					session.setAttribute("email", email);
					 

					//obtain saved cart data  
					HashMap<String, ArrayList<ArrayList<String>>> savedCartData = (HashMap<String, ArrayList<ArrayList<String>>>) session
							.getAttribute("savedcartdata");

					// if the logged in user had item in the cart in the previous session
					if (savedCartData != null && savedCartData.get(email)!=null) {

						//get saved items in the cart 
						ArrayList<ArrayList<String>> c = savedCartData.get(email);
						
						//add them to the cart
						session.setAttribute("cart", c);

						//go the home page
						response.sendRedirect("home.jsp");
					} else {

						 
						ArrayList<ArrayList<String>> emptyCart = new ArrayList<ArrayList<String>>();

						 
					 
						// other wise remove null values so that cart size value won't be null
						session.setAttribute("cart", emptyCart);

						response.sendRedirect("home.jsp");
					}

			 

				 
			} else {
				
				//error message for wrong credentials
				session.setAttribute("loginmessage", " Wrong email or password was used please try again");
				response.sendRedirect("home.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("errorMessage", " It seems that something went wrong please try again later");
			response.sendRedirect("errorPage.jsp");
		}
	}

}

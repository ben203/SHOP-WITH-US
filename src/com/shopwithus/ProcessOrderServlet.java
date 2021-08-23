package com.shopwithus;

import java.io.IOException;
import java.math.BigInteger;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
 
import java.sql.Statement;
 
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.jdbc.exceptions.MysqlDataTruncation;

/**
 * Servlet implementation class ProcessOrderServlet
 */
@WebServlet("/finishorder")
public class ProcessOrderServlet extends HttpServlet {
	 
 
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 HttpSession session = request.getSession();
	 	
	 	//obtain user info
	 	String email= (String) session.getAttribute("email");
	 	String fullName= (String) session.getAttribute("name");
		String address = (String) session.getAttribute("address");
		String city = (String) session.getAttribute("city");
		String zipcode = (String) session.getAttribute("zipcode");
		String nameofstate = (String) session.getAttribute("nameofstate");
		
		String fullAddress = address + " ," + city + ", " + nameofstate + " "+ zipcode;
		
 
		
		String ccNumber = (String) session.getAttribute("ccNumber");
		
		String cvvNumber = (String) session.getAttribute("cvvNumber");
		
		String expirationmonth = (String) session.getAttribute("expirationmonth");
		String expirationyear = (String) session.getAttribute("expirationyear");
		
		String fullExpirationDate= expirationmonth + " / "+ expirationyear;
		
		String phoneNumber = (String) session.getAttribute("phoneNumber");
		
		 
		//generate and store an order number
		String orderNumber = String.format("%040d", new BigInteger(UUID.randomUUID().toString().replace("-", ""), 16));
	 	orderNumber =  orderNumber.substring(0, 15);
		session.setAttribute("orderNumber", orderNumber);
		 
	 
		
		//database connection 
		try {
	 
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ShopWithUsDb", "root", "qaz1");
			Statement st=conn.createStatement();
		
				int i=st.executeUpdate("insert into orders(email,name,address,ccn,cvv,expiration_date, order_number,phone_number)values('"+email+"','"+fullName+"','"+fullAddress+"','"+ccNumber+"','"+cvvNumber+"','"+fullExpirationDate+"','"+orderNumber+"','"+phoneNumber+"')");
			 
			} catch (SQLException | ClassNotFoundException  e) {
				 
				e.printStackTrace();
			}
			 response.sendRedirect("sendEmail");
		 
			 	}

}

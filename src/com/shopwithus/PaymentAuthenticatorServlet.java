package com.shopwithus;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/paymentprocessor")
public class PaymentAuthenticatorServlet extends HttpServlet {

 
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		request.setAttribute("frompaymentprocessor", "redirected from payment processor");
		
	 
		//obtain user data
		 String name="";
		String address = (String) request.getParameter("address");
		String city = (String) request.getParameter("city");
		String zipcode = (String) request.getParameter("zip");
		String nameofstate =  request.getParameter("nameofstate");
		String ccNumber = (String) request.getParameter("cardnumber");
		String cvvNumber = (String) request.getParameter("cvv");
		String expirationmonth = (String) request.getParameter("emonth");
		String expirationyear = (String) request.getParameter("expirationyear");
		String phoneNumber = (String) request.getParameter("phoneNumber");
  		
		//when name on credit card is same as name on account
		if ( request.getParameter("name")==null) {
			
			name = (String)session.getAttribute("fullName");
		}else {
			name=(String) request.getParameter("name");
		}
	 
		//regex for authenticating user input
		String phoneNumberRegex = "^\\(?([0-9]{3})\\)?[-.)]?([0-9]{3})[-.]?([0-9]{4})$";
		String nameRegex = "^[\\p{L} .'-]+$";
		String zipcodeRegex = "(\\d{5})\\b";
		String cvvRegex = "(\\d{3})\\b";
		String visaRegex = "^4[0-9]{12}(?:[0-9]{3})?$";
		String masterRegex = "^5[1-5][0-9]{14}$";
		String amexRegex = "^3[47][0-9]{13}$";
		String discoverRegex = "^6(?:011|5[0-9]{2})[0-9]{12}$";

		session.setAttribute("address", address);
		session.setAttribute("city", city);
		session.setAttribute("expirationmonth", expirationmonth);
		session.setAttribute("expirationyear", expirationyear);
		session.setAttribute("nameofstate", nameofstate);
	 
		boolean wrongUserInput = false;
		 
		//making sure user input is correct 
		if (phoneNumber.matches(phoneNumberRegex)) {
			session.setAttribute("phoneNumber", phoneNumber);
		} else {
			session.setAttribute("phoneNumber", null);
			
	 
			 
		}
		if (name.matches(nameRegex)) {
			session.setAttribute("name", name);
		} else {
			session.setAttribute("name", null);
			
	 
			 
		}
		if (zipcode.matches(zipcodeRegex)) {
			session.setAttribute("zipcode", zipcode);
		} else {
			session.setAttribute("zipcode", null);
			wrongUserInput=true;
		}

		if (cvvNumber.matches(cvvRegex)) {
			session.setAttribute("cvvNumber", cvvNumber);
		} else {
			session.setAttribute("cvvNumber", null);
			wrongUserInput=true;
		}

		try {
			ccNumber = ccNumber.replaceAll("-", "");
			if (ccNumber.matches(visaRegex)) {
				session.setAttribute("cctype", "VISA");
				session.setAttribute("ccNumber", ccNumber);
			} else if (ccNumber.matches(masterRegex)) {
				session.setAttribute("cctype", "MASTER");
				session.setAttribute("ccNumber", ccNumber);
			} else if (ccNumber.matches(amexRegex)) {
				session.setAttribute("cctype", "AMEX");
				session.setAttribute("ccNumber", ccNumber);
			} else if (ccNumber.matches(discoverRegex)) {
				session.setAttribute("cctype", "DISCOVER");
				session.setAttribute("ccNumber", ccNumber);
			} else {
				session.setAttribute("ccNumber", null);
				
				wrongUserInput=true;
			}

		} catch (Exception e) {
			e.printStackTrace();
			String message = "It is not you it's us something went wrong please try again";
			request.setAttribute("errorMessage", message);
			 request.getRequestDispatcher("errorPage.jsp").forward(request, response);
		}
		
		
 
		 
 if(wrongUserInput) {
	 
	 //back to payment page with error message 
	 response.sendRedirect("paymentPage.jsp");
 }else {
	 
	 
	 response.sendRedirect("paymentConfirmation.jsp");
	 
 
 
 
	}  
		
	}

}

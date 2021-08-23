package com.shopwithus;

import java.io.IOException;
import java.sql.Connection;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.validator.routines.EmailValidator;
 


 

 
@WebServlet("/registration")
public class RegistrationServlet extends HttpServlet {
	 
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

 HttpSession session = request.getSession();
 
		String namePatern = "[a-zA-Z]{2,40}";
		String passwordPattern="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*])(?=\\S+$).{8,20}$";
		boolean validNames=false;
		boolean validEmail=false;
		boolean validPassword=false;
		
//obtain user input
String lastName=request.getParameter("lastName");
 String firstName=request.getParameter("firstName");
String email=request.getParameter("email");
String password=request.getParameter("password");
String bdate=request.getParameter("bdate");
int yearofbdate = Integer.valueOf(bdate.substring(0,4));

 

 //if user under 18
if( yearofbdate >2002 ) {
	 
	 response.sendRedirect("tooYoungToSignup.jsp");
	} 
 
//first name and last name should be all in characters with length from 2 to 40
if((firstName+lastName).matches(namePatern)) {
	validNames=true;
 
	session.setAttribute("nameError", null);
	 
}else {
	
	request.setAttribute("nameError","Please make sure you use a proper name");
	 
	
}

//Apache email validator 
EmailValidator validator = EmailValidator.getInstance();

if (validator.isValid(email)) {
validEmail=true;
 
session.setAttribute("emailError", null);
 
} else {
	request.setAttribute("emailError","Please make sure you use a proper Email");
 
 
}
 
 


//validate password
if(password.matches(passwordPattern)) {

	validPassword=true;
	session.setAttribute("passwordError", null);
 
}		else {
	
	 String passwordErrorMes=" * Password should be between 8 to 20 characters <br>"+
							"* It should contain special characters of ! @ # $ % & ^ &  * <br>"+
							"* It should contain at least one lower and upper case letter <br>"+
							"* It should contain at least one digit <br>"+
							"* It shouldn't contain any whitespace <br>";
	 
request.setAttribute("passwordError",passwordErrorMes);
request.setAttribute("duplicateEmailError", null);//not to crowed the header
}

 
 
//connect to data base to sore user data if all correct user input was entered 
if (validNames && validEmail && validPassword) {
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ShopWithUsDb", "root", "qaz1");
	Statement st=conn.createStatement();
	int i=st.executeUpdate("insert into usersdb(first_name ,last_name,email,password,bdate)values('"+firstName+"','"+lastName+"','"+email+"','"+password+"','"+bdate+"')");
	 response.sendRedirect("successfulRegistration.jsp");
 
	}
 
catch(SQLIntegrityConstraintViolationException e) {
	
	
	  String duplicateEmailMes= "The email address already exists in our database <br> "
	  							+ "please choose a different email address";
	request.setAttribute("duplicateEmailError", duplicateEmailMes);
	
	
	
	//not to crowed the header
	if(request.getParameter("passwordError")!=null) {
		
		request.setAttribute("duplicateEmailError", "");
		  
	}
	request.getRequestDispatcher("signup.jsp").forward(request, response);
}
	catch(Exception e)
	{
	System.out.print(e);
	e.printStackTrace();
	
	}
	
	
	}else {
		
	 //back to sign up page with error messages 
		session.setAttribute("duplicateEmailError", null);
	 request.getRequestDispatcher("signup.jsp").forward(request, response);
	 
	}
	
	}
 
}

package com.shopwithus;

import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/sendEmail")
public class SendEmailServlet extends HttpServlet {

	//static Map<String,String> host = new TreeMap<>(String.CASE_INSENSITIVE_ORDER);
	static String ordernumber = "";
	static String email = "";
	static String firstName = "";
	static String address = "";
//static String domain="";
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
 
		 
		ordernumber = (String) session.getAttribute("orderNumber");
		email = (String) session.getAttribute("email");
		//  domain = email.substring('@'+1, email.length());
		firstName = (String) session.getAttribute("firstName");
		address = (String) session.getAttribute("address");
		//assaignHost(host);
		 
		try {
			sendMail(email);
		} catch (MessagingException e) {

			e.printStackTrace();

		}

		response.sendRedirect("orderConfermation.jsp");

	}

	public static void sendMail(String recepient) throws MessagingException {
		Properties properties = new Properties();
	 
	 
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host","Smtp.gmail.com");
		properties.put("mail.smtp.port", "587");

		String myemail = "";
		String mypassword = "";

		Session session = Session.getInstance(properties, new Authenticator() {
			@Override

			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(myemail, mypassword);
			}

		});

		Message message = prepareMessage(session, myemail, recepient);
		Transport.send(message);
		System.out.print("Messgage sent successfully");

	}

	private static Message prepareMessage(Session session, String myemail, String recepient) {
		try {
			// Create a default MimeMessage object.
			MimeMessage message = new MimeMessage(session);

			// Set From: header field of the header.
			message.setFrom(new InternetAddress(myemail));

			// Set To: header field of the header.
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(myemail));

			// Set Subject: header field
			message.setSubject("Your order from SWU");

			// Now set the actual message
			message.setText("Hello, " + firstName + " this message is to conferm your order. " + "Your order number is "
					+ "ordernumber. Your order will be shipped to " + address);
 

			return message;

		} catch (Exception ex) {
			// Send message
			Logger.getLogger(SendEmailServlet.class.getName()).log(Level.SEVERE, null, ex);
		}
		return null;
	}
	
//	static void assaignHost(Map<String,String> host) {
//		 
//		host.put("1and1.com", "Smtp.1and1.com");
//		host.put("Airmail.net", "Mail.airmail.net");
//		host.put("Aol.com", "Smtp.aol.com");
//		host.put("Att.net", "Outbound.att.net");
//		host.put("Bluewin.ch", "Smtpauths.bluewin.ch");
//		host.put("Btconnect.com", "Mail.btconnect.tom");
//		host.put("Comcast.net", "Smtp.comcast.net");
//		host.put("Earthlink.net", "Smtpauth.earthlink.net");
//		host.put("Gmail.com", "Smtp.gmail.com");
//		host.put("Gmx.net", "Mail.gmx.net");
//		host.put("Hotpop.com", "Mail.hotpop.com");
//		host.put("Libero.it", "Mail.libero.it");
//		host.put("Lycos.com", "Smtp.lycos.com");
//		host.put("o2.com", "Smtp.o2.com");
//		host.put("Orange.net", "Smtp.orange.net");
//		host.put("Outlook.com", "Smtp.live.com");
//		host.put("Tin.it", "Mail.tin.it");
//		host.put("Tiscali.co.uk", "Smtp.tiscali.co.uk");
//		host.put("Verizon.net", "Outgoing.verizon.net");
//		host.put("virgin.net", "Smtp.virgin.net");
//		host.put("Wanadoo.fr", "Smtp.wanadoo.fr");
//		host.put("Yahoo.com", "Smtp.mail.yahoo.com");
//  
//		
//	}

}

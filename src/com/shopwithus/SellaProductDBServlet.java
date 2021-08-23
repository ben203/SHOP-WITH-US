package com.shopwithus;

import java.io.IOException;
import java.io.InputStream;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.mysql.cj.jdbc.exceptions.MysqlDataTruncation;

@WebServlet("/SellaProduct")
@MultipartConfig(maxFileSize = 160177215) // upload file's size up to 16MB
public class SellaProductDBServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		
		//obtain user input 
		String email = (String) session.getAttribute("email");
		String productName = request.getParameter("productName");
		String price = request.getParameter("price");
		String productCondition = request.getParameter("productCondition");
		String description = request.getParameter("description");
		
		InputStream inputStream = null; // input stream of the upload file

		// obtains the upload file part in this multipart request
		Part filePart = request.getPart("image");
		if (filePart != null) {
			// prints out some information for debugging
			System.out.println(filePart.getName());
			System.out.println(filePart.getSize());
			System.out.println(filePart.getContentType());

			// obtains input stream of the upload file
			inputStream = filePart.getInputStream();
		}

		Connection conn = null; // connection to the database
 

		try {
			// connects to the database
			Class.forName("com.mysql.jdbc.Driver");

			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopwithusdb", "root", "qaz1");
			// constructs SQL statement
			String sql = "INSERT INTO sellaproduct (email,name_of_the_product, price, condi, image, product_description) values (?,?, ?, ?, ?, ?)";
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, email);
			statement.setString(2, productName);
			statement.setString(3, price);
			statement.setString(4, productCondition);
			statement.setString(6, description);

			if (inputStream != null) {
				// fetches input stream of the upload file for the blob column
				statement.setBlob(5, inputStream);

			}

			// sends the statement to the database server
			int row = statement.executeUpdate();
			if (row > 0) {
				System.out.print("ROW " + row);
				request.setAttribute("successfulMessage", "File uploaded");
				request.getRequestDispatcher("messageAfterUpload.jsp").forward(request, response);
			}
		} 
		
		catch(MysqlDataTruncation ex1) {
			
			//if image is bigger than  16MB
			session.setAttribute("errorMessage","Image size is too big please use a smaller file size");
				
		 
		} catch (ClassNotFoundException | SQLException e) {
		 
			e.printStackTrace();
		}
		
		finally {
			if (conn != null) {
				// closes the database connection
				try {
					conn.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}

			// forwards to the message page for and success or error message   
			response.sendRedirect("messageAfterUpload.jsp");
		}
	}
}
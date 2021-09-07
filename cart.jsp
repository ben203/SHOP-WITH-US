
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="java.util.*" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>One place shop</title>
</head>
<body>
	<style>
	body {
zoom:150%;
}
p {
	position: absolute;
	right: 50%;
}

.rbutton {
	position: absolute;
	color: white;
	background: green;
	right: 27%;
}

.right {
	position: absolute;
	right: 1%;
	top: 2%;
}

.hov:hover {
	border-style: outset;
}

pre {
	position: relative;
	top: 50px;
	tab-size: 0;
	font: 14px Arial, bold;
}
</style>





	<p>
		<img src=images/home3/secondcart.jpg width="100" height="80"> <br>
		<br id="center"> Shopping Cart<br> <br> <br> <br>

	</p>





	<form action="/ShopWithUs/home.jsp">
		<input type="submit" value="Go to Home page" />
	</form>




	<form action="deletecartitem" method="get" class="right">

		<input class="right" value="clearcart" type="submit">
	</form>









	<pre> 

	Date                                                  Order  <br>
	
	</pre>





	<%
	//obtain cart data
	ArrayList<ArrayList<String>> cart = (ArrayList<ArrayList<String>>) session.getAttribute("cart");

	//if cart is not empty display the items 
	if (cart != null) {
		int i = 0;
		while (i < cart.size()) {
			String dsplayItems = String.valueOf(cart.get(i));
			out.print(dsplayItems.replace("[", " ").replace("]", " ").replace(",", " ")

			+ "<br>" + "<br>");

			i++;

		}

	}

	//cart is empty reset indexs when adding items
	if (cart.size() == 0) {

		session.setAttribute("resetIndex", "reset");
	}

	//save cart data
	session.setAttribute("cart", cart);

	//for error handling purpose in payment file 
	session.setAttribute("fromcartpage", "");
			 
	%>

	<form action="paymentPage.jsp" method=post id="center">
		<p>
			<input type="image" src="images/home3/checkout.png"
				id="ordercheckout" class="hov" width="90" height="50" type="submit">
		</p>
	</form>

</body>
</html>

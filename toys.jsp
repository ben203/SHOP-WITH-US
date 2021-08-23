<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import=" javax.swing.*" import="java.util.*" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>One Place Shop</title>


<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.cart-size {
	color: white;
	background: #2E8B57;
	position: absolute;
	top: 10px;
	right: 83px;
	width: 25px;
	height: 25px;
}

.cbutton {
	position: relative;
	left: 44%;
	top: -33px;
	background: #04bd86;
}

#cart {
	position: absolute;
	right: 1px;
	top: 3px;
}

#logout {
	position: absolute;
	right: 55px;
	top: 3px;
}

#login {
	position: absolute;
	right: 10%;
	top: 1%;
}

#signup {
	position: absolute;
	right: 1%;
	top: 1%;
}

#user-greater {
	position: absolute;
	right: 18%;
	color: #00995c;
	font-weight: bold;
	font-size: 17px;
	font-family: Arial;
	top: 0px;
}

.hov:hover {
	border-style: outset;
}
</style>

<link rel="stylesheet" href="CSS/menu-bar.css">
<link rel="stylesheet" href="CSS/search-bar.css">
<link rel="stylesheet" href="CSS/slideshow.css">
<link rel="stylesheet" href="CSS/icons.css">
<link rel="stylesheet" href="CSS/login-popup.css">





<form action="search" class="searchbar">
	<input type="text" placeholder="Search Products" name="search-bar">
	<button type="submit">
		<i class="fa fa-search"></i>
	</button>
</form>

<a href="home.jsp"> <img src="images/home1/logo.png" id="logo"
	class="hov" title=ShopWithUs width="100" height="60">

</a>




<div class="topnav">
	<a href="home.jsp">Home</a> <a href="bestSellers.jsp">Best Sellers</a>
	<a href="customerService.jsp">Customer Service</a> <a href="books.jsp">Books</a>
	<a href="toys.jsp">Toys</a> <a href="games.jsp">Games</a> <a
		href="giftCards.jsp">Gift Cards</a> <a href="electronics.jsp">Electronics</a>
	<!-- only display sellyourproducts tab if user is logged in -->
	<%if (session.getAttribute("email") != null) {out.print("<a href=" + '"' + "sellYourProducts.jsp" + '"' + ">Sell Your Products</a>");}%>

</div>




</head>
<body>

	<%
	String name = (String) session.getAttribute("firstName");
	String email = (String) session.getAttribute("email");

	String login = " <a  onclick=" + '"' + "openForm()" + '"' + " >" + " <img src=" + '"' + "images" + '/' + "home1" + '/'
			+ "login.png" + '"' + "id=" + '"' + "login" + '"' + "class=" +

			'"' + "hov" + '"' + "title=ShopWithUs width=" + '"' + "80" + '"' + "height=" + '"' + "30" + '"' + "> </a>";

	String signup = " <a  href=" + '"' + "signup.jsp" + '"' + " >" + " <img src=" + '"' + "images" + '/' + "home1" + '/'
			+ "signup.png" + '"' + "id=" + '"' + "signup" + '"' + "class=" +

			'"' + "hov" + '"' + "title=ShopWithUs width=" + '"' + "80" + '"' + "height=" + '"' + "30" + '"' + "> </a>";

	String userGreating = "<h1 id =" + '"' + "user-greater" + '"' + "class=" + "> Hi " + name + "<" + '/' + "h1>";

	String logout = " <div> <form action=" + '"' + "Logout" + '"' + "method =" + '"' + "post" + '"' + "id=" + '"' + "logout"
			+ '"' + "> <input type=" + '"' + "image" + '"' + "src=" + '"' + "images" + '/' + "home1" + '/' + "logout.png"
			+ '"' + "id=" + '"' + "logout" + '"' + "class=" + '"' + "hov" + '"' + "width=" + '"' + "80" + '"' + "height="
			+ '"' + "30" + '"' + "alt=" + '"' + "submit" + '"' + '/' + "> </a>" + "<" + '/' + "form><" + '/' + "div>";
	String cart = " <a  href=" + '"' + "cart.jsp" + '"' + " >" + " <img src=" + '"' + "images" + '/' + "home1" + '/'
			+ "cart.jpg" + '"' + "id=" + '"' + "cart" + '"' + "class=" +

			'"' + "hov" + '"' + "title=ShopWithUs width=" + '"' + "80" + '"' + "height=" + '"' + "30" + '"' + "> </a>";

	//if user is not logged in display login and signup icons 		
	if (email == null) {

		out.print(login + signup);

		String message = (String) session.getAttribute("message");

		//error message for failed login attempt 
		if (message != null) {

			JOptionPane.showMessageDialog(null, message, "Error", JOptionPane.ERROR_MESSAGE);

			session.setAttribute("message", null);
		}

	}

	else {

		//when user is logged in display greating, cart icon , cart items size counter and logout icon 
		ArrayList<ArrayList<String>> cartval = (ArrayList<ArrayList<String>>) session.getAttribute("cart");
		String cartSize = "<button" + " class=" + '"' + "cart-size" + '"' + "onclick=" + '"' + "location.href='cart.jsp'"
		+ '"' + " type=" + '"' + "button" + '"' + ">" + cartval.size() + "</button>";

		out.print(cartSize + userGreating + logout + cart);

	}
	%>

	<script>
		//popup login 
		function openForm() {
			document.getElementById("myForm1").style.display = "block";
		}
		//close login popup 
		function closeForm() {
			document.getElementById("myForm1").style.display = "none";
		}
	</script>




	<div class="form-popup" id="myForm1">
		<form action="LoginAuthenticator" method="post" class="form-container">
			<h1>Login</h1>
			<label for="email"><b>Email</b></label> <input type="text"
				placeholder="Enter Email" name="email" required> <label
				for="psw"><b>Password</b></label> <input type="password"
				placeholder="Enter Password" name="password" required>
			<button type="submit" class="btn">Login</button>
			<button type="button" class="btn cancel" onclick="closeForm()">Close</button>
		</form>
	</div>
<body>




	<br>
	<br>
	<br>
	<br>
	<img src="images/toys/dinosaur.jpg" width="150" height="100"
		style="float: left">Dinosaur Toys for 3 to 7 Year Old Boys
	<br> Price: $35.00
	<br>
	<form name="toyoder" action="additemstocart" method="get">
		<input name="item" type="hidden"
			value="Dinosaur Toys for 3 to 7 Year Old Boys"> <input
			name="price" type="hidden" value="35.00"> <input
			name="formname" type="hidden" value="toyoder"> <input
			name="toybutton1" class="cbutton" type="submit" value="Addtocart" />
	</form>




	<br>
	<br>
	<img src="images/toys/lawn.jpg" width="150" height="100"
		style="float: left"> JUMELLA Lawn Mower Bubble Machine
	<br> Price: $18.95
	<br>
	<form name="toyoder" action="additemstocart" method="get">
		<input name="item" type="hidden"
			value="JUMELLA Lawn Mower Bubble Machine "> <input
			name="price" type="hidden" value="18.95"> <input
			name="formname" type="hidden" value="toyoder"> <input
			name="toybutton2" class="cbutton" type="submit" value="Addtocart" />
	</form>

	<br>
	<br>
	<img src="images/toys/planes.jpg" width="150" height="100"
		style="float: left"> 2 Pack LED Light Airplane,17.5"
	<br> Price: $19.00
	<br>
	<form name="toyoder" action="additemstocart" method="get">
		<input name="item" type="hidden"
			value="2 Pack LED Light Airplane,17.5"> <input name="price"
			type="hidden" value="19.00"> <input name="formname"
			type="hidden" value="toyoder"> <input name="toybutton3"
			class="cbutton" type="submit" value="Addtocart" />
	</form>

	<br>
	<br>
	<img src="images/toys/ramps.jpg" width="150" height="100"
		style="float: left"> TOP BRIGHT Car Ramp Toy
	<br> Price: $8.99
	<br>
	<form name="toyoder" action="additemstocart" method="get">
		<input name="item" type="hidden" value="TOP BRIGHT Car Ramp Toy">
		<input name="price" type="hidden" value="8.99"> <input
			name="formname" type="hidden" value="toyoder"> <input
			name="toybutton4" class="cbutton" type="submit" value="Addtocart" />
	</form>


	<br>
	<br>
	<img src="images/toys/fire-truck.jpg" width="150" height="100"
		style="float: left"> Prextex RC Fire Engine Truck
	<br> Price: $40.00
	<br>
	<form name="toyoder" action="additemstocart" method="get">
		<input name="item" type="hidden" value="Prextex RC Fire Engine Truck">
		<input name="price" type="hidden" value="40.00"> <input
			name="formname" type="hidden" value="toyoder"> <input
			name="toybutton5" class="cbutton" type="submit" value="Addtocart" />
	</form>


	<br>
	<br>
	<img src="images/toys/truck.jpg" width="150" height="100"
		style="float: left"> Toy Pickup Trucks for Boys
	<br> Price: $45.00
	<br>
	<form name="toyoder" action="additemstocart" method="get">
		<input name="item" type="hidden" value="Toy Pickup Trucks for Boys">
		<input name="price" type="hidden" value="45.00"> <input
			name="formname" type="hidden" value="toyoder"> <input
			name="toybutton6" class="cbutton" type="submit" value="Addtocart" />
	</form>

	<br>
	<br>
	<img src="images/toys/rc-robot.jpg" width="150" height="100"
		style="float: left">Sonomo Toys for 6-9 Year Old Boys
	<br> Price: $95.00
	<br>
	<form name="toyoder" action="additemstocart" method="get">
		<input name="item" type="hidden"
			value="Sonomo Toys for 6-9 Year Old Boys"> <input
			name="price" type="hidden" value="95.00"> <input
			name="formname" type="hidden" value="toyoder"> <input
			name="toybutton7" class="cbutton" type="submit" value="Addtocart" />
	</form>

	<br>
	<br>
	<img src="images/toys/iplay.jpg" width="150" height="100"
		style="float: left"> iLearn 10pcs Baby Rattle Toys
	<br> Price: $15.00
	<br>
	<form name="toyoder" action="additemstocart" method="get">
		<input name="item" type="hidden" value="iLearn 10pcs Baby Rattle Toys">
		<input name="price" type="hidden" value="15.00"> <input
			name="formname" type="hidden" value="toyoder"> <input
			name="toybutton8" class="cbutton" type="submit" value="Addtocart" />
	</form>


</body>
</html>
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
	left: 33%;
	top: -70px;
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
		<!-- only display the sellyourproduct when user is logged in -->
	<%if(session.getAttribute("email")!=null){out.print("<a href=" + '"'+"sellYourProducts.jsp" +'"'+">Sell Your Products</a>");}%>
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
	<img src="images/electronics/apple-ipad.jpg" width="150" height="100"
		style="float: left">2021 Apple 11-inch iPad Pro
	<br> Price: $800
	<br>
	<br>
	<br>
	<form name="electronicorder" action="additemstocart" method="get">
		<input name="item" type="hidden" value="2021 Apple 11-inch iPad Pro">
		<input name="price" type="hidden" value="800.00"> <input
			name="formname" type="hidden" value="electronicorder"> <input
			name="electronicsbutton1" class="cbutton" type="submit"
			value="Addtocart" />
	</form>

	<br>
	<img src="images/electronics/beats-ear-buds.jpg" width="150"
		height="100" style="float: left">New Beats Studio Buds
	<br> Price: $145.95
	<br>
	<br>
	<br>
	<form name="electronicorder" action="additemstocart" method="get">
		<input name="item" type="hidden" value="New Beats Studio Buds">
		<input name="price" type="hidden" value="145.95"> <input
			name="formname" type="hidden" value="electronicorder"> <input
			name="electronicsbutton1" class="cbutton" type="submit"
			value="Addtocart" />
	</form>

	<br>
	<img src="images/electronics/bose-headphone.jpg" width="150"
		height="100" style="float: left"> Bose SoundLink Headphones
	<br> Price: $160.00
	<br>
	<br>
	<br>
	<form name="electronicorder" action="additemstocart" method="get">
		<input name="item" type="hidden" value="Bose SoundLink Headphones">
		<input name="price" type="hidden" value="160.00"> <input
			name="formname" type="hidden" value="electronicorder"> <input
			name="electronicsbutton1" class="cbutton" type="submit"
			value="Addtocart" />
	</form>

	<br>
	<img src="images/electronics/hp-laptop.jpg" width="150" height="100"
		style="float: left"> HP Stream 14-inch Laptop
	<br> Price: $300.00
	<br>
	<br>
	<br>
	<form name="electronicorder" action="additemstocart" method="get">
		<input name="item" type="hidden" value="HP Stream 14-inch Laptop">
		<input name="price" type="hidden" value="300.00"> <input
			name="formname" type="hidden" value="electronicorder"> <input
			name="electronicsbutton1" class="cbutton" type="submit"
			value="Addtocart" />
	</form>

	<br>
	<img src="images/electronics/macbookpro.jpg" width="150" height="100"
		style="float: left"> Apple MacBook Pro
	<br> Price: $1029.00
	<br>
	<br>
	<br>
	<form name="electronicorder" action="additemstocart" method="get">
		<input name="item" type="hidden" value="Apple MacBook Pro"> <input
			name="price" type="hidden" value="1029.00 "> <input
			name="formname" type="hidden" value="electronicorder"> <input
			name="electronicsbutton1" class="cbutton" type="submit"
			value="Addtocart" />
	</form>

	<br>
	<img src="images/electronics/samsung-curved-tv.jpg" width="150"
		height="100" style="float: left">SAMSUNG 55-inch Curved TV
	<br> Price: $600.00
	<br>
	<br>
	<br>
	<form name="electronicorder" action="additemstocart" method="get">
		<input name="item" type="hidden" value="SAMSUNG 55-inch Curved TV">
		<input name="price" type="hidden" value="600.00"> <input
			name="formname" type="hidden" value="electronicorder"> <input
			name="electronicsbutton1" class="cbutton" type="submit"
			value="Addtocart" />
	</form>

	<br>
	<img src="images/electronics/samsung-galaxy-tab.jpg" width="150"
		height="100" style="float: left">SAMSUNG Galaxy Tab S7
	<br> Price: $845.00
	<br>
	<br>
	<br>
	<form name="electronicorder" action="additemstocart" method="get">
		<input name="item" type="hidden" value="SAMSUNG Galaxy Tab S7 ">
		<input name="price" type="hidden" value="$845.00"> <input
			name="formname" type="hidden" value="electronicorder"> <input
			name="electronicsbutton1" class="cbutton" type="submit"
			value="Addtocart" />
	</form>

	<br>
	<img src="images/electronics/sony-65-inches-tv.jpg" width="150"
		height="100" style="float: left"> Sony X80J 65 Inch TV
	<br> Price: $900.00
	<br>
	<br>
	<br>
	<form name="electronicorder" action="additemstocart" method="get">
		<input name="item" type="hidden" value="Sony X80J 65 Inch TV">
		<input name="price" type="hidden" value="900.00"> <input
			name="formname" type="hidden" value="electronicorder"> <input
			name="electronicsbutton1" class="cbutton" type="submit"
			value="Addtocart" />
	</form>

	<br>
	<img src="images/electronics/vacuume-robot.jpg" width="150"
		height="100" style="float: left"> Robot Vacuum Cleaner
	<br> Price: $235.00
	<br>
	<br>
	<br>
	<form name="electronicorder" action="additemstocart" method="get">
		<input name="item" type="hidden" value="Robot Vacuum Cleaner">
		<input name="price" type="hidden" value="235.00"> <input
			name="formname" type="hidden" value="electronicorder"> <input
			name="electronicsbutton1" class="cbutton" type="submit"
			value="Addtocart" />
	</form>
	<br>
	<img src="images/electronics/wireless-earbuds.jpg" width="150"
		height="100" style="float: left"> TOZO T6 True Wireless Earbuds
	<br> Price: $35.00
	<br>
	<br>
	<br>


	<form name="electronicsorder" action="additemstocart" method="get">
		<input name="item" type="hidden" value="TOZO T6 True Wireless Earbuds">
		<input name="price" type="hidden" value="35.00"> <input
			name="formname" type="hidden" value="electronicorder"> <input
			name="electronicsbutton1" class="cbutton" type="submit"
			value="Addtocart" />
	</form>
</body>
</html>
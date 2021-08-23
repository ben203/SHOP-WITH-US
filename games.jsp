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
	left: 27%;
	top: -50px;
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
	<img src="images/games/fifa21.jpg" width="150" height="100"
		style="float: left">FIFA 21
	<br> PC
	<br> Price: $20.00
	<br>

	<form name="gameorder" action="additemstocart" method="get">


		<input name="title" type="hidden" value="FIFA 21"> <input
			name="console" type="hidden" value="PC"> <input name="price"
			type="hidden" value="20.00"> <input name="formname"
			type="hidden" value="gameorder"> <input name="gamebutton1"
			class="cbutton" type="submit" value="Addtocart" />
	</form>




	<br>
	<img src="images/games/fortnite.png" width="150" height="100"
		style="float: left"> Fortnite
	<br> PC
	<br> Price: $45.95
	<br>

	<form name="gameorder" action="additemstocart" method="get">


		<input name="title" type="hidden" value="Fortnite"> <input
			name="console" type="hidden" value="PC"> <input name="price"
			type="hidden" value="45.95"> <input name="formname"
			type="hidden" value="gameorder"> <input name="gamebutton2"
			class="cbutton" type="submit" value="Addtocart" />
	</form>


	<br>
	<img src="images/games/mario-golf.jpg" width="150" height="100"
		style="float: left"> Mario Golf: Super Rush
	<br> Nintendo Switch
	<br> Price: $60.00
	<br>

	<form name="gameorder" action="additemstocart" method="get">


		<input name="title" type="hidden" value="Mario Golf: Super Rush">



		<input name="console" type="hidden" value="Nintendo Switch"> <input
			name="price" type="hidden" value="60.00"> <input
			name="formname" type="hidden" value="gameorder"> <input
			name="gamebutton3" class="cbutton" type="submit" value="Addtocart" />
	</form>


	<br>
	<img src="images/games/minecraft.png" width="150" height="100"
		style="float: left"> Minecraft
	<br> Mac
	<br> Price: $28.99
	<br>

	<form name="gameorder" action="additemstocart" method="get">


		<input name="title" type="hidden" value="Minecraft"> <input
			name="console" type="hidden" value="Mac"> <input name="price"
			type="hidden" value="28.99"> <input name="formname"
			type="hidden" value="gameorder"> <input name="gamebutton4"
			class="cbutton" type="submit" value="Addtocart" />
	</form>


	<br>
	<img src="images/games/mlb.jpg" width="150" height="100"
		style="float: left"> MLB The Show 21
	<br> PC
	<br> Price: $29.00
	<br>

	<form name="gameorder" action="additemstocart" method="get">


		<input name="title" type="hidden" value="MLB The Show 21"> <input
			name="console" type="hidden" value="PC"> <input name="price"
			type="hidden" value="29.00"> <input name="formname"
			type="hidden" value="gameorder"> <input name="gamebutton5"
			class="cbutton" type="submit" value="Addtocart" />
	</form>


	<br>
	<img src="images/games/nba2k.jpg	" width="150" height="100"
		style="float: left"> NBA 2K21
	<br> PlayStaion 4
	<br> Price: $45.00
	<br>

	<form name="gameorder" action="additemstocart" method="get">


		<input name="title" type="hidden" value="NBA 2K21"> <input
			name="console" + type="hidden" value="PlayStaion 4"> <input
			name="price" type="hidden" value="45.00"> <input
			name="formname" type="hidden" value="gameorder"> <input
			name="gamebutton6" class="cbutton" type="submit" value="Addtocart" />
	</form>

	<br>
	<img src="images/games/need-for-speed.jpg" width="150" height="100"
		style="float: left">Need For Speed
	<br> Xbox One
	<br> Price: $35.00
	<br>

	<form name="gameorder" action="additemstocart" method="get">


		<input name="title" type="hidden" value="Need For Speed"> <input
			name="console" type="hidden" value="Xbox One"> <input
			name="price" type="hidden" value="35.00"> <input
			name="formname" type="hidden" value="gameorder"> <input
			name="gamebutton7" class="cbutton" type="submit" value="Addtocart" />
	</form>

	<br>
	<img src="images/games/sonic.jpg" width="150" height="100"
		style="float: left"> Sonic Generations (Platinum Hits)
	<br> Xbox 360
	<br> Price: $55.00
	<br>

	<form name="gameorder" action="additemstocart" method="get">


		<input name="title" type="hidden"
			value="Sonic Generations (Platinum Hits)"> <input
			name="console" type="hidden" value="Xbox 360"> <input
			name="price" type="hidden" value="55.00"> <input
			name="formname" type="hidden" value="gameorder"> <input
			name="gamebutton8" class="cbutton" type="submit" value="Addtocart" />
	</form>

	<br>
	<img src="images/games/spiderman.jpg" width="150" height="100"
		style="float: left"> Spider-Man Miles Morals
	<br> PlayStation 4
	<br> Price: $35.00
	<br>

	<form name="gameorder" action="additemstocart" method="get">
		<input name="title" type="hidden" value="Spider-Man Miles Morals">
		<input name="console" type="hidden" value="PlayStation 4"> <input
			name="price" type="hidden" value="35.00"> <input
			name="formname" type="hidden" value="gameorder"> <input
			name="gamebutton9" class="cbutton" type="submit" value="Addtocart" />
	</form>




</body>
</html>
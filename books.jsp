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
body {
zoom:150%;
}
#menubar{
  display: flex;
    flex-wrap: nowrap;
    
}
#search{
 position:relative;
left: 200px;

top:1px;
width:800px;
min-width:10px;


}
#sbutn{
 
left:473px;
font-size:13px; 
height:40px;
width:58px;
 
}

.cart-size {
	color: white;
	background: #2E8B57;
	position: relative;
	right: -840px;
	top: -10px;
	width: 25px;
	height: 25px;
}

.cbutton {
position: relative;
	left: 33%;
	top: -60px;
	background: #04bd86;
}

#cart {
	position: relative;
	right: -975px;
	top: -120px;
}

#logout {
		position: relative;
	right:-430px;
  top:-42px;
}

#login {
	position: relative;
	right: -775px;
  top: -10px;
}

#signup {
	position: relative;
	right: -780px;
	top: -10px;
}

#user-greater {
	position: relative;
	right: -750px;
	top: -10px;
	color: #00995c;
	font-weight: bold;
	font-size: 17px;
	font-family: Arial;
	top: -50px;
}

.hov:hover {
	border-style: outset;
}
</style>

<link rel="stylesheet" href="CSS/menu-bar.css">
<link rel="stylesheet" href="CSS/search-bar.css">

<link rel="stylesheet" href="CSS/icons.css">
<link rel="stylesheet" href="CSS/login-popup.css">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>


<div>
<form action="search" class="searchbar" id="search">
	<input type="text" placeholder="Search Products" name="search-bar">
	 <button class="btn btn-outline-success" id="sbutn" type="submit">Search</button>
	 
</form>
</div>

<a href="home.jsp"> <img src="images/home1/logo.png" id="logo"
	class="hov" title=ShopWithUs width="100" height="60">

</a>




<div class="topnav" id="menubar" >
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



	<div>

 <!-- adjusting the text and image positioning   -->
<%if(session.getAttribute("email")==null){out.print("<br><br><br>");} %>

		  <img src="images/books/book1.jpg"
			width="150" height="100" style="float: left"> Title: The
		Mountain Is You <br> Autor: Brianna Wiest <br> Price: $15.99
		<br>


		<form name="bookorder" action="additemstocart" method="get">


			<input name="title" type="hidden" value="The Mountain Is You">



			<input name="author" type="hidden" value="Brianna Wiest"> <input
				name="price" type="hidden" value="15.99"> <input
				name="formname" type="hidden" value="bookorder"> <input
				name="bookbutton1" class="cbutton" type="submit" value="Addtocart" />
		</form>



		<br> <img src="images/books/book2.jpg" width="150" height="100"
			style="float: left"> Title: GoodNight Moon <br> Autor:
		Margaret Wise Brown <br> Price: $10.99 <br>

		<form name="bookorder" action="additemstocart" method="get">


			<input name="title" type="hidden" value="GoodNight Moon"> <input
				name="author" type="hidden" value="Margaret Wise Brown"> <input
				name="price" type="hidden" value="10.99"> <input
				name="formname" type="hidden" value="bookorder"> <input
				name="bookbutton2" class="cbutton" type="submit" value="Addtocart" />
		</form>
	</div>

	<br>
	<img src="images/books/book3.jpg" width="150" height="100"
		style="float: left"> Title: Where's Spot?
	<br> Autor: Eric Hill
	<br> Price: $9.00
	<br>

	<form name="bookorder" action="additemstocart" method="get">


		<input name="title" type="hidden" value="Where's Spot?"> <input
			name="author" type="hidden" value="Eric Hill"> <input
			name="price" type="hidden" value="9.00"> <input
			name="formname" type="hidden" value="bookorder"> <input
			name="bookbutton3" class="cbutton" type="submit" value="Addtocart" />
	</form>

	<br>
	<img src="images/books/book4.jpg" width="150" height="100"
		style="float: left"> Title: It Ends With Us
	<br> Autor: Colleen Hoover
	<br> Price: $25.99
	<br>

	<form name="bookorder" action="additemstocart" method="get">


		<input name="title" type="hidden" value="Colleen Hoover"> <input
			name="author" type="hidden" value="Brianna Wiest"> <input
			name="price" type="hidden" value="25.99"> <input
			name="formname" type="hidden" value="bookorder"> <input
			name="bookbutton4" class="cbutton" type="submit" value="Addtocart" />
	</form>

	<br>
	<img src="images/books/book5.jpg" width="150" height="100"
		style="float: left"> Title: Atomic Habits
	<br> Autor: James Clear
	<br> Price: $35.00
	<br>

	<form name="bookorder" action="additemstocart" method="get">


		<input name="title" type="hidden" value="Atomic Habits"> <input
			name="author" type="hidden" value="James Clear"> <input
			name="price" type="hidden" value="35.00"> <input
			name="formname" type="hidden" value="bookorder"> <input
			name="bookbutton5" class="cbutton" type="submit" value="Addtocart" />
	</form>

	<br>
	<img src="images/books/book6.jpg" width="150" height="100"
		style="float: left"> Title: The Last Thing He Told Me
	<br> Autor: Laura Dave
	<br> Price: $20.00
	<br>

	<form name="bookorder" action="additemstocart" method="get">


		<input name="title" type="hidden" value="The Last Thing He Told Me">



		<input name="author" type="hidden" value="Laura Dave"> <input
			name="price" type="hidden" value="20.00"> <input
			name="formname" type="hidden" value="bookorder"> <input
			name="bookbutton6" class="cbutton" type="submit" value="Addtocart" />
	</form>

	<br>
	<img src="images/books/book7.jpg" width="150" height="100"
		style="float: left">Title: Razorblade Tears
	<br> Autor: S. A. Cosby
	<br> Price: $15.99
	<br>

	<form name="bookorder" action="additemstocart" method="get">


		<input name="title" type="hidden" value=" Razorblade Tears"> <input
			name="author" type="hidden" value="Brianna Wiest"> <input
			name="price" type="hidden" value="15.99"> <input
			name="formname" type="hidden" value="bookorder"> <input
			name="bookbutton7" class="cbutton" type="submit" value="Addtocart" />
	</form>

	<br>
	<img src="images/books/book8.jpg" width="150" height="100"
		style="float: left">Title: Corduroy
	<br> Autor: Dan Freeman
	<br> Price: $15.99
	<br>

	<form name="bookorder" action="additemstocart" method="get">


		<input name="title" type="hidden" value="Corduroy"> <input
			name="author" type="hidden" value="Dan Freeman"> <input
			name="price" type="hidden" value="15.99"> <input
			name="formname" type="hidden" value="bookorder"> <input
			name="bookbutton8" class="cbutton" type="submit" value="Addtocart" />
	</form>

	<br>
	<img src="images/books/book9.jpg" width="150" height="100"
		style="float: left"> Title: Checkmate In Berlin
	<br> Autor: Giles Milton
	<br> Price: $44.00
	<br>

	<form name="bookorder" action="additemstocart" method="get">


		<input name="title" type="hidden" value="Checkmate In Berlin">



		<input name="author" type="hidden" value="Giles Milton"> <input
			name="price" type="hidden" value="44.00"> <input
			name="formname" type="hidden" value="bookorder"> <input
			name="bookbutton9" class="cbutton" id="btnButton" type="submit"
			value="Addtocart" />
	</form>





</body>
</html>
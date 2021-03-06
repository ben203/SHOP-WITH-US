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
	left: 7%;
	top: -10px;
	background: #04bd86;
}

#cart {
	position: relative;
	right: -825px;
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
input[type='number']{
    width: 131px;
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

//disable the textbox unless radio button for it is selected  
function Checkradiobutton()
{
	 
	var otherrb = document.getElementsByClassName('otherrb');
	var otherrbtext = document.getElementsByClassName('otherrbtext');
	for(var i=0; i<otherrb.length; i++){
		if(otherrb[i].checked ){
			 
		 
			otherrbtext[i].disabled=false;
		 
		}else{
			
			otherrbtext[i].disabled=true;
		}
		
	}
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



	  <!-- adjusting the text and image positioning   -->
<%if(session.getAttribute("email")==null){out.print("<br><br><br>");} %>
	 
	<img src="images/gift-cards/apple.jpg" width="150" height="100"
		style="float: left">
	<br> Everything Apple
	<br>

	<form name="giftorder" action="additemstocart" method="get">
		<input name="card" type="hidden" value="Everything Apple"><input
			type="radio" name="amount" value="25.00" checked> 25 <input
			type="radio" name="amount" value="50.00"> 50 <input
			type="radio" name="amount" value="100.00"> 100 <input
			type="radio" name="amount" class="otherrb"
			onClick="Checkradiobutton()"> other <input
			class="otherrbtext" size = "100"placeholder="other amount" type="number" min="1"
			max="100000" name="othamount" onClick="Checkradiobutton()"> <input
			name="formname" type="hidden" value="giftorder">
		<button class="cbutton">Addtocart</button>
		<br>
	</form>




	<br>
	<br>
	<br>
	<img src="images/gift-cards/google-play.jpg" width="150" height="100"
		style="float: left">
	<br> Google Play Store
	<br>

	<form name="giftorder" action="additemstocart" method="get">
		<input name="card" type="hidden" value="Google Play Store"> <input
			type="radio" name="amount" value="25.00" checked> 25 <input
			type="radio" name="amount" value="50.00"> 50 <input
			type="radio" name="amount" value="100.00"> 100 <input
			type="radio" name="amount" class="otherrb"
			onClick="Checkradiobutton()"> other <input
			class="otherrbtext" placeholder="other amount" type="number" min="1"
			max="100000" name="othamount" onClick="Checkradiobutton()"> <input
			name="formname" type="hidden" value="giftorder">
		<button class="cbutton">Addtocart</button>
		<br>
	</form>

	<br>
	<br>
	<br>
	<img src="images/gift-cards/kohls.jpg" width="150" height="100"
		style="float: left">
	<br>Kohl's
	<br>
	<form name="giftorder" action="additemstocart" method="get">
		<input name="card" type="hidden" value="Kohl's"> <input
			type="radio" name="amount" value="25.00" checked> 25 <input
			type="radio" name="amount" value="50.00"> 50 <input
			type="radio" name="amount" value="100.00"> 100 <input
			type="radio" name="amount" class="otherrb"
			onClick="Checkradiobutton()"> other <input
			class="otherrbtext" placeholder="other amount" type="number" min="1"
			max="100000" name="othamount" onClick="Checkradiobutton()"> <input
			name="formname" type="hidden" value="giftorder">
		<button class="cbutton">Addtocart</button>
		<br>
	</form>

	<br>
	<br>
	<br>
	<img src="images/gift-cards/mastercard.jpg" width="150" height="100"
		style="float: left">
	<br>Mastercard
	<br>
	<form name="giftorder" action="additemstocart" method="get">
		<input name="card" type="hidden" value="Mastercard"> <input
			type="radio" name="amount" value="25.00" checked> 25 <input
			type="radio" name="amount" value="50.00"> 50 <input
			type="radio" name="amount" value="100.00"> 100 <input
			type="radio" name="amount" class="otherrb"
			onClick="Checkradiobutton()"> other <input
			class="otherrbtext" placeholder="other amount" type="number" min="1"
			max="100000" name="othamount" onClick="Checkradiobutton()"> <input
			name="formname" type="hidden" value="giftorder">
		<button class="cbutton">Addtocart</button>
		<br>
	</form>
	<br>
	<br>
	<br>
	<img src="images/gift-cards/starbucks.jpg" width="150" height="100"
		style="float: left">
	<br> Starbucks
	<br>
	<form name="giftorder" action="additemstocart" method="get">
		<input name="card" type="hidden" value="Starbucks"> <input
			type="radio" name="amount" value="25.00" checked> 25 <input
			type="radio" name="amount" value="50.00"> 50 <input
			type="radio" name="amount" value="100.00"> 100 <input
			type="radio" name="amount" class="otherrb"
			onClick="Checkradiobutton()"> other <input
			class="otherrbtext" placeholder="other amount" type="number" min="1"
			max="100000" name="othamount" onClick="Checkradiobutton()"> <input
			name="formname" type="hidden" value="giftorder">
		<button class="cbutton">Addtocart</button>
		<br>
	</form>
	<br>
	<br>
	<br>
	<img src="images/gift-cards/taco-bell.jpg" width="150" height="100"
		style="float: left">
	<br>Taco Bell
	<br>
	<form name="giftorder" action="additemstocart" method="get">

		<input name="card" type="hidden" value="Taco Bell"> <input
			type="radio" name="amount" value="25.00" checked> 25 <input
			type="radio" name="amount" value="50.00"> 50 <input
			type="radio" name="amount" value="100.00"> 100 <input
			type="radio" name="amount" class="otherrb"
			onClick="Checkradiobutton()"> other <input
			class="otherrbtext" placeholder="other amount" type="number" min="1"
			max="100000" name="othamount" onClick="Checkradiobutton()"> <input
			name="formname" type="hidden" value="giftorder">
		<button class="cbutton">Addtocart</button>
		<br>
	</form>
	<br>
	<br>
	<br>
	<img src="images/gift-cards/visa.png" width="150" height="100"
		style="float: left">
	<br>Visa
	<br>

	<form name="giftorder" action="additemstocart" method="get">
		<input name="card" type="hidden" value="Visa"> <input
			type="radio" name="amount" value="25.00" checked> 25 <input
			type="radio" name="amount" value="50.00"> 50 <input
			type="radio" name="amount" value="100.00"> 100 <input
			type="radio" name="amount" class="otherrb"
			onClick="Checkradiobutton()"> other <input
			class="otherrbtext" placeholder="other amount" type="number" min="1"
			max="100000" name="othamount" onClick="Checkradiobutton()"> <input
			name="formname" type="hidden" value="giftorder">
		<button class="cbutton">Addtocart</button>
		<br>
	</form>



</body>
</html>
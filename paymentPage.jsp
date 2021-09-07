<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="java.util.*" import="java.text.DecimalFormat"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>One Stop Shop</title>
<head>


<link rel="stylesheet" href="CSS/flexbox.css">


<style>
body {
zoom:150%;
}
p1 {
	position: absolute;
	color: red;
	top: 30px;
}

p2 {
	position: absolute;
	left: 57%;
	text-align: justify;
}

p3 {
	position: absolute;
	right: 20px
}

input[type=text] {
	width: 80%;
	margin-bottom: 20px;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

select {
	position: absolute;
	width: 250px;
	height: 33px;
}

#error {
	border: 3px solid red;
}
</style>




</head>
<body>
	<script>
		//disable text box if checkbox ticked
		function disableText() {

			var textbox = document.getElementsByClassName("fullname");
			if (document.getElementById("distext").checked) {

				textbox[0].disabled = true;

			} else {
				textbox[0].disabled = false;

			}

		}
	</script>
	<%
	//since values are null before user enterned their info
	//counter act this by suppressing the error message
	if (session.getAttribute("fromcartpage") != null) {
		session.setAttribute("phoneNumber", "");
		session.setAttribute("name", "");
		session.setAttribute("zipcode", "");
		session.setAttribute("cvvNumber", "");
		session.setAttribute("ccNumber", "");
		session.setAttribute("fromcartpage", null);
	} 
	%>


	<p1> <%
 //when one or more values are inccorect
 if (session.getAttribute("phoneNumber") == null || session.getAttribute("name") == null
 		|| (session.getAttribute("zipcode") == null) || (session.getAttribute("ccNumber") == null)
 		|| session.getAttribute("cvvNumber") == null) {

 	out.print(" * Please fix one or more of your inccorect input below");
 	 
 }
 %> </p1>
	<div class="row">
		<div class="col-75">
			<div class="container">
				<form action="paymentprocessor" name="payment" method="post">

					<div class="row">
						<div class="col-50">
							<h3>Billing Address</h3>

							<label for="adr"><i class="fa fa-address-card-o"></i>
								Address*</label> <input type="text" id="adr" name="address" required
								placeholder="542 W. 15th Street"> <label for="city"><i
								class="fa fa-institution"></i> City*</label> <input type="text"
								id="city" required name="city" placeholder="New York">

							<div class="row">
								<div class="col-50">
									<label for="state">State*</label> <select name="nameofstate">
										<option value="AL">Alabama</option>
										<option value="AK">Alaska</option>
										<option value="AZ">Arizona</option>
										<option value="AR">Arkansas</option>
										<option value="CA">California</option>
										<option value="CO">Colorado</option>
										<option value="CT">Connecticut</option>
										<option value="DE">Delaware</option>
										<option value="DC">District Of Columbia</option>
										<option value="FL">Florida</option>
										<option value="GA">Georgia</option>
										<option value="HI">Hawaii</option>
										<option value="ID">Idaho</option>
										<option value="IL">Illinois</option>
										<option value="IN">Indiana</option>
										<option value="IA">Iowa</option>
										<option value="KS">Kansas</option>
										<option value="KY">Kentucky</option>
										<option value="LA">Louisiana</option>
										<option value="ME">Maine</option>
										<option value="MD">Maryland</option>
										<option value="MA">Massachusetts</option>
										<option value="MI">Michigan</option>
										<option value="MN">Minnesota</option>
										<option value="MS">Mississippi</option>
										<option value="MO">Missouri</option>
										<option value="MT">Montana</option>
										<option value="NE">Nebraska</option>
										<option value="NV">Nevada</option>
										<option value="NH">New Hampshire</option>
										<option value="NJ">New Jersey</option>
										<option value="NM">New Mexico</option>
										<option selected value="NY">New York</option>
										<option value="NC">North Carolina</option>
										<option value="ND">North Dakota</option>
										<option value="OH">Ohio</option>
										<option value="OK">Oklahoma</option>
										<option value="OR">Oregon</option>
										<option value="PA">Pennsylvania</option>
										<option value="RI">Rhode Island</option>
										<option value="SC">South Carolina</option>
										<option value="SD">South Dakota</option>
										<option value="TN">Tennessee</option>
										<option value="TX">Texas</option>
										<option value="UT">Utah</option>
										<option value="VT">Vermont</option>
										<option value="VA">Virginia</option>
										<option value="WA">Washington</option>
										<option value="WV">West Virginia</option>
										<option value="WI">Wisconsin</option>
										<option value="WY">Wyoming</option>
									</select>

								</div>
								<div class="col-50">
									<br> <label for="zip">ZIP Code*</label> <input type="text"
										id="<%if (session.getAttribute("zipcode") == null) {
	out.print("error");
} else {
	out.print("");
	session.setAttribute("cartpage", null);
}%>"
										name="zip" placeholder="10001" required>
								</div>

								<div class="col-50">
									<br> <label for="phoneNumber">Phone Number*</label> <input
										type="text"
										id="<%if (session.getAttribute("phoneNumber") == null) {
	out.print("error");
} else {
	out.print("");
	session.setAttribute("cartpage", null);
}%>"
										name="phoneNumber" placeholder="212-445-9085" required>
								</div>
							</div>
						</div>

						<div class="col-50">
							<h3>Payment</h3>
							<label for="fname">Accepted Cards</label> <img
								src=images/home3/payment-methods.jpeg width=200px; height=70px>

							<label for="cname">Name on the card*</label> <input type="text"
								class="fullname"
								id="<%if (session.getAttribute("name") == null) {
	out.print("error");
} else {
	out.print("");
	session.setAttribute("cartpage", null);
}%>"
								name="name" placeholder="John More Doe" required> <label
								for="ccnum">Credit card number*</label> <input type="text"
								id="<%if (session.getAttribute("ccNumber") == null) {
	out.print("error");
} else {
	out.print("");
	session.setAttribute("cartpage", null);
}%>"
								name="cardnumber" placeholder="1111-2222-3333-4444" required>
							<label for="expmonth">Exp. month*</label> <select name="emonth">
								<option selected value='Janaury'>Janaury</option>
								<option value='February'>February</option>
								<option value='March'>March</option>
								<option value='April'>April</option>
								<option value='May'>May</option>
								<option value='June'>June</option>
								<option value='July'>July</option>
								<option value='August'>August</option>
								<option value='September'>September</option>
								<option value='October'>October</option>
								<option value='November'>November</option>
								<option value='December'>December</option>
							</select>

							<div class="row">
								<div class="col-50">
									<br> <br> <label for="expyear">Exp. Year*</label> <select
										name="expirationyear">

										<option value="2022">2022</option>
										<option value="2023">2023</option>
										<option value="2024">2024</option>
										<option selected value="2025">2025</option>
										<option value="2026">2026</option>
										<option value="2027">2027</option>
										<option value="2028">2028</option>
										<option value="2029">2029</option>
										<option value="2030">2030</option>
										<option value="2031">2031</option>
									</select>
								</div>
								<div class="col-50">
									<br> <label for="cvv">CVV*</label> <input type="text"
										id="<%if (session.getAttribute("cvvNumber") == null) {
	out.print("error");
} else {
	out.print("");
	session.setAttribute("cartpage", null);
}%>"
										name="cvv" placeholder="352" required>
								</div>

							</div>
						</div>

					</div>

					<label> <input type="checkbox" id="distext" name="samename"
						onclick="disableText()"> Name on the card same as on the
						account
					</label> 
					<input type="submit" value="Continue to checkout" class="btn">
				</form>
			</div>
		</div>

		<div class="col-25">
			<div class="container">
				<h4>
					Item <span class="price" style="color: black"> <i
						class="fa fa-shopping-cart"></i> <b> Price</b>
					</span>
				</h4>

				<%
				ArrayList<ArrayList<String>> cart = (ArrayList<ArrayList<String>>) session.getAttribute("cart");
 
				DecimalFormat df = new DecimalFormat("0.00");
				double totalPrice = 0;

				//display cart content and price on the right hand side

				if (cart != null) {
					int i = 0;
					while (i < cart.size()) {

						out.print("<p2>" + cart.get(i).get(2) + "</p2>");

						if (cart.get(i).size() == 5) {

					String individualPrice = cart.get(i).get(3).replace("Price: $", "");

					totalPrice += Double.parseDouble(individualPrice);

					out.print("<p3>" + "$ " + individualPrice + "</p3>" + "<br>" + "<br>" + "<br>");

					session.setAttribute("totalPrice", totalPrice);
						}

						if (cart.get(i).size() == 6) {
					String individualPrice = cart.get(i).get(4).replace("Price: $", "");

					totalPrice += Double.parseDouble(individualPrice);

					out.print("<p3>" + "$ " + individualPrice + "</p3>" + "<br>" + "<br>" + "<br>");

					session.setAttribute("totalPrice", totalPrice);

						}

						i++;

					}

					out.print("<hr>");

					out.print("<p> Total <span class=" + '"' + "price" + '"' + "style=" + '"' + "color:black" + '"' + "><b> $ "
					+ df.format(totalPrice) + "</b></span></p>");
					
					 
				}
				%>


			</div>
		</div>
	</div>
</body>
</html>
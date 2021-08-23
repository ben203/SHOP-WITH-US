

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="javax.swing.JFrame"
	import="javax.swing.JOptionPane"%>

<!DOCTYPE html>
<html>
<head>



<script>
	function validateForm() {
		let fn = document.forms["registrationform"]["firstName"].value;
		let ln = document.forms["registrationform"]["lastName"].value;
		let em = document.forms["registrationform"]["email"].value;
		let pa = document.forms["registrationform"]["password"].value;
		let bd = document.forms["registrationform"]["bdate"].value;

		if (fn == "") {
			alert("Please fill out your first name");

			return false;
		}
		if (ln == "") {
			alert("Please fill out your first name");
			return false;
		}
		if (em == "") {
			alert("Please fill out your email");
			return false;
		}

		if (pa == "") {
			alert("Please provide a password");
			return false;
		}

		if (bd == "") {
			alert("Please provide your birth date");
			return false;
		}

	}
</script>


<meta charset="ISO-8859-1">
<title>One Place Shop</title>

<style>
h1 {
	position: absolute;
	right: 27%;
	color: red;
	font-size: 16px;
}

h2 {
	position: absolute;
	right: 50%;
	top: 20%;
	color: green;
}

h3 {
	position: absolute;
	right: 45%;
	top: 30%;
}

h4 {
	position: absolute;
	right: 35%;
	top: 40%;
}

button {
	position: absolute;
	background: green;
	right: 50%;
}

.error1 {
	position: absolute;
	color: red;
	font-size: 18px;
	right: -315px;
}

.error2 {
	position: absolute;
	color: red;
	font-size: 18px;
	right: -150px;
}
</style>


</head>
<body>

	<%
	//set error message to empty string so that 'null' wont show on page 
	if (request.getAttribute("nameError") == null) {

		request.setAttribute("nameError", "");
	}

	if (request.getAttribute("emailError") == null) {

		request.setAttribute("emailError", "");
	}

	if (request.getAttribute("passwordError") == null) {

		request.setAttribute("passwordError", "");
	}
	if (request.getAttribute("duplicateEmailError") == null) {

		request.setAttribute("duplicateEmailError", "");
	}
	%>


	<h1>

		<%=(String) request.getAttribute("passwordError")%><br> <br>
		<br>
		<%=(String) request.getAttribute("duplicateEmailError")%>

	</h1>


	<h2>

		Sign up <br> <br> <br>
	</h2>

	<h3>Create an account</h3>

	<h4>
		<form name="registrationform" onsubmit="return validateForm()"
			action="registration" method="post">
			<p1>Name*: <input type="text" name="firstName"
				placeholder="first name"> <input type="text" name="lastName"
				placeholder="last name"> <lable class="error1"> <%=(String) request.getAttribute("nameError")%>
			</lable> <br>
			<br>
			</p1>
			<p2>Email*: <input type="text" name="email"> <lable
				class="error2"> <%=(String) request.getAttribute("emailError")%>
			</lable> <br>
			<br>
			</p2>
			Password*: <input type="password" name="password"> <br>
			<br> Birth date*: <input type="date" name="bdate"> <br>
			<br> <br>

			<button type="submit">Register</button>
		</form>

	</h4>





</body>
</html>
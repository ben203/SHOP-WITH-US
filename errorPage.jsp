<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error</title>
<style>
button {
	float: left;
}

body {
zoom:150%;
}

p {
	Position: absolute;
	right: 207px;
	top: 30px;
}

h1 {
	position: absolute;
	font-size: 18px;
	right: 30%;
}
</style>


</head>
<body>
	<h1>

		<%
		out.print(session.getAttribute("errorMessage"));
		session.setAttribute("errorMessage", null);
		%>



	</h1>

	<script>
		//go to the home page after 10 seconds 
		setTimeout(function() {
			document.location = "home.jsp";
		}, 10000); // delay in milliseconds
	</script>


	<p>
		<img src="images/home1/oops.jpg" width="600" height="300">
	</p>
</body>
</html>
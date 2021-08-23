<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Confirmation</title>

<style>
h1 {
	position: absolute;
	right: 35%;
}

p {
	position: absolute;
	top: 20%;
	left: 20;
}

#button {
	position: absolute;
	top: 85%;
}
</style>


<link rel="stylesheet" href="CSS/flexbox.css">

</head>
<body>

	<button onclick="goBack()">Go Back</button>
	<h1>


		Payment Confirmation<br> <br> <br> <br>

	</h1>

	<p>
		Name:
		<%
 
 //print user data so that the user can confirm everything is correct 
 if(session.getAttribute("name")==null){
	 
	 String fullName= (String) session.getAttribute("fullName");
	 session.setAttribute("name", fullName);
 out.print(fullName);
 
 }else{
	 
	 out.print((String) session.getAttribute("name"));
	 
 }
	 
	 
	 %><br> <br>
		<br> Address:<%=(String) session.getAttribute("address") %><br>
		<br>
		<br> City:<%=(String) session.getAttribute("city") %><br>
		<br>
		<br> Zipcode:
		<%=(String) session.getAttribute("zipcode") %><br>
		<br>
		<br> State:<%=(String) session.getAttribute("nameofstate") %><br>
		<br>
		<br> Credit Card:<%
 String ccN = (String) session.getAttribute("ccNumber");
 
 String formatedCCN = "***" + ccN.substring(ccN.length()-4,ccN.length());
 
 String ccT = (String) session.getAttribute("cctype");
 String ccType="";
 
 if (ccT.equals("VISA")){
	 
	 ccType+="<img src=" + '"'+"images/home3/visa.png"+'"'+ "width="+'"'+ "50"+ '"'+ "height=" + '"'+ "35"+'"'+">";
	 
 }
 if (ccT.equals("MASTER")){
	 
	 ccType+="<img src=" + '"'+"images/home3/mastercard.png"+'"'+ "width="+'"'+ "50"+ '"'+ "height=" + '"'+ "35"+'"'+">";
	 
 }
 if (ccT.equals("AMEX")){
	 
	 ccType+="<img src=" + '"'+"images/home3/AMX.png"+'"'+ "width="+'"'+ "50"+ '"'+ "height=" + '"'+ "35"+'"'+">";
	 
 }
 if (ccT.equals("DISCOVER")){
	 
	 ccType+="<img src=" + '"'+"images/home3/discover.jpg"+'"'+ "width="+'"'+ "50"+ '"'+ "height=" + '"'+ "35"+'"'+">";
	 
 }
 out.print(ccType +"  "+ formatedCCN); 
 
 
  
  %><br>
		<br>
		<br>



	</p>


	<script>
function goBack() {
  window.history.back();
}
</script>


	<form action="finishorder" method="post">
		<input type="submit" value="Confirm Order" class="btn" id="button">
		</a>
	</form>


</body>
</html>
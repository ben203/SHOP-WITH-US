<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Message</title>
<style>
p {
	position: absolute;
	top: 15%;
	right: 30%;
}
</style>





</head>
<body>
	<%

String success = (String) request.getAttribute("successfulMessage");

 
if(success!=null){
	String image1= "  <center> <p> <img src=" + '"' + "images" +'/' + "sell-your-products" + '/' + "ty.png"+ '"'+    
			 " width=" + '"'+ "350" + '"' + "height=" + '"' + '"'+"150"+ '"' + "><" +'/'+ "p>  <" + '/'+ "center>";
		 out.print(image1);
		out.print( "<center>" +"We will email you our decition pending review of your product" +"<" + '/'+"center>" );
	
}else{
	String eMessage="";
	 if(session.getAttribute("errorMessage")==null){
		 eMessage = "It is not you it's us something went wrong please try again";
	 } else{
		 
		eMessage= (String) session.getAttribute("errorMessage");
	 }
	request.setAttribute("errorMessage",eMessage );
	 request.getRequestDispatcher("errorPage.jsp").forward(request, response);
	 
	  
}

 

%>
	<script>
		//go to the home page after 10 seconds 
		setTimeout(function() {
			document.location = "home.jsp";
		}, 10000); // delay in milliseconds
	</script>
</body>
</html>
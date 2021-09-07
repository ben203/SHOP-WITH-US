<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="java.util.*" import="java.util.Map" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>One Place Shop</title>

<style type="text/css">
p {
	position: absolute;
	top: 5px;
	right: 40%;
}
body {
zoom:150%;
}
</style>
</head>
<body>
	<p>
		<img src="images/home3/order-confermation.png" width="300"
			height="250">  
	 
	</p>
 
<script>
		//go to the home page after 5 seconds 
		setTimeout(function() {
			document.location = "home.jsp";
		}, 5000); // delay in milliseconds
	</script>



	<%
	//item that were ordered with their frequency  
	Map<String, Integer> itemFrequency = new HashMap<String, Integer>();

	//obtain data from previous order if one exists   
	if (session.getAttribute("itemFrequency") != null) {
		itemFrequency = (Map<String, Integer>) session.getAttribute("itemFrequency");

	}

	//obtain the cart items 
	ArrayList<ArrayList<String>> shoppingCart = (ArrayList<ArrayList<String>>) session.getAttribute("cart");

	//Count the frequency of an item
	for (int i = 0; i < shoppingCart.size(); i++) {
		String item = shoppingCart.get(i).get(2);
		Integer val = itemFrequency.get(item);
		if (val != null) {
			itemFrequency.put(item, val + 1);
		} else {
			itemFrequency.put(item, 1);
		}
	}

	//combine the frequency data and ordered item  
	//in order to easily sort them  
	String[] combined = new String[itemFrequency.size()];

	int index = 0;
	// the actual combining of the data
	for (Map.Entry<String, Integer> entry : itemFrequency.entrySet()) {

		combined[index] = String.valueOf(entry.getValue()) + "     " + entry.getKey();
		index++;

	}

	//easy sort in a descending order
	Arrays.sort(combined, Collections.reverseOrder());

	//final top list to be printed
	String[] finalList = new String[11];

	//To make sure to only get only the top 10 items 
	if (combined.length < 11) {
		finalList = new String[combined.length];

	}

	for (int i = 0; i < finalList.length; i++) {

		//Get the name of the ordered item
		finalList[i] = combined[i].substring(combined[i].indexOf(' ') + 1, combined[i].length()) + "<br>";

		//Adding the items to the list based on their type  

		if (finalList[i].substring(4, 8).equals("Book")) {
			String bookValue = "<a href =" + '"' + "books.jsp" + '"' + " <label>" + finalList[i] + "</label>  </a>";
			finalList[i] = bookValue;

		}

		//Adding the items to be displaied 
		else if (finalList[i].substring(4, 7).equals("Toy")) {
			String toyValue = "<a href =" + '"' + "toys.jsp" + '"' + " <label>" + finalList[i] + "</label>  </a>";

			finalList[i] = toyValue;

		} else if (finalList[i].substring(4, 8).equals("Game")) {
			String gameValue = "<a href =" + '"' + "games.jsp" + '"' + " <label>" + finalList[i] + "</label>  </a>";

			finalList[i] = gameValue;
		}

		else if (finalList[i].substring(4, 8).equals("Gift")) {

			String giftcardValue = "<a href =" + '"' + "giftCards.jsp" + '"' + " <label>" + finalList[i] + "</label>  </a>";
			finalList[i] = giftcardValue;

		} else {
			String electronicsValue = "<a href =" + '"' + "electronics.jsp" + '"' + " <label>" + finalList[i]
			+ "</label>  </a>";
			finalList[i] = electronicsValue;
		}

	}

	//to keep track of items being sold and their quantity 
	session.setAttribute("itemFrequency", itemFrequency);

	//for top selling tab
	session.setAttribute("topsellinglist", finalList);

	//clear cart since the order has been processed 
	shoppingCart.clear();
	session.setAttribute("cart", shoppingCart);

	// deleting items
	session.setAttribute("resetIndex", "reset");
	%>









	 
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC>
<html>
	<style>
	body {
	text-align: center;
	}
	h1{
	text-align: center;
	font-family: "Times New Roman", Times, serif;
  	font-size:50px;
  	font-weight: bold;
	}
	label {
	text-align: center;
  	font-family: "Times New Roman", Times, serif;
  	font-size:25px;
  	font-weight: bold;
	}
	p {
	text-align: center;
  	font-family: "Times New Roman", Times, serif;
  	font-size:25px;
  	font-weight: bold;
	}
	button {
	text-align: center;
  	font-family: "Times New Roman", Times, serif;
  	font-size:30px;
  	font-weight: bold;
	}
	input{
  	font-family: "Times New Roman", Times, serif;
  	font-size:25px;
	}
	select{
  	font-family: "Times New Roman", Times, serif;
  	font-size:25px;
	}
	div {
	text-align: center;
	font-family: "Times New Roman", Times, serif;
  	font-size:25px;
  	font-weight: bold;
	}
	table{
	text-align: center;
  	font-family: "Times New Roman", Times, serif;
  	font-size:25px;
  	font-weight: bold;
  	background-color:black;
  	color:red;
    border-collapse: separate;
    margin: 0 auto;
	}
	th, td {
	  padding: 15px;
	}
	
	.rightDiv{
    
    position:absolute;
	right: 25px;
    
    }
    
    .leftDiv{
    position:absolute;
	left: 25px;
	
    }
    



	</style>
	<head>
	<title>Home | BuyME</title> 
	</head>
	<body style="background-color:#DC143C;"> 
	<br>
     
     
    
	<%
	String clicked_id = "";
	String title =" ";
	String seller = "";
    String listing_id = "";
	String text = "";
	String price ="";
		try {
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		
			//Create a SQL statement
			Statement stmt = con.createStatement();
		} catch (Exception e) {
		}
	    if ((session.getAttribute("user") == null)) {
		//
		} else {
		%>
		<h1>Welcome <%=session.getAttribute("user")%> </h1>
		<%
		}
	    
	    
	    
	    
	    
	    
	    
	%>




 <div class ="leftDiv">
 
	<form method ="post" action = "SortListings.jsp">
		
	   <table border=1>
	
	   <tr>
	   <td>
	   <label> Manufacturer</label>
	
	
	
	
	  <input type="checkbox" id="microsoft" name= "manufacturer" value="microsoft">
	  <label for="microsoft"> Microsoft:</label><br>
	
	  <input type="checkbox" id="nintendo" name="manufacturer" value="nintendo">
	  <label for="nintendo"> Nintendo</label><br>
	
	  <input type="checkbox" id="sony" name="manufacturer" value="sony">
	  <label for="sony"> Sony </label>
	  </td>
	  </tr>
	  
	  <tr>
	  
	  <td>
	  <label> Model</label>
		
	  
	  <input type="checkbox" id="Series X" name="model" value="SeriesX">
	  <label for= "Series X" > Series X</label>
	
	  <input type="checkbox" id="Series S" name="model" value="SeriesS">
	  <label for="Series S"> Series S</label>
	  
	  </td>
	  
	  </tr>
	  
	  
	  <tr>
	  <td>
	  <input type="checkbox" id="PlayStation 5" name="model" value="PlayStation 5">
	  <label for="PlayStation 5"> PlayStation 5</label>
	  
	  <input type="checkbox" id="PlayStation 4" name="model" value="PlayStation 4">
	  <label for="PlayStation 5"> PlayStation 4</label>
	  </td>
	  </tr>
	  
	  <tr>
	  <td>
	  <input type="checkbox" id="Switch OLED" name= "model" value="SwitchOLED">
	  <label for="Switch OLED"> Switch OLED</label>
	  
	  <input type="checkbox" id="Switch" name= "model" value="Switch">
	  <label for="Switch"> Switch </label>
	  
	  <input type="checkbox" id="Switch Lite" name= "model" value="SwitchLite">
	  <label for="Switch Lite"> Switch Lite</label>
	  </td>
	  </tr>
	  
	  <tr>
	  <td>
	<label> New or Used:</label><br>
			
	  <input type="checkbox" id="new" name="new_or_used" value="new">
	  <label for="new"> new</label>
	  
	  <input type="checkbox" id="used" name="new_or_used" value="used">
	  <label for="used"> used</label>
	  </td>
	</tr>
	
	<tr>
	<td>
	<label> Warranty:</label>
			
	  <input type="checkbox" id="included" name="included" value="included">
	  <label for="included"> Included</label>
	
	<label> Sort by:</label>
	  <select name="sortby" id="sortby">
	    
			<option value="low_to_high"> Current Price: Low to High</option>
	       <option value="high_to_low"> Current Price: High to Low </option>
	    </select>
	    
	</td>
	</tr>
	 <tr>
	 <td>
	<input type="submit" value="Sort" style="font-size:30px;font-weight:bold;text-align:center;color:red;background-color:black">
	</td>
	</tr>
	
	</table>
	
	</form>


</div>






<div class = "rightDiv" > 
	<table>
	<tr>    
	<td><label> HERE ARE THE AVAILABLE LISTINGS</label></td>
	</tr>
	 <% try{
	  	ApplicationDB db = new ApplicationDB();	
	  	Connection con = db.getConnection();
	  	Statement st = con.createStatement();
	  	ResultSet rs;
	  	
	    String all_listings = "SELECT * FROM listings";
	  	try{
	  		
	  		String q = (String)session.getAttribute("sort_query");
	  		if(q!= null & q.length() > 5)
	  		{
	  			all_listings = q;
	  			
	  		}
	  		
	  	    session.removeAttribute("sort_query");
	  	}
	  	catch(Exception e){
	  		all_listings = "SELECT * FROM listings";
	  	}
	  	

	    
	    
	    
	    
	  	rs = st.executeQuery(all_listings);
	  	while (rs.next()) {
	  		title = rs.getString("title");
	  		seller = rs.getString("seller_id");
	  		listing_id = rs.getString("listing_id");
	  		price = rs.getString("start_price");
	  		text = listing_id + ") " + title + " by " + seller + "   $" + price;
	  		if(title!=null){
	%>
			<tr>
			<td> 
			<form action="Listing.jsp" method="POST">
				<input type="submit" value='<%=text%>' name="ListingID" 
				style="font-size:30px;font-weight:bold;text-align:center;color:red;background-color:black">
			</form>
			</td>
			<tr> 	
    <%
	  		}
	  	 }
	  }
	  catch(Exception e)
	  {
	  	System.out.println("Failed to get listing.");
	  }
	    
	
	  %>	
	</table>
	
	<br>

		<a href="NewListingPage.jsp"> 
	<button type="button" style="font-size:30px;font-weight:bold;text-align:center;color:red;background-color:black">
	ADD LISTING</button>
	</a>
	
	<a href="logout.jsp"> 
	<button type="button" style="font-size:30px;font-weight:bold;text-align:center;color:red;background-color:black">
	LOG OUT</button> </a>
	
	
	
	<a href="faq.jsp"> 
	<button type="button" style="font-size:30px;font-weight:bold;text-align:center;color:red;background-color:black">
	VISIT FAQ </button> </a>
	
	  </div>
	  
	  
	  
	
	  
	  
	  
	  
	  
	  
	  
	</body> 
	<br>
</html>
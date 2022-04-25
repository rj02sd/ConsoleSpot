<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
<head>


<style>
	body {
	text-align: center;
	}
	h1{
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
	input{
  	font-family: "Times New Roman", Times, serif;
  	font-size:20px;
	}
	button {
	text-align: center;
  	font-family: "Times New Roman", Times, serif;
  	font-size:30px;
  	font-weight: bold;
	}
	div {
	text-align: center;
	}
	
	</style>




<meta charset="UTF-8">
<title>New Nintendo Listing</title>
</head>

<body style="background-color:#DC143C; ">
    	<br>
        <h1>New Nintendo Listing</h1>
		<br>
		
		
		
	
		
		<form method ="post" action = "NewListingPost.jsp"> 
		
		
        <label for="manufacturer">  Manufacturer:
	    
	    <br> 
		<input type="text" id="manufacturer"  name="manufacturer" value = "Nintendo" readonly  >
		<br>
		</label>

		
		
		<label for="model">Choose a Model:</label>
		<br>
	    <select name="model" id="model">
	    
 		<option value="switcholed"> Switch OLED</option>
        <option value="switch"> Switch </option>
        <option value="switchlite"> Switch Lite </option>
        </select>
		
		<br>
		
	    <label for="color">Color:</label>
		<br>
	    <select name="color" id="color">
	    
 		<option value="redblack"> Red/Black</option>
        <option value="black"> Black </option>
        <option value="pastel"> Pastel </option>
        </select>
        <br>
		
		
		<br>
		
	    <label for="new_or_used">New or Used:</label>
		<br>
	    <select name="new_or_used" id="new_or_used">
	    
 		<option value="new"> New</option>
        <option value="used"> Used </option>
        </select>
        <br>
		
		
		
				<br>
		
	 		
	    <label for="multipleplaymodes">Multiple playmodes</label>
		<br>
	    <select name="multipleplaymodes" id="multipleplaymodes">
	    
 		<option value="yes"> Yes </option>
        <option value="no"> No </option>
        </select>
        <br>
		
		
				
	    <label for="oled_or_lcd"> Oled or LCD</label>
		<br>
	    <select name="oled_or_lcd" id="oledorlcd">
	    
 		<option value="OLED"> OLED </option>
        <option value="LCD"> LCD </option>
        </select>
        <br>
		
		
		
		
		<label for="storage">Storage:
		<br>
		<input type="text" id="storage" name="stoage" value = "32GB">
		<br>
		</label>
		
				<br>
		
	    <label for="warranty">Warranty</label>
		<br>
	    <select name="warranty" id="warranty">
	    
 		<option value="yes"> Yes </option>
        <option value="no"> No </option>
        </select>
        <br>
		

	
		<label for="resolution">Resolution:
		<br>
		<input type="text" id="resolution" name="resolution"  value = "1080p">
		<br>
		</label>
		
				<br>


		<label for="screensize"> Screensize:
		<br>
		<input type="text" id="screensize" name="screensize" value = "6.2inch">
		<br>
		</label>
				<br>
		
		
		<label for="startprice">Start Price:
		<br>
		<input type="text" id="startprice" name="startprice" value = '100' >
		<br>
		</label>
		
			<label for="minprice">MinimumPrice:
		<br>
		<input type="text" id="minprice" name="minprice" value = '100'>
		<br>
		</label>
		
		
		<label for="incrementprice">Increment Price:
		<br>
		<input type="text" id="incrementprice" name="incrementprice" value = '2.0' >
		<br>
		</label>
		

		
		<br>
		<label for="startdate">Start Date:
		<br>
		<input type="date" id="startdate" name="startdate">
		<br>
		</label>
		
		
			<br>
		<label for="enddate">End Date:
		<br>
		<input type="date" id="enddate" name="enddate">
		<br>
		</label>
		
		
		<input type="submit" value="LIST" style="font-size:30px;font-weight:bold;text-align:center;color:red;background-color:black">
		
		 </form>		
		 

 				<td><a href="NewListingPage.jsp"> <button type="button"
		style="font-size:30px;font-weight:bold;text-align:center;color:red;background-color:black">
		Back</button> </a></td>
		 
		
		
		
		
		<br>
	   
	   
	   
	   
	   </body>

	



</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

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



<head>
<meta charset="UTF-8">
<title>Make New Listing</title>

  <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Registration | Console Spot</title>
        <meta name="description" content="Group 21 CS336 Spring 2022 Final Project.">
        <link rel="stylesheet" href="main.css">
    </head>
    
    <body style="background-color:#DC143C; ">
    	<br>
        <h1> New Listing</h1>
		<br>
		
<form method ="post" action = "NewListingRedirect.jsp"> 


		
		<label for="manufacturer">Choose a manufacturer:</label>
		<br>
	    <select name="manufacturer" id="manufacturer">
	    
 		<option value="microsoft"> Microsoft</option>
        <option value="nintendo"> Nintendo </option>
        <option value="sony"> Sony </option>
        </select>
		

		<br>
		
				<br>
						<br>
		
	<input type="submit" value="NEXT" style="font-size:30px;font-weight:bold;text-align:center;color:red;background-color:black">
			</form>
		<br>
		
		
				<td><a href="home.jsp"> <button type="button"
		style="font-size:30px;font-weight:bold;text-align:center;color:red;background-color:black">
		Back</button> </a></td>
	</body>
	
</html>
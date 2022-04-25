<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>New Playstation Listing</title>
</head>

<body style="background-color:#DC143C; ">
    	<br>
        <h1>New Playstation Listing</h1>
		<br>
		
		
		<form method ="post" action = "NewListingPost.jsp"> 
		
		


	    <label for="manufacturer">  Manufacturer:
	    
	    <br> 
		<input type="text" id="manufacturer"  name="manufacturer" value = "Sony" readonly  >
		<br>
		</label>



		
		
		<label for="model">Choose a Model:</label>
		<br>
	    <select name="model" id="model">
	    
 		<option value="seriesx"> PlayStation 5</option>
        <option value="seriesS"> PlayStation 4 </option>
     
        </select>
		
		<br>
		
	    <label for="color">Color:</label>
		<br>
	    <select name="color" id="color">
	    
 		<option value="redblack"> Black</option>
        <option value="black"> White </option>
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
		
	
		
		
		<label for="storage">Storage:
		<br>
		<input type="text" id="storage" name="storage" value = '1000GB'>
		<br>
		</label>	
		<br>
				
				
				
		<label for="ssd_size">SSD Size:
		<br>
		<input type="text" id="ssd_size" name="ssd_size" value = '200GB' >
		<br>
		</label>
		
				<br>
				
				
			
	    <label for="disc_or_digital">Disc or Digital</label>
		<br>
	    <select name="disc_or_digital" id="disc_or_digital">
	    
 		<option value="Disc"> Disc </option>
        <option value="Digital"> Digital </option>
        </select>
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
		<input type="text" id="resolution" name="resolution" value = '1080p'>
		<br>
		</label>
		
				<br>




		<label for="startprice">Start Price:
		<br>
		<input type="text" id="startprice" name="startprice" value = '100.0'>
		<br>
		</label>
		
			<label for="minprice">MinimumPrice:
		<br>
		<input type="text" id="minprice" name="minprice" value = '100.0'>
		<br>
		</label>
		
		
		<label for="incrementprice">Increment Price:
		<br>
		<input type="text" id="incrementprice" name="incrementprice" value ='5' >
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

			
	
		<br>

	
	<input type="submit" value="LIST" style="font-size:30px;font-weight:bold;text-align:center;color:red;background-color:black">
		
		 </form>		
		 

		<br>
		
		 				<td><a href="NewListingPage.jsp"> <button type="button"
		style="font-size:30px;font-weight:bold;text-align:center;color:red;background-color:black">
		Back</button> </a></td>
		 
	</body>
	


</html>
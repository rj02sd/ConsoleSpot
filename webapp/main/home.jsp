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
	
	</style>
	<head>
	<title>Home | BuyME</title> 
	</head>
	<body style="background-color:#DC143C;"> 
	<br>
	<%

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
		<p>Welcome <%=session.getAttribute("user")%> </p>
		<%
		}
	%>
	</body> 
	<br>
	<table>
	<tr>    
	<td><label> HERE ARE THE AVAILABLE LISTINGS</label></td>
	</tr>
	<tr>
	<td>LISTING 1</td>
	</tr>
	<tr>
	<td>LISTING 2</td>
	</tr>
	<tr>
	<td>LISTING 3</td>
	</tr>
	</table>
	<br>
	<button type="button" style="font-size:30px;font-weight:bold;text-align:center;color:red;background-color:black">
	ADD - PLACEHOLDER</button>
	<a href="logout.jsp"> 
	<button type="button" style="font-size:30px;font-weight:bold;text-align:center;color:red;background-color:black">
	LOG OUT</button> </a>
</html>

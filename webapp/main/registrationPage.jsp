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
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Registration | BuyMe</title>
        <meta name="description" content="Group 21 CS336 Spring 2022 Final Project.">
        <link rel="stylesheet" href="main.css">
    </head>
    
    <body style="background-color:#DC143C; ">
    	<br>
        <h1>BuyMe Registration</h1>
		<form action="register.jsp" method="POST">
		<table>
		<tr>    
		<td> EMAIL </td><td>
		<input type="text" name="email" value="placeholder"></td>
		</tr>
		<tr>    
		<td> USERNAME </td><td>
		<input type="text" name="username"></td>
		</tr>
		<tr>
		<td> PASSWORD </td><td>
		<input type="text" name="password"></td>
		</tr>
		</table>
		<br>
		<input type="submit" value="REGISTER" 
		style="font-size:30px;font-weight:bold;text-align:center;color:red;background-color:black">
		</form>
		<p style="display:none" id="invalid">INVALID REGISTRATION</p>
		<script>
			function show(){
				document.getElementById("invalid").style.display = "block";
			}
			function hide(){
				document.getElementById("invalid").style.display = "none";
			}
			function loginText(){
				document.getElementById("invalid").innerHTML = "INVALID CREDENTIALS";
			}
			function regText(){
				document.getElementById("invalid").style.display = "REGISTRATION COMPLETE";
			}
		</script>
		<% 
			if(session.getAttribute("regFail")!=null){
				out.println("<script> show(); </script>");
				out.println("<script> setTimeout(hide,1500); </script>");
				session.removeAttribute("regFail");
			}
		%>
		<a href="login.jsp"> 
		<button type="button" style="font-size:30px;font-weight:bold;text-align:center;color:red;background-color:black">
		BACK</button> </a>
	</body>
	
</html>
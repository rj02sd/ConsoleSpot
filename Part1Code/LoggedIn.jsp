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
	b{
	font-family: "Times New Roman", Times, serif;
  	font-size:40px;
  	font-weight: bold;
	}
	label {
	text-align: center;
  	font-family: "Times New Roman", Times, serif;
  	font-size:50px;
  	font-weight: bold;
	}
	input{
  	font-family: "Times New Roman", Times, serif;S
  	font-size:20px;
	}
	button {
	text-align: center;
  	font-family: "Times New Roman", Times, serif;
  	background-color:black;
  	color:#DC143C;
  	font-size:50px;
  	font-weight: bold;
	}
	div {
	text-align: center;
	}
	</style>
	<head>
	<title>LOGGED IN|BUY ME</title> 
	</head>
	 <body style="background-color:#DC143C;"> 
	<br>
	<b>THE USER IS NOW LOGGED IN</b>
	<br>
	</body> 
	<br>
	<a href="Login.jsp"> <button type="button">LOG OUT</button> </a>
</html>

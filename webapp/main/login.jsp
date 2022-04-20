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
        <title>LogIn | BuyMe</title>
        <meta name="description" content="Group 21 CS336 Spring 2022 Final Project.">
        <link rel="stylesheet" href="main.css">
    </head>
    
    <body style="background-color:#DC143C;">
        <h1>BuyMe LOGIN</h1>
		<%
			try{
				ApplicationDB db = new ApplicationDB();	
				Connection con = db.getConnection();		
				Statement stmt = con.createStatement();
				
				stmt.executeUpdate("INSERT IGNORE INTO ACCOUNTS (USERNAME,PASSWORD) VALUES('admin', 'adminpw')");
				stmt.executeUpdate("INSERT IGNORE INTO ACCOUNTS (USERNAME,PASSWORD) VALUES('user1', 'pass1')");
				stmt.executeUpdate("INSERT IGNORE INTO ACCOUNTS (USERNAME,PASSWORD) VALUES('random', '12345')");
				String str = "SELECT * FROM accounts a group by a.username";
				
				ResultSet result = stmt.executeQuery(str);
				
				result.close();
				stmt.close();
				con.close();
			}catch (Exception e) {
				out.print(e);
			}
		%>
		<form action="loginMatch.jsp" method="POST">
		<table>
		<tr>    
		<td>USERNAME</td><td>
		<input type="text" name="username"></td>
		</tr>
		<tr>
		<td>PASSWORD</td><td>
		<input type="text" name="password"></td>
		</tr>
		</table>
		<br>
		<input type="submit" value="LOG IN" 
		style="font-size:30px;font-weight:bold;text-align:center;color:red;background-color:black">
		<p style="display:none" id="invalid">INVALID CREDENTIALS</p>
		</form>
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
				document.getElementById("invalid").innerHTML = "REGISTRATION COMPLETE";
			}
		</script>
		<%
			if(session.getAttribute("matchTested")!=null){
				out.println("<script> loginText(); show(); </script>");
				out.println("<script> setTimeout(hide,1500); </script>");
				session.removeAttribute("matchTested");
			}
			if(session.getAttribute("newAccount")!=null){
				out.println("<script> regText(); show(); </script>");
				out.println("<script> setTimeout(hide,1500); </script>");
				session.removeAttribute("newAccount");
			}
		%>
		<table>
		<tr>    
		<td><label> Don't Have an Account? Create One Here</label></td>
		</tr>
		<tr>
		<td><a href="registrationPage.jsp"> <button type="button"
		style="font-size:30px;font-weight:bold;text-align:center;color:red;background-color:black">
		REGISTER</button> </a></td>
		</tr>
		</table>
	</body>
</html>

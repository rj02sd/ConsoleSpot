<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-color:#DC143C;">
<%

		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			String str = "SELECT * FROM accounts";

			ResultSet result = stmt.executeQuery(str);
			//result.next();
			while(result.next()){			
				if(result.getString("username").equals(username) && result.getString("password").equals(password)){
					result.close();
					stmt.close();
					con.close();
					out.print("<script>window.location.href = \"LoggedIn.jsp\";</script>");
				}
			}
			result.close();
			stmt.close();
			con.close();
			out.print("<script>window.location.href = \"Login.jsp\";</script>");
		} catch (Exception e) {
		}
	%>
</body>
</html>
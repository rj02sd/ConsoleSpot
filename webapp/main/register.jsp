<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LOG IN | BuyMe</title>
</head>
<body style="background-color:#DC143C;">

<%
	ApplicationDB db = new ApplicationDB();	
    String userid = request.getParameter("username");   
    String pwd = request.getParameter("password");
    String eml = request.getParameter("email");
    Connection con = db.getConnection();
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from accounts where username='" + userid +"'");
    if (rs.next() || userid.equals("")) {
   		session.setAttribute("regFail", "true");
   		response.sendRedirect("registrationPage.jsp");
    } else {
    	st.executeUpdate("INSERT IGNORE INTO ACCOUNTS (USERNAME,PASSWORD) VALUES("+userid+","+ pwd+")");
    	session.setAttribute("newAccount", "true");
    	response.sendRedirect("login.jsp");
    }
%>
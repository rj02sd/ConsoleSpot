<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<% 


try{


	String manufacturer = request.getParameter("manufacturer");
	
	System.out.println("got here0");
	
	if(manufacturer.equalsIgnoreCase("sony"))
	{
		response.sendRedirect("ListPlaystation.jsp");
		
	}
	else if(manufacturer.equalsIgnoreCase("microsoft"))
	{
		response.sendRedirect("ListXbox.jsp");
	}
	else if(manufacturer.equalsIgnoreCase("nintendo"))
	{
		response.sendRedirect("ListNintendo.jsp");
	}
	
	System.out.println(manufacturer);
	
	
}
catch(Exception e){

	
}


%>





</body>
</html>
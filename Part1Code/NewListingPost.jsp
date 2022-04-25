<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<%

//attributes of console
String manufacturer = request.getParameter("manufacturer");
String model="";
String color ="";
String new_or_used= "";
String warranty= "";
String resolution="";
String storage="";
//Nintendo specific 
String oled_or_lcd="";
String screensize="";
String multipleplaymodes="";
//sony xbox specific 
String digital_or_disc="";

//xbox specific 
String ssd_size = "";

//
String seller_id="";


String start_date = "";
String end_date = "";

//listing specific 
int listingID = 0; //initialize listing new id
int consoleID = 0;
double start_price = 0;
double min_price = 0;
double increment_price=0;




//get sellerid
try{
    seller_id = (String)request.getSession().getAttribute("user");
    System.out.print("User: " + seller_id);
}
catch(Exception e)
{
	System.out.println("failed to get user id");	
}



//get new console
try{
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	Statement st = con.createStatement();
	ResultSet rs;
	String query = "SELECT max(console_id) FROM video_game_consoles";
	rs = st.executeQuery(query);
	while (rs.next()) {
		consoleID = Integer.parseInt(rs.getString("max(console_id)"));
		System.out.println("consoleID =" +consoleID);
	 }
	consoleID +=1;//increment to get next new ID
}
catch(Exception e)
{
	System.out.println("Failed to get console id.");
}


//get new listing id
try{
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	Statement st = con.createStatement();
	ResultSet rs;
	String query = "SELECT max(listing_id) FROM listings";
	rs = st.executeQuery(query);
	while (rs.next()) {
		listingID = Integer.parseInt(rs.getString("max(listing_id)"));
		System.out.println("listingID =" + listingID);
	 }
	listingID +=1;//increment to get next new ID
}
catch(Exception e)
{
	System.out.println("Failed to get listing id.");
}


///try to get all the required fields, if some are null session will restart the listing 
try{
	start_price = Double.parseDouble(request.getParameter("startprice"));
	min_price = Double.parseDouble(request.getParameter("minprice")) ;
	increment_price = Double.parseDouble(request.getParameter("incrementprice"));
	model = request.getParameter("model");
	color = request.getParameter("color");
	new_or_used = request.getParameter("new_or_used");
	warranty = request.getParameter("warranty");
	resolution = request.getParameter("resolution");
	storage = request.getParameter("storage");
	color = request.getParameter("color");

}
catch(Exception e)
{	
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
}



//try to get the dates otherwise restart page

try{
    start_date = request.getParameter("startdate");
    end_date = request.getParameter("enddate"); 
    
}
catch(Exception e){
	System.out.println("date null");
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
}







///time to submit the whole baby in 


try{
	
	ApplicationDB db = new ApplicationDB();	
    Connection con = db.getConnection();
    Statement st = con.createStatement();
    
   

    //inserting into consoles
    
    String console_columns = "(console_id, manufacturer, model, color, new_or_used, storage_space, warranty, resolution)";
    String console_values = "(" + consoleID + "," + "'"+ manufacturer +"'"+ "," + "'" + model + "'" + "," + "'" + color + "'" + "," + "'" + new_or_used + "'" + "," + "'" + storage + "'" +"," + "'"+  warranty + "'" + "," +  "'" + resolution + "'" + ")"; 
    
   
    
    String special_columns = "";
    String special_values = "";


    System.out.println("INSERT INTO VIDEO_GAME_CONSOLES" + console_columns + "VALUES" + console_values); 
    st.executeUpdate("INSERT INTO VIDEO_GAME_CONSOLES" + console_columns + "VALUES" + console_values);
    System.out.println("Submitted Consoles");
    
    
    
    
    //inserting into listings table
    String list_columns = "(listing_id,start_price,start_date,end_date,minimum_price,increment_price,seller_id, consoleID) ";
 	String values = "(" +  listingID + "," + start_price + "," + "'" + start_date+  "'"+  "," + "'" + end_date +  "'"+  "," + min_price + "," + increment_price  + "," + '"' + seller_id + '"' + "," + consoleID + ")";

 	

    System.out.println("INSERT INTO LISTINGS" + list_columns + " VALUES" + values);
    st.executeUpdate("INSERT INTO LISTINGS" + list_columns + " VALUES" + values);
    System.out.println("Submitted Listing");
    
  

    
    
    
	if(manufacturer.equalsIgnoreCase("sony")){
		
		
		try{
			digital_or_disc = request.getParameter("disc_or_digital");
		}
		catch(Exception e){
			response.sendRedirect("ListPlaystation.jsp");
		}
			
		special_columns  = "(playstation_id, digital_or_disc)";
		special_values = "(" + consoleID + "," + "'"+ digital_or_disc + "'"+  ")";
		
		
		st.executeUpdate("INSERT INTO sony_playstation "+ special_columns + " values " + special_values);
		System.out.println("Submitted sony");
	}
	else if(manufacturer.equalsIgnoreCase("microsoft"))	{
		
		
		try{
			ssd_size = request.getParameter("ssd_size");
			digital_or_disc = request.getParameter("disc_or_digital");
		}
		catch(Exception e){
			response.sendRedirect("ListMicrosoft.jsp");
		}
		
		special_columns = "(xbox_id, ssd_size, digital_or_disc)";
		special_values  = "(" + consoleID + "," + "'"+ ssd_size + "'" +   "," + "'"+ digital_or_disc + "'"+ ")";
		
		System.out.println("INSERT INTO microsoft_xbox "+ special_columns + " values " + special_values);
		
		st.executeUpdate("INSERT INTO microsoft_xbox "+ special_columns + " values " + special_values);
		System.out.println("Submitted xbox");
		
		
	}
	else if(manufacturer.equalsIgnoreCase("nintendo")){	
		try{
			oled_or_lcd = request.getParameter("oled_or_lcd"); 
			screensize = request.getParameter("screensize"); 
			multipleplaymodes = request.getParameter("multipleplaymodes"); 
		}
		catch(Exception e){
			response.sendRedirect("ListNintendo.jsp");
		}
		
		special_columns = "(id, screensize, multiple_playmodes, oled_or_lcd)";
		special_values = "(" +  consoleID + ",'"+ screensize + "'"+ "," + "'"+ multipleplaymodes + "'"+"," + "'"+ oled_or_lcd + "'"+  ")";
		System.out.println("INSERT INTO nintendo"+ special_columns + " values " + special_values);
		st.executeUpdate("INSERT INTO nintendo_switch"+ special_columns + " values " + special_values);
		System.out.println("Submitted nintendo");
		
	}
	
    
    


	response.sendRedirect("home.jsp");

}
catch(Exception e){
	System.out.println("Could not submit");
	if(manufacturer.equalsIgnoreCase("sony")){
		response.sendRedirect("ListPlaystation.jsp");
		
	}
	else if(manufacturer.equalsIgnoreCase("microsoft"))	{
		response.sendRedirect("ListXbox.jsp");
	}
	else if(manufacturer.equalsIgnoreCase("nintendo"))
	{
		response.sendRedirect("ListNintendo.jsp");
	}
}


%>








</body>
</html>
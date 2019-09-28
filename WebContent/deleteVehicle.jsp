<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.*,java.util.*,basics.DBConnection,java.net.URLEncoder"%>    
<!DOCTYPE html>
<%

Connection con = DBConnection.createConnection();
String id=request.getParameter("id");

try {
	
	String query = "delete from vehicle where RegNo=?";				
	PreparedStatement ps = con.prepareStatement(query); 
	ps.setString(1, id);
    ps.executeUpdate();

    String message = "Deleted"; response.sendRedirect("admin_Vehicle.jsp?message="+ URLEncoder.encode(message, "UTF-8"));
	
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
		

%>
package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import basics.DBConnection;

public class Admin {
	
	Connection con = DBConnection.createConnection();
	
public ResultSet getIssuedUser() {
		
		try {
			
		String query = "select * from user_profile where status='issued' and Type='Driver' or Type='Employee' ";				
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		return rs;
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return null;				
	}
	
public ResultSet getIssuedAdmin() {
		
		try {
			
		String query = "select * from user_profile where Type='Admin'  and status='issued' ";				
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		return rs;
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return null;				
	}

public ResultSet getRoutes() {
	
	try {
		
	String query = "select * from route";				
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(query);
	return rs;
	
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
	return null;				
}

public ResultSet getVehicles() {
	
	try {
		
	String query = "select * from vehicle";				
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(query);
	return rs;
	
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
	return null;				
}

public void deleteVehicle(String Vid) {
	
	try {
		
	String query = "delete from vehicle where RegNo=?";				
	PreparedStatement ps = con.prepareStatement(query); 
	ps.setString(1, Vid);
    ps.executeUpdate();

	
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
				
}
	

}

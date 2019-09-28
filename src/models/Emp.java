package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


import basics.DBConnection;

public class Emp {
  Connection con = DBConnection.createConnection();

	
	public ResultSet empAll(String id) {
		
		try {
			
		String query = "select * from employee where eId=?";				
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();
		return rs;
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return null;				
	}
	
	public ResultSet getAllDrivers(String id) {
		
		try {
			
		String query = "SELECT d.fName,d.telNo,r.sCity,r.dCity,v.type,v.Ecapacity FROM user_profile up LEFT JOIN route r ON r.Id=up.rout_No LEFT JOIN vehicle v ON v.RegNo=up.vehi_No LEFT JOIN driver d ON d.eId=up.emp_No WHERE up.Type='Driver'";			
		PreparedStatement ps = con.prepareStatement(query);
		ResultSet rs = ps.executeQuery();
		
		return rs;
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return null;				
	}
	
   public ResultSet getRideDetails(String id) {
		
		try {
			
		String query = "select * from emp_ride where eId=?";			
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();
		
		return rs;
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return null;				
	}

}

package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import basics.DBConnection;

public class Driver {
Connection con = DBConnection.createConnection();
	
	public ResultSet driverAll(String id) {
		
		try {
			
		String query = "select * from driver where eId=?";	/////////////////////////			
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();
		
		return rs;
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return null;				
	}
	
	public ResultSet getMyVehicle(String id) {
		
		try {
			
		String query = "SELECT * FROM vehicle v LEFT JOIN user_profile up ON up.vehi_No=v.RegNo WHERE up.emp_No=?";				
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();
		
		return rs;
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return null;				
	}
	
	public ResultSet getMyRoute(String id) {
		
		try {
			
		String query = "SELECT * FROM route r LEFT JOIN user_profile up ON up.rout_No=r.Id WHERE up.emp_No=?";				
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();
		
		return rs;
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return null;				
	}
	
public ResultSet getMyEmployees(String id) {
		
		try {
			
		String query = "SELECT * FROM emp_ride er WHERE er.driverId=?";				
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

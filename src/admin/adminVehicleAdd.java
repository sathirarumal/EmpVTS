package admin;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import basics.DBConnection;

/**
 * Servlet implementation class adminVehicleAdd
 */
@WebServlet("/adminVehicleAdd")
public class adminVehicleAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminVehicleAdd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String VehicleNo = request.getParameter("vehiNo");
		String type = request.getParameter("type");
		int nos = Integer.parseInt(request.getParameter("nos"));
		String ec = request.getParameter("ec");

		
		Connection con = DBConnection.createConnection();
		 
		 try { String query ="insert into vehicle (RegNo,type,NoOfSheet,Ecapacity) values (?,?,?,?)";
		
		  PreparedStatement ps = con.prepareStatement(query); 
		  ps.setString(1,VehicleNo);
		  ps.setString(2,type); 
		  ps.setInt(3,nos); 
		  ps.setString(4,ec);
		  
		  ps.executeUpdate();

		  
		  String message = "Success"; response.sendRedirect("admin_Vehicle.jsp?message="+ URLEncoder.encode(message, "UTF-8"));
		  
		  } catch(SQLException e) { 
			  
			  String message = "Some thing wrong"; response.sendRedirect("admin_Vehicle.jsp?message="+ URLEncoder.encode(message, "UTF-8"));
			  e.printStackTrace(); 		  
		  }
	}

}

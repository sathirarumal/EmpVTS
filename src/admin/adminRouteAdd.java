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
 * Servlet implementation class adminRouteAdd
 */
@WebServlet("/adminRouteAdd")
public class adminRouteAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminRouteAdd() {
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
		
		int routeId = Integer.parseInt(request.getParameter("rid"));
		int motherId = Integer.parseInt(request.getParameter("mrid"));
		String sCity = request.getParameter("sc");
		String dCity = request.getParameter("dc");

		
		Connection con = DBConnection.createConnection();
		 
		 try { String query ="insert into route (Id,motherId,sCity,dCity) values (?,?,?,?)";
		
		  PreparedStatement ps = con.prepareStatement(query); 
		 
		  ps.setInt(1,routeId);
		  ps.setInt(2,motherId); 
		  ps.setString(3,sCity); 
		  ps.setString(4,dCity);
		  
		  ps.executeUpdate();

		  
		  String message = "Success"; response.sendRedirect("admin_Routes.jsp?message="+ URLEncoder.encode(message, "UTF-8"));
		  
		  } catch(SQLException e) { 
			  
			  String message = "Some thing wrong"; response.sendRedirect("admin_Routes.jsp?message="+ URLEncoder.encode(message, "UTF-8"));
			  e.printStackTrace(); 		  
		  }
	}

}

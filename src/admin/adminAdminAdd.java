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
 * Servlet implementation class adminAdminAdd
 */
@WebServlet("/adminAdminAdd")
public class adminAdminAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminAdminAdd() {
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
		String EmpNo = request.getParameter("empNo");
		String pw = request.getParameter("pw");
		String vn = null;
		String rn = null;
		String Type = "Admin";

		String type = request.getParameter("acType");
		if (type != null) {
			Type = "SuperAdmin";
		}

		String status = "issued";

		
		Connection con = DBConnection.createConnection();
		 
		 try { String query ="insert into user_profile (emp_No,pw,vehi_No,rout_No,status,Type) values (?,?,?,?,?,?)";
		
		  PreparedStatement ps = con.prepareStatement(query); 
		  ps.setString(1,EmpNo);
		  ps.setString(2,pw); 
		  ps.setString(3,vn); 
		  ps.setString(4,rn);
		  ps.setString(5,status); 
		  ps.setString(6,Type); 
		  ps.executeUpdate();
		  
		  String message = "Success"; response.sendRedirect("admin_Admin.jsp?message="+ URLEncoder.encode(message, "UTF-8"));
		  
		  } catch(SQLException e) { 
			  
			  String message = "Some thing wrong"; response.sendRedirect("admin_Admin.jsp?message="+ URLEncoder.encode(message, "UTF-8"));
			  e.printStackTrace(); 		  
		  }
	}

}

package emp;

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
import javax.servlet.http.HttpSession;

import basics.DBConnection;

/**
 * Servlet implementation class employeeUpdate
 */
@WebServlet("/employeeUpdate")
public class employeeUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public employeeUpdate() {
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
		HttpSession session = request.getSession();
		
		String eId = (String) session.getAttribute("eid");
		String designation = request.getParameter("dsg");
		String fName = request.getParameter("fn");
		String lName = request.getParameter("ln");
		int telNo = Integer.parseInt(request.getParameter("tn"));
		String city = request.getParameter("ci");

		Connection con = DBConnection.createConnection();
		 
		 try { String query ="update employee set designation=?,fName=?,lName=?,telNo=?,city=? where eId=?"; 
		
		  PreparedStatement ps = con.prepareStatement(query); 
		 
		  
		  ps.setString(1,designation); 
		  ps.setString(2,fName); 
		  ps.setString(3,lName);
		  ps.setInt(4,telNo);
		  ps.setString(5,city);
		  ps.setString(6,eId);

		  
		  ps.executeUpdate();

		  
		  String message = "Success"; response.sendRedirect("emp_Profile.jsp?message="+ URLEncoder.encode(message, "UTF-8"));
		  
		  } catch(SQLException e) { 
			  
			  String message = "Some thing wrong"; response.sendRedirect("emp_Profile.jsp?message="+ URLEncoder.encode(message, "UTF-8"));
			  e.printStackTrace(); 		
		  }
	}

}

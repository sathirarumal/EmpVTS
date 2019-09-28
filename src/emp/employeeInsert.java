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
 * Servlet implementation class employeeInsert
 */
@WebServlet("/employeeInsert")
public class employeeInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public employeeInsert() {
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
		 
		 try { String query ="insert into employee (eId,designation,fName,lName,telNo,city) values (?,?,?,?,?,?)";
		
		  PreparedStatement ps = con.prepareStatement(query); 
		 
		  ps.setString(1,eId);
		  ps.setString(2,designation); 
		  ps.setString(3,fName); 
		  ps.setString(4,lName);
		  ps.setInt(5,telNo);
		  ps.setString(6,city);

		  
		  ps.executeUpdate();

		  	String query2 ="update user_profile set Type=? where eId=?"; 
			
		  	PreparedStatement ps2 = con.prepareStatement(query2); 		 
		  
		  	ps2.setString(1,"completelyActive"); 
		  	ps2.setString(2,eId); 
		  
		  	ps2.executeUpdate();
		  	
		  String message = "Success"; response.sendRedirect("emp_Main.jsp?message="+ URLEncoder.encode(message, "UTF-8"));
		  
		  } catch(SQLException e) { 
			  
			  String message = "Some thing wrong"; response.sendRedirect("emp_First.jsp?message="+ URLEncoder.encode(message, "UTF-8"));
			  e.printStackTrace(); 		
		  }
	}

		
	

}

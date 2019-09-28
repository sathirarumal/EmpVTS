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
 * Servlet implementation class EmpRideAdd
 */
@WebServlet("/EmpRideAdd")
public class EmpRideAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmpRideAdd() {
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
		
		String EmpNo = (String) session.getAttribute("eid");		
		String Rout = request.getParameter("rid");
		String turn = request.getParameter("time");
		String did = request.getParameter("driver");
		
		Connection con = DBConnection.createConnection();
		 
		 try { String query ="insert into emp_ride (empNo,routeNo,turn,driverId) values (?,?,?,?)";
		
		  PreparedStatement ps = con.prepareStatement(query); 
		  ps.setString(1,EmpNo);
		  ps.setString(2,Rout); 
		  ps.setString(3,turn);
		  ps.setString(4,did); 
		  ps.executeUpdate();
		  
		  String message = "success"; response.sendRedirect("EmpRideAdd.jsp?message="+ URLEncoder.encode(message, "UTF-8"));
		  
		 } catch(SQLException e) { 
			  
			  String message = "Some thing wrong"; response.sendRedirect("EmpRideAdd.jsp?message="+ URLEncoder.encode(message, "UTF-8"));
			  e.printStackTrace(); 		
		 }
	}

}

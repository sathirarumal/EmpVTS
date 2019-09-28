package basics;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

/**
 * Servlet implementation class login
 */
@WebServlet("/login1")
public class login1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login1() {
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
		
		String empNo=request.getParameter("username");
		String pw=request.getParameter("password");
		
		HttpSession session = request.getSession();
		
		
		Connection con = DBConnection.createConnection();
		
		
		try
		{
							
			String query = "select * from user_profile where emp_No=? and pw=? ";
			
			PreparedStatement ps = con.prepareStatement(query);		
			ps.setString(1,empNo);
			ps.setString(2,pw);	
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
			
				String EID =rs.getString(1);
				String status =rs.getString(5);
				String type =rs.getString(6);
				
				if(status.equals("issued")) {
					
					session.setAttribute("eid",EID);
					response.sendRedirect("loginFirst.jsp?empNo=" + URLEncoder.encode(EID, "UTF-8")); 
					
				}else if(status.equals("active")) {
						session.setAttribute("eid",EID);
						
						if(type.equals("Admin")) {
							response.sendRedirect("admin_User.jsp?empNo=" + URLEncoder.encode(EID, "UTF-8"));
							
						}else if(type.equals("Employee")) {
							response.sendRedirect("emp_First.jsp?empNo=" + URLEncoder.encode(EID, "UTF-8"));
							
						}else {
							response.sendRedirect("driver_First.jsp?empNo=" + URLEncoder.encode(EID, "UTF-8")); 
						}
						
				}else {
						session.setAttribute("eid",EID);
						
						if(type.equals("Employee")) {
							response.sendRedirect("emp_Main.jsp?empNo=" + URLEncoder.encode(EID, "UTF-8")); 					

						}else {
							response.sendRedirect("driver_EmpList.jsp?empNo=" + URLEncoder.encode(EID, "UTF-8")); 					

						}
					}
				}
			
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
				
		
	}

}

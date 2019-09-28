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

/**
 * Servlet implementation class login
 */
@WebServlet("/login2")
public class login2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login2() {
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
		
		HttpSession session = request.getSession();
		
		String Eid=(String) session.getAttribute("eid");
		String pw=request.getParameter("password");
		String pw2=request.getParameter("password2");
		
		
		Connection con = DBConnection.createConnection();

		
		if(pw.equals(pw2)) {
		
		try
		{
							
			String query = "update user_profile set pw=?,status='active' where emp_No=?";
			
			PreparedStatement ps = con.prepareStatement(query);		
			ps.setString(1,pw);	
			ps.setString(2,Eid);	
		    ps.executeUpdate();
		    
		    String msg="please login to continued";
		    response.sendRedirect("login.jsp?msg=" + URLEncoder.encode(msg, "UTF-8")); 
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		}
		
	}

}

package servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.DbConnection;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		try {
			DbConnection conn = new DbConnection();
			
			String userName = request.getParameter("username");
			String passWord = request.getParameter("password");
			
			
			Statement stmt = conn.getConnection().createStatement(
					ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_READ_ONLY
					);
			
			ResultSet rSet = stmt.executeQuery("select * from tbl_user where  username='"+userName+"' and password = '"+passWord+"'     ");
			
			if( rSet.next()  ) {
				
				int uid = rSet.getInt("uid");
				
				
				
				HttpSession session = request.getSession();
				
				session.setAttribute("logged", true);
				
				session.setAttribute("uid", uid);
				
				response.sendRedirect("dashboard");
				
			}else {
				
				response.sendRedirect("error.html");
				
			}
			
			
			
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		
	}

}

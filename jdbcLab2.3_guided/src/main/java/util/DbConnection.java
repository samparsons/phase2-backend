package util;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DbConnection
 */
@WebServlet("/DbConnection")
public class DbConnection extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String databaseURL = "jdbc:mysql://localhost:3306/";
    private final String databaseUsername = "root";
    private final String databasePassword = "";
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DbConnection() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			
			Class.forName("com.mysql.jdbc.driver");
			Connection connection = DriverManager.getConnection(databaseURL,databaseUsername,databasePassword);
			
			connection.close();
			
			PrintWriter printWriter = response.getWriter();
			printWriter.println("connection is good.");
			
			
			
		} catch (ClassNotFoundException ex) {
			System.out.println(ex.getLocalizedMessage());
			
		} catch (SQLException ex) {
			System.out.println(ex.getLocalizedMessage());
		}
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

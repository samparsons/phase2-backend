package servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.DBConnection;

/**
 * Servlet implementation class ProductDetails
 */
@WebServlet("/ProductDetails")
public class ProductDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String productId = request.getParameter("productId");
			PrintWriter out = response.getWriter();
			out.println("<html><body>");
			InputStream in = getServletContext().getResourceAsStream("WEB-INF/config.properties");
			Properties props = new Properties();
			props.load(in);
			
			DBConnection conn = new DBConnection(props.getProperty("url"), props.getProperty("userid"), props.getProperty("password"));
			Statement stmt = conn.getConnection().createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			ResultSet resultSet = stmt.executeQuery("SELECT * FROM eproduct WHERE ID = "+productId+";");
			boolean empty = false;
			while( resultSet.next() ) {
			    // ResultSet processing here
			    empty = true;
			}

			if( empty ) {
			

			productId 			= resultSet.getString(1);
            String name 		= resultSet.getString(2);
            String price 		= resultSet.getString(3);
            String dateAdded 	= resultSet.getString(4);
            
			out.println("resultSet: "+resultSet.toString());
			//finish table 
			out.println("<div><h1>Product Details</h1><br>"
					+ "<table class='table'>"
					+ "  <thead>\n"
					+ "    <tr>\n"
					+ "      <th scope=\"col\">#</th>\n"
					+ "      <th scope=\"col\">First</th>\n"
					+ "      <th scope=\"col\">Last</th>\n"
					+ "      <th scope=\"col\">Handle</th>\n"
					+ "    </tr>\n"
					+ "  </thead>\n"
					+ "  <tbody>\n"
					+ "    <tr>\n"
					+ "      <th scope=\"row\">1</th>\n"
					+ "      <td>Mark</td>\n"
					+ "      <td>Otto</td>\n"
					+ "      <td>@mdo</td>\n"
					+ "    </tr>\n"
					+ ""
					+ "</div>");
			
			out.println("Executed an SELECT operation<br>");
			
			}
			stmt.close();
			conn.closeConnection();
			out.println("</body></html>");
			conn.closeConnection();
		} catch (ClassNotFoundException ex) {
			ex.printStackTrace();
		} catch (SQLException ex) {
			ex.printStackTrace();
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

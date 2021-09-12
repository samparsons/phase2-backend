package servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
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
			String productIdInput = request.getParameter("productId");
			PrintWriter out = response.getWriter();
			out.println("<!doctype html><html lang='en'> <head> <meta charset='utf-8'> <meta name='viewport' content='width=device-width, initial-scale=1, shrink-to-fit=no'> <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'> <title>Product Details</title> </head><body>");
			InputStream in = getServletContext().getResourceAsStream("WEB-INF/config.properties");
			Properties props = new Properties();
			props.load(in);
			
			DBConnection conn = new DBConnection(props.getProperty("url"), props.getProperty("userid"), props.getProperty("password"));
			Statement stmt = conn.getConnection().createStatement(
					ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_READ_ONLY
					);
			String query = "SELECT * FROM eproduct WHERE ID = "+productIdInput+";";
			ResultSet resultSet = stmt.executeQuery(query);
			boolean results = false;
			
			while(resultSet.next()) {
				results = true;
				int productId 		= resultSet.getInt("ID");
	            String name 		= resultSet.getString("name");
	            BigDecimal price 	= resultSet.getBigDecimal("price");
	            Timestamp dateAdded 	= resultSet.getTimestamp("date_added");
				out.println("<div class='container'><h1>Product Details</h1><br><table class='table'><thead><tr><th scope='col'>ProductId</th><th scope='col'>Product Name</th><th scope='col'>Price</th><th scope='col'>Date Added</th></tr></thead><tbody><tr><th scope='row'>"+productId+"</th><td>"+name+"</td><td>"+price+"</td><td>"+dateAdded+"</td></tr></tbody></table></div>");
			}
			if(!results) {
				out.println("<div class='container'><h1>Product Details</h1><br><div class='alert alert-danger' role='alert'>There was an error. No results found with that Product Id.</div><br><br><figure><blockquote class='blockquote'><p>'For everything you have missed, you have gained something else, and for everything you gain, you lose something else.'</p></blockquote><figcaption class='blockquote-footer'>Ralph Waldo Emerson <cite title='“Ralph Waldo Emerson: Selected Essays, Lectures and Poems”, p.72, Bantam Classics'>'Ralph Waldo Emerson: Selected Essays, Lectures and Poems', p.72, Bantam Classics</cite></figcaption></figure></div>");
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

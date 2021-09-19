package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import shop.Product;
import util.HibernateUtil;

/**
 * Servlet implementation class NewProduct
 */
@WebServlet("/NewProduct")
public class NewProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		String name = request.getParameter("name");
		Double price = Double.parseDouble(request.getParameter("price"));		
		Product p1 = new Product(name,price);		
		SessionFactory factory = HibernateUtil.getSessionFactory();		
		Session session = factory.openSession();		
		Transaction trans = session.beginTransaction();		
		session.save(p1);		
		trans.commit();		
		session.close();
		
		PrintWriter out = response.getWriter();
		out.println("<html><body>New Product Saved");
		out.println("</body></html>");
		
	}

}

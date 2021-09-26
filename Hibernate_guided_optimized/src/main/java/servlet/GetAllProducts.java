package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

import shop.Product;
import util.HibernateUtil;

/**
 * Servlet implementation class GetAllProducts
 */
@WebServlet("/GetAllProducts")
public class GetAllProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetAllProducts() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		SessionFactory factory = HibernateUtil.getSessionFactory();		
		PrintWriter out = response.getWriter();
		
		
		Session session = factory.openSession();
		
		//List<Product> products = session.createQuery("from Product").list();
		
		//Criteria cr = session.createCriteria(Product.class);
		
		//cr.add( Restrictions.ge("price", 12.0)); //errors bc this is an int
		
		//List<Product> products = cr.list();
		
		CriteriaBuilder cb = session.getCriteriaBuilder();
		
		CriteriaQuery<Product> cr = cb.createQuery(Product.class);
		
		Root<Product> root = cr.from(Product.class);
		
		cr.select(root).where( cb.ge(root.get("price"), 12.0));
		
		Query<Product> query = session.createQuery(cr);
		
		List<Product> products = query.getResultList();
		
		out.println("<html><body>");
		for(Product p : products) {
			out.println(p.getName()+" | "+p.getPrice()+" | "+p.getProductId()+"<br>");
		}
		
		
		session.close();
		
		out.println("</body></html>");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import shop.Product;
import shop.ProductImage;
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
		// TODO Auto-generated method stub
		String name = "phone";
		double price = 17.99;
		
		List<ProductImage> images = new ArrayList<>();
		
		Product p1 = new Product(name,price);
		
		ProductImage img1 = new ProductImage("a.jpg");
		ProductImage img2 = new ProductImage("b.jpg");
		
		
		
		img1.setProduct(p1);
		img2.setProduct(p1);
		
		
		images.add(img1);
		
		images.add(img2);
		
		p1.setImages(images);
		
		
		
		
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
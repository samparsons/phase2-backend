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

import shop.Account;
import shop.Address;
import shop.Product;
import shop.ProductImage;
import shop.ProductImageMeta;
import shop.User;
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
		/*
		String name = "phone";
		double price = 17.99;
		
		List<ProductImage> images = new ArrayList<>();
		
		Product p1 = new Product(name,price);
		
		ProductImage img1 = new ProductImage("a.jpg",p1);
		ProductImage img2 = new ProductImage("b.jpg",p1);
		
		ProductImageMeta meta1 = new ProductImageMeta("1","a",img1);
		ProductImageMeta meta2 = new ProductImageMeta("2","b",img1);
		
		ProductImageMeta meta3 = new ProductImageMeta("3","c",img2);
		ProductImageMeta meta4 = new ProductImageMeta("4","d",img2);
		
		
		p1.addImage(img1);
		p1.addImage(img2);
		img1.addImageMeta(meta1);
		img1.addImageMeta(meta2);
		img2.addImageMeta(meta3);
		img2.addImageMeta(meta4);
		*/
		
		SessionFactory factory = HibernateUtil.getSessionFactory();		
		Session session = factory.openSession();		
		Transaction trans = session.beginTransaction();		
		
		Address address = new Address("First St.","Miami","Florida","45678");
		
		Account acct = new Account("john345","pw123");
		
		User user = new User("John","Doe",acct,address);
			
		session.save(user);		
		trans.commit();		
		session.close();
		
		PrintWriter out = response.getWriter();
		out.println("<html><body>New Product Saved");
		out.println("</body></html>");
		
 	}
}
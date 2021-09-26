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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String name = request.getParameter("pname");
		double price = Double.parseDouble(request.getParameter("price"));
		String imageUrl = request.getParameter("imageUrl");
		String imageMetaKey = request.getParameter("imageMetaKey");
		String imageMetaValue = request.getParameter("imageMetaValue");
		
		//List<ProductImage> images = new ArrayList<>();
		
		Product newProduct = new Product(name,price);
		
		ProductImage img1 = new ProductImage(imageUrl,newProduct);
		
		ProductImageMeta meta1 = new ProductImageMeta(imageMetaKey,imageMetaValue,img1);
		
		newProduct.addImage(img1);
		img1.addImageMeta(meta1);		
		
		SessionFactory factory = HibernateUtil.getSessionFactory();		
		Session session = factory.openSession();		
		Transaction trans = session.beginTransaction();		
		/*
		Address address = new Address("First St.","Miami","Florida","45678");
		
		Account acct = new Account("john345","pw123");
		
		User user = new User("John","Doe",acct,address);
		*/	
		session.save(newProduct);		
		trans.commit();		
		session.close();
		
		response.sendRedirect("list_product.jsp");
		
 	}
}
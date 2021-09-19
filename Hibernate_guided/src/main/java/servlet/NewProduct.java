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
import shop.ProductImageMeta;
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
		
		ProductImageMeta meta1 = new ProductImageMeta("1","a");
		ProductImageMeta meta2 = new ProductImageMeta("2","b");
		
		ProductImageMeta meta3 = new ProductImageMeta("3","c");
		ProductImageMeta meta4 = new ProductImageMeta("4","d");
		
		List<ProductImageMeta> metas1 = new ArrayList<>();
		List<ProductImageMeta> metas2 = new ArrayList<>();
		
			
		img1.setProduct(p1);
		img2.setProduct(p1);
		
		meta1.setProductImage(img1);
		meta2.setProductImage(img1);
		
		meta3.setProductImage(img2);
		meta4.setProductImage(img2);
		
		metas1.add(meta1);
		metas1.add(meta2);
		
		metas2.add(meta3);
		metas2.add(meta4);
		
		img1.setImageMeta(metas1);
		img2.setImageMeta(metas2);
		
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
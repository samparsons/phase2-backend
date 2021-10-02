package dist.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import tables.Payment;
import util.HibernateUtil;

/**
 * Servlet implementation class Payment
 */
@WebServlet("/Payment")
public class PaymentProcessing extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentProcessing() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cc_name = request.getParameter("cc_name");
		String cc_num = request.getParameter("cc_num");
		String cc_month = request.getParameter("cc_month");
		String cc_year = request.getParameter("cc_year");
		String ccv = request.getParameter("ccv");
		String flight_id = request.getParameter("flight_id");
		String customer_id = request.getParameter("customer_id");
		String capacity = request.getParameter("capacity");
		
		
		//DEBUG
		
		System.out.println("cc_name: "+cc_name);
		System.out.println("cc_num: "+cc_num);
		System.out.println("cc_month: "+cc_month);
		System.out.println("cc_year: "+cc_year);
		System.out.println("ccv: "+ccv);
		
		Payment pmt = new Payment(cc_name,cc_num,cc_month,cc_year,ccv);
		
		SessionFactory factory = HibernateUtil.getSessionFactory();		
		Session session = factory.openSession();		
		Transaction trans = session.beginTransaction();
		session.save(pmt);		
		trans.commit();		
		
		
		response.sendRedirect("flightRegister?customer_id="+customer_id+"&flight_id="+flight_id+"&payment_id="+pmt.getPayment_Id()+"&capacity="+capacity);
		session.close();
		
	}
}

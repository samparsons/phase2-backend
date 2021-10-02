package dist.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import tables.Customer;
import util.HibernateUtil;

/**
 * Servlet implementation class SaveCustomer
 */
@WebServlet("/SaveCustomer")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String dateOfBirthIn = request.getParameter("dateOfBirth");
		String st_address = request.getParameter("st_address");
		String gender = request.getParameter("gender");
		String id_type = request.getParameter("id_type");
		String id_num = request.getParameter("id_num");
		String exp_dateIn = request.getParameter("id_exp_date");
		String flight_id = request.getParameter("flight_id");
		String capacity = request.getParameter("capacity");
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
		
		//DEBUG
		System.out.println("firstName: "+firstName);
		System.out.println("lastName: "+lastName);
		System.out.println("dateOfBirthIn: "+dateOfBirthIn);
		System.out.println("st_address: "+st_address);
		System.out.println("gender: "+gender);
		System.out.println("id_type: "+id_type);
		System.out.println("id_num: "+id_num);
		System.out.println("exp_dateIn: "+exp_dateIn);
		System.out.println("flight_id: "+flight_id);
		
		
		
		Date dateOfBirth = null;
		Date exp_date = null;
		try {
			dateOfBirth = sdf.parse(dateOfBirthIn);
			exp_date = sdf.parse(exp_dateIn);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Customer nc = new Customer(firstName,lastName,dateOfBirth,st_address,gender,id_type,id_num,exp_date);
		
		SessionFactory factory = HibernateUtil.getSessionFactory();		
		Session session = factory.openSession();		
		Transaction trans = session.beginTransaction();
		session.save(nc);		
		trans.commit();		
		
		
		response.sendRedirect("payment.jsp?customer_id="+nc.getCustomer_Id()+"&flight_id="+flight_id+"&capacity="+capacity);
		session.close();
	}
}

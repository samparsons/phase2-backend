package dist.servlet;

import java.io.IOException;
import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import tables.Admin;
import tables.Airline;
import tables.Airport;
import tables.Flight;
import util.HibernateUtil;

/**
 * Servlet implementation class AdminOps
 */
@WebServlet("/AdminOps")
public class AdminOps extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminOps() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int op_num = Integer.parseInt(request.getParameter("op"));
		System.out.println("op_num: "+op_num);
		
		if(op_num==1) {
			//create test credentials (admin, admin), update back to (admin,admin) when it exists.
			String username = "admin";
			String password = "admin";
			
			
			Session session = HibernateUtil.getSessionFactory().openSession();
			Admin admin = new Admin(username,password);
			try {
				CriteriaBuilder cb = session.getCriteriaBuilder();
				CriteriaQuery<Admin> cr = cb.createQuery(Admin.class);
				Root<Admin> root = cr.from(Admin.class);
				cr.select(root);
				Query<Admin> query = session.createQuery(cr);
				List<Admin> admins = query.getResultList(); 
				if(admins.size()==0) {
					try {
					
					Transaction trans = session.beginTransaction();
					session.save(admin);		
					trans.commit();		
					session.close();
					response.sendRedirect("login.jsp?success=1");
					} catch (Exception e) {
						response.sendRedirect("login.jsp?error=2");
					}
				} else {
					admin = admins.get(0);
					admin.setPassword(password);
					Transaction trans = session.beginTransaction();
					session.save(admin);		
					trans.commit();		
					session.close();
					response.sendRedirect("login.jsp?success=2");
					
				}
			} catch (Exception e) {
				// do nothing;
			}
			
		} else if(op_num==2) {
			//check username and pw
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			Session se = HibernateUtil.getSessionFactory().openSession();
			
			try {
				
		    	se.beginTransaction();
				CriteriaBuilder cb = se.getCriteriaBuilder();
				CriteriaQuery<Admin> cr = cb.createQuery(Admin.class);
				Root<Admin> root = cr.from(Admin.class);
				/* helpful link: https://www.baeldung.com/hibernate-criteria-queries*/
	
				Predicate equalsUsername = cb.equal(root.get("username"),username);
				Predicate equalsPassword = cb.equal(root.get("password"),password);
				
				cr.select(root).where(cb.and(equalsUsername,equalsPassword));
				Query<Admin> query = se.createQuery(cr);
				
	            Admin user = query.getSingleResult();
	            response.sendRedirect("admin.jsp?success=s01");
			} catch (NoResultException e) {
				response.sendRedirect("login.jsp?error=1");
			} finally {
				se.close();
			}
		} else if (op_num==3) {
			//update password
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String newPassword = request.getParameter("newPassword");
			Session se = HibernateUtil.getSessionFactory().openSession();
			
			try {
				
				Transaction trans = se.beginTransaction();
				CriteriaBuilder cb = se.getCriteriaBuilder();
				CriteriaQuery<Admin> cr = cb.createQuery(Admin.class);
				Root<Admin> root = cr.from(Admin.class);
				/* helpful link: https://www.baeldung.com/hibernate-criteria-queries*/
	
				Predicate equalsUsername = cb.equal(root.get("username"),username);
				Predicate equalsPassword = cb.equal(root.get("password"),password);
				
				cr.select(root).where(cb.and(equalsUsername,equalsPassword));
				Query<Admin> query = se.createQuery(cr);
				
	            Admin user = query.getSingleResult();
	            user.setPassword(newPassword);
	            se.save(user);
	            trans.commit();
	            response.sendRedirect("admin.jsp?success=s02");
			} catch (NoResultException e) {
				response.sendRedirect("admin.jsp?error=err01");
			} finally {
				se.close();
			}
		} else if (op_num==4) {
			//delete airport
			Session session = HibernateUtil.getSessionFactory().openSession();
			try {	
				Transaction trans = session.beginTransaction();
				Airport airport = session.load(Airport.class,Integer.parseInt(request.getParameter("airport_id")));
				session.delete(airport);
				trans.commit();		
				session.close();
				response.sendRedirect("admin.jsp?success=s03&pg=1");
			} catch (Exception e) {
				response.sendRedirect("admin.jsp?error=err02&pg=1");
			}
			
		} else if (op_num==5) {
			//delete airline
			Session session = HibernateUtil.getSessionFactory().openSession();
			try {	
				Transaction trans = session.beginTransaction();
				Airline airline = session.load(Airline.class,Integer.parseInt(request.getParameter("airline_id")));
				session.delete(airline);
				trans.commit();		
				session.close();
				response.sendRedirect("admin.jsp?success=s04&pg=2");
			} catch (Exception e) {
				response.sendRedirect("admin.jsp?error=err03&pg=2");
			}
		} else if (op_num==6) {
			//delete flight
			Session session = HibernateUtil.getSessionFactory().openSession();
			try {	
				Transaction trans = session.beginTransaction();
				Flight flight = session.load(Flight.class,Integer.parseInt(request.getParameter("flight_id")));
				session.delete(flight);
				trans.commit();		
				session.close();
				response.sendRedirect("admin.jsp?success=s05&pg=3");
			} catch (Exception e) {
				response.sendRedirect("admin.jsp?error=err04&pg=3");
			}
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

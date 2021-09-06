package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;

/**
 * Servlet implementation class Dashboard
 */
@WebServlet("/Dashboard")
public class Dashboard1_23 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Dashboard1_23() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Cookie cookie = null;
		Cookie[] cookies = null;
		
		ArrayList<User> users = new ArrayList<User>();
		User user1 = new User("Sam","pw");
		User user2 = new User("Georgi","pw");
		User user3 = new User("Jim","pw");
		User user4 = new User("Bob","pw");
		users.add(user1);
		users.add(user2);
		users.add(user3);
		users.add(user4);
		
		boolean foundUserName = false;
		boolean foundPassword = false;
		PrintWriter out = response.getWriter();
		//start html
		out.println("<html><body>");
		cookies = request.getCookies();
		for(User u : users) {
			if(cookies!=null) {
				for (int i = 0; i < cookies.length; i++) {
					cookie = cookies[i];
					/* DEBUGGING LOGIC
					 * System.out.println("print cookie: "+cookie.getName()+"|"+cookie.getValue());
					 * System.out.println("print user: "+u.getUsername()+"|"+u.getPassword());
					 * System.out.println("bool check un: "+foundUserName+i);
					 * System.out.println("bool check pw: "+foundPassword+i);*/
					// check for username
					if(cookie.getValue().equals(u.getUsername())) {
						out.println("userName read from cookie: "+cookie.getValue()+"<br>");
						out.println("userName read from ArrayList: "+u.getUsername()+"<br>");
						foundUserName=true;
					}
					// check for matching password
					if(cookie.getValue().equals(u.getPassword())&&foundUserName) {
						out.println("password read from cookie: "+cookie.getValue()+"<br>");
						out.println("password read from ArrayList: "+u.getPassword()+"<br>");
						out.println("LOGIN SUCCESS<br>");
						foundPassword=true;
						out.println("<a href='logout'>Logout of session</a><br>");
					}
				}
				if(foundUserName&&foundPassword) {
					break;
				}
			}
		}
		
		/* DEBUG CODE
		 * System.out.println("final bool check un: "+foundUserName);
		 * System.out.println("final bool check pw: "+foundPassword);
		 */
		
		if(!foundUserName || !foundPassword) {
			response.sendRedirect("error?un="+foundUserName+"&pw="+foundPassword);
		}
		
		
		out.println("</body></html>");
		//end html
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

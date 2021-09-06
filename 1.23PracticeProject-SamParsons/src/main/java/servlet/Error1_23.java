package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Error
 */
@WebServlet("/Error")
public class Error1_23 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Error1_23() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String un = request.getParameter("un");
		String pw = request.getParameter("pw");
		System.out.println("error un: "+un);
		System.out.println("error pw: "+pw);
		PrintWriter out = response.getWriter();
		if(un!=null&&pw!=null) {
			
			out.println("<html><body>");
			int errNo = 1;
			if(un.equals("false")) {
				out.println("ERROR"+errNo+": No UserId was found in user database.<br>");
				errNo++;
			} 
			if (pw.equals("false")) {
				out.println("ERROR"+errNo+": The password did not match.<br>");
			}
			HttpSession session = request.getSession();		
			session.invalidate();
			out.println("Session terminated.<br>");
			out.println("</body></html>");
		} else {
			out.println("<html><body>");
			out.println("ERROR: please try again.");
			out.println("</body></html>");
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

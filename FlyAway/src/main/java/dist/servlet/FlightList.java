package dist.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Testing
 */
@WebServlet("/Testing")
public class FlightList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FlightList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html><html lang=\"en\"> <head> <meta charset=\"utf-8\"/> <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\"/> <meta name=\"description\" content=\"\"/> <meta name=\"author\" content=\"\"/> <title>FlyAway - Begin Your Adventure</title> <link rel=\"icon\" type=\"image/x-icon\" href=\"assets/favicon.ico\"/> <link href=\"https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css\" rel=\"stylesheet\"/> <link href=\"https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700\" rel=\"stylesheet\"/> <link href=\"https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic\" rel=\"stylesheet\" type=\"text/css\"/> <link href=\"https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css\" rel=\"stylesheet\"/> <link href=\"css/styles.css\" rel=\"stylesheet\"/> <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\"> </head> <body id=\"page-top\"> <nav class=\"navbar navbar-expand-lg navbar-light fixed-top py-3\" id=\"mainNav\"> <div class=\"container px-4 px-lg-5\"> <a class=\"navbar-brand\" href=\"#page-top\">FlyAway</a> </div></nav><header class=\"masthead\"> <div class=\"container px-4 px-lg-5 h-100\"> <div class=\"row gx-4 gx-lg-5 h-100 align-items-center justify-content-center text-center\"> <div class=\"col-lg-8 align-self-end\">");
		
		out.println("");
		
		out.println("</div></div></div></header><footer class=\"bg-light py-5\"> <div class=\"container px-4 px-lg-5\"><div class=\"small text-center text-muted\">Copyright &copy; 2021 - FlyAway</div></div><div class=\"container px-4 px-lg-5\"><div class=\"small text-center text-muted\"><a href=\"https://startbootstrap.com/theme/creative/\" target=\"_blank\">Download this theme at Start Bootstrap</a></div></div><div class=\"container px-4 px-lg-5\"><div class=\"small text-center text-muted\">Background Image Credit: <a href=\"https://commons.wikimedia.org/wiki/File:Flight-travelling-airplane_(23698289143).jpg\" target=\"_blank\">pixellaphoto</a></div></div></footer> <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js\"></script> <script src=\"https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js\"></script> <script src=\"js/scripts.js\"></script> </body></html>");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html><html lang=\"en\"> <head> <meta charset=\"utf-8\"/> <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\"/> <meta name=\"description\" content=\"\"/> <meta name=\"author\" content=\"\"/> <title>FlyAway - Begin Your Adventure</title> <link rel=\"icon\" type=\"image/x-icon\" href=\"assets/favicon.ico\"/> <link href=\"https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css\" rel=\"stylesheet\"/> <link href=\"https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700\" rel=\"stylesheet\"/> <link href=\"https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic\" rel=\"stylesheet\" type=\"text/css\"/> <link href=\"https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css\" rel=\"stylesheet\"/> <link href=\"css/styles.css\" rel=\"stylesheet\"/> <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\"> </head> <body id=\"page-top\"> <nav class=\"navbar navbar-expand-lg navbar-light fixed-top py-3\" id=\"mainNav\"> <div class=\"container px-4 px-lg-5\"> <a class=\"navbar-brand\" href=\"#page-top\">FlyAway</a> </div></nav><header class=\"masthead\"> <div class=\"container px-4 px-lg-5 h-100\"> <div class=\"row gx-4 gx-lg-5 h-100 align-items-center justify-content-center text-center\"> <div class=\"col-lg-8 align-self-end\">");
		
		out.println("");
		
		out.println("</div></div></div></header><footer class=\"bg-light py-5\"> <div class=\"container px-4 px-lg-5\"><div class=\"small text-center text-muted\">Copyright &copy; 2021 - FlyAway</div></div><div class=\"container px-4 px-lg-5\"><div class=\"small text-center text-muted\"><a href=\"https://startbootstrap.com/theme/creative/\" target=\"_blank\">Download this theme at Start Bootstrap</a></div></div><div class=\"container px-4 px-lg-5\"><div class=\"small text-center text-muted\">Background Image Credit: <a href=\"https://commons.wikimedia.org/wiki/File:Flight-travelling-airplane_(23698289143).jpg\" target=\"_blank\">pixellaphoto</a></div></div></footer> <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js\"></script> <script src=\"https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js\"></script> <script src=\"js/scripts.js\"></script> </body></html>");

	}

}

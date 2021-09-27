package dist.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.concurrent.ThreadLocalRandom;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.ObjectNotFoundException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import tables.Airline;
import tables.Airport;
import tables.Flight;
import util.HibernateUtil;

/**
 * Servlet implementation class DataGen
 */
@WebServlet("/DataGen")
public class DataGen extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DataGen() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		
		try {
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html><html lang=\"en\"> <head> <meta charset=\"utf-8\"/> <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\"/> <meta name=\"description\" content=\"\"/> <meta name=\"author\" content=\"\"/> <title>FlyAway - Begin Your Adventure</title> <link rel=\"icon\" type=\"image/x-icon\" href=\"assets/favicon.ico\"/> <link href=\"https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css\" rel=\"stylesheet\"/> <link href=\"https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700\" rel=\"stylesheet\"/> <link href=\"https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic\" rel=\"stylesheet\" type=\"text/css\"/> <link href=\"https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css\" rel=\"stylesheet\"/> <link href=\"css/styles.css\" rel=\"stylesheet\"/> <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\"> </head> <body id=\"page-top\"> <nav class=\"navbar navbar-expand-lg navbar-light fixed-top py-3\" id=\"mainNav\"> <div class=\"container px-4 px-lg-5\"> <a class=\"navbar-brand\" href=\"#page-top\">FlyAway</a> </div></nav><header class=\"masthead\"> <div class=\"container px-4 px-lg-5 h-100\"> <div class=\"row gx-4 gx-lg-5 h-100 align-items-center justify-content-center text-center\"> <div class=\"col-lg-8 align-self-end\">");
		
		out.println("<img class=\"rounded mx-auto d-block\" src=\"FlyAway/dist/img/loader-flight.gif\" />");
		
		out.println("</div></div></div></header><footer class=\"bg-light py-5\"> <div class=\"container px-4 px-lg-5\"><div class=\"small text-center text-muted\">Copyright &copy; 2021 - FlyAway</div></div><div class=\"container px-4 px-lg-5\"><div class=\"small text-center text-muted\"><a href=\"https://startbootstrap.com/theme/creative/\" target=\"_blank\">Download this theme at Start Bootstrap</a></div></div><div class=\"container px-4 px-lg-5\"><div class=\"small text-center text-muted\">Background Image Credit: <a href=\"https://commons.wikimedia.org/wiki/File:Flight-travelling-airplane_(23698289143).jpg\" target=\"_blank\">pixellaphoto</a></div></div></footer> <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js\"></script> <script src=\"https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js\"></script> <script src=\"js/scripts.js\"></script> </body></html>");

		
		
		int i = 1000;
		for (int j = 0; j < i; j++) {
			
			//get a day between now and 30 days from now for the flight date.
			//get all values to create a flight
			//in order to create a good set of test data points with our first few rows 
			//we set things manually so we have a good data set to test our queries with.
			int randomAirportArrive;
			int randomAirportDepart;
			int randomAirline;
			Date dateTime;
			String terminal;
			Integer gate;
			double price;
			long now = new Date().getTime();
			int capacity;
			
			
			if(j>20) {
				//there are 9225 rows in tbl_airports
				randomAirportArrive = ThreadLocalRandom.current().nextInt(1,9225 + 1);
				
				//there are 9225 rows in tbl_airports
				randomAirportDepart = ThreadLocalRandom.current().nextInt(1,9225 + 1);
				
				//there are 1571 rows in tbl_airports
				randomAirline = ThreadLocalRandom.current().nextInt(1,1571 + 1);
				
				while(randomAirportDepart==randomAirportArrive) {
					randomAirportDepart+=10;
					if(randomAirportDepart>9225) {
						randomAirportDepart-=20;
					}
				}
				
				//create random terminal
				String letters = "ABCDEFGHIJKLMNOPQRSTUVWZYZ";
				int number =  ThreadLocalRandom.current().nextInt(0,25 + 1);
				terminal = letters.substring(number,number+1);
				//create random gate
				gate = ThreadLocalRandom.current().nextInt(1,30 + 1);
				//create random price
				price = ThreadLocalRandom.current().nextDouble(200.0, 1500.0);
				
				long aDay = TimeUnit.DAYS.toMillis(1);
				Date today =  new Date(now);
				Date thirtyDaysAhead = new Date(now + aDay * 30);
				//flight dateTime value
				dateTime = between(today, thirtyDaysAhead);
				
				//create random capacity
				capacity = ThreadLocalRandom.current().nextInt(0,300 + 1);
			} else {
				randomAirportArrive = 2;
				randomAirportDepart = 10;
				randomAirline = j+1;
				dateTime = new Date(now);
				terminal = "A";
				gate = j+1;
				price = 129.99;
				capacity = j;
			}
			
			//get objects
			Airline airline = session.load(Airline.class,randomAirline);
			Airport airportDepart = session.load(Airport.class,randomAirportDepart);
			Airport airportArrive = session.load(Airport.class,randomAirportArrive);
			//get airlineName
			String airlineName = airline.getCompanyName();
			//get departCity
			String departCity = airportDepart.getCity_name(); 
			//get departAirport
			String departAirport = airportDepart.getAirport_name();
			//get arriveCity
			String arriveCity = airportArrive.getCity_name(); 
			//get arriveAirport
			String arriveAirport = airportArrive.getAirport_name();
			
			if(departCity.equals("NA")) {
				departCity = "Springfield";
			}
			if(arriveCity.equals("NA")) {
				arriveCity = "Springfield";
			}
			
			//add the flight
			Flight flight = new Flight(airlineName,departCity,departAirport,arriveCity,arriveAirport,terminal,gate,price,dateTime,capacity);
			Transaction tr = session.beginTransaction();
			
			session.save(flight);
			tr.commit();
			
		}
		//session.delete(product);
		} catch (ObjectNotFoundException e) {
			System.out.println(e);
			System.out.println("No row found");
		}
		
		session.close();
		response.sendRedirect("/FlyAway/dist/index.html");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public static Date between(Date startInclusive, Date endExclusive) {
	    long startMillis = startInclusive.getTime();
	    long endMillis = endExclusive.getTime();
	    long randomMillisSinceEpoch = ThreadLocalRandom
	      .current()
	      .nextLong(startMillis, endMillis);

	    return new Date(randomMillisSinceEpoch);
	}

}

package dist.servlet;

import java.io.IOException;
import java.time.Instant;
import java.util.Date;
import java.util.Iterator;
import java.util.Random;
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
		int i = 1000;
		for (int j = 0; j < i; j++) {
			
			//get a day between now and 30 days from now for the flight date.
			//get airline and airport values
			
			
			//there are 9225 rows in tbl_airports
			int randomAirportArrive = ThreadLocalRandom.current().nextInt(1,9225 + 1);
			
			//there are 9225 rows in tbl_airports
			int randomAirportDepart = ThreadLocalRandom.current().nextInt(1,9225 + 1);
			
			//there are 1571 rows in tbl_airports
			int randomAirline = ThreadLocalRandom.current().nextInt(1,1571 + 1);
			
			while(randomAirportDepart==randomAirportArrive) {
				randomAirportDepart+=10;
				if(randomAirportDepart>9225) {
					randomAirportDepart-=20;
				}
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
			//create random terminal
			String letters = "ABCDEFGHIJKLMNOPQRSTUVWZYZ";
			int number =  ThreadLocalRandom.current().nextInt(0,25 + 1);
			String terminal = letters.substring(number,number+1);
			//create random gate
			Integer gate = ThreadLocalRandom.current().nextInt(1,30 + 1);
			//create random price
			double price = ThreadLocalRandom.current().nextDouble(200.0, 1500.0);
			
			long now = new Date().getTime();
			long aDay = TimeUnit.DAYS.toMillis(1);
			Date today =  new Date(now);
			Date thirtyDaysAhead = new Date(now + aDay * 30);
			//flight dateTime value
			Date dateTime = between(today, thirtyDaysAhead);
			
			//create random capacity
			int capacity = ThreadLocalRandom.current().nextInt(0,300 + 1);
			
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

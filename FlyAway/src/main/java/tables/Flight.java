package tables;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

//import tables.FlightRegistry;

@Entity
@Table(name="tbl_flights")
public class Flight {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int flightId;
	
	private String airlineName;
	private String departCity;
	private String arriveCity;
	private String terminal;
	private String gate;
	private double price;
	private Date dateTime;
	
	//@OneToMany(mappedBy="flight",cascade=CascadeType.ALL)
	//private List<FlightRegistry> flights;
		
	
	
	public Flight() {
		super();
	}
	
	
	
	public Flight(String airlineName, String departCity, String arriveCity, String terminal, String gate, double price,
			Date dateTime) {
		super();
		this.airlineName = airlineName;
		this.departCity = departCity;
		this.arriveCity = arriveCity;
		this.terminal = terminal;
		this.gate = gate;
		this.price = price;
		this.dateTime = dateTime;
		//flights = new ArrayList<FlightRegistry>();
	}



	//public void addFlight(FlightRegistry flight) {
	//	flights.add(flight);
	//}

	public String getAirlineName() {
		return airlineName;
	}

	public void setAirlineName(String airlineName) {
		this.airlineName = airlineName;
	}

	public String getDepartCity() {
		return departCity;
	}

	public void setDepartCity(String departCity) {
		this.departCity = departCity;
	}

	public String getArriveCity() {
		return arriveCity;
	}

	public void setArriveCity(String arriveCity) {
		this.arriveCity = arriveCity;
	}

	public String getTerminal() {
		return terminal;
	}

	public void setTerminal(String terminal) {
		this.terminal = terminal;
	}

	public String getGate() {
		return gate;
	}

	public void setGate(String gate) {
		this.gate = gate;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public Date getDateTime() {
		return dateTime;
	}

	public void setDateTime(Date dateTime) {
		this.dateTime = dateTime;
	}

	public int getFlightId() {
		return flightId;
	}
	
	
	
}

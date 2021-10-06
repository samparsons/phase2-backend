<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.Query" %>
<%@ page import="org.hibernate.HibernateException" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.criterion.Restrictions" %>
<%@ page import="javax.persistence.criteria.CriteriaBuilder" %>
<%@ page import="javax.persistence.criteria.CriteriaQuery" %>
<%@ page import="javax.persistence.criteria.Root" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="javax.persistence.criteria.Predicate" %>
<%@ page import="util.HibernateUtil" %>
<%@ page import="tables.Flight" %>
<%@ page import="tables.Airport" %>
<%@ page import="tables.Airline" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	List<Airport> airports = new ArrayList<Airport>();
	List<Airline> airlines = new ArrayList<Airline>();
	List<Flight> flights = new ArrayList<Flight>();
	Session se = HibernateUtil.getSessionFactory().openSession();
	String nullcheck = request.getParameter("pg");
	if(nullcheck!=null){
		Integer pg_id = Integer.parseInt(request.getParameter("pg"));
		if(pg_id==1){ //Sources and Destinations aka Airports
			se.beginTransaction();
			CriteriaBuilder cb = se.getCriteriaBuilder();
			CriteriaQuery<Airport> cr = cb.createQuery(Airport.class);
			Root<Airport> root = cr.from(Airport.class);
			cr.select(root);
			Query<Airport> query = se.createQuery(cr);
	        airports = query.getResultList();
		} else if (pg_id==2) { //Airlines
			se.beginTransaction();
			CriteriaBuilder cb = se.getCriteriaBuilder();
			CriteriaQuery<Airline> cr = cb.createQuery(Airline.class);
			Root<Airline> root = cr.from(Airline.class);
			cr.select(root);
			Query<Airline> query = se.createQuery(cr);
	        airlines = query.getResultList();
		} else if (pg_id==3) { //Flights
	    	se.beginTransaction();
			CriteriaBuilder cb = se.getCriteriaBuilder();
			CriteriaQuery<Flight> cr = cb.createQuery(Flight.class);
			Root<Flight> root = cr.from(Flight.class);
			cr.select(root);
			Query<Flight> query = se.createQuery(cr);
	        flights = query.getResultList();
		} 
	}
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>FlyAway - Admin Portal</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap Icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
        <!-- SimpleLightbox plugin CSS-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        
        <!-- Include jQuery -->
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
		
		<!-- Include Date Range Picker -->
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
		
		<!-- Importing icon cdn -->
	    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	  
		        
        
    </head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light-fixed-top bg-light py-3 px-3" id="MainNav">
		  <a class="navbar-brand" href="/FlyAway/dist/index.html">FlyAway</a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
			  <div class="navbar-collapse" id="navbarResponsive">
				    <ul class="navbar-nav">
				    	<li class="nav-item">
				    		<a class="nav-link text-secondary" href="/FlyAway/dist/datagen">Generate Flights</a>
				    	</li>
				      	<li class="nav-item">
				        	<a class="nav-link text-secondary" href="/FlyAway/dist/login.jsp">Admin Login</a>
				      	</li>
				      	<li class="nav-item">
				        	<a class="nav-link text-secondary" href="#"> | </a>
				      	</li>
				      	<li class="nav-item">
				        	<a class="nav-link" href="/FlyAway/dist/admin.jsp?pg=1">Sources and Destinations</a>
				      	</li>
				      	<li class="nav-item">
				        	<a class="nav-link" href="/FlyAway/dist/admin.jsp?pg=2">Airline List</a>
				      	</li>
				      	<li class="nav-item">
				        	<a class="nav-link" href="/FlyAway/dist/admin.jsp?pg=3">Flight List</a>
				      	</li>
				      	<li>
				      		<a class="nav-link" href="/FlyAway/dist/admin.jsp?pg=4">Change Password</a>
				      	</li>
				    </ul>
			  </div>
		</nav>
        <!-- Admin Page -->
        <section class="page-section bg-light" id="register">
            <div class="container px-5 px-lg-5">
                <div class="row gx-5 gx-lg-5 justify-content-center">
                    <div class="col-lg-12 text-center">
                        <h2 class="text-primary mt-0">Admin Portal</h2>
                        <hr class="divider divider-primary" />
                        <%
                        String success = request.getParameter("success");
                		
            			if(success!=null){
            				%>
            					<div class="alert alert-success" role="alert">
            				<%
            				if(success.indexOf("01")>=0){
            					%>
            			   			<b>Login Successfull!</b><br>
            					<%
            				}
            				if(success.indexOf("02")>=0){
            					%>
            		   				<b>Password Updated!</b><br>
            					<%
            				}
            				if(success.indexOf("03")>=0){
            					%>
            			   			<b>Source & Destination Deleted.</b><br>
            					<%
            				}
            				if(success.indexOf("04")>=0){
            					%>
            			   			<b>Airline Deleted.</b><br>
            					<%
            				}
            				if(success.indexOf("05")>=0){
            					%>
            			   			<b>Flight Deleted.</b><br>
            					<%
            				}
            				
            				%>
            				</div>
            				<%
            			}
                        %>
                        <%
                        String error = request.getParameter("error");
                		
            			if(error!=null){
            				%>
            					<div class="alert alert-danger" role="alert">
            				<%
            				if(error.indexOf("01")>=0){
            					%>
            			   			<b>Error updating password. Please try again.</b><br>
            					<%
            				}
            				if(error.indexOf("02")>=0){
            					%>
            			   			<b>Error deleting source & destination. Please try again.</b><br>
            					<%
            				}
            				if(error.indexOf("03")>=0){
            					%>
            			   			<b>Error deleting airline. Please try again.</b><br>
            					<%
            				}
            				if(error.indexOf("04")>=0){
            					%>
            			   			<b>Error deleting airport. Please try again.</b><br>
            					<%
            				}
            				%>
            				</div>
            				<%
            			}
                        %>
                        <%
                        if(nullcheck!=null){
                        Integer pg_id = Integer.parseInt(request.getParameter("pg"));
                        if(pg_id==1){ //Sources and Destinations aka Airports
                        	//TABLE COLUMN NAMES
                    		%>
                    		<h4 class="text-primary mt-0">Sources and Destinations</h4>
                    		<hr class="divider divider-primary" />
                    		<table class="table table-striped table-hover">
								<thead>
									<tr>
								    	<th scope="col">Airport Id</th>
								      	<th scope="col">Airport Name</th>
								      	<th scope="col">Country Code</th>
								      	<th scope="col">Region Code</th>
								      	<th scope="col">IATA Code</th>
								      	<th scope="col">City Name</th>
								      	<th></th>
								   	</tr>
								</thead>
								<tbody>
                    		<%
                    		for(Airport a : airports){
                    			%>
                    			<tr>
									<th scope="row"><%=a.getAirport_id() %></th>
								    <td><%=a.getAirport_name() %></td>
								    <td><%=a.getIso_country() %></td>
								    <td><%=a.getIso_region() %></td>
								    <td><%=a.getIata_code() %></td>
								    <td><%=a.getCity_name() %></td>
								    <td><a class="btn btn-primary btn-sm" href="/FlyAway/dist/adminOps?op=4&airport_id=<%=a.getAirport_id() %>">Delete Location</a></td>
								</tr>
                    			<%
                    		}
                    		//END TABLE
                    		%>
                    		 </tbody>
						</table>
                    	<%
                    	se.close();
                    	} else if(pg_id==2){ //Airlines
                    		//TABLE COLUMN NAMES
                    		%>
                    		<h4 class="text-primary mt-0">Airline Company List</h4>
                    		<hr class="divider divider-primary" />
                    		<table class="table table-striped table-hover">
								<thead>
									<tr>
								    	<th scope="col">Airline Id</th>
								      	<th scope="col">Airline Company Name</th>
								      	<th></th>
								   	</tr>
								</thead>
								<tbody>
                    		<%
                    		for(Airline a : airlines){	
                    			%>
                    			<tr>
									<th scope="row"><%=a.getAirline_id() %></th>
								    <td><%=a.getCompanyName() %></td>
								     <td><a class="btn btn-primary btn-sm" href="/FlyAway/dist/adminOps?op=5&airline_id=<%=a.getAirline_id() %>">Delete Airline</a></td>
								</tr>
                    			
                    			<%
                    		}
                    		
                    		//END TABLE
                    		%>
                    		 </tbody>
						</table>
                    	<%
                    	se.close();
                    	} else if (pg_id==3) { //Flights
                    		//TABLE COLUMN NAMES
                    		%>
                    		<h4 class="text-primary mt-0">All Flights List</h4>
                    		<hr class="divider divider-primary" />
                    		<table class="table table-striped table-hover">
								<thead>
									<tr>
								    	<th scope="col">Flight Number</th>
								      	<th scope="col">Airline Name</th>
								      	<th scope="col">Arrive City</th>
								      	<th scope="col">Arrive Airport</th>
								      	<th scope="col">Capacity</th>
								      	<th scope="col">Date & Time</th>
								      	<th scope="col">Depart City</th>
								      	<th scope="col">Depart Airport</th>
								      	<th scope="col">Terminal</th>
								      	<th scope="col">Gate</th>
								      	<th scope="col">Price</th>
								      	<th scope="col"></th>
								      	
								   	</tr>
								</thead>
								<tbody>
                    		
                    		
                    		<%
							for(Flight f : flights){
								//ROW GENERATION
                    			%>
									<tr>
								      <th scope="row"><%=f.getFlightId() %></th>
								      <td><%=f.getAirlineName() %></td>
								      <td><%=f.getArriveCity() %></td>
								      <td><%=f.getArriveAirport() %></td>
								      <td><%=f.getCapacity() %></td>
								      <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="<%=f.getDateTime() %>" /></td>
								      <td><%=f.getDepartCity() %></td>
								      <td><%=f.getDepartAirport() %></td>
								      <td><%=f.getTerminal() %></td>
								      <td><%=f.getGate() %></td>
								      <td><%=f.getPrice() %></td>
								      <td><a class="btn btn-primary btn-sm" href="/FlyAway/dist/adminOps?op=6&flight_id=<%=f.getFlightId() %>">Delete Flight</a></td>
								    </tr>
                    			<%
                    		}
                    		
                    		//END TABLE
                    		%>
                    		 </tbody>
						</table>
                    		<%
                    		se.close();
                    		
                    	} else if (pg_id==4) { // change pw
                    	%>
                    	<p>To reset your password, please login.
                		<form method="post" action="/FlyAway/dist/adminOps?op=3">
							<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
								    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
								 </div>
								<input name="username" class="form-control" placeholder="Username" type="text">
							</div> <!-- input-group.// -->
							</div> <!-- form-group// -->
							<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
								    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
								 </div>
							    <input class="form-control mb-5" placeholder="Current Password" type="password" name="password">
							</div> <!-- input-group.// -->
							</div> <!-- form-group// -->
							<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
								    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
								 </div>
							    <input class="form-control mb-5" placeholder="New Password" type="password" name="newPassword">
							</div> <!-- input-group.// -->
							</div> <!-- form-group// -->
							<div class="form-group">
							<button type="submit" class="btn btn-primary btn-block mb-3"> Update </button>
							</div> <!-- form-group// -->
						</form>
                		<%
                    		
                    	} 
                        } else {
                    		%>
							<p>Choose an option from the navbar.</p>
                            <%
                    	}
                        
                        
                        %>
                        
                    </div>
                </div>
            </div>
        </section>
        <% se.close(); %>
<!-- Footer-->
        <footer class="bg-light py-5">
            <div class="container px-4 px-lg-5"><div class="small text-center text-muted">Copyright &copy; 2021 - FlyAway</div></div>
            <div class="container px-4 px-lg-5"><div class="small text-center text-muted"><a href="https://startbootstrap.com/theme/creative/" target="_blank">Download this theme at Start Bootstrap</a></div></div>
            <div class="container px-4 px-lg-5"><div class="small text-center text-muted">Background Image Credit: <a href="https://commons.wikimedia.org/wiki/File:Flight-travelling-airplane_(23698289143).jpg" target="_blank">pixellaphoto</a></div></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- SimpleLightbox plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
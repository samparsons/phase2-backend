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
<%
	List<Airport> airports = new ArrayList<Airport>();
	List<Airline> airlines = new ArrayList<Airline>();
	List<Flight> flights = new ArrayList<Flight>();
	Session se = HibernateUtil.getSessionFactory().openSession();
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
        <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="#page-top">FlyAway</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto my-2 my-lg-0">
                        <li class="nav-item"><a class="nav-link" href="/FlyAway/dist/datagen">Generate Flights</a></li>
                        <li class="nav-item"><a class="nav-link" href="/FlyAway/dist/login.html">Admin Login</a></li>
                        <li class="nav-item"><a class="nav-link" href="/FlyAway/dist/admin.jsp?pg=1">Sources and Destinations</a></li>
                        <li class="nav-item"><a class="nav-link" href="/FlyAway/dist/admin.jsp?pg=2">Airline List</a></li>
                        <li class="nav-item"><a class="nav-link" href="/FlyAway/dist/admin.jsp?pg=3">Flight List</a></li>
                    </ul>
                </div>
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
                        //error handling block here.
                        %>
                        <%
                        if(pg_id==1){ //Sources and Destinations aka Airports
                    		for(Airport a : airports){
                    			%>
                    			<%
                    		}
                    	} else if (pg_id==2) { //Airlines
							for(Airline a : airlines){
                    			%>
                    			<%
                    		}

                    	} else if (pg_id==3) { //Flights
							for(Flight f : flights){
                    			%>
                    			<%
                    		}
                    	} else if (pg_id==4) {
                			%>
                			<%
                    		// change pw
                    	}
                        
                        
                        %>
                        <a href="/FlyAway/dist/admin.jsp?pg=4">Change Password</a>
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
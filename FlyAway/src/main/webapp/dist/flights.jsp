<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>FlyAway - Flights</title>
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
                <a class="navbar-brand" href="/FlyAway/dist/index.html">FlyAway</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                  <!--  navbar if I need it later.
                    <ul class="navbar-nav ms-auto my-2 my-lg-0">
                        <li class="nav-item"><a class="nav-link" href="/FlyAway/dist/index.html">Home</a></li>
                    </ul>
                     -->
                </div>
            </div>
        </nav>
        <!-- Masthead-->
        <section class="page-section bg-light" id="book">
            <div class="container px-5 px-lg-5">
                <div class="row gx-5 gx-lg-5 justify-content-center">
                    <div class="col-lg-12 text-center">
                    <table class="table table-striped table-hover">
						<thead>
							<tr>
						    	<th scope="col">Flight Number</th>
						      	<th scope="col">Airline Name</th>
						      	<th scope="col">Arrive City</th>
						      	<th scope="col">Arrive Airport</th>
						      	<th scope="col">Depart City</th>
						      	<th scope="col">Depart Airport</th>
						      	<th scope="col">Price</th>
						      	<th scope="col"></th>
						      	
						   	</tr>
						</thead>
						<tbody>
						
						<% 
						//START JAVA
							
							//handle date reformat
							String in = request.getParameter("date");
							SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
							Date convertDate = sdf.parse(in);
							SimpleDateFormat queryDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
							String date = queryDate.format(convertDate);
							Date date1 = queryDate.parse(date);
							Date date2 = queryDate.parse(date);
							
							//convert date2 to calendar to add hours,min,sec
							Calendar c = Calendar.getInstance();
        					c.setTime(date2);
        					c.add(Calendar.HOUR, 23);
        			        c.add(Calendar.MINUTE, 59);
        			        c.add(Calendar.SECOND, 59);
        			        
        			        date2 = c.getTime();

							
							
							String depart = request.getParameter("depart");
							String arrive = request.getParameter("arrive");
							Integer capacity = Integer.parseInt(request.getParameter("capacity"));
							
							
							
							//DEBUG
							System.out.println("date1: "+date1);
							System.out.println("date1: "+date2);
							System.out.println("depart: "+depart);
							System.out.println("arrive: "+arrive);
							System.out.println("capacity: "+capacity);
							
							
							Session se = HibernateUtil.getSessionFactory().openSession();
					    	se.beginTransaction();
							CriteriaBuilder cb = se.getCriteriaBuilder();
							CriteriaQuery<Flight> cr = cb.createQuery(Flight.class);
							Root<Flight> root = cr.from(Flight.class);
							/* helpful link: https://www.baeldung.com/hibernate-criteria-queries*/

							Predicate equalsArriveCity = cb.equal(root.get("arriveCity"),arrive);
							Predicate equalsDepartCity = cb.equal(root.get("departCity"),depart);
							Predicate hasCapacity = cb.ge(root.<Integer>get("capacity"),capacity);
							Predicate gtDate = cb.greaterThanOrEqualTo(root.<Date>get("dateTime"),date1);
							Predicate ltDate = cb.lessThanOrEqualTo(root.<Date>get("dateTime"),date2);
							
							cr.select(root).where(cb.and(equalsArriveCity,equalsDepartCity,hasCapacity,gtDate,ltDate));
							Query<Flight> query = se.createQuery(cr);
				            List<Flight> flights = query.getResultList();
				            for(Flight f : flights) {
		            	%>
						
						<tr>
					      <th scope="row"><%=f.getFlightId() %></th>
					      <td><%=f.getAirlineName() %></td>
					      <td><%=f.getArriveCity() %></td>
					      <td><%=f.getArriveAirport() %></td>
					      <td><%=f.getDepartCity() %></td>
					      <td><%=f.getDepartAirport() %></td>
					      <td><%=f.getPrice() %></td>
					      
					      <td><a class="btn btn-primary btn-sm" href="registration.jsp?flight_id=<%=f.getFlightId() %>">Choose Flight</a></td>
					    </tr>
						
						
						<%		
							}//close for loop
					    	se.close();
						  
						//END JAVA
						%>
						  </tbody>
						</table>
                    </div>
                </div>
            </div>
        </section>
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
        <script>
		    $(document).ready(function(){
		        var date_input=$('input[name="date"]'); //our date input has the name "date"
		        var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
		        date_input.datepicker({
		            format: 'mm/dd/yyyy',
		            container: container,
		            todayHighlight: true,
		            autoclose: true,
		        })
		    })
		</script>
    </body>
</html>

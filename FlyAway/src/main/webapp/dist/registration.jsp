<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="util.HibernateUtil" %>
<%@ page import="tables.Flight" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Session se = HibernateUtil.getSessionFactory().openSession();
	int flight_id = Integer.parseInt(request.getParameter("flight_id"));
	Flight f = se.load(Flight.class,flight_id);
	
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>FlyAway - Registration</title>
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
                        <li class="nav-item"><a class="nav-link" href="/FlyAway/dist/datagen">Generate Test Data</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Customer Registration -->
        <section class="page-section bg-light" id="register">
            <div class="container px-5 px-lg-5">
                <div class="row gx-5 gx-lg-5 justify-content-center">
                    <div class="col-lg-12 text-center">
                        <h2 class="text-primary mt-0">Customer Registration</h2>
                        <hr class="divider divider-primary" />
                        <%
                        //error handling block here.
                        %>
                        <form class="row g-3 align-items-center" action="register" method="POST">
					    	<div class="col-auto">
					      		<input type="text" class="form-control" placeholder="First Name" name="depart"  id="date">
					    	</div>
					    	<div class="col-auto">
					      		<input type="text" class="form-control" placeholder="Last Name" name="arrive"  id="date">
					    	</div>
					    	<div class="col-auto">
						    	<div class="input-group flex-nowrap">
								  <label for="birth_date" class="visually-hidden">Birth Date</label>
						    		<span class="input-group-text" id="addon-wrapping">
				                        <i class="fa fa-user-circle-o">
				                        </i>
				                    </span>
						    		<input class="form-control" id="birth_date" name="birth_date" placeholder="DOB - MM/DD/YYY" type="text" aria-label="date" aria-describedby="addon-wrapping"/>
								</div>
					    	</div>
					    	<div class="col-auto">
					      		<input type="text" class="form-control" placeholder="Street Address" name="st_address"  id="st_address">
					    	</div>
					    	<div class="col-auto">
					      		<input type="text" class="form-control" placeholder="Age" name="age"  id="age">
					    	</div>
					    	<div class="col-auto">
					      		<select class="form-select" aria-label="Gender" name="gender" id="gender">
									<option selected>Gender</option>
								  	<option value="1">Male</option>
								  	<option value="2">Female</option>
								  	<option value="3">Prefer not to Say</option>
								</select>
							</div>
							<div class="col-auto">
					      		<select class="form-select" aria-label="ID Type" name="id_type" id="id_type">
									<option selected>ID Type</option>
								  	<option value="1">Drivers License</option>
								  	<option value="2">ID Card</option>
								  	<option value="2">Military ID</option>
								  	<option value="3">Passport</option>
								</select>
							</div>
							<div class="col-auto">
					      		<input type="text" class="form-control" placeholder="ID Number" name="id_num"  id="id_num">
					    	</div>
					    	<div class="col-auto">
						    	<div class="input-group flex-nowrap">
								  <label for="id_exp_date" class="visually-hidden">Exp Date</label>
						    		<span class="input-group-text" id="addon-wrapping">
				                        <i class="fa fa-id-card-o">
				                        </i>
				                    </span>
						    		<input class="form-control" id="id_exp_date" name="id_exp_date" placeholder="EXP - MM/DD/YYY" type="text" aria-label="date" aria-describedby="addon-wrapping"/>
								</div>
					    	</div>
					    	<button type="submit" class="btn btn-secondary col-auto">Submit</button>
						</form>
                    </div>
                </div>
            </div>
        </section>
        <!-- Flight Info -->
        <section class="page-section bg-light" id="flight_info">
            <div class="container px-5 px-lg-5">
                <div class="row gx-5 gx-lg-5 justify-content-center">
                    <div class="col-lg-12 text-center">
                        <h4 class="text-primary mt-0">Flight Information</h4>
                        <hr class="divider divider-primary" />
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
						   		</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row"><%=f.getFlightId() %></th>
								    <td><%=f.getAirlineName() %></td>
								    <td><%=f.getArriveCity() %></td>
								    <td><%=f.getArriveAirport() %></td>
								    <td><%=f.getDepartCity() %></td>
								    <td><%=f.getDepartAirport() %></td>
								    <td><%=f.getPrice() %></td>
						    	</tr>
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
		        var date_input=$('input[name="birth_date"]'); //our date input has the name "date"
		        var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
		        date_input.datepicker({
		            format: 'mm/dd/yyyy',
		            container: container,
		            todayHighlight: true,
		            autoclose: true,
		        })
		    })
		    $(document).ready(function(){
		        var date_input=$('input[name="id_exp_date"]'); //our date input has the name "date"
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
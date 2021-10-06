<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>FlyAway - Begin Your Adventure</title>
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
                    <ul class="navbar-nav ms-auto my-2 my-lg-0">
                        <li class="nav-item"><a class="nav-link" href="/FlyAway/dist/datagen">Generate Flights</a></li>
                        <li class="nav-item"><a class="nav-link" href="/FlyAway/dist/login.jsp">Admin Login</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Masthead-->
        <header class="masthead">
            <div class="container px-4 px-lg-5 h-100">
                <div class="row gx-4 gx-lg-5 h-75 align-items-center justify-content-center text-center">
                    <div class="col-lg-8 align-self-end">
                        <h1 class="text-white font-weight-bold">Admin Login</h1>
                    
                    </div>
                    <!-- login form from: https://bootsnipp.com/snippets/j6r4X 
                    -->
                    <%
                    String error = request.getParameter("error");
                    String success = request.getParameter("success");
                    
                    if(error!=null){
                    	if(error.equals("1")){
                    	%>
                    	<div class="alert alert-danger" role="alert">
							<b>Login Unsuccessful. Please contact admin services to validate your login.<b><br> 
                    		Testers: If you're having issues, please click "Create Credentials to Test" link below, then use username 'admin' and password 'admin' to access the admin portal.
						</div>
                    	
                    	<%
                    	} else if(error.equals("2")){
                    	%>
                    		<div class="alert alert-danger" role="alert">
							<b>Credentials already exist.<b><br> 
                    		Use username 'admin' and password 'admin' to access the admin portal.
						</div>
                    	<%
                    	}
                    }
                    
                    if(success!=null){
                    	
                    	%>
                    	<div class="alert alert-success" role="alert">
                    	<%
                    	if(success.equals("1")){
                    		%>
							<b>Credentials Created!<b><br>
							<% 
                    	}
                    	if(success.equals("2")){
                    		%>
							<b>Credentials Updated!<b><br>
							<% 
                    	}
							%>
                    		Use username 'admin' and password 'admin' to access the admin portal.
						</div>
                    	<%
                    }
                    
                    %>
                    <div class="card">
						<article class="card-body">
							<h4 class="card-title text-center mb-4 mt-1">Sign in</h4>
							<hr>

							<p class="text-center"><a href="/FlyAway/dist/adminOps?op=1" class="btn btn-primary btn-block mb-3">Create or Update Test Credentials</a></p>
							<p class="text-center">Once you've generated credentials, use 'admin' for username and password.</p>
							<h6>Enter your admin credentials.</h6>
							<form method="post" action="/FlyAway/dist/adminOps?op=2">
							<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
								    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
								 </div>
								<input name="username" class="form-control" placeholder="admin" type="text">
							</div> <!-- input-group.// -->
							</div> <!-- form-group// -->
							<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
								    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
								 </div>
							    <input class="form-control mb-5" placeholder="admin" type="password" name="password">
							</div> <!-- input-group.// -->
							</div> <!-- form-group// -->
							<div class="form-group">
							<button type="submit" class="btn btn-primary btn-block mb-3"> Login </button>
							</div> <!-- form-group// -->
							</form>
						</article>
					</div> <!-- card.// -->
                </div>
            </div>
        </header>
       
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

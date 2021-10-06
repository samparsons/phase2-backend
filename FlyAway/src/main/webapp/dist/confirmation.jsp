<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="util.HibernateUtil" %>
<%@ page import="tables.Flight" %>
<%@ page import="tables.Customer" %>
<%@ page import="tables.Payment" %>
<%@ page import="tables.Airport" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<!-- 
FOR TICKET: 
Copyright (c) 2021 by Lennart Hase (https://codepen.io/motorlatitude/pen/JhuoB)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
-->
<html>
<head>
	<meta charset="UTF-8">
	<title>Flight Confirmed</title>
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

	<style>
		body{
		  margin: 0;
		  padding: 0;
		  background: #fff;
		}
		
		.box{
		  position: absolute;
		  top: auto;

		  left: auto;

		}
		
		.ticket{
		  width: 800px;
		  height: 350px;
		  background: #FFB300;
		  border-radius: 3px;
		  box-shadow: 0 0 100px #aaa;
		  border-top: 1px solid #E89F3D;
		  border-bottom: 1px solid #E89F3D;
		}
		
		.left{
		  margin: 0;
		  padding: 0;
		  list-style: none;
		  position: absolute;
		  top: 0px;
		  left: -5px;
		}
		
		.left li{
		  width: 0px;
		  height: 0px;
		}
		
		.left li:nth-child(-n+2){
		  margin-top: 8px;
		  border-top: 5px solid transparent;
		  border-bottom: 5px solid transparent; 
		  border-right: 5px solid #FFB300;
		}
		
		.left li:nth-child(3),
		.left li:nth-child(6){
		  margin-top: 8px;
		  border-top: 5px solid transparent;
		  border-bottom: 5px solid transparent; 
		  border-right: 5px solid #EEEEEE;
		}
		
		.left li:nth-child(4){
		  margin-top: 8px;
		  margin-left: 2px;
		  border-top: 5px solid transparent;
		  border-bottom: 5px solid transparent; 
		  border-right: 5px solid #EEEEEE;
		}
		
		.left li:nth-child(5){
		  margin-top: 8px;
		  margin-left: -1px;
		  border-top: 6px solid transparent;
		  border-bottom: 6px solid transparent; 
		  border-right: 6px solid #EEEEEE;
		}
		
		.left li:nth-child(7),
		.left li:nth-child(9),
		.left li:nth-child(11),
		.left li:nth-child(12){
		  margin-top: 7px;
		  border-top: 5px solid transparent;
		  border-bottom: 5px solid transparent; 
		  border-right: 5px solid #E5E5E5;
		}
		
		.left li:nth-child(8){
		  margin-top: 7px;
		  margin-left: 2px;
		  border-top: 5px solid transparent;
		  border-bottom: 5px solid transparent; 
		  border-right: 5px solid #E5E5E5;
		}
		
		.left li:nth-child(10){
		  margin-top: 7px;
		  margin-left: 1px;
		  border-top: 5px solid transparent;
		  border-bottom: 5px solid transparent; 
		  border-right: 5px solid #E5E5E5;
		}
		
		.left li:nth-child(13){
		  margin-top: 7px;
		  margin-left: 2px;
		  border-top: 5px solid transparent;
		  border-bottom: 5px solid transparent; 
		  border-right: 5px solid #FFB300;
		}
		
		.left li:nth-child(14){
		  margin-top: 7px;
		  border-top: 5px solid transparent;
		  border-bottom: 5px solid transparent; 
		  border-right: 5px solid #FFB300;
		}
		
		.right{
		  margin: 0;
		  padding: 0;
		  list-style: none;
		  position: absolute;
		  top: 0px;
		  right: -5px;
		}
		
		.right li:nth-child(-n+2){
		  margin-top: 8px;
		  border-top: 5px solid transparent;
		  border-bottom: 5px solid transparent; 
		  border-left: 5px solid #FFB300;
		}
		
		.right li:nth-child(3),
		.right li:nth-child(4),
		.right li:nth-child(6){
		  margin-top: 8px;
		  border-top: 5px solid transparent;
		  border-bottom: 5px solid transparent; 
		  border-left: 5px solid #EEEEEE;
		}
		
		.right li:nth-child(5){
		  margin-top: 8px;
		  margin-left: -2px;
		  border-top: 5px solid transparent;
		  border-bottom: 5px solid transparent; 
		  border-left: 5px solid #EEEEEE;
		}
		
		.right li:nth-child(8),
		.right li:nth-child(9),
		.right li:nth-child(11){
		  margin-top: 7px;
		  border-top: 5px solid transparent;
		  border-bottom: 5px solid transparent; 
		  border-left: 5px solid #E5E5E5;
		}
		
		.right li:nth-child(7){
		  margin-top: 7px;
		  margin-left: -3px;
		  border-top: 5px solid transparent;
		  border-bottom: 5px solid transparent; 
		  border-left: 5px solid #E5E5E5;
		}
		
		.right li:nth-child(10){
		  margin-top: 7px;
		  margin-left: -2px;
		  border-top: 5px solid transparent;
		  border-bottom: 5px solid transparent; 
		  border-left: 5px solid #E5E5E5;
		}
		
		.right li:nth-child(12){
		  margin-top: 7px;
		  border-top: 6px solid transparent;
		  border-bottom: 6px solid transparent; 
		  border-left: 6px solid #E5E5E5;
		}
		
		.right li:nth-child(13),
		.right li:nth-child(14){
		  margin-top: 7px;
		  border-top: 5px solid transparent;
		  border-bottom: 5px solid transparent; 
		  border-left: 5px solid #FFB300;
		}
		
		.ticket:after{
		  content: '';
		  position: absolute;
		  right: 200px;
		  top: 0px;
		  width: 2px;
		  height: 250px;
		  box-shadow: inset 0 0 0 #FFB300,
		    inset 0 -10px 0 #B56E0A,
		    inset 0 -20px 0 #FFB300,
		    inset 0 -30px 0 #B56E0A,
		    inset 0 -40px 0 #FFB300,
		    inset 0 -50px 0 #999999,
		    inset 0 -60px 0 #E5E5E5,
		    inset 0 -70px 0 #999999,
		    inset 0 -80px 0 #E5E5E5,
		    inset 0 -90px 0 #999999,
		    inset 0 -100px 0 #E5E5E5,
		    inset 0 -110px 0 #999999,
		    inset 0 -120px 0 #E5E5E5,
		    inset 0 -130px 0 #999999,
		    inset 0 -140px 0 #E5E5E5,
		    inset 0 -150px 0 #B0B0B0,
		    inset 0 -160px 0 #EEEEEE,
		    inset 0 -170px 0 #B0B0B0,
		    inset 0 -180px 0 #EEEEEE,
		    inset 0 -190px 0 #B0B0B0,
		    inset 0 -200px 0 #EEEEEE,
		    inset 0 -210px 0 #B0B0B0,
		    inset 0 -220px 0 #FFB300,
		    inset 0 -230px 0 #B56E0A,
		    inset 0 -240px 0 #FFB300,
		    inset 0 -250px 0 #B56E0A;
		}
		
		.ticket:before{
		  content: '';
		  position: absolute;
		  z-index: 5;
		  right: 199px;
		  top: 0px;
		  width: 1px;
		  height: 250px;
		  box-shadow: inset 0 0 0 #FFB300,
		    inset 0 -10px 0 #F4D483,
		    inset 0 -20px 0 #FFB300,
		    inset 0 -30px 0 #F4D483,
		    inset 0 -40px 0 #FFB300,
		    inset 0 -50px 0 #FFFFFF,
		    inset 0 -60px 0 #E5E5E5,
		    inset 0 -70px 0 #FFFFFF,
		    inset 0 -80px 0 #E5E5E5,
		    inset 0 -90px 0 #FFFFFF,
		    inset 0 -100px 0 #E5E5E5,
		    inset 0 -110px 0 #FFFFFF,
		    inset 0 -120px 0 #E5E5E5,
		    inset 0 -130px 0 #FFFFFF,
		    inset 0 -140px 0 #E5E5E5,
		    inset 0 -150px 0 #FFFFFF,
		    inset 0 -160px 0 #EEEEEE,
		    inset 0 -170px 0 #FFFFFF,
		    inset 0 -180px 0 #EEEEEE,
		    inset 0 -190px 0 #FFFFFF,
		    inset 0 -200px 0 #EEEEEE,
		    inset 0 -210px 0 #FFFFFF,
		    inset 0 -220px 0 #FFB300,
		    inset 0 -230px 0 #F4D483,
		    inset 0 -240px 0 #FFB300,
		    inset 0 -250px 0 #F4D483;
		}
		
		.content{
		  position: absolute;
		  top: 40px;
		  width: 100%;
		  height: 270px;
		  background: #eee;
		}
		
		.airline{
		  position: absolute;
		  top: 10px;
		  left: 10px;
		  font-family: Arial;
		  font-size: 20px;
		  font-weight: bold;
		  color: rgba(0,0,102,1);
		}
		
		.boarding{
		  position: absolute;
		  top: 10px;
		  right: 220px;
		  font-family: Arial;
		  font-size: 18px;
		  color: rgba(255,255,255,0.6);
		}
		
		.jfk{
		  position: absolute;
		  top: 10px;
		  left: 20px;
		  font-family: Arial;
		  font-size: 38px;
		  color: #222;
		}
		
		.sfo{
		  position: absolute;
		  top: 10px;
		  left: 180px;
		  font-family: Arial;
		  font-size: 38px;
		  color: #222;
		}
		
		.plane{
		  position: absolute;
		  left: 105px;
		  top: 0px;
		}
		
		.sub-content{
		  background: #e5e5e5;
		  width: 100%;
		  height: 140px;
		  position: absolute;
		  top: 70px;
		}
		
		/*.watermark{
		  position: absolute;
		  left: 5px;
		  top: -10px;
		  font-family: Arial;
		  font-size: 110px;
		  font-weight: bold;
		  color: rgba(255,255,255,0.2);
		}*/
		
		.name{
		  position: absolute;
		  top: 10px;
		  left: 10px;
		  font-family: Arial Narrow, Arial;
		  font-weight: bold;
		  font-size: 14px;
		  color: #999;
		}
		
		.name span{
		  color: #555;
		  font-size: 17px;
		}
		
		.flight{
		  position: absolute;
		  top: 10px;
		  left: 180px;
		  font-family: Arial Narrow, Arial;
		  font-weight: bold;
		  font-size: 14px;
		  color: #999;
		}
		
		.flight span{
		  color: #555;
		  font-size: 17px;
		}
		
		.gate{
		  position: absolute;
		  top: 10px;
		  left: 280px;
		  font-family: Arial Narrow, Arial;
		  font-weight: bold;
		  font-size: 14px;
		  color: #999;
		}
		
		.gate span{
		  color: #555;
		  font-size: 17px;
		}
		
		
		.seat{
		  position: absolute;
		  top: 10px;
		  left: 350px;
		  font-family: Arial Narrow, Arial;
		  font-weight: bold;
		  font-size: 14px;
		  color: #999;
		}
		
		.seat span{
		  color: #555;
		  font-size: 17px;
		}
		
		.boardingtime{
		  position: absolute;
		  top: 60px;
		  left: 10px;
		  font-family: Arial Narrow, Arial;
		  font-weight: bold;
		  font-size: 14px;
		  color: #999;
		}
		
		.boardingtime span{
		  color: #555;
		  font-size: 17px;
		}
		
		.barcode{
		  position: absolute;
		  left: 8px;
		  bottom: 6px;
		  height: 30px;
		  width: 90px;
		  background: #222;
		  box-shadow: inset 0 1px 0 #FFB300, inset -2px 0 0 #FFB300,
		    inset -4px 0 0 #222,
		    inset -5px 0 0 #FFB300,
		    inset -6px 0 0 #222,
		    inset -9px 0 0 #FFB300,
		    inset -12px 0 0 #222,
		    inset -13px 0 0 #FFB300,
		    inset -14px 0 0 #222,
		    inset -15px 0 0 #FFB300,
		    inset -16px 0 0 #222,
		    inset -17px 0 0 #FFB300,
		    inset -19px 0 0 #222,
		    inset -20px 0 0 #FFB300,
		    inset -23px 0 0 #222,
		    inset -25px 0 0 #FFB300,
		    inset -26px 0 0 #222,
		    inset -26px 0 0 #FFB300,
		    inset -27px 0 0 #222,
		    inset -30px 0 0 #FFB300,
		    inset -31px 0 0 #222,
		    inset -33px 0 0 #FFB300,
		    inset -35px 0 0 #222,
		    inset -37px 0 0 #FFB300,
		    inset -40px 0 0 #222,
		    inset -43px 0 0 #FFB300,
		    inset -44px 0 0 #222,
		    inset -45px 0 0 #FFB300,
		    inset -46px 0 0 #222,
		    inset -48px 0 0 #FFB300,
		    inset -49px 0 0 #222,
		    inset -50px 0 0 #FFB300,
		    inset -52px 0 0 #222,
		    inset -54px 0 0 #FFB300,
		    inset -55px 0 0 #222,
		    inset -57px 0 0 #FFB300,
		    inset -59px 0 0 #222,
		    inset -61px 0 0 #FFB300,
		    inset -64px 0 0 #222,
		    inset -66px 0 0 #FFB300,
		    inset -67px 0 0 #222,
		    inset -68px 0 0 #FFB300,
		    inset -69px 0 0 #222,
		    inset -71px 0 0 #FFB300,
		    inset -72px 0 0 #222,
		    inset -73px 0 0 #FFB300,
		    inset -75px 0 0 #222,
		    inset -77px 0 0 #FFB300,
		    inset -80px 0 0 #222,
		    inset -82px 0 0 #FFB300,
		    inset -83px 0 0 #222,
		    inset -84px 0 0 #FFB300,
		    inset -86px 0 0 #222,
		    inset -88px 0 0 #FFB300,
		    inset -89px 0 0 #222,
		    inset -90px 0 0 #FFB300;
		}
		
		.slip{
		  left: 455px;
		}
		
		.nameslip{
		  top: 60px;
		  left: 410px;
		}
		
		.flightslip{
		  left: 410px;
		}
		
		.seatslip{
		  left: 540px;
		}
		
		.jfkslip{
		  font-size: 30px;
		  top: 20px;
		  left: 410px;
		}
		
		.sfoslip{
		  font-size: 30px;
		  top: 20px;
		  left: 530px;
		}
		
		.planeslip{
		  top: 10px;
		  left: 475px;
		}
		
		.airlineslip{
		  left: 455px;
		}

	</style>
</head>
<body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="/FlyAway/dist/index.html">FlyAway</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto my-2 my-lg-0">
                        <li class="nav-item"><a class="nav-link" href="/FlyAway/dist/index.html">Home</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Masthead-->
        <header class="masthead">
            <div class="container px-4 px-lg-5 h-200">
                <div class="row gx-4 gx-lg-5 h-50 align-items-center justify-content-center text-center">
                    <div class="col-lg-8 align-self-end">
                        <h1 class="text-white font-weight-bold">Your Adventure Begins Now!</h1>
                   </div>
                    <div class="col-lg-8 align-self-end">
                   
                        <div class="box">
						  <ul class="left">
						    <li></li>
						    <li></li>
						    <li></li>
						    <li></li>
						    <li></li>
						    <li></li>
						    <li></li>
						    <li></li>
						    <li></li>
						    <li></li>
						    <li></li>
						    <li></li>
						    <li></li>
						    <li></li>
						  </ul>
						  
						  <ul class="right">
						    <li></li>
						    <li></li>
						    <li></li>
						    <li></li>
						    <li></li>
						    <li></li>
						    <li></li>
						    <li></li>
						    <li></li>
						    <li></li>
						    <li></li>
						    <li></li>
						    <li></li>
						    <li></li>
						  </ul>
						  <div class="ticket">
						  <% 
						  	Session se = HibernateUtil.getSessionFactory().openSession();
						  	int flight_id = Integer.parseInt(request.getParameter("flight_id"));
						  	int customer_id = Integer.parseInt(request.getParameter("customer_id"));
						  	int payment_id = Integer.parseInt(request.getParameter("payment_id"));
							Flight f = se.load(Flight.class,flight_id);
							Customer c = se.load(Customer.class,customer_id);
							Payment p = se.load(Payment.class,payment_id);
							Airport airport_arrive = f.getAirportArrive();
							Airport airport_depart = f.getAirportDepart();
							
							%>
						    <span class="airline"><%=f.getAirlineName() %></span>

						    <span class="boarding">Boarding pass</span>
						    <div class="content">
						      <span class="jfk"><%=airport_arrive.getIata_code()%></span>
						      <span class="plane"><?xml version="1.0" ?><svg clip-rule="evenodd" fill-rule="evenodd" height="60" width="60" image-rendering="optimizeQuality" shape-rendering="geometricPrecision" text-rendering="geometricPrecision" viewBox="0 0 500 500" xmlns="http://www.w3.org/2000/svg"><g stroke="#222"><line fill="none" stroke-linecap="round" stroke-width="30" x1="300" x2="55" y1="390" y2="390"/><path d="M98 325c-9 10 10 16 25 6l311-156c24-17 35-25 42-50 2-15-46-11-78-7-15 1-34 10-42 16l-56 35 1-1-169-31c-14-3-24-5-37-1-10 5-18 10-27 18l122 72c4 3 5 7 1 9l-44 27-75-15c-10-2-18-4-28 0-8 4-14 9-20 15l74 63z" fill="#222" stroke-linejoin="round" stroke-width="10"/></g></svg></span>
						      <span class="sfo"><%=airport_depart.getIata_code()%></span>
						      
						      <span class="jfk jfkslip"><%=airport_arrive.getIata_code()%></span>
						      <span class="plane planeslip"><?xml version="1.0" ?><svg clip-rule="evenodd" fill-rule="evenodd" height="50" width="50" image-rendering="optimizeQuality" shape-rendering="geometricPrecision" text-rendering="geometricPrecision" viewBox="0 0 500 500" xmlns="http://www.w3.org/2000/svg"><g stroke="#222"><line fill="none" stroke-linecap="round" stroke-width="30" x1="300" x2="55" y1="390" y2="390"/><path d="M98 325c-9 10 10 16 25 6l311-156c24-17 35-25 42-50 2-15-46-11-78-7-15 1-34 10-42 16l-56 35 1-1-169-31c-14-3-24-5-37-1-10 5-18 10-27 18l122 72c4 3 5 7 1 9l-44 27-75-15c-10-2-18-4-28 0-8 4-14 9-20 15l74 63z" fill="#222" stroke-linejoin="round" stroke-width="10"/></g></svg></span>
						      <span class="sfo sfoslip"><%=airport_depart.getIata_code()%></span>
						      <div class="sub-content">

						        <span class="name">PASSENGER NAME<br><span><%=c.getLastName()%>, <%=c.getFirstName()%></span></span>
						        <span class="flight">FLIGHT N&deg;<br><span>X3-65C3</span></span>
						        <span class="gate">TERMINAL<br><span><%=f.getTerminal() %></span></span>
						        <span class="seat">GATE<br><span><%=f.getGate() %></span></span>
						        <span class="boardingtime">BOARDING TIME<br><span><fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="<%=f.getDateTime() %>" /></span></span>
						            
						         <span class="flight flightslip">FLIGHT N&deg;<br><span>X3-65C3</span></span>
						          <span class="seat seatslip">GATE<br><span><%=f.getGate() %></span></span>
						         <span class="name nameslip">PASSENGER NAME<br><span><%=c.getLastName() %>, <%=c.getFirstName() %></span></span>
						      </div>
						    </div>
						    <div class="barcode"></div>
						    <div class="barcode slip"></div>
						    <% se.close(); %>
						  </div>
						</div>
					
                    </div>
                   
                </div>
            </div>
        </header>


</body>
</html>
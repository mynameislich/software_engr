<%-- 
    Document   : AddFlight
    Created on : Apr 10, 2017, 9:15:16 PM
    Author     : Emily
--%>

<%@page import="Model.Airport"%>
<%@page import="dao.AirportDataAccess"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.AirplaneDataAccess"%>
<%@page import="dao.AdminDataAccess"%>
<%@page import="Model.Airplanes"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Add Flights</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="../css/reset.css" type="text/css" media="all">
        <link rel="stylesheet" href="../css/layout.css" type="text/css" media="all">
        <link rel="stylesheet" href="../css/style.css" type="text/css" media="all">
        <script type="text/javascript" src="../js/jquery-1.4.2.js" ></script>
        <script type="text/javascript" src="../js/cufon-yui.js"></script>
        <script type="text/javascript" src="../js/cufon-replace.js"></script>
        <script type="text/javascript" src="../js/Myriad_Pro_italic_600.font.js"></script>
        <script type="text/javascript" src="../js/Myriad_Pro_italic_400.font.js"></script>
        <script type="text/javascript" src="../js/Myriad_Pro_400.font.js"></script>
        <!--[if lt IE 9]>
        <script type="text/javascript" src="js/ie6_script_other.js"></script>
        <script type="text/javascript" src="js/html5.js"></script>
        <![endif]-->
    </head>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="js/ie6_script_other.js"></script>
    <script type="text/javascript" src="js/html5.js"></script>
    <![endif]-->
</head>
<body id="page6">
    <!-- START PAGE SOURCE -->
    <div class="body1">
        <div class="main">
            <header>
                <div class="wrapper">
                    <h1><a href="/CS5800/index" id="logo">AirLines</a><span id="slogan">Wings For You</span></h1>
                    <div class="right">
                        <nav>
                            <ul id="menu">
                                <li><a href="/CS5800/index">Add Flights</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </header>
        </div>
    </div>

    <div class="main">
        <section id="content">
            <article class="col2 pad_left1">
                <h2>Please Set Flight </h2> <!-- Stopped here -->

                <form id="ContactForm" name="myForm" action="/CS5800/AddFlight"  method="post">
                    <div>
                        <div class="wrapper">
                            <div class="bg">
                                <input type="text" name="flightID" class="input">
                            </div>
                            *Flight ID:<br />
                        </div>
                        <div class="wrapper">
                            <div class="bg">
                                
                                <input class="form-control" id="date" name="arrivingTime" placeholder="MM/DD/YYY" type="text" required/>

                            </div>
                            *Arriving Time:<br />
                        </div>
                                                <div class="wrapper">
                            <div class="bg">
                                
                                <input class="form-control" id="date" name="departingTime" placeholder="MM/DD/YYY" type="text" required/>

                            </div>
                            *Departing Time:<br />
                        </div>
                        <div class="wrapper">
                            <div class="bg">

                                <select name="origin"  class="input" required>
                                    <%

                                        AirportDataAccess da = new AirportDataAccess();
                                        List airports = da.getAll();
                                        List names = new ArrayList();
                                        for (int i = 0; i < airports.size(); i++) {
                                            Airport temp = (Airport) airports.get(i);
                                            names.add(temp.getAbbr());
                                        }
                                        request.setAttribute("databaseList", names);
                                    %>
                                    <c:forEach items="${databaseList}" var="databaseValue">
                                        <option value="${databaseValue}">
                                            ${databaseValue}
                                        </option>
                                    </c:forEach>
                                </select><br>
                            </div>
                            *Origin:<br />
                        </div>
                        <div class="wrapper">
                            <div class="bg">
                                <select name="dest"  class="input" required>
                                    
                                    <c:forEach items="${databaseList}" var="databaseValue">
                                        <option value="${databaseValue}">
                                            ${databaseValue}
                                        </option>
                                    </c:forEach>
                                </select><br>
                            </div>
                            *Destination:<br />
                        </div>
                        <div class="wrapper">
                            <div class="bg">
                                <select name="AirplaneID"  class="input" required>
                                    <%
                                        AirplaneDataAccess Airplane_da = new AirplaneDataAccess();
                                        List planes = Airplane_da.getAll();
                                        List plane_names = new ArrayList();
                                        for (int i = 0; i < planes.size(); i++) {
                                            Airplanes temp = (Airplanes) planes.get(i);
                                            plane_names.add(temp.getDescription());
                                        }
                                        request.setAttribute("databaseList", plane_names);
                                    %>
                                    <c:forEach items="${databaseList}" var="databaseValue">
                                        <option value="${databaseValue}">
                                            ${databaseValue}
                                        </option>
                                    </c:forEach>
                                </select><br>
                            </div>
                            *Airplane: <br />
                        </div>
                        <p>  </p>
                        <div class="wrapper">
                            <div class="bg">
                                <input type="text" name="price" class="input" required>
                            </div>

                            *Price<br /><br />
                        </div>
                    <div class="wrapper">
                            <div class="bg">
                                <input type="text" name="frequency" class="input" required>
                            </div>

                            *Frequency<br /><br />
                        </div>
 
                        <input type="submit" value="Submit" class="button1">

                        </form>

                        </article>
                        </section>
                        <script>

                            window.onload = function () {
                                myFunction();
                            };

                            function validateForm() {

                                var message = "";
                                var x = document.forms["myForm"]["fname"].value;
                                if (x.search(/[a-zA-Z]/) == -1) {
                                    message = message + "Invalid first name input. Please re-enter using letters.\n";
                                }
                                var x = document.forms["myForm"]["lname"].value;
                                if (x.search(/[a-zA-Z]/) == -1) {
                                    message = message + "Invalid last name input. Please re-enter using letters.\n";
                                }



                                var x = document.forms["myForm"]["dob"].value;
                                /*if (isNaN(x)) {
                                 message = message + "Age must be a number\n";
                                 }  
                                 if (x > 110) {
                                 message = message + "Age entered is invalid. Please re-enter.\n";
                                 
                                 }*/
                                var x = document.forms["myForm"]["age"].value;

                                if (isNaN(x)) {
                                    message = message + "age must be a number\n";
                                }
                                if (x == "") {
                                    message = message + "age must be entered\n";
                                    document.forms["myForm"]["age"] = -1;
                                }
                                var x = document.forms["myForm"]["id"].value;
                                if (x == "") {
                                    message = message + "id must be entered\n";
                                    document.forms["myForm"]["id"] = -1;
                                }
                                var x = document.forms["myForm"]["address"].value;
                                if (x.search(/[0-9]/) == -1) {
                                    message = message + "The address must include a house/building number.\n";
                                }
                                if (x.search(/[a-zA-Z]/) == -1) {
                                    message = message + "The address must include a street name.\n";
                                }

                                var x = document.forms["myForm"]["zip"].value;
                                if (isNaN(x)) {
                                    message = message + "Invalid zip code. Zip codes must be 5 digits.\n";
                                }
                                if (x.length < 5) {
                                    message = message + "Zip code is too short, it must be 5 digits.\n";
                                }
                                if (x.length > 5) {
                                    message = message + "Zip code is too long, it must be 5 digits.\n";
                                }

                                var x = document.forms["myForm"]["phone"].value;
                                if (isNaN(x)) {
                                    message = message + "Phone number is invalid. Please re-enter using digits.\n";
                                }
                                if (x.length != 10) {
                                    message = message + "Phone number should be 10 digits.\n";
                                }

                                var x = document.forms["myForm"]["phoneBackup"].value;
                                if (x.length != 0) {
                                    if (isNaN(x)) {
                                        message = message + "Phone number backup is invalid. Please re-enter using digits.\n";
                                    }
                                    if (x.length != 10) {
                                        message = message + "Phone number backup should be 10 digits.\n";
                                    }
                                }

                                var x = document.forms["myForm"]["password"].value;
                                if (x.length < 8) {

                                    message = message + "password is too short, it must be at least 8 characters\n";
                                }
                                if (x.length > 50) {
                                    message = message + "password is too long\n";
                                    ;
                                }
                                if (x.search(/\d/) == -1) {
                                    message = message + "invalid password. Please include a number\n";
                                }
                                if (x.search(/[a-z]/) == -1) {
                                    message = message + "Invalid password. Please include a lower case letter\n";
                                }
                                if (x.search(/[A-Z]/) == -1) {
                                    message = message + "Invalid password. Please include an upper case letter\n";
                                }
                                if (x.search(/[!$%^&*()_+|~=`{}:/;<>?,.@#]/) == -1) {
                                    message = message + "Invalid password. Please include a special character\n";
                                }

                                var y = document.forms["myForm"]["passwordConfirmation"].value;
                                if (x != y) {
                                    message = message + "password must match password confirmation\n";
                                }

                                if (message != "") {
                                    alert(message);
                                    return false;
                                }



                            }






                        </script>
                    </div>
                    <div class="body2">
                        <div class="main">
                            <footer>
                                <div class="footerlink">
                                    <p class="lf">Copyright &copy; 2010  - All Rights Reserved</p>
                                    <p class="rf">Template from<a href="http://www.templatemonster.com/">TemplateMonster</a></p>
                                    <div style="clear:both;"></div>
                                </div>
                            </footer>
                        </div>
                    </div>
                    <script type="text/javascript"> Cufon.now();</script>
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
                    <script type="text/javascript">

                        (function () {

                            var bodyEl = $('body'),
                                    navToggleBtn = bodyEl.find('.nav-toggle-btn');

                            navToggleBtn.on('click', function (e) {
                                bodyEl.toggleClass('active-nav');
                                e.preventDefault();
                            });



                        })();


                    </script>
                    <!-- END PAGE SOURCE -->
                    </body>
                    </html>
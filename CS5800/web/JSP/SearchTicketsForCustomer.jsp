<%-- 
    Document   : SearchTickets
    Created on : Apr 16, 2017, 5:24:55 PM
    Author     : Emily 
--%>


<%@page import="Model.Airport"%>
<%@page import="dao.AirportDataAccess"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.TypeDataAccess"%>
<%@page import="Model.Airplane_type"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Search tickets for Customer</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" type="text/css" media="all">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css" type="text/css" media="all">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" media="all">
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.2.js" ></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/cufon-yui.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/cufon-replace.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/Myriad_Pro_italic_600.font.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/Myriad_Pro_italic_400.font.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/Myriad_Pro_400.font.js"></script>
        <!--  jQuery -->

        <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

        <!-- Isolated Version of Bootstrap, not needed if your site already uses Bootstrap -->
        <link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />

        <!-- Bootstrap Date-Picker Plugin -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>

        <script>
            $(document).ready(function () {
                var date_input = $('input[name="date"]'); //our date input has the name "date"
                var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
                var options = {
                    format: 'mm/dd/yyyy',
                    container: container,
                    todayHighlight: true,
                    autoclose: true,
                };
                date_input.datepicker(options);
            })
        </script>
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
<body id="page7">
    <!-- START PAGE SOURCE -->
    <div class="body1">
        <div class="main">
            <header>
                <div class="wrapper">
                    <h1><a href="/CS5800/index" id="logo">AirLines</a><span id="slogan">Wings For You</span></h1>
                    <div class="right">
                        <nav>
                            <ul id="menu">
                                <li><a href="/CS5800/index">Home</a></li>
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
                <h2>Enter your requirements for searching </h2> <!-- Stopped here -->

                <form id="ContactForm" name="myForm" action="/CS5800/Search" method="post">
                    <div>
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
                            *From:<br /> 

                        </div>
                        <div class="wrapper">
                            <div class="bg">

                                <select name="destination"  class="input" required>

                                    <c:forEach items="${databaseList}" var="databaseValue">
                                        <option value="${databaseValue}">
                                            ${databaseValue}
                                        </option>
                                    </c:forEach>
                                </select><br>
                            </div>
                            *To:<br /> 

                        </div>

                        <div class="wrapper">
                            <div class="bg">
                                <input class="form-control" id="date" name="departTime" placeholder="MM/DD/YYY" type="text"/>


                            </div>
                            *Depart :<br /><br />
                        </div> 

                        <div class="wrapper">
                            <div class="bg">
                                <input class="form-control" id="date" name="returnTime" placeholder="MM/DD/YYY" type="text"/>

                            </div>
                            *Return(leave it blank if it is one-way) :<br /><br />
                        </div> 
                    </div>
                    <input type="submit" value="Submit" class="button1">
                </form>

            </article>
        </section>

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


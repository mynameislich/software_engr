<%-- 
    Document   : SearchTickets
    Created on : Apr 16, 2017, 5:24:55 PM
    Author     : LICH
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
        <title>Search tickets</title>
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
                                <input type="text" name="departTime" class="input" required>
                            </div>

                            *Depart :<br /><br />
                        </div>           
                        <div class="wrapper">
                            <div class="bg">
                                <input type="text" name="returnTime" class="input" >
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


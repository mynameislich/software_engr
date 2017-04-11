<%-- 
    Document   : CheckFlight
    Created on : Apr 10, 2017, 9:15:16 PM
    Author     : LICH
--%>

<%@page import="Model.Flight"%>
<%@page import="dao.AdminDataAccess"%>
<%@page import="Model.Admin"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>All Flights</title>
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
                <h2> Flights table</h2> <!-- Stopped here -->
                <table>
                    <tr>
                           <td>Flight ID</td>
                           <td>Airplane</td>
                           <td>To</td>
                           <td>From</td>
                           <td>Price</td>
                           <td>Time</td>
                    <%
                        List result = (List)request.getAttribute("allFlights");
                        for (int i = 0; i < result.size(); i++) {
                            Flight temp = (Flight)result.get(i);
                            out.println(temp.getId());
                            out.println(temp.getAirplane_id());
                            out.println(temp.getDestination());
                            out.println(temp.getOrigin());
                            out.println(temp.getPrice());
                            out.println(temp.getTime());
                           
                    %>

                   
                           <td><%=temp.getId()%></td>
                           <td><%=temp.getAirplane_id()%></td>
                           <td><%=temp.getDestination()%></td>
                           <td><%=temp.getOrigin()%></td>
                           <td><%=temp.getPrice()%></td>
                           <td><%=temp.getTime()%></td>
                    </tr>

                    <%
                        }
                    %>

                </table>


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
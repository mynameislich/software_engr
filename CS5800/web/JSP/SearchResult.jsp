<%-- 
    Document   : SearchResult
    Created on : Apr 10, 2017, 9:15:16 PM
    Author     : LICH
--%>

<%@page import="java.util.ArrayList"%>
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" type="text/css" media="all">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css" type="text/css" media="all">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" media="all">
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.2.js" ></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/cufon-yui.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/cufon-replace.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/Myriad_Pro_italic_600.font.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/Myriad_Pro_italic_400.font.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/Myriad_Pro_400.font.js"></script><!--[if lt IE 9]>
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
                                <li><a href="/CS5800/index">Search Result</a></li>
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
                        <td>From</td>
                        <td>To</td>
                        <td>Departing time</td>
                        <td>Arriving time</td>
                        <td>Price</td>
                        <td>Flight(s)</td>

                    </tr>
                    <tr>

                        <%
                            String m_class = (String)request.getAttribute("class");
                            List<List<Flight>> result = (ArrayList) request.getAttribute("theFlights");
                            for (int i = 0; i < result.size(); i++) {
                                String origin = result.get(i).get(0).getOrigin();
                                String dest = result.get(i).get(result.get(i).size() - 1).getDestination();
                                String DepartingTime = result.get(i).get(0).getDepartingTime2();
                                String ArrivingTime = result.get(i).get(result.get(i).size() - 1).getArrivingTime2();
                                double price = 0.0;
                                String Flight_list = "";
                                for (int j = 0; j < result.get(i).size(); j++) {
                                    price = price + result.get(i).get(j).getPrice();
                                    Flight_list = Flight_list +  result.get(i).get(j).getFlight_id() + ": "+result.get(i).get(j).getOrigin() + " to " + result.get(i).get(j).getDestination() + " \n";
                                }
                                if(m_class == "First"){
                                    price = price * 10;
                                    
                                }else if(m_class == "Buss"){
                                    price = price * 5;
                                }
                            
                            
                        %>


                        <td><%=origin%></td>
                        <td><%=dest%></td>
                        <td><%=DepartingTime%></td>
                        <td><%=ArrivingTime%></td>
                        <td><%=price%></td>
                        <td><%=Flight_list%></td>
                    </tr>
                    <%}%>

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
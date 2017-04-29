<%-- 
    Document   : Admin
    Created on : Mar 5, 2017, 2:54:24 PM
    Author     : LICH
--%>

<%@page import="Model.User"%>
<%@page import="java.util.ArrayList"%>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
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
        <title>Wings Airline</title>
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
        <script type="text/javascript" src="js/ie6_script_other.js"></script>
        <script type="text/javascript" src="js/html5.js"></script>
        <![endif]-->
    </head>
    <body id="page5">
        <!-- START PAGE SOURCE -->
        <div class="body1">
            <div class="main">
                <header>
                    <div class="wrapper">
                        <h1><a href="/CS5800/JSP/profile.jsp" id="logo">AirLines</a><span id="slogan">Wings For You</span></h1>
                        <div class="right">
                            <nav>
                                <ul id="menu">
                                    <li><a href="/CS5800/JSP/Home.jsp">Home</a></li>
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

                    <%
                        User admin = (User) session.getAttribute("theUser");

                        
                        String name = "";

                        if (admin.getLog() == 1) {
                           name = admin.getFirstName()+ " " + admin.getLastName();
                        }
                        //System.out.println("id : " + name);



                    %>


                  <h2>Dear   <%=  name%><a href="/CS5800/JSP/SignUp.jsp">   profile</a></h2>
                    
                    <p>Stay hungry, Stay foolish</p>
                    
                    <a href="/CS5800/AllFlights"><h3>check flight</h3></a>
                    <a href="/CS5800/JSP/AddType.jsp"><h3>add airplane type</h3></a>
                    <a href="/CS5800/JSP/AddFlight.jsp"><h3>add flight</h3></a>
                    <a href="/CS5800/JSP/AddAirports.jsp"><h3>add Airport</h3></a>
                    <a href="/CS5800/JSP/AddAirplane.jsp"><h3>add aircraft</h3></a>
                    <a href="/CS5800/JSP/AddManager.jsp"><h3>assign manager</h3></a>
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

<%-- 
    Document   : Customer
    Created on : Mar 5, 2017, 2:54:24 PM
    Author     : LICH
--%>

<%@page import="java.util.ArrayList"%>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page import="dao.UserDataAccess"%>
<%@page import="Model.User"%>
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
    <body id="page5">
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

                    <%
                        User user = (User) session.getAttribute("theUser");

                        
                        String name = "";

                        if (user.getLog() == 1) {
                            name = " " + user.getFirstName() + " " + user.getLastName();
                        }
                        System.out.println("id : " + name);


                    %>


                    <h2>Dear   <%="      " + name%> <a href="/CS5800/JSP/SignUp.jsp">profile</a></h2>

                    <p> How can we help you with?</p>

                    <a href="/CS5800/JSP/SignUp.jsp"><h3>Search Tickets</h3></a>

                    <a href="/CS5800/JSP/SignUp.jsp"><h3>Past order</h3></a>

                    <a href="/CS5800/JSP/SignUp.jsp"><h3>Recommendation!</h3></a>


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
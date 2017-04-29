<%-- 
    Document   : AddAirports
    Created on : Apr 16, 2017, 10:10:28 AM
    Author     : LICH
--%>


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
        <title>Add airport</title>
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
                    <h1><a href="/CS5800/JSP/index.jsp" id="logo">Home</a><span id="slogan">Wings For You</span></h1>
                    <div class="right">
                        <nav>
                            <ul id="menu">
                                <li><a href="/CS5800/JSP/index.jsp">Home</a></li>
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
                <h2>Please add airport to database </h2> <!-- Stopped here -->

                <form id="ContactForm" name="myForm" action="/CS5800/AddAirport" method="post">
                    <div>
                        <div class="wrapper">
                            <div class="bg">
                                <input type="text" name="ID" class="input"required>
                            </div>
                            *ID:<br /> <!--display on screen = *Variable-->
                        </div>
                        <div class="wrapper">
                            <div class="bg">
                                <input type="text" name="name" class="input" required>
                               
                            </div>
                            * Airport Name:<br />
                        </div>
                        <div class="wrapper">
                            <div class="bg">
                                <input type="text" name="abbr" class="input" required>
                            </div>
                            *Airport Abbreviation: <br />
                        </div>
                        <div class="wrapper">
                            <div class="bg">
                                <input type="text" name="loc" class="input" required>
                            </div>
                            *Airport Address <br />
                        </div>
                        <input type="submit" value="Submit" class="button1">

                        </form>
                    </div>

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

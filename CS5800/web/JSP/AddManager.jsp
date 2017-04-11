<%-- 
    Document   : AddManager
    Created on : Apr 3, 2017, 7:19:53 PM
    Author     : colleengannon
--%>

<%@page import="dao.UserDataAccess"%>
<%@page import="Model.Admin"%>
<%--<%@page import="Model.Manager"%>--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Add Manager</title>
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
    </head>
    
    <body>
        <div class="body1">
            <div class="main">
              <header>
                <div class="wrapper">
                  <h1><a href="/CS5800/index" id="logo">AirLines</a><span id="slogan">Wings For You</span></h1>
                  <div class="right">
                    <nav>
                      <ul id="menu">
                        <li><a href="/CS5800/index">Register Manager</a></li>
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
                <h2>Please enter the email of the user to grant manager privileges to. </h2>

                <form id="ContactForm" name="myForm" action="../AddManager" method="post">
                  <div>
                    <div class="wrapper">
                      <div class="bg">
                        <input type="text" name="email" class="input" required>
                      </div>
                        *Email:<br />                      
                      <input type="submit" value="Submit" class="button1">
                    </div>
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
    </body>
    
</html>


<%--
    1. Change work ID from -1 (user) to 1 (manager) - assume already have an account
    2. Generate username & password
    3. Email generated username & password to new manager
--%>
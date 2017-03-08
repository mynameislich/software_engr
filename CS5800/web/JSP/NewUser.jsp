<%-- 
    Document   : NewUser
    Created on : Mar 5, 2017, 3:18:46 PM
    Author     : LICH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@page import="dao.UserDataAccess"%>
<%@page import="Model.User"%>
<%@page import="Model.MailSender"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Wings For You Airline| Confirmation</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
        <link rel="stylesheet" href="css/layout.css" type="text/css" media="all">
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all">
        <script type="text/javascript" src="js/jquery-1.4.2.js" ></script>
        <script type="text/javascript" src="js/cufon-yui.js"></script>
        <script type="text/javascript" src="js/cufon-replace.js"></script>
        <script type="text/javascript" src="js/Myriad_Pro_italic_600.font.js"></script>
        <script type="text/javascript" src="js/Myriad_Pro_italic_400.font.js"></script>
        <script type="text/javascript" src="js/Myriad_Pro_400.font.js"></script>
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
            <%

                String firstname = request.getParameter("fname");
                String lastname = request.getParameter("lname");
                String gender = request.getParameter("gender");
                String address = request.getParameter("address");
                String zip = request.getParameter("zip");
                String phone = request.getParameter("phone");
                String phoneBackup = request.getParameter("phoneBackup");
                String email = request.getParameter("email");
                String emailBackup = request.getParameter("emailBackup");
                String password = request.getParameter("password");
                password = Model.Password.encrypt(password);
                int id = -1;
                int age = -1;
                String value = request.getParameter("age");
                if (value.length() != 0) {
                    if (value.matches("^-?\\d+$")) {
                        age = Integer.parseInt(request.getParameter("age"));
                    }

                }
                value = request.getParameter("id");
                if (value.length() != 0) {
                    if (value.matches("^-?\\d+$")) {
                        id = Integer.parseInt(request.getParameter("id"));
                    }

                }


            %>
            <section id="content">
                <article class="col2 pad_left1">
                    <h2>Account Created, thank you!</h2>
                    <h3>please go to your email to check confirmation</h3>
                    <%          User n = new User(email, password, address, zip, firstname, lastname, 0,id, age,-1 , phone, gender, 0);

                        UserDataAccess da = new UserDataAccess();
                        da.addNewUser(n);
                        da.confirm(email, 0001);
                        //response.sendRedirect("/index");
                        MailSender send = new MailSender();
                        send.send(email, "0001");
                    %>
                    <form id="ContactForm" name="myForm" action="validate" method="post">
                        <div>
                            <div class="wrapper">
                                <div class="bg">
                                    <input type="email" name="email" class="input" required>
                                </div>
                                *Email:<br />
                            </div>
                            <div class="wrapper">
                                <div class="bg">
                                    <input type="code" name="code" class="input" required>
                                </div>
                                *code:<br />
                            </div>

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
        <!-- END PAGE SOURCE -->
    </body>
</html>
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

<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>adding user into database</title>
        <style type="text/css">

            * {
                margin: 0;
                padding: 0;
            }

            body {
                font-family: Open Sans, Arial, sans-serif;
                overflow-x: hidden;
            }

            nav {
                position: fixed;
                z-index: 1000;
                top: 0;
                bottom: 0;
                width: 200px;
                background-color: #036;
                transform: translate3d(-200px, 0, 0);
                transition: transform 0.4s ease;
            }
            .active-nav nav {
                transform: translate3d(0, 0, 0);
            }
            nav ul {
                list-style: none;
                margin-top: 100px;
            }
            nav ul li a {
                text-decoration: none;
                display: block;
                text-align: center;
                color: #fff;
                padding: 10px 0;
            }

            .nav-toggle-btn {
                display: block;
                position: absolute;
                left: 200px;
                width: 40px;
                height: 40px;
                background-color: #666;
            }

            .content {
                padding-top: 100px;
                height: 2000px;
                background-color: #ccf;
                transition: transform 0.4s ease;
            }
            .active-nav .content {
                transform: translate3d(200px, 0, 0);
            }


        </style>
    </head>

    <body>

        <div class="content" >
            <body>

                <br>
                <div style="width: 900px; margin-left: 40%; margin-right: auto">




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

                    <h1>Account Created, thank you!</h1>

                    <h3>please go to your email to check confirmation</h3>



                    <%                        
                        User n = new User(email, password, address, zip, firstname, lastname, 0, 0, id, age, phone, gender, 0);

                        UserDataAccess da = new UserDataAccess();
                        da.addNewUser(n);
                        da.confirm(email, 0001);
                        //response.sendRedirect("/index");
                        MailSender send = new MailSender();
                        send.send(email, "0001");
                    %>

                </div>
                    <div style="margin-left: 35%;background: rgba(255,255,255,.4);border-radius: 25px;border: 2px solid #a1a1a1;padding: 50px; width: 50%">
            <form name="myForm" action="validate" method="post">
                Email:<br>
                <input type="email" name="email" style="width: 100%" required><br>
                Confirmation Code:<br>
                <input type="code" name="code" style="width: 100%" required><br>
                
                <input type="submit" value="Submit">
            </form>
            <!--Complete Interface Addnew.-->

        </div>

        </div>











        <nav>

            <a href="#" class="nav-toggle-btn"></a>

            <ul>
                <li><a href="/CS5800/index">Home</a></li>


                <li><a href="/CS5800/LogIn.html">Log In</a></li>
                <li><a href="/CS5800/JSP/SignUp.jsp">Sign Up</a></li>
            </ul>

        </nav>



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

<%-- 
    Document   : wecolmUser
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

                        String inputCode = request.getParameter("code");
                        String email = request.getParameter("email");

                    %>
                    <c:forEach items="${AllUser}" var="p">
                        <c:set var="email" value="<%=email%>"/>
                        <c:set var="code" value="<%=inputCode%>"/>

                        <c:if test="${email == p.getId()}">
                            <c:if test="${password == p.getComfirm()}">

                                <c:out value="${email} and ${password} logging in"/>
                                <%
                                    System.out.println("good");
                                    UserDataAccess da = new UserDataAccess();
                                    da.confirm(email, 1);
                                %>


                            </c:if>
                        </c:if>

                    </c:forEach>


                    <%response.sendRedirect("LogIn.html");%>



















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

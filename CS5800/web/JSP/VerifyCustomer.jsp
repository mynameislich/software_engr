<%-- 
    Document   : VerifyCustomer
    Created on : May 1, 2017, 11:42:51 AM
    Author     : Emily
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
        <title>Wings For You Airline| Verify Customer</title>
        <meta charset="utf-8">
         <meta charset="utf-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" type="text/css" media="all">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css" type="text/css" media="all">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" media="all">
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.2.js" ></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/cufon-yui.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/cufon-replace.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/Myriad_Pro_italic_600.font.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/Myriad_Pro_italic_400.font.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/Myriad_Pro_400.font.js"></script>
    </head>
<body id = "page 20">
<div class = "body20">
	<div class = "main">
		<%
		String email = request.getParameter("email");
		 String value = request.getParameter("id");
                 int id = 1;
		 if(value.length() != 0)
		 {
		 	if (value.matches("^-?\\d+$")) {
			 id = Integer.parseInt(request.getParameter("id"));
                        }
		 }  
                    UserDataAccess datA  = new UserDataAccess();
                    datA.matchCustomer(email, id);
                    %>
          <form id = "validateForm" name ="validateCustomer" action ="../ManagerVerifyCustomer" method = "post" >
                        <div>
          <div class="wrapper">
            <div class="bg">
              <input type="email" name="email" class="input" required>
            </div>
            Customer E-mail:<br />
          </div>
          <div class="wrapper">
            <div class="bg">
             <input type="validID" name="validID"  class="input" required>
            </div>
             Valid ID:<br />
          </div>
          <input type="submit" value="Submit" class="button1">
          
      </form>
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
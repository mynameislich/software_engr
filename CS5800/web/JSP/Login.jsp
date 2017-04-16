<%-- 
    Document   : Login
    Created on : Feb 13, 2017, 11:41:46 AM
    Author     : Zuoyuan Zhao
--%>

<%@page import="dao.UserDataAccess"%>
<%@page import="Model.User"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login JSP Page</title>
    </head>
    <body>
        <h1>Welcome to Wings for You Airline</h1>
        
        <table cellpadding="10">
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Email</th>
            </tr>
            <%
                User theOne;
                theOne = (User)request.getAttribute("theUser");
            %>
           
        </table>
        
    </body>
</html>


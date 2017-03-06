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
        <h1>Doesn't matter</h1>
        <%

            String email = request.getParameter("email");
            String password = request.getParameter("password");

            password = Model.Password.encrypt(password);
            Object test = request.getAttribute("AllUser");

        %>

        <%= test%>
        <table cellpadding="10">
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Email</th>
            </tr>
            <c:forEach items="${AllUser}" var="p">
                <c:set var="email" value="<%=email%>"/>
                <c:set var="password" value="<%=password%>"/>

                <c:if test="${email == p.getId()}">
                    <c:if test="${password == p.getPass()}">
                        <c:if test="${p.getComfirm() == 1}">
                            <c:out value="${email} and ${password} logging in"/>
                            <%
                                System.out.println("good");
                                UserDataAccess da = new UserDataAccess();
                                da.editUserSession(email, 1);
                            %>
                        </c:if>

                    </c:if>
                </c:if>
                <tr>
                    <td>${p.getFirstName()}</td>
                    <td>${p.getLastName()}</td>
                    <td>${p.getId()}</td>
                </tr>
            </c:forEach>
        </table>
        <%response.sendRedirect("index");%>
    </body>
</html>


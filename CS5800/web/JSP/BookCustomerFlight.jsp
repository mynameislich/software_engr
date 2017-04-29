<%-- 
    Document   : BookCustomerFlight
    Created on : Apr 29, 2017, 10:36:11 AM
    Author     : Emily
--%>

<%@page import="dao.UserDataAccess"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/Myriad_Pro_400.font.js"></script>
    </head>
                                                                                                                   
    <body>
        <h1>Book Customer Flight: Verify Customer</h1>
                            <%

                        String telephone = request.getParameter("phone");
                        String email = request.getParameter("email");

                    %>
                    <c:forEach items="${AllUser}" var="p">
                        <c:set var="email" value="<%=email%>"/>
                        <c:set var="phone" value="<%=telephone%>"/>

                        <c:if test="${email == p.getId()}">
                            <c:if test="${password == p.getPhone()}">
                                <%
                                    System.out.println("good");
                                    UserDataAccess da = new UserDataAccess();
                                    da.confirm(email, 1);
                                %>
                            </c:if>
                        </c:if>
                    </c:forEach>
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
    </body>
</html>

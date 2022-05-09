<%-- 
    Document   : DeleteHealthCenter
    Created on : 20/06/2020, 11:13:01 ص
    Author     : Matrix
--%>

<%@page import="api.HealthCenterApi"%>
<%@page import="entity.HealthCenter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%@page import="entity.User" %>
 <%@page import="api.UserApi" %>
    
    <%
        /*
        check for login
        */
        Object o=session.getAttribute(User.IS_LOGIN);
        if(o == null){
            response.sendRedirect("index.jsp");
        }
        
        String health_center_id=request.getParameter(HealthCenter.ID);
        if(health_center_id!=null){
           HealthCenterApi.delete(Integer.parseInt(health_center_id));
           response.sendRedirect("ManageHealthCenters.jsp");
        }
        %>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>

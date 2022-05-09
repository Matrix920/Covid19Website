<%-- 
    Document   : DeleteQuarantineCenter
    Created on : 20/06/2020, 01:32:09 م
    Author     : Matrix
--%>

<%@page import="api.QuarantineCenterApi"%>
<%@page import="entity.QuarantineCenter"%>
<%@page import="entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
     <%
        /*
        check for login
        */
        Object o=session.getAttribute(User.IS_LOGIN);
        if(o == null){
            response.sendRedirect("index.jsp");
        }
        
        String quarantine_center_id=request.getParameter(QuarantineCenter.ID);
        if(quarantine_center_id!=null){
           QuarantineCenterApi.delete(Integer.parseInt(quarantine_center_id));
           response.sendRedirect("ManageQuarantineCenters.jsp");
        }
        %>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>

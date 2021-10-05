<%-- 
    Document   : logout
    Created on : 23 Apr, 2019, 4:16:42 PM
    Author     : Prashant Lapi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
session.setAttribute("userid", null);
session.setAttribute("paitentid", null);
session.setAttribute("doctorid", null);
session.invalidate();
response.sendRedirect("index.jsp");
%>
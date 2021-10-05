<%-- 
    Document   : news
    Created on : 27 Mar, 2019, 11:30:39 AM
    Author     : Prashant Lapi
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
           String tip=request.getParameter("tips");
           String news=request.getParameter("news");
           try{
           Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_healthcare_system","root","tiger");
               
               if(news==news){
                   PreparedStatement ps = con.prepareStatement("insert into news (news) values(?)");
                ps.setString(1, news);
                ps.executeUpdate();
               response.sendRedirect("admin_dashboard.jsp");
               }
           }
           catch(Exception e){
               out.print("e");
           }
       %>
    </body>
</html>

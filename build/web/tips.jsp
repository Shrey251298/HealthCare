<%-- 
    Document   : tips
    Created on : 27 Mar, 2019, 11:16:59 AM
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
           String type=request.getParameter("type_tips");
           try{
           Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_healthcare_system","root","tiger");
               if(type.equals("healthtip")){     
               PreparedStatement htips = con.prepareStatement("insert into tips (tips) values(?)");
                htips.setString(1, tip);
                htips.executeUpdate();
               response.sendRedirect("admin_dashboard.jsp");
               }
               else if(type.equals("eyetip")){
                PreparedStatement etips = con.prepareStatement("insert into eyetips (tips) values(?)");
                etips.setString(1, tip);
                etips.executeUpdate();
                response.sendRedirect("admin_dashboard.jsp");
               }
               else if(type.equals("skintip")){
                PreparedStatement etips = con.prepareStatement("insert into skintips (tips) values(?)");
                etips.setString(1, tip);
                etips.executeUpdate();
                response.sendRedirect("admin_dashboard.jsp");
               }
               else if(type.equals("hairtip")){
                PreparedStatement etips = con.prepareStatement("insert into hairtips (tips) values(?)");
                etips.setString(1, tip);
                etips.executeUpdate();
                response.sendRedirect("admin_dashboard.jsp");
               }
               
           }
           catch(Exception e){
               out.print("e");
           }
       %>
    </body>
</html>

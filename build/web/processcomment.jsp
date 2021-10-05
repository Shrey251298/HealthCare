<%-- 
    Document   : processcomment
    Created on : 8 Apr, 2019, 5:26:59 PM
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
           String paitent=(String)session.getAttribute("paitentid");
           String doctor=request.getParameter("doctor");
           String doctoremail=request.getParameter("doctoremail");
           String paitentname=request.getParameter("paitentname");
            String msg=request.getParameter("msg");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_healthcare_system","root","tiger");
                    
               PreparedStatement pst = con.prepareStatement("insert into postcomment(paitent,msg,doctor,redate,doctoremail,paitentname)values(?,?,?,CURDATE(),?,?)");
               pst.setString(1, paitent);
               pst.setString(2, msg);
               pst.setString(3, doctor);
               pst.setString(4, doctoremail);
               pst.setString(5, paitentname);
                pst.executeUpdate();
                response.sendRedirect("doctor.jsp");
        %>
    </body>
</html>

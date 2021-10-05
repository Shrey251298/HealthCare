<%-- 
    Document   : admin_login_process
    Created on : 16 Feb, 2019, 5:05:23 PM
    Author     : Prashant Lapi
--%>

<%@page import="javax.xml.ws.Response"%>
<%@page import="javax.websocket.SendResult"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>admin login process</title>
        <%!
                ResultSet insertcommand(String cmd){
                    Connection con;
                    Statement stm;
                    ResultSet a=null;
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/e_healthcare_system", "root", "tiger");
                        stm=con.createStatement();
                        a=stm.executeQuery(cmd);
                    } catch (ClassNotFoundException | SQLException ex) {
                        System.out.println(ex);
                    }
                    return a;
                }
    
            %>
    </head>
    <body>
       <%
           String adminuser=request.getParameter("username");
           String adminpass=request.getParameter("password");
           
           ResultSet adr=insertcommand("select * from admin_login where emailid='"+adminuser+"' AND password='"+adminpass+"'");
           if (adr.next()) {
               
               session.setAttribute("userid", adminuser);
               response.sendRedirect("admin_dashboard.jsp");
               
           }
           else
           {
               out.println("<script>alert('invalid ')</script>");
           }
 
       %>
    </body>
</html>

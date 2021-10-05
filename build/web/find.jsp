<%-- 
    Document   : find
    Created on : 7 Apr, 2019, 8:46:50 PM
    Author     : Prashant Lapi
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
   ResultSet paitent;
    String row="";
    ResultSet doctor;
    String drow="";
    ResultSet doctorp;
    String dprow="";
%>
    </head>
    <body>
        <form action="doctor.jsp">
                            <input type="text" name="search">
                            <input type="submit" value="Search">
        </form>
       <% 
       
                        String type = request.getParameter("search");
                           if(type.equals("fever") || type.equals("pain in teeth")){
                             ResultSet doc=insertcommand("select * from doctor_reg_perment where department='dental' ");
                        while(doc.next()){
                            out.print("<div class='card' id='card2'  style='margin: 0px; border: 1px solid rgba(0,0,0,.125);border-radius: .25rem; max-width: 200px;' data-toggle='modal' data-target='#defaultModal"+doc.getString(3)+"'>");
                            out.print("<div class='card-body text-center'>");
                            out.print("<h3 class='card-title'>"+doc.getString(3)+"</h3>");
                            out.print("<p class='card-text'>"+doc.getString(16)+"</p>");
                            out.print("<p class='card-text'>"+doc.getString(9)+"</p>");
                            out.print("</div>");
                            out.print("</div>");
                            
                        }  
                           }
                        else if(type.equals("diabetes")){
                                ResultSet doc=insertcommand("select * from doctor_reg_perment where department='dental' ");
                        while(doc.next()){
                            out.print("<div class='card' id='card2'  style='margin: 0px; border: 1px solid rgba(0,0,0,.125);border-radius: .25rem; max-width: 200px;' data-toggle='modal' data-target='#defaultModal"+doc.getString(3)+"'>");
                            out.print("<div class='card-body text-center'>");
                            out.print("<h3 class='card-title'>"+doc.getString(3)+"</h3>");
                            out.print("<p class='card-text'>"+doc.getString(16)+"</p>");
                            out.print("<p class='card-text'>"+doc.getString(9)+"</p>");
                            out.print("</div>");
                            out.print("</div>");
                            
                        }  
                                }
                           
                        
                                        
       %>
    </body>
</html>

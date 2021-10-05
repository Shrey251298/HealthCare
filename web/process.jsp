<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Process Page</title>
    </head>
    <body> 
            <% 
                String login=request.getParameter("login");
                String pass=request.getParameter("pass");
                String radio=request.getParameter("d");
                ResultSet r;
                boolean log=false;
                if(radio.equals("docto")){
                    r=insertcommand("select * from login_doctor where username='"+login+"' AND password='"+pass+"'");
                    if (r.next()) {
                         session.setAttribute("doctorid", login);
                         response.sendRedirect("doctor_dashboard.jsp");
                    }
                }
                else{
                   r=insertcommand("select * from login_paitent where username='"+login+"' AND password='"+pass+"'");
                    if (r.next()) {
                         session.setAttribute("paitentid", login);
                         response.sendRedirect("paitent_dashboard.jsp");
                    }
                }
            %>
    </body>
</html>
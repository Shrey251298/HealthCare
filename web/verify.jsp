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
    boolean insertcomd(String cmd){
        Connection con;
        Statement stm;
        boolean a=true;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/e_healthcare_system", "root", "tiger");
            stm=con.createStatement();
            a=stm.execute(cmd);
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }
        return a;
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Verify Page</title>
    </head>
    <body>
        <%
            String a=request.getParameter("userno");
            out.print("Userno: "+a+" registered");
            ResultSet r=insertcommand("select * from paitent_reg");
           while(r.next()){
                    boolean b=insertcomd("insert into login_paitent values('"+r.getString(2)+"','"+r.getString(3)+"')");
            if(!b){
                out.print("Successfully verified");
            }
            else{
                out.print("\nFailed Login Insertion");
            }
           }
        %>
    </body>
</html>

<%@page import="javax.mail.internet.*"%>
<%@page import="javax.mail.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    String e;
    boolean mail=true;
    boolean insertcmd(String cmd){
        Connection con;
        Statement stm;
        boolean a=true;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/e_healthcare_system", "root", "tiger");
            stm=con.createStatement();
            a=stm.execute(cmd);
        } catch (ClassNotFoundException | SQLException ex) {
            e=ex.toString();
        }
        return a;
    }
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
    void send(String to, String sub,String msg) 
    {
        final String user="abhipanat676@gmail.com";
        final String pass="abhi5panat";
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() 
            {
                return new PasswordAuthentication(user, pass);
            }
        });
        try 
        {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(sub);
            message.setText(msg);
            Transport.send(message);
        } catch (MessagingException e) 
        {
            mail=false;
            throw new RuntimeException(e);
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String data=request.getParameter("id");
            String sel=request.getParameter("selector");
            ResultSet r=insertcommand("select * from appointment");
            while(r.next()){
                if(data.equals(r.getString(8))){
                    if(sel.equals("a")){
                       send(r.getString(8),"Sucessfully Booked Appointment","Doctor Name="+r.getString(1)+"\n Date Of Appointment="+r.getString(5)+"\n Time Of Appointment="+r.getString(6));
                        if(mail){
                            boolean b=insertcmd("insert into appointment_reg values ( '"+r.getString(1)+"','"+r.getString(2)+"','"+r.getString(3)+"','"+r.getString(4)+"','"+r.getString(5)+"','"+r.getString(6)+"','"+r.getString(7)+"','"+r.getString(8)+"','"+r.getString(9)+"','"+r.getString(10)+"','"+r.getString(11)+"')");
                            boolean c=insertcmd("delete from appointment where email='"+data+"'");
                            if(!(b||c)){
                                out.print("Success");
                            }
                            else{
                                out.println("Failed");
                            }
                        }
                    }
                    else{
                        boolean a=insertcmd("delete from appointment where email='"+data+"'");
                        if(!a){
                                out.print("Success");
                            }
                            else{
                                out.println("Failed");
                            }
                    }
                }
            }
        %>
    </body>
</html>

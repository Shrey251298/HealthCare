

<%-- 
    Document   : reg_proccess
    Created on : Feb 7, 2019, 4:39:44 PM
    Author     : IIHT
--%>

<%@page import="java.util.Properties"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Random"%>
<%@page import="javax.mail.internet.*"%>
<%@page import="javax.mail.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reg_process</title>
    </head>
    <body>
       <%!
    String e;
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
            protected PasswordAuthentication getPasswordAuthentication(){
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
            throw new RuntimeException(e);
        }
    }
    %>
<%
    String fname=request.getParameter("fname");
    String lname=request.getParameter("lname");
    String email=request.getParameter("e_mail");
    String pwd=request.getParameter("pass");
    String bod=request.getParameter("bod");
    String contact=request.getParameter("cn");
    String city=request.getParameter("city");
    String gender=request.getParameter("gender");
    String address=request.getParameter("address");
    String mno=request.getParameter("mno");
    String cln=request.getParameter("cln");
    String clno=request.getParameter("clno");
    String de=request.getParameter("de");
    String woe=request.getParameter("woe");
    String q=request.getParameter("q");
    out.print(q);
    out.print(gender);
    out.print(fname);
    out.print(lname);
    out.print(email);
    out.print(pwd);
    out.print(bod);
    out.print(contact);
    out.print(city);
    out.print(address);
   
%> 

    </body>
</html>
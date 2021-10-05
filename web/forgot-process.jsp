<%-- 
    Document   : forgot-process
    Created on : Feb 9, 2019, 4:44:43 PM
    Author     : IIHT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Properties"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Random"%>
<%@page import="javax.mail.internet.*"%>
<%@page import="javax.mail.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%! 
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
    
        ResultSet insertcommand(String cmd){
        Connection con;
        Statement stm;
        ResultSet a=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/abhi", "root", "tiger");
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
try
{
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/abhi","root","tiger"); 
Statement st=con.createStatement();
String email=request.getParameter("e_mail");
String strQuery = "select * from reg";
ResultSet rs = st.executeQuery(strQuery);
boolean a=false;
while(rs.next()){
if(rs.getString(1).equals(email)){
send(email, "Forgot Password","your password:"+rs.getString(2));
a=true;
break;
}
}
if(!a){
out.println("Invalid Email Id !");
}
else
{
    out.println("Password send to your email id successfully !");
}
}
catch (Exception e){
e.printStackTrace();
}
%>
</body>
</html>

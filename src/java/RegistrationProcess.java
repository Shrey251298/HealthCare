/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Prashant Lapi
 */
@WebServlet("/RegistrationProcess")

public class RegistrationProcess extends HttpServlet {
    boolean mail;
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
    public void send(String to, String sub,String msg) 
    {
        mail=true;
        final String user="abhipanat676@gmail.com";
        final String pass="abhi5panat";
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        Session session = Session.getDefaultInstance(props,new javax.mail.Authenticator() 
        {
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
    
  
   @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8;");
        PrintWriter out=response.getWriter();
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_healthcare_system","root","tiger");
                Statement st= con.createStatement();
                
                
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
                String depart=request.getParameter("department");
               
                
                boolean a=true;
    if(q.equals("paitent")){
        Random r = new Random(100000);
        int id=r.nextInt(10000);
                
  
   
   
        a=insertcmd("insert into paitent_reg values('"+id+"','"+email+"','"+pwd+"','"+fname+"','"+lname+"','"+bod+"','"+gender+"','"+contact+"','"+city+"','"+address+"',CURDATE())");
        send(email, "Paitent Verification", "Click to verify: http://localhost:8084/Health/verify.jsp?userno='"+id+"'");
        a=insertcmd("insert into profile_img (userid,status) values('"+email+"','1')");
   
    }
    else{
    a=insertcmd("insert into doctor_reg values('"+email+"','"+pwd+"','"+fname+"','"+lname+"','"+bod+"','"+gender+"','"+contact+"','"+city+"','"+address+"','"+mno+"','"+cln+"','"+clno+"','"+de+"','"+woe+"',CURDATE(),'"+depart+"','1')");
    }
    if(!a){
        out.print("<font color='green'>Registered Successfully</font><br><a href='index.jsp'>Login</a>");
        
    }
    else{
        out.print("<font color='red'>Failed Registeration</font>"+e);
    }
                
               
            
                
        }
        catch (Exception e){
            e.printStackTrace();
        }
       
        
        
       
    }
   

   
}

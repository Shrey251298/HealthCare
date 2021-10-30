/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author IIHT
 */
@WebServlet(name = "contactmail", urlPatterns = {"/contactmail"})
public class contactmail extends HttpServlet {
String name,subject, email, msg;

@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        name=request.getParameter("name");
        email=request.getParameter("mail");
        subject=request.getParameter("sub");
        msg=request.getParameter("mes");
        a=request.getParameter("Name");
        
        final String username="abhipanat676@gmail.com";
        final String password="abhi5panat";
        Properties porps=new Properties();
        porps.put("mail.smtp.auth",true);
        porps.put("mail.smtp.starttls.enable",true);
        porps.put("mail.smtp.host","smtp.gmail.com");
        porps.put("mail.smtp.port","587");
        Session session = Session.getInstance(porps, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication(){
            return new PasswordAuthentication(username, password);
            }
        });
        
        try{
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(email));
              message.addRecipient(Message.RecipientType.TO,
                new InternetAddress(username));
            //message.setRecipient(Message.RecipientType.TO,InternetAddress.parse("username"));
            MimeBodyPart textPart=new MimeBodyPart();
            Multipart multipart=new MimeMultipart();
            String finaltext="Name: "+name+"\nEmail:"+email+"\nSubject:"+subject+"\nYour Message:"+msg;
            textPart.setText(finaltext);
            message.setSubject(subject);
            multipart.addBodyPart(textPart);
            message.setContent(multipart);
            message.setSubject("Contact Details");
            Transport.send(message);
            out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"css/sweetalert.css\">");
            out.println("<script src=\"assets/plugins/jquery/jquery-v3.2.1.min.js\"></script>");
            out.println("<script src=\"js/sweetalert.min.js\"></script>");
            out.println("<script>");
            out.println("$(document).ready(function(){");
            out.println("swal(\"Mail Sended\",\"Your Mail Has Been Send Successfully !\",\"success\");");
            out.println("});");
            out.println("</script>");
           response.sendRedirect("index.jsp");
          
            } catch (MessagingException ex) {
            out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"css/sweetalert.css\">");
            out.println("<script src=\"assets/plugins/jquery/jquery-v3.2.1.min.js\"></script>");
            out.println("<script src=\"js/sweetalert.min.js\"></script>");
            out.println("<script>");
            out.println("$('#contactsubmit').submit(function(){");
            out.println("swal(\"Mail Not Sended\",\"Your Mail Has Not Been Send Due To Internet Error !\",\"error\");");
            out.println("});");
            out.println("</script>");
            RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
            rd.include(request, response);
            Logger.getLogger(contactmail.class.getName()).log(Level.SEVERE, null, ex);
    }
        
        
    }

    

}








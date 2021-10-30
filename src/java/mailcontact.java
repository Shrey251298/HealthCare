
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import static java.lang.System.out;
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
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;



public class mailcontact extends HttpServlet {
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
      public void send(String to, String name,String email,String subject,String message1) 
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
            message.addRecipient(Message.RecipientType.TO,
                new InternetAddress(user));
            message.setSubject(subject);
            message.setText(message1);
            Transport.send(message);
            MimeBodyPart textPart=new MimeBodyPart();
            Multipart multipart=new MimeMultipart();
            String finaltext="Name: "+name+"\nEmail:"+email+"\nSubject:"+subject+"\nYour Message:"+message1;
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
         
        } catch (MessagingException e) 
        {
            mail=false;
            throw new RuntimeException(e);
        }
    }
      
      //database code
      
   @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8;");
        PrintWriter out=response.getWriter();
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/urdatabasename","root","tiger");
                Statement st= con.createStatement();
                
                
                String name=request.getParameter("name");
                String  email=request.getParameter("mail");
                String subject=request.getParameter("sub");
                String message1=request.getParameter("mes");
              
               
                
                boolean a=true;

   
   
        a=insertcmd("insert into paitent_reg values('"+name+"','"+email+"','"+subject+"','"+message1+"')");        //send(email, "Paitent Verification", "Click to verify: http://localhost:8084/Health/verify.jsp?userno='"+subject+"'",message1);
        
   



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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
@WebServlet("/doctoruploadimage")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, 
        maxFileSize = 1024 * 1024 *10,
        maxRequestSize = 1024 * 1024 *50)
public class doctoruploadimage extends HttpServlet {
    
   
   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Part part=request.getPart("file");
        String fileName=extractFileName(part);
        String savePath="C:/Users/Prashant Lapi/Documents/NetBeansProjects/Health/web/image"+ File.separator + fileName;
        File fileSaveDir=new File(savePath);
        
        part.write(savePath+ File.separator);
        HttpSession s=request.getSession();
                String pi=(String)s.getAttribute("doctorid");
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_healthcare_system","root","tiger");
            Statement st=con.createStatement();
            ResultSet pa=st.executeQuery("select * from doctor_reg_perment where email = '"+pi+"'");
            while(pa.next()){
                int status=pa.getInt("status");
                if(status == 1){
                    PreparedStatement pst = con.prepareStatement("insert into doctor_image values(?,?,?)");
                      pst.setString(1, pi);
                      pst.setString(2, fileName);
                      pst.setString(3, savePath);
                      pst.executeUpdate();
                      PreparedStatement ps = con.prepareStatement("update  doctor_reg_perment set status=0 where email='"+pi+"'");
                        ps.executeUpdate();
                      response.sendRedirect("doctor_dashboard.jsp");
                      
                }
                else{
                   PreparedStatement pst = con.prepareStatement("update  doctor_image set filename='"+fileName+"', path='"+savePath+"' where email='"+pi+"'");
                    pst.executeUpdate();
                    response.sendRedirect("doctor_dashboard.jsp");
                }
            }
               
            
        }
        catch (Exception e){
            out.println(e);
        }
       
        
    }
    private String extractFileName (Part part){
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items){
            if(s.trim().startsWith("filename")){
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}

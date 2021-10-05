/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.File;
import java.sql.*;
import javax.servlet.annotation.MultipartConfig;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
/**
 *
 * @author Prashant Lapi
 */
@WebServlet("/FileUploadImage")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, 
        maxFileSize = 1024 * 1024 *10,
        maxRequestSize = 1024 * 1024 *50)
public class FileUploadImage extends HttpServlet {
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
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        int id=Integer.parseInt(request.getParameter("pid"));
        String firstName=request.getParameter("pname");
        String lastName=request.getParameter("pprice");
         String pName=request.getParameter("pdescription");
         String radio=request.getParameter("product");
        Part part=request.getPart("pfile");
        String fileName=extractFileName(part);
        String savePath="C:\\Users\\IIHT\\Documents\\NetBeansProjects\\Health\\web\\images\\product"+ File.separator + fileName;
        File fileSaveDir=new File(savePath);
        
        part.write(savePath+ File.separator);
        boolean a=true;
        if(radio.equals("medicine"))
        {
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/e_healthcare_system", "root", "tiger");
                PreparedStatement pst = con.prepareStatement("insert into medicine_table values(?,?,?,?,?,?)");
                pst.setInt(1, id);
                pst.setString(2, firstName);
                pst.setString(3, lastName);
                pst.setString(4, pName);
                pst.setString(5, fileName);
                pst.setString(6, savePath);
                pst.executeUpdate();
                response.sendRedirect("admin_dashboard.jsp");
            }catch(Exception e){}
            
            // a=insertcmd("insert into medicine_table values ("+id+" ,'"+firstName+"', '"+lastName+"','"+pName+"', '"+fileName+"', '"+savePath+"') ");
            
        }
        else
        {
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/e_healthcare_system", "root", "tiger");
                PreparedStatement pst = con.prepareStatement("insert into healthproduct_table values(?,?,?,?,?,?)");
                pst.setInt(1, id);
                pst.setString(2, firstName);
                pst.setString(3, lastName);
                pst.setString(4, pName);
                pst.setString(5, fileName);
                pst.setString(6, savePath);
                pst.executeUpdate();
                response.sendRedirect("admin_dashboard.jsp");
            }
            catch(Exception e){}
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

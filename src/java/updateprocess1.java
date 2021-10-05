/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Prashant Lapi
 */
@WebServlet(urlPatterns = {"/updateprocess1"})
public class updateprocess1 extends HttpServlet {

   @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
      PrintWriter out = response.getWriter();
      String lname=request.getParameter("lname");
       String contact=request.getParameter("contact");
       String address=request.getParameter("address");
       String patient=request.getParameter("email");
       
       
       try{
           Class.forName("com.mysql.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/e_healthcare_system","root","tiger");
            PreparedStatement pst = con.prepareStatement("update  paitent_reg set lname='"+lname+"',contact='"+contact+"',address='"+address+"' where email='"+patient+"'");
                pst.executeUpdate();
                response.sendRedirect("paitent_list.jsp");
       }
       catch(Exception e)
       {
          e.printStackTrace();
       }
      
    }
}

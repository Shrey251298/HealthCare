/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Prashant Lapi
 */
public class updateprocess extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       PrintWriter out = response.getWriter();
       
       String lname=request.getParameter("lname");
       String contact=request.getParameter("contact");
       String address=request.getParameter("address");
       String cln=request.getParameter("cln");
       String clno=request.getParameter("clno");
       String degree=request.getParameter("degree");
       String woe=request.getParameter("woe");
       String doctor=request.getParameter("email");
       
       
       try{
           Class.forName("com.mysql.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/e_healthcare_system","root","tiger");
            PreparedStatement pst = con.prepareStatement("update  doctor_reg_perment set lname='"+lname+"',contact='"+contact+"',address='"+address+"',clinicname='"+cln+"',clinicno='"+clno+"',degree='"+degree+"',workofexperience='"+woe+"' where email='"+doctor+"'");
                pst.executeUpdate();
                response.sendRedirect("doctor_list.jsp");
       }
       catch(Exception e)
       {
           e.printStackTrace();
       }
    }

    
}

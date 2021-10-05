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

/**
 *
 * @author Prashant Lapi
 */
public class admineditprocess extends HttpServlet {

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String fname=request.getParameter("adminame");
        String lname=request.getParameter("adminalast");
        String address=request.getParameter("address");
        String pwd=request.getParameter("pass");
        String contact=request.getParameter("contact");
        String email=request.getParameter("email");
        String country = request.getParameter("country");
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/e_healthcare_system","root","tiger");
            PreparedStatement ps=con.prepareStatement("insert into (emailid,password,firstname,lastname,address,contact,country) values (?,?,?,?,?,?,?)");
            ps.setString(1, email);
            ps.setString(2, pwd);
            ps.setString(3, fname);
            ps.setString(4, lname);
            ps.setString(5, address);
            ps.setString(6, contact);
            ps.setString(7, country);
            ps.executeUpdate();
            response.sendRedirect("admin_profile.jsp");
        }
        catch(Exception e){
        e.printStackTrace();
        }
    }
}

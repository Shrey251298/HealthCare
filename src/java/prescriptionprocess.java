/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Prashant Lapi
 */
public class prescriptionprocess extends HttpServlet {
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
            try{
                        
                        String doctorname=request.getParameter("doctorname");
                        String paitentname=request.getParameter("paitentname");
                        String date=request.getParameter("date");
                        String medicinename=request.getParameter("medicinename");
                        String contact=request.getParameter("contact");
                        String query=request.getParameter("query");
                        String msg=request.getParameter("msg");
                        boolean a=true;
                        a=insertcmd("insert into prescription values('"+doctorname+"','"+paitentname+"','"+date+"','"+contact+"','"+query+"','"+msg+"'')");
                        if(a=false){
                            out.print("not success");
                        }
                        else{
                            
                            out.print("success");
                            response.sendRedirect("doctor_dashboard.jsp");
                        }
                    }
                    catch(Exception e){
                    e.printStackTrace();
                    }     
            
        }
    }

    



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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Prashant Lapi
 */
public class patient_list_delete extends HttpServlet {

    
    @Override
        protected void doPost(HttpServletRequest a,HttpServletResponse s) throws IOException,ServletException
            {
                s.setContentType("text/html");
                PrintWriter d=s.getWriter();
                
                String f=a.getParameter("email");
                
                String g="com.mysql.jdbc.Driver";
                Connection h=null;
                String i="jdbc:mysql://localhost:3306/e_healthcare_system",j="root",k="tiger";
                PreparedStatement l;
                String m="delete from paitent_reg where email='"  +f+ "'";
                
                try
                    {
                        Class.forName(g);
                        h=DriverManager.getConnection(i,j,k);
                        l=h.prepareStatement(m);
                        int n=l.executeUpdate();
                        s.sendRedirect("paitent_list.jsp");
                        h.close();
                    }
                
                catch(Exception o)
                    {
                        d.println(o);
                    }
            }

}

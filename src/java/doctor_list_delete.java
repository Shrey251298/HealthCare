import java.io.*;
import java.util.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class doctor_list_delete extends HttpServlet
    {
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
                String m="delete from doctor_reg_perment where email='"  +f+ "'";
                
                try
                    {
                        Class.forName(g);
                        h=DriverManager.getConnection(i,j,k);
                        l=h.prepareStatement(m);
                        int n=l.executeUpdate();
                        s.sendRedirect("doctor_list.jsp");
                        h.close();
                    }
                
                catch(Exception o)
                    {
                        d.println(o);
                    }
            }
    }
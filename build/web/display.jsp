<%-- 
    Document   : display
    Created on : 15 Feb, 2019, 4:18:15 PM
    Author     : Prashant Lapi
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int imageid=Integer.parseInt(request.getParameter("id"));
            
                    try{
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/abhi","root","tiger");
                            Statement st=con.createStatement();
                            String sql="select * from image_table where id="+imageid+"";
                            ResultSet rs=st.executeQuery(sql);
                            while(rs.next()){
                                String filename = rs.getString("filename");
                            
        %>
        <table style="width:100%">
            <tr>
                <th>Id</th>
                <th> Image</th>
                
            </tr>
            <tr>
                <td><%=imageid%></td>
                <td><image src="image/<%=filename%>"width="200" height="200"></td>
                
            </tr>
        </table>
         <% }
              }
                    catch(Exception e){
                    out.println(e);
                    }
         %>       
    </body>
</html>

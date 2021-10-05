<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%
    String msg=request.getParameter("msg");
    String name=(String)session.getAttribute("name");
    String with=(String)session.getAttribute("with");
    Calendar cal=Calendar.getInstance();
    SimpleDateFormat sdf=new SimpleDateFormat("HH:mm");
    boolean exe=true;
    try{
        Class.forName("com.mysql.jdbc.Driver");
        
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/e_healthcare_system", "root", "tiger");
        Statement stm=con.createStatement();
        if(msg.length()<=0){
            
        }
        else{
        exe=stm.execute("insert into chat values('"+name+"','"+with+"','"+msg+"','"+sdf.format(cal.getTime())+"')");
        }
    }catch(Exception ex){
        out.println("<script>alert('Message Send Failed With Exception');</script>");
        response.sendRedirect("chat.jsp");
    }
    if(!exe){
        response.sendRedirect("chat.jsp");
    }
    else{
        out.println("<script>alert('Message Send Failed');</script>");
        response.sendRedirect("chat.jsp");
    }
%>
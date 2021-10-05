<%@page import="java.sql.*"%>
<%
    try{
        char s=34;
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/e_healthcare_system", "root", "tiger");
        Statement stm=con.createStatement();
        ResultSet rs=stm.executeQuery("select * from chat");
        out.println("[");
        int i=0;
                while(rs.next()){
                    if(i==0){
                        
                    }
                    else{
                        out.println(",");
                    }
                    i++;
                    out.println("{"+s+"from"+s+":"+s+rs.getString(1)+s+","+s+"to"+s+":"+s+rs.getString(2)+s+","+s+"msg"+s+":"+s+rs.getString(3) +s+","+s+"date"+s+":"+s+rs.getString(4)+s+"}");
                }
        out.println("]");
    }catch(Exception ex){
        
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Chat Room</title>
        
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    </head>
    <body><center><br><br>
        <%
            String name=(String)session.getAttribute("name");
            String with=(String)session.getAttribute("with");
            char s=34;
            out.println("On Going Chat: <font color='black'>"+name+"</font> and <font color='black'>"+with+"</font>");
        %>
        <br><br><iframe src="show.jsp#end" width="500" height="350" style="border:none;"></iframe><br>
        <form action="addmsg.jsp">
            <input type="text" name="msg" class="form-control" style="width: 40%" placeholder="Enter Your Message Here!" /><button type="submit" style="position: relative; top:-38px; left:230px;" class="btn btn-danger">Send</button>
        </form></center>
    </body>
</html>
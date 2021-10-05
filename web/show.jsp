<%
    String name=(String)session.getAttribute("name");
    String with=(String)session.getAttribute("with");
    char s=34;
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <style>
            .chat:after{
                         content: '';
                position: absolute;
                width: 20px;
                height: 15px;
                border-right: 1px solid transparent;
                border-bottom: 35px solid transparent;
                border-left: 30px solid #eee;
                top: 7%;
                left: 100%; 
            }
        </style>
    </head>
    <body>
        <script>
    var xmlhttp = new XMLHttpRequest();
var url = "allchat.jsp";
xmlhttp.onreadystatechange = function() {
  if (this.readyState == 4 && this.status == 200) {
    var myArr = JSON.parse(this.responseText);
    myFunction(myArr);
  }
};
xmlhttp.open("GET", url, true);
xmlhttp.send();
function myFunction(arr) {
  var i;
  var past="";
  for(i = 0; i < arr.length; i++) {
    if(((arr[i].from===<%=s+name+s%>)&&(arr[i].to===<%=s+with+s%>))||((arr[i].from===<%=s+with+s%>)&&(arr[i].to===<%=s+name+s%>))){
        if(((arr[i].from===<%=s+name+s%>)&&(arr[i].to===<%=s+with+s%>))){
            past=past+"<br><br><br><div style='border:none; float:right; background: #eee; ' class='card card-body chat'><p class='m-0'>"+arr[i].msg+"</p><br><p class='m-0'>"+arr[i].date+"</p></div><br>\n\
    ";
        }
        else{
            past=past+"<br><br><br><div style='border:none; float:left; background: #eee;' class='card card-body chat1'><p class='m-0'>"+arr[i].msg+"</p><br><p>"+arr[i].date+"</p></div>";
        }
            
        
}
}
document.getElementById("data").innerHTML=past;
}
setInterval(function(){
xmlhttp.open("GET", url, true);
xmlhttp.send();
}, 1000);
        </script>
        <div id="content">
           
            <p id="data"></p>
        </div>
        <div id="end"></div>
    </body>
</html>
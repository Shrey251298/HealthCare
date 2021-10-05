<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
    ResultSet insertcommand(String cmd){
        Connection con;
        Statement stm;
        ResultSet a=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/e_healthcare_system", "root", "tiger");
            stm=con.createStatement();
            a=stm.executeQuery(cmd);
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }
        return a;
    }
   ResultSet paitent;
    String row="";
    ResultSet doctor;
    String drow="";
    ResultSet doctorp;
    String dprow="";
%>
<%  String pic=(String)session.getAttribute("doctorid"); %>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>:: Swift - Hospital Admin ::</title>
<link rel="icon" href="favicon.ico" type="image/x-icon">
<link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">
<link href="assets/plugins/morrisjs/morris.css" rel="stylesheet" />
<!-- Custom Css -->
<link href="assets/css/main.css" rel="stylesheet">
<link href="assets/css/abhi.css" rel="stylesheet">
<link href="css/nav.css" rel="stylesheet">
<!-- Swift Themes. You can choose a theme from css/themes instead of get all themes -->
<link href="assets/css/themes/all-themes.css" rel="stylesheet" />
<style type="text/css">
	.navbar{
		padding: 0px;
	}
	
	.img-profile{
		width: 100%;height: 100%;max-height: 180px;border: 6px solid #dee2e6;border-radius: 10px;margin: 0px 40px;max-width: 180px; position: relative; top: -100px;
		box-shadow: 1px 14px 5px 0px #dee2e6;
	}

	.navbar-dark .navbar-nav .active>.nav-link, .navbar-dark .navbar-nav .nav-link.active, .navbar-dark .navbar-nav .nav-link.show, .navbar-dark .navbar-nav .show>.nav-link {
    color: #007bff !important;
    background: #fff;
    font-size: 12px !important;
    padding: 15px 62px !important;
    border-left: 1px solid #dee2e6 !important;
}
.navbar-dark .navbar-nav .nav-link {
    color: rgba(255,255,255,.5) !important;
    font-size: 12px !important;
    border-right: 1px solid #adb5bd5e !important;
    padding: 15px 63px !important;
}
small{
	color: #adb5bd;
}
p{
	margin-bottom: 0.5rem;
}
h2{
	font-size: 12px;
	font-weight: bold;
}
table td{
	font-size: 14px;
}
.smal{
    color: #eee;
    
}



</style>

</head>

<body class="theme-cyan">
<!-- Page Loader -->
<div class="page-loader-wrapper">
    <div class="loader">
        <div class="preloader">
            <div class="spinner-layer pl-cyan">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div>
                <div class="circle-clipper right">
                    <div class="circle"></div>
                </div>
            </div>
        </div>
        <p>Please wait...</p>
    </div>
</div>
<!-- #END# Page Loader --> 
<!-- Overlay For Sidebars -->
<div class="overlay"></div>
<!-- #END# Overlay For Sidebars -->
<!-- #Float icon -->
<ul id="f-menu" class="mfb-component--br mfb-zoomin" data-mfb-toggle="hover">
  <li class="mfb-component__wrap">
    <a href="#" class="mfb-component__button--main g-bg-cyan">
      <i class="mfb-component__main-icon--resting zmdi zmdi-plus"></i>
      <i class="mfb-component__main-icon--active zmdi zmdi-close"></i>
    </a>
    <ul class="mfb-component__list">
      <li>
        <a href="doctor-schedule.html" data-mfb-label="Doctor Schedule" class="mfb-component__button--child bg-blue">
          <i class="zmdi zmdi-calendar mfb-component__child-icon"></i>
        </a>
      </li>
      <li>
        <a href="patients.html" data-mfb-label="Patients List" class="mfb-component__button--child bg-orange">
          <i class="zmdi zmdi-account-o mfb-component__child-icon"></i>
        </a>
      </li>

      <li>
        <a href="payments.html" data-mfb-label="Payments" class="mfb-component__button--child bg-purple">
          <i class="zmdi zmdi-balance-wallet mfb-component__child-icon"></i>
        </a>
      </li>
    </ul>
  </li>
</ul>
<!-- #Float icon -->
<!-- Morphing Search  -->

<!-- Top Bar -->
<nav class="navbar clearHeader">
    <div class="col-12">
        <div class="navbar-header"> <a href="javascript:void(0);" class="bars"></a> <a class="navbar-brand" href="paitent_dashboard.jsp">Healthcare</a> </div>
        <ul class="nav navbar-nav navbar-right" style="flex-direction: unset;">
            <!-- Notifications -->
            
            <!-- #END# Notifications --> 
            <!-- Tasks -->
            
            <!-- #END# Tasks -->
            <li><a href="javascript:void(0);" class="js-right-sidebar" data-close="true"><i class="zmdi zmdi-settings"></i></a></li>
        </ul>
    </div>
</nav>
<!-- #Top Bar -->
<section> 
    <!-- Left Sidebar -->
    <aside id="leftsidebar" class="sidebar"> 
        <!-- User Info -->
        <div class="user-info">
            <div class="admin-image">
            <%
                                         try{
                                             ResultSet im=insertcommand("select * from doctor_reg_perment where email = '"+pic+"' ");
                                             while(im.next()){
                                                 int status=im.getInt("status");
                                                 if(status == 0){
                                                     ResultSet image=insertcommand("select * from doctor_image where email = '"+pic+"' ");
                                                     while(image.next()){
                                                         String filename=image.getString("filename");
                                    %>
                                                        <img src="image/<%=filename%>">
                                    <%
                                                     }
                                                 }
                                                 else{
                                    %>
                                                    <img src="image/default-profile-pic.png">
                                    <%
                                                 }
                                             }
                                         }
                                         catch(Exception e){e.printStackTrace();}
                                %>
            
            </div>
            <div class="admin-action-info"> <span>Welcome</span>
                <%
                                    try{
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_healthcare_system","root","tiger");
                                    Statement st=con.createStatement();
                                    String sql="select * from doctor_reg_perment where email='"+pic+"'";
                                    ResultSet rs=st.executeQuery(sql);
                                    while(rs.next()){
                                        String firstname = rs.getString("fname");
                                %>      
                                <h3><%=firstname%></h3>
                                <% }
                                    }
                                          catch(Exception e){
                                          out.println(e);
                                          }
                                %>
                <ul>
                    
                    <li><a data-placement="bottom" title="Go to Profile" href="doctor_dashboard.jsp"><i class="zmdi zmdi-account"></i></a></li>                    
                    <li><a href="javascript:void(0);" class="js-right-sidebar" data-close="true"><i class="zmdi zmdi-settings"></i></a></li>
                    <li><a data-placement="bottom" title="Full Screen" href="logout.jsp" ><i class="zmdi zmdi-sign-in"></i></a></li>
                </ul>
            </div>
            <div class="quick-stats">
                <h5>Today Report</h5>
                <ul>
                    <li><span><%
                            paitent=insertcommand("select count(*) from paitent_reg");
                                  while(paitent.next()){
                                      row=paitent.getString(1);
                                      out.println(row);
                                  }
                            %><i>Patient</i></span></li>
                    <li><span><%
                                  doctor=insertcommand("select count(*) from appointment");;
                                  while(doctor.next()){
                                      drow=doctor.getString(1);
                                      out.println(drow);
                                  }
                            %><i>Panding Appointment</i></span></li>
                    <li><span>04<i>Visit</i></span></li>
                </ul>
            </div>
        </div>
        <!-- #User Info --> 
        <!-- Menu -->
        <div class="menu">
            <ul class="list">
                <li class="header">MAIN NAVIGATION</li>
                <li ><a href="doctor_dashboard.jsp"><i class="zmdi zmdi-home"></i><span>Dashboard</span></a></li>
                <li><a href="show_appointment.jsp" class="menu-toggle"><i class="zmdi zmdi-account-add"></i><span>Appointment Request</span> </a>
                </li>
                <li class="active open"><a href="javascript:void(0);" class="menu-toggle"><i class="zmdi zmdi-account-o"></i><span>Patients</span> </a>
                    <ul class="ml-menu">
                        <li><a href="booked_paitent.jsp">Manage Patients</a></li>                       
                    </ul>
                </li>
                <li><a href="javascript:void(0);" class="menu-toggle"><i class="zmdi zmdi-shopping-cart"></i><span>Product</span> </a>
                    <ul class="ml-menu">
                        <li> <a href="hp.jsp">Health Product</a></li>
                        <li> <a href="m.jsp">Medicine</a></li>
                    </ul>
                </li>
                
                <li><a href="javascript:void(0);" class="menu-toggle"><i class="zmdi zmdi-local-convenience-store"></i><span>Service</span> </a>
                    <ul class="ml-menu">
                        <li> <a href="javascript:void(0);" class="menu-toggle">Mediclaim</a>
                            <ul class="ml-menu">
                                <li> <a href="#" data-toggle="modal" data-target="#CashlessMediclaim">Cashless Mediclaim</a></li>                         
                                <li> <a href="#"  data-toggle="modal" data-target="#ReimbursementMediclaim">Reimbursement Mediclaim</a></li>
                            </ul>
                        </li>
                        <li> <a href="#">Ambulance</a></li>
                    </ul>
                </li>
                <li class="header">LABELS</li>
                <li> <a href="javascript:void(0);"><i class="zmdi zmdi-chart-donut col-red"></i><span>Important</span> </a> </li>
                <li> <a href="javascript:void(0);"><i class="zmdi zmdi-chart-donut col-amber"></i><span>Warning</span> </a> </li>
                <li> <a href="javascript:void(0);"><i class="zmdi zmdi-chart-donut col-blue"></i><span>Information</span> </a> </li>
            </ul>
        </div>
        <!-- #Menu -->
    </aside>
    <!-- #END# Left Sidebar --> 
    <!-- Right Sidebar -->
    <aside id="rightsidebar" class="right-sidebar">
        <ul class="nav nav-tabs tab-nav-right" role="tablist">
            <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#skins">Skins</a></li>
            
        </ul>
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane in active in active" id="skins">
                <ul class="demo-choose-skin">
                    <li data-theme="red">
                        <div class="red"></div>
                        <span>Red</span> </li>
                    <li data-theme="purple">
                        <div class="purple"></div>
                        <span>Purple</span> </li>
                    <li data-theme="blue">
                        <div class="blue"></div>
                        <span>Blue</span> </li>
                    <li data-theme="cyan" class="active">
                        <div class="cyan"></div>
                        <span>Cyan</span> </li>
                    <li data-theme="green">
                        <div class="green"></div>
                        <span>Green</span> </li>
                    <li data-theme="deep-orange">
                        <div class="deep-orange"></div>
                        <span>Deep Orange</span> </li>
                    <li data-theme="blue-grey">
                        <div class="blue-grey"></div>
                        <span>Blue Grey</span> </li>
                    <li data-theme="black">
                        <div class="black"></div>
                        <span>Black</span> </li>
                    <li data-theme="blush">
                        <div class="blush"></div>
                        <span>Blush</span> </li>
                </ul>
            </div>
            
        </div>
    </aside>
    <!-- #END# Right Sidebar --> 
</section>
<section class="content home">
    <div class="container-fluid">
        <div class="block-header">
            <h2>Paitent Appointment Booked</h2>
            <small class="text-muted">Welcome to Healthcare application</small>
        </div>
        
        <div class="row clearfix">
            <div class="col-12">
                <div class="card card-body" style="border-radius: 10px;">
                    <h3 style="padding-left: 50px;">Booked Patient</h3>
                    <hr>
                    <div class="container">
                        <div class="row">
                            <div class="col-10">
                                <%
                        ResultSet appoint=insertcommand("select * from appointment_reg where demail='"+pic+"'");
                        while(appoint.next()){
                            out.print("<div class='card' id='card2'  style='margin: 0px; border: 1px solid rgba(0,0,0,.125);border-radius: .25rem; max-width: 220px; margin-bottom: 20px;'>");
                            out.print("<div class='card-body text-center'>");
                            out.print("<h3 class='card-title'>"+appoint.getString(2)+"</h3>");
                            out.print("<p class='card-text'>"+appoint.getString(4)+"</p>");
                            out.print("<p class='card-text'>"+appoint.getString(7)+"</p>");
                            out.print("<p class='card-text'>"+appoint.getString(8)+"</p>");
                            out.print("<a href='log.jsp?name="+pic+"&with="+appoint.getString(8)+"' class='btn btn-primary' style='background: #eee; border-radius: 5px;'>CHAT</a>");
                            out.print("</div>");
                            out.print("</div>");
                            
                        }  
                    %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</div>       
</section>
                       

<div class="color-bg"></div>
<!-- Jquery Core Js --> 
<script src="assets/bundles/libscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js -->
<script src="assets/bundles/morphingsearchscripts.bundle.js"></script> <!-- morphing search Js --> 
<script src="assets/bundles/vendorscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js --> 

<script src="assets/plugins/jquery-sparkline/jquery.sparkline.min.js"></script> <!-- Sparkline Plugin Js -->
<script src="assets/plugins/chartjs/Chart.bundle.min.js"></script> <!-- Chart Plugins Js --> 

<script src="assets/bundles/mainscripts.bundle.js"></script><!-- Custom Js -->
<script src="assets/bundles/morphingscripts.bundle.js"></script><!-- morphing search page js --> 

<script src="assets/js/pages/charts/sparkline.min.js"></script>


</body>
</html>

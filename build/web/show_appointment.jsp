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
<link href="assets/plugins/bootstrap/css/bootstrap-table.min.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="assets/plugins/morrisjs/morris.css" rel="stylesheet" />
<!-- Custom Css -->
<link href="assets/css/main.css" rel="stylesheet">
<link href="assets/css/abhi.css" rel="stylesheet">
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
textarea{
                border: 0px solid #fff;
                max-width: 590px;
                text-decoration: none;
                padding: 10px;
            }
            ::placeholder{
               color: #aaaaaa91;
            }
            .text{
                position: relative;
                max-width: 600px;
                height: auto;
                border: 3px solid #eee;
                margin: 35px auto;
                box-shadow: -1px -2px 0px 0px #eee;
                border-radius: 5px;
                box-sizing: border-box;
                
            }
            .text:after{
                 content: '';
                position: absolute;
                width: 30px;
                height: 35px;
                border-right: 1px solid transparent;
                border-bottom: 35px solid transparent;
                border-left: 30px solid #eee;
                top: 101%;
                left: 10%;  

            }
            .a{
                position: relative;
                max-width: 600px;
                height: auto;
                border: 3px solid #000;
                margin: 50px auto;
                padding: 30px;
                box-sizing: border-box;
                
            }
            .a:after{
                content: '';
                position: absolute;
                width: 50px;
                height: 50px;
                border-top: 0px solid #000;
                border-right: 2px solid #000;
                border-bottom: 2px solid #000;
                border-left: 0px solid #000;
                top: 83%;
                left: 10%;
                margin-left: -25px;
                transform: rotate(45deg);
                 background: #fff;   
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
                <li class="active open"><a href="show_appointment.jsp" class="menu-toggle"><i class="zmdi zmdi-account-add"></i><span>Appointment Request</span> </a>
                </li>
                <li><a href="javascript:void(0);" class="menu-toggle"><i class="zmdi zmdi-account-o"></i><span>Patients</span> </a>
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
            <h2>Show Appointment</h2>
          <small class="text-muted">Welcome to Healthcare application</small>
        </div>
        <div class="container-fluid">
           <div class="row">
                        <div class="col-md-12">
                            <div class="tabbable-line">
                               <ul class="nav nav-pills nav-pills-rose" style="height: 100px;">
									<li><a href="#" class="list-btn" id="listview">Request Appointment</a></li>
										
									<li><a href="#" class="list-btn" id="gridview">Appointment</a></li>
										
								</ul>	
                                <div class="tab-content">
                                    <div class="tab-pane active fontawesome-demo" id="tab1">
                                        <div class="row">
					    <div class="col-md-12">
                                                <div class="container bg-white p-5">
                                                    
                                                <div>
                                                    <table  id="example4"  data-toggle="table" data-search="true" data-pagination="true">
                                                        <thead  style="color: black">
                                                            <tr>
					                        <th>Doctor Name</th>
                                                                <th> Paitent First Name</th>
					                        <th> Paitent Last Name </th>
					                        <th> Paitent Age </th>
					                        <th> Date Of Appointment </th>
					                        <th> Time Of Appointment</th>
					                        <th> Mobile </th>
                                                                <th>Email</th>
                                                                <th>Condition</th>
                                                                <th>Note</th>
					                        <th> Action </th>
					                    </tr>
					                </thead>
                                                        <tbody style="color: black" id="mylocation">   
							<%
                                                          ResultSet rstd=insertcommand("select * from appointment");
                                                                while(rstd.next()){
                                                                    out.println("<tr>"
                                                                        + "<td>"+rstd.getString(1)+"</td>"
                                                                        + "<td>"+rstd.getString(2)+"</td>"
                                                                        + "<td>"+rstd.getString(3)+"</td>"
                                                                        + "<td>"+rstd.getString(4)+"</td>"
                                                                        + "<td>"+rstd.getString(5)+"</td>"
                                                                        + "<td>"+rstd.getString(6)+"</td>"
                                                                        + "<td>"+rstd.getString(7)+"</td>"
                                                                        + "<td>"+rstd.getString(8)+"</td>"
                                                                        + "<td>"+rstd.getString(9)+"</td>" 
                                                                        + "<td>"+rstd.getString(10)+"</td>"    
                                                                        + "<td><form action='accept_appointment.jsp' method='GET'><input type='hidden' value='a' name='selector'><input type='hidden' value='"+rstd.getString(8)+"' name='id'><button class='btn btn-primary' name='submit' value='accept' type='submit' style='padding: 6px 10px 10px 10px;border-radius: 50%;'><i class='fa fa-check' aria-hidden='true'></i></button></form></td>" 
                                                                        + "<td><form action='accept_appointment.jsp' method='GET'><input type='hidden' value='r' name='selector'><input type='hidden' value='"+rstd.getString(8)+"' name='id'><button class='btn btn-danger' name='submit' value='reject' type='submit' style='padding: 6px 10px 10px 10px;border-radius: 50%;'><i style='color:#fff' class='fa fa-times' aria-hidden='true'></i></button></form></td>"        
                                                                        + "</tr>");
                                                                            }
                                                        %>						
							</tbody>
					        </table>
                                                </div>
                                            </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane active fontawesome-demo" id="tab2">
                                        <div class="row">
					    <div class="col-md-12">
                                                <div class="container bg-white p-5">
                                                    
                                                <div>
                                                    <table  id="example4"  data-toggle="table" data-search="true" data-pagination="true">
                                                        <thead  style="color: black">
                                                            <tr>
					                        <th>Doctor Name</th>
                                                                <th> Paitent First Name</th>
					                        <th> Paitent Last Name </th>
					                        <th> Paitent Age </th>
					                        <th> Date Of Appointment </th>
					                        <th> Time Of Appointment</th>
					                        <th> Mobile </th>
                                                                <th>Email</th>
                                                                <th>Condition</th>
                                                                <th>Note</th>
					                        
					                    </tr>
					                </thead>
                                                        <tbody style="color: black" id="mylocation">   
							<%
                                                          ResultSet rst=insertcommand("select * from appointment_reg");
                                                                while(rst.next()){
                                                                    out.println("<tr>"
                                                                        + "<td>"+rst.getString(1)+"</td>"
                                                                        + "<td>"+rst.getString(2)+"</td>"
                                                                        + "<td>"+rst.getString(3)+"</td>"
                                                                        + "<td>"+rst.getString(4)+"</td>"
                                                                        + "<td>"+rst.getString(5)+"</td>"
                                                                        + "<td>"+rst.getString(6)+"</td>"
                                                                        + "<td>"+rst.getString(7)+"</td>"
                                                                        + "<td>"+rst.getString(8)+"</td>"
                                                                        + "<td>"+rst.getString(9)+"</td>" 
                                                                        + "<td>"+rst.getString(10)+"</td>"    
                                                                        + "</tr>");
                                                                            }
                                                        %>						
							</tbody>
					        </table>
                                                </div>
                                            </div>
                                            </div>
                                        </div>
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
<script src="assets/plugins/bootstrap/js/bootstrap-table.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.13.5/bootstrap-table.min.js"></script>
<script>
    $(document).ready(function(){
        $("#tab2").hide();
        $("#gridview").click(function(){
            $("#tab2").show();
            $("#tab1").hide();
        })
        $("#listview").click(function(){
            $("#tab2").hide();
            $("#tab1").show();
        })
    });
</script>
</body>
</html>

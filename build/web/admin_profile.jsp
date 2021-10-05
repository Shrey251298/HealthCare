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
%>
<%  String pic=(String)session.getAttribute("userid"); %>
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
<!-- Swift Themes. You can choose a theme from css/themes instead of get all themes -->
<link href="assets/css/themes/all-themes.css" rel="stylesheet" />
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
        <div class="navbar-header"> <a href="javascript:void(0);" class="bars"></a> <a class="navbar-brand" href="admin_dashboard.jsp">Healthcare</a> </div>
        <ul class="nav navbar-nav navbar-right">
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
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_healthcare_system","root","tiger");
                                    Statement st=con.createStatement();
                                    String sql="select * from admin_image where  emailid='"+pic+"'";
                                    ResultSet rs=st.executeQuery(sql);
                                    while(rs.next()){
                                        String filename = rs.getString("filename");
                                %>      
                                <img src="image/<%=filename%>">
                                <% }
                                    }
                                          catch(Exception e){
                                          out.println(e);
                                          }
                                %>
            </div>
            <div class="admin-action-info"> <span>Welcome</span>
                
                                <%
                                    try{
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_healthcare_system","root","tiger");
                                    Statement st=con.createStatement();
                                    String sql="select * from admin_login where  emailid='"+pic+"'";
                                    ResultSet rs=st.executeQuery(sql);
                                    while(rs.next()){
                                        String firstname = rs.getString("firstname");
                                %>      
                                <h3><%=firstname%></h3>
                                <% }
                                    }
                                          catch(Exception e){
                                          out.println(e);
                                          }
                                %>
                <ul>
                    
                    <li><a data-placement="bottom" title="Go to Profile" href="admin_profile.jsp"><i class="zmdi zmdi-account"></i></a></li>                    
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
                                  doctor=insertcommand("select count(*) from doctor_reg");;
                                  while(doctor.next()){
                                      drow=doctor.getString(1);
                                      out.println(drow);
                                  }
                            %><i>Panding</i></span></li>
                    <li><span>04<i>Visit</i></span></li>
                </ul>
            </div>
        </div>
        <!-- #User Info --> 
        <!-- Menu -->
        <div class="menu">
            <ul class="list">
                <li class="header">MAIN NAVIGATION</li>
                <li class="active open"><a href="admin_dashboard.jsp"><i class="zmdi zmdi-home"></i><span>Dashboard</span></a></li>
                <li><a href="javascript:void(0);" class="menu-toggle"><i class="zmdi zmdi-account-add"></i><span>Doctors</span> </a>
                    <ul class="ml-menu">
                        <li><a href="doctor_list.jsp">All Doctors</a></li>
                        
                    </ul>
                </li>
                <li><a href="javascript:void(0);" class="menu-toggle"><i class="zmdi zmdi-account-o"></i><span>Patients</span> </a>
                    <ul class="ml-menu">
                        <li><a href="paitent_list.jsp">Manage Patients</a></li>
                                              
                    </ul>
                </li>
                <li><a href="product1.jsp"><i class="zmdi zmdi-shopping-cart"></i><span>Product</span></a></li>
                
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
                <li><a href="admin_profile.jsp"><i class="zmdi zmdi-edit"></i><span>Edit Profile</span></a></li>
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

<section class="content profile-page">
    <div class="container-fluid">
        <div class="row clearfix">
            <div class="col-md-12 p-l-0 p-r-0">
                <section class="boxs-simple">
                    <div class="profile-header">
                        <div class="profile_info">
                            <div class="profile-image"> 
                                <%
                                    try{
                                       
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_healthcare_system","root","tiger");
                                    Statement st=con.createStatement();
                                    String sql="select * from admin_image where emailid='"+pic+"'";
                                    ResultSet rs=st.executeQuery(sql);
                                    while(rs.next()){
                                        String filename = rs.getString("filename");
                                %>      
                                <img src="image/<%=filename%>">
                                <% }
                                    }
                                          catch(Exception e){
                                          out.println(e);
                                          }
                                %>
                            </div>
                            <%
                                    try{
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_healthcare_system","root","tiger");
                                    Statement st=con.createStatement();
                                    String sql="select * from admin_login where  emailid='"+pic+"'";
                                    ResultSet rs=st.executeQuery(sql);
                                    while(rs.next()){
                                        String firstname = rs.getString("firstname");
                                %>      
                               <h4 class="mb-0"><strong><%=firstname%></strong></h4>
                                <% }
                                    }
                                          catch(Exception e){
                                          out.println(e);
                                          }
                                %>
                            
                            <span class="text-muted col-white">Admin</span>
                            <div class="mt-10">
                                <form action="AdminUploadImage" method="post" enctype="multipart/form-data">
                                   
                                <input type="file" name="file"  class="btn btn-raised btn-default bg-green btn-sm" >
                                <input type="submit" class="btn btn-primary" value="Upload Image">
                                </form>
                            </div>
                            <p class="social-icon">
                                <a title="Twitter" href="#"><i class="zmdi zmdi-twitter"></i></a>
                                <a title="Facebook" href="#"><i class="zmdi zmdi-facebook"></i></a>
                                <a title="Google-plus" href="#"><i class="zmdi zmdi-twitter"></i></a>
                                <a title="Dribbble" href="#"><i class="zmdi zmdi-dribbble"></i></a>
                                <a title="Behance" href="#"><i class="zmdi zmdi-behance"></i></a>
                                <a title="Instagram" href="#"><i class="zmdi zmdi-instagram "></i></a>
                                <a title="Pinterest" href="#"><i class="zmdi zmdi-pinterest "></i></a>
                            </p>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <div class="row clearfix mt-5">
            <div class="col-lg-4 col-md-12">
                <div class="card">
                    <div class="header">
                        <h2>About Me</h2>
                        <hr>
                    </div>
                    <div class="body">
                        
                       <%
                                    try{
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_healthcare_system","root","tiger");
                                    Statement st=con.createStatement();
                                    String sql="select * from admin_login where  emailid='"+pic+"'";
                                    ResultSet ad=st.executeQuery(sql);
                                    while(ad.next()){ 
                                %> 
                                <div class="profile-desc">
                          Hello I am <%=ad.getString(4)%> in a Healthcare System. I love to work in the Healthcare System.
                        </div>
                                        <ul class="list-group list-group-unbordered">
                                            <li class="list-group-item">
                                                <b>ID :</b>
                                                <div class="profile-desc-item pull-right ml-5"><%=ad.getString(1)%></div>
                                            </li>
                                            <li class="list-group-item">
                                                <b>Email :</b>
                                                <div class="profile-desc-item pull-right ml-4"><%=ad.getString(2)%></div>
                                            </li>
                                             <li class="list-group-item">
                                                <b> Contact :</b>
                                                <div class="profile-desc-item pull-right ml-3"><%=ad.getString(7)%></div>
                                            </li>
                                            <li class="list-group-item">
                                                <b>Address</b>
                                                <div class="profile-desc-item pull-right"><%=ad.getString(6)%></div>
                                            </li>
                                        </ul>
                                        
                               <% }
                                    }
                                          catch(Exception e){
                                          out.println(e);
                                          }
                                %>   
                        <p class="text-default"></p>
                        <blockquote>
                            <small>Designer <cite title="Source Title">Source Title</cite></small> 
                        </blockquote>
                    </div>
                </div>
                <div class="card">
                    <div class="header">
                        <h2>My Portfolio Status</h2>
                    </div>
                    <div class="body">
                        <ul class="list-unstyled">
                            <li>
                                <div>Behance</div>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%"> <span class="sr-only">40% Complete (success)</span> </div>
                                </div>
                            </li>
                            <li>
                                <div>Themeforest</div>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%"> <span class="sr-only">20% Complete</span> </div>
                                </div>
                            </li>
                            <li>
                                <div>Dribbble</div>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-warning progress-bar-striped active" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%"> <span class="sr-only">60% Complete (warning)</span> </div>
                                </div>
                            </li>
                            <li>
                                <div>Pinterest</div>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-danger progress-bar-striped active" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%"> <span class="sr-only">80% Complete (danger)</span> </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-8 col-md-12">
                <div class="card">
                    <div class="body"> 
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs tab-nav-right" role="tablist">
                            <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#mypost">My Post</a></li>
                            <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#usersettings">Setting</a></li>
                        </ul>
                        
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane in active" id="mypost">
                                <div class="wrap-reset">
                                    <form name="commentform">
                                        <div class="form-group">
                                            <div class="form-line">
                                                <textarea rows="4" name="comment" class="form-control no-resize" placeholder="Please type what you want..."></textarea>
                                            </div>
                                            <div class="form-line">
                                                <input type="text" name="email" class="form-control" placeholder="Enter Email" required/>
                                            </div>
                                        </div>
                                        <div class="post-toolbar-b"> <input type="button" class="pull-right btn btn-raised btn-success btn-sm" tooltip="Post it!" value="Post Comment" onclick="postComment()"> </div> 
                                    </form>    
                                    <div class="mypost-list" id="mylocation"></div>
                                </div>
                            </div>
                            
                            <div role="tabpanel" class="tab-pane" id="usersettings">
                               <div class="body">
                                    
                                    <h2 class="card-inside-title">Account Settings</h2>
                                    <form action="admineditprocess" method="post"> 
                                    <div class="row clearfix">
                                        <div class="col-lg-6 col-md-12">
                                            <div class="form-group">
                                                <div class="form-line">
                                                    <input type="text" name="adminame" class="form-control" placeholder="First Name">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-12">
                                            <div class="form-group">
                                                <div class="form-line">
                                                    <input type="text" name="adminlast" class="form-control" placeholder="Last Name">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-12">
                                            <div class="form-group">
                                                <div class="form-line">
                                                    <textarea rows="4" name="address" class="form-control no-resize" placeholder="Address Line 1"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-12">
                                            <div class="form-group">
                                                <div class="form-line">
                                                    <input type="text" name="pass" class="form-control" placeholder="Password">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <div class="form-line">
                                                    <input type="text" name="contact" class="form-control" placeholder="Contact">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <div class="form-line">
                                                    <input type="text" name="email" class="form-control" placeholder="E-mail">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <div class="form-line">
                                                    <input type="text" name="country" class="form-control" placeholder="Country">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <button class="btn btn-raised btn-success" type="submit">Save Changes</button>
                                        </div>
                                           
                                    </div>
                                    </form>    
                               </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Modal Part Of Mediclam -->                              
<div class="modal fade" id="CashlessMediclaim" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="defaultModalLabel">Cashless Mediclaim</h4>
            </div>
            <div class="modal-body">
                <p> Cashless mediclaim service offers an insured person the benefit of availing medical treatment at the best hospitals, without having to pay from his/her own pocket.</p> 
                <p>Hospitalization bills, up to the sum insured are directly settled by the insurance company. In this process, prior approval of the TPA (Third-Party Administrator) is required.</p>
                <p>If cashless mediclaim facility is offered in your health insurance policy, you need not run around arranging funds at the time of medical emergency.</p>
                <p> This cashless mediclaim service can be availed only in network hospitals of the insurer.</p>
                <p>Thus, we can say that under such facility, the insurer directly pays to the hospital for the customers’ medical treatment.</p>
                <p> And the insured is saved from running for money at a crucial time.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-link waves-effect" data-dismiss="modal">CLOSE</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="ReimbursementMediclaim" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="defaultModalLabel">Reimbursement Mediclaim</h4>
            </div>
            <div class="modal-body">
                <p>The reimbursement claim for health insurance can be made if the policyholder opts to go to a hospital of his/ her choice, which is a non-empanelled hospital.</p> 
                <p>In this case, the cashless claim facility cannot be used.</p> 
                <p>Therefore, the insured has to pay all his/ her medical bills and other costs involved in hospitalization and treatment and then claim reimbursement.</p> 
                <p>In order to avail reimbursement claim you have to provide the necessary documents including original bills to the insurance provider.</p> 
                <p>The company will then evaluate the claim to see its scope under the policy cover and then makes a payment to the insured.</p> 
                <p>In case the treatment is not covered under the policy, the claim will be rejected.</p>
                <p>The insurance provider generally provides reasons for the rejection.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-link waves-effect" data-dismiss="modal">CLOSE</button>
            </div>
        </div>
    </div>
</div>
<!-- //Modal Part Of Mediclam -->
<div class="color-bg"></div>
<!-- Jquery Core Js --> 
<script src="assets/bundles/libscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js -->
<script src="assets/bundles/morphingsearchscripts.bundle.js"></script> <!-- morphing search Js --> 
<script src="assets/bundles/vendorscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js --> 

<script src="assets/plugins/jquery-sparkline/jquery.sparkline.min.js"></script> <!-- Sparkline Plugin Js -->
<script src="assets/plugins/chartjs/Chart.bundle.min.js"></script> <!-- Chart Plugins Js --> 

<script src="assets/bundles/mainscripts.bundle.js"></script><!-- Custom Js -->
<script src="assets/bundles/morphingscripts.bundle.js"></script><!-- morphing search page js --> 
<!--<script src="assets/js/pages/index.js"></script>-->
<script src="assets/js/pages/charts/sparkline.min.js"></script>
<script>  
var request;  
function postComment(){  
var comment=document.commentform.comment.value;  
var email=document.commentform.email.value;  
  
var url="comment.jsp?comment="+comment+"&email="+email;  
  
if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try{  
request.onreadystatechange=function(){  
if(request.readyState==4){  
var val=request.responseText;  
document.getElementById('mylocation').innerHTML=val;  
}  
}//end of function  
request.open("GET",url,true);  
request.send();  
}catch(e){alert("Unable to connect to server");}  
}  
</script>  

</body>
</html>
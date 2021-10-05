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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="assets/plugins/morrisjs/morris.css" rel="stylesheet" />
<!-- Custom Css -->
<link href="assets/css/main.css" rel="stylesheet">
<link href="assets/css/abhi.css" rel="stylesheet">
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
<div id="morphsearch" class="morphsearch">
    <form class="morphsearch-form">
        
    </form>
    
    <!-- /morphsearch-content --> 
    <span class="morphsearch-close"></span> </div>
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

<section class="content home">
    <div class="container-fluid">
        <div class="block-header">
            <h2>Dashboard</h2>
            <small class="text-muted">Welcome to Healthcare application</small>
        </div>
        
        <div class="row clearfix">
            <div class="col-lg-3 col-md-3 col-sm-6">
                <div class="info-box-4 hover-zoom-effect">
                    <div class="icon"> <i class="zmdi zmdi-account col-blue"></i> </div>
                    <div class="content">
                        <div class="text">New Patient</div>
                        <div class="number">
                            <%
                            paitent=insertcommand("select count(*) from paitent_reg");
                                  while(paitent.next()){
                                      row=paitent.getString(1);
                                      out.println(row);
                                  }
                            %>
                        </div>    
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6">
                <div class="info-box-4 hover-zoom-effect">
                    <div class="icon"> <i class="zmdi zmdi-account col-green"></i> </div>
                    <div class="content">
                        <div class="text">Doctor</div>
                        <div class="number"><%
                        doctorp=insertcommand("select count(*) from doctor_reg_perment");
                                  while(doctorp.next()){
                                      dprow=doctorp.getString(1);
                                      out.println(dprow);
                                  }
                            %></div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6">
                <div class="info-box-4 hover-zoom-effect">
                    <div class="icon"> <i class="zmdi zmdi-bug col-blush"></i> </div>
                    <div class="content">
                        <div class="text">Today's Operations</div>
                        <div class="number">05</div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6">
                <div class="info-box-4 hover-zoom-effect">
                    <div class="icon"> <i class="zmdi zmdi-balance col-cyan"></i> </div>
                    <div class="content">
                        <div class="text">Hospital Earning</div>
                        <div class="number">$3,540</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="card">
                    <div class="header">
                        <h2>Hospital Survey</h2>
                        <ul class="header-dropdown">
                            <li class="dropdown"> <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="zmdi zmdi-more-vert"></i></a>
                                <ul class="dropdown-menu float-right">
                                    <li><a href="javascript:void(0);">Action</a></li>
                                    <li><a href="javascript:void(0);">Another action</a></li>
                                    <li><a href="javascript:void(0);">Something else here</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="body">
                        <canvas id="line_chart" height="70"></canvas>
                    </div>
                </div>
            </div>
        </div>
        <div class="row clearfix">
            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                <div class="card">
                    <div class="header">
                        <h2>New Patient <small >18% High then last month</small></h2>
                        <ul class="header-dropdown">
                            <li class="dropdown"> <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="zmdi zmdi-more-vert"></i></a>
                                <ul class="dropdown-menu float-right">
                                    <li><a href="javascript:void(0);">Action</a></li>
                                    <li><a href="javascript:void(0);">Another action</a></li>
                                    <li><a href="javascript:void(0);">Something else here</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="body">
                        <div class="stats-report">
                          <div class="stat-item">
                            <h5>Overall</h5>
                            <b class="col-indigo">70.40%</b></div>
                          <div class="stat-item">
                            <h5>Montly</h5>
                            <b class="col-indigo">25.80%</b></div>
                          <div class="stat-item">
                            <h5>Day</h5>
                            <b class="col-indigo">12.50%</b></div>
                        </div>
                        <div class="sparkline" data-type="line" data-spot-Radius="3" data-highlight-Spot-Color="rgb(63, 81, 181)" data-highlight-Line-Color="#222"
                                 data-min-Spot-Color="rgb(233, 30, 99)" data-max-Spot-Color="rgb(63, 81, 181)" data-spot-Color="rgb(63, 81, 181, 0.7)"
                                 data-offset="90" data-width="100%" data-height="100px" data-line-Width="1" data-line-Color="rgb(63, 81, 181, 0.7)"
                                 data-fill-Color="rgba(63, 81, 181, 0.3)"> 6,1,3,3,6,3,2,2,8,2 </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                <div class="card">
                    <div class="header">
                        <h2>Medical Treatment <small>18% High then last month</small></h2>
                        <ul class="header-dropdown">
                            <li class="dropdown"> <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="zmdi zmdi-more-vert"></i></a>
                                <ul class="dropdown-menu float-right">
                                    <li><a href="javascript:void(0);">Action</a></li>
                                    <li><a href="javascript:void(0);">Another action</a></li>
                                    <li><a href="javascript:void(0);">Something else here</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="body">
                        <div class="stats-report">
                          <div class="stat-item">
                            <h5>Overall</h5>
                            <b class="col-green">84.60%</b></div>
                          <div class="stat-item">
                            <h5>Montly</h5>
                            <b class="col-green">15.40%</b></div>
                          <div class="stat-item">
                            <h5>Day</h5>
                            <b class="col-green">5.10%</b></div>
                        </div>
                        <div class="sparkline" data-type="line" data-spot-Radius="3" data-highlight-Spot-Color="rgb(233, 30, 99)" data-highlight-Line-Color="#222"
                                 data-min-Spot-Color="rgb(233, 30, 99)" data-max-Spot-Color="rgb(120, 184, 62)" data-spot-Color="rgb(120, 184, 62, 0.7)"
                                 data-offset="90" data-width="100%" data-height="100px" data-line-Width="1" data-line-Color="rgb(120, 184, 62, 0.7)"
                                 data-fill-Color="rgba(120, 184, 62, 0.3)"> 6,4,7,6,9,3,3,5,7,4,2,3,7,6 </div>
                    </div>
                </div>
            </div>
           <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                <div class="card">
                    <div class="header">
                        <h2>Heart Surgeries <small>18% High then last month</small></h2>
                        <ul class="header-dropdown">
                            <li class="dropdown"> <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="zmdi zmdi-more-vert"></i></a>
                                <ul class="dropdown-menu float-right">
                                    <li><a href="javascript:void(0);">Action</a></li>
                                    <li><a href="javascript:void(0);">Another action</a></li>
                                    <li><a href="javascript:void(0);">Something else here</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="body">
                        <div class="stats-report">
                          <div class="stat-item">
                            <h5>Overall</h5>
                            <b class="col-blue-grey">80.40%</b></div>
                          <div class="stat-item">
                            <h5>Montly</h5>
                            <b class="col-blue-grey">13.00%</b></div>
                          <div class="stat-item">
                            <h5>Day</h5>
                            <b class="col-blue-grey">9.50%</b></div>
                        </div>
                        <div class="sparkline" data-type="line" data-spot-Radius="3" data-highlight-Spot-Color="rgb(233, 30, 99)" data-highlight-Line-Color="#222"
                                 data-min-Spot-Color="rgb(233, 30, 99)" data-max-Spot-Color="rgb(96, 125, 139)" data-spot-Color="rgb(96, 125, 139, 0.7)"
                                 data-offset="90" data-width="100%" data-height="100px" data-line-Width="1" data-line-Color="rgb(96, 125, 139, 0.7)"
                                 data-fill-Color="rgba(96, 125, 139, 0.3)"> 6,4,7,8,4,3,2,2,5,6,7,4,1,5,7,9,9,8,7,6 </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="card">
                    <div class="header">
                        <h2> New Patient List <small>Patient List</small> </h2>
                        <ul class="header-dropdown">
                            <li class="dropdown"> <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="zmdi zmdi-more-vert"></i></a>
                                <ul class="dropdown-menu float-right">
                                    <li><a href="javascript:void(0);" class=" waves-effect waves-block">Action</a></li>
                                    <li><a href="javascript:void(0);" class=" waves-effect waves-block">Another action</a></li>
                                    <li><a href="javascript:void(0);" class=" waves-effect waves-block">Something else here</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="body">
                        <div class="table-responsive">
                          <table class="table table-striped">
                            <thead>
                              <tr>
                                <th>#</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Email</th>
                                <th>Gender</th>
                              </tr>
                            </thead>
                            <tbody>
                              <%
                                  ResultSet r=insertcommand("select * from paitent_reg");
                                  while(r.next()){
                                      out.println("<tr><td>"+r.getString(1)+"</td>"
                                              + "<td>"+r.getString(4)+"</td>"
                                              + "<td>"+r.getString(5)+"</td>"
                                              + "<td>"+r.getString(2)+"</td>"
                                              + "<td>"+r.getString(7)+"</td>"
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
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="card">
                    <div class="header">
                        <h2>Confirm Doctor List <small>Doctor List</small> </h2>
                        <ul class="header-dropdown">
                            <li class="dropdown"> <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="zmdi zmdi-more-vert"></i></a>
                                <ul class="dropdown-menu float-right">
                                    <li><a href="javascript:void(0);" class=" waves-effect waves-block">Action</a></li>
                                    <li><a href="javascript:void(0);" class=" waves-effect waves-block">Another action</a></li>
                                    <li><a href="javascript:void(0);" class=" waves-effect waves-block">Something else here</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="body">
                        <button type="button" class="btn btn-raised btn-primary waves-effect" id="showperment">Show Perment Doctor</button>
                         <button type="button" class="btn btn-raised btn-primary waves-effect" id="showtempory">Confirm Doctor</button>
                            <div class="table-responsive" id="showtemporydata">
                            <table class="table table-striped">
                              <thead>
                                <tr>
                                  <th>M.C.I No</th>
                                  <th>Name</th>
                                  <th>Gender</th>
                                  <th>Email</th>
                                  <th>Accept</th>
                                  <th>Reject</th>
                                </tr>
                              </thead>
                              <tbody>
                                <%
                                    ResultSet rst=insertcommand("select * from doctor_reg");
                                    while(rst.next()){
                                        out.println("<tr>"
                                                + "<td>"+rst.getString(10)+"</td>"
                                                + "<td>"+rst.getString(3)+"</td>"
                                                + "<td>"+rst.getString(6)+"</td>"
                                                + "<td>"+rst.getString(1)+"</td>"
                                                + "<td><form action='accept.jsp' method='GET'><input type='hidden' value='a' name='selector'><input type='hidden' value='"+rst.getString(1)+"' name='id'><button class='btn btn-primary' name='submit' value='accept' type='submit' style='padding: 6px 10px 10px 10px;border-radius: 50%;'><i class='fa fa-check' aria-hidden='true'></i></button></form></td>"
                                                + "<td><form action='accept.jsp' method='GET'><input type='hidden' value='r' name='selector'><input type='hidden' value='"+rst.getString(1)+"' name='id'><button class='btn btn-danger' name='submit' value='reject' type='submit' style='padding: 6px 10px 10px 10px;border-radius: 50%;'><i style='color:#fff' class='fa fa-trash' aria-hidden='true'></i></button></form></td>"
                                                + "</tr>");
                                    }
                                %>
                              </tbody>
                            </table>
                          </div>
                              <div class="table-responsive" id="showpermentdata">
                            <table class="table table-striped">
                              <thead>
                                <tr>
                                  <th>M.C.I No</th>
                                  <th>Name</th>
                                  <th>Gender</th>
                                  <th>Email</th>
                                </tr>
                              </thead>
                              <tbody>
                                <%
                                    ResultSet rs=insertcommand("select * from doctor_reg_perment");
                                    while(rs.next()){
                                        out.println("<tr>"
                                                + "<td>"+rs.getString(10)+"</td>"
                                                + "<td>"+rs.getString(3)+"</td>"
                                                + "<td>"+rs.getString(6)+"</td>"
                                                + "<td>"+rs.getString(1)+"</td>"
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
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="card">
                    <div class="header">
                        <h2> Add Product <small>Description text here...</small> </h2>
                        <ul class="header-dropdown">
                            <li class="dropdown"> <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="zmdi zmdi-more-vert"></i></a>
                                <ul class="dropdown-menu float-right">
                                    <li><a href="javascript:void(0);" class=" waves-effect waves-block">Action</a></li>
                                    <li><a href="javascript:void(0);" class=" waves-effect waves-block">Another action</a></li>
                                    <li><a href="javascript:void(0);" class=" waves-effect waves-block">Something else here</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="body">
                        <form action="FileUploadImage" method="post" class="fomr" enctype="multipart/form-data">
                            <div class="radio">
                                        <input type="radio" name="product" id="medicine" value="medicine">
                                        <label for="medicine">Medicine</label>
                                        <input type="radio" name="product" id="healthproduct" value="healthproduct">
                                        <label for="healthproduct">Health Product</label>
                            </div> 
                            <div class="row">
                                <div class="col-2"><label>Product Id</label></div>
                                <div class="col-6"><input type="text" name="pid" required class="form-control"></div>
                            </div>
                            <div class="row">
                                <div class="col-2"><label>Product Name</label></div>
                                <div class="col-6"><input type="text" name="pname" required class="form-control"></div>
                            </div>
                            <div class="row">
                                <div class="col-2"><label>Product Price</label></div>
                                <div class="col-6"><input type="text" name="pprice" required class="form-control"></div>
                            </div>
                            <div class="row">
                                <div class="col-2"><label>Product Description</label></div>
                                <div class="col-6"><input type="text" name="pdescription" required class="form-control"></div>
                            </div>
                            <div class="row">
                                <div class="col-2"><label>Product Image</label></div>
                                <div class="col-6"><input type="file" name="pfile" required="" class="form-control-file"></div>
                            </div>
                            <div class="row">
                                <div class="col-2"></div>
                                <div class="col-6"><input type="submit" name="" required value="add" class="btn btn-primary"></div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
         <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12">
                 <div class="card">
                    <div class="header">
                        <h2>HealthCare Tips <small>Add Multiple HealthCare Tips</small></h2>
                        <ul class="header-dropdown">
                            <li class="dropdown"> <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="zmdi zmdi-more-vert"></i></a>
                                <ul class="dropdown-menu float-right">
                                    <li><a href="javascript:void(0);">Action</a></li>
                                    <li><a href="javascript:void(0);">Another action</a></li>
                                    <li><a href="javascript:void(0);">Something else here</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="body">
                        <form action="tips.jsp" method="post">
                            <select name="type_tips" class="form-control">
                                <option value="eyetip">Eye Tips</option>
                                <option value="skintip">Skin Tips</option>
                                <option value="hairtip">Hair Tips</option>
                                <option value="healthtip">Health Tips</option>
                            </select>
                            <textarea name="tips" rows="5"  style="height: 100px;" required class="form-control" placeholder="Enter Tips"></textarea><br>
                            <input type="submit"  required="" value="add" class="btn btn-raised btn-primary waves-effect">
                        </form>   
                    </div>
                </div>
            </div>
        </div>                      
        <div class="row clearfix">
            <div class="col-lg-4 col-md-4 col-sm-6">
                <div class="card">
                    <div class="header">
                        <h2>PATIENT Reports</h2>
                        <ul class="header-dropdown">
                            <li class="dropdown"> <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="zmdi zmdi-more-vert"></i></a>
                                <ul class="dropdown-menu float-right">
                                    <li><a href="javascript:void(0);">Action</a></li>
                                    <li><a href="javascript:void(0);">Another action</a></li>
                                    <li><a href="javascript:void(0);">Something else here</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="body">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>First Name</th>
                                        <th>Charts</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Dean Otto</td>
                                        <td>
                                            <span class="sparkbar">5,8,6,3,5,9,2</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>K. Thornton</td>
                                        <td>
                                        <span class="sparkbar">10,8,9,3,5,8,5</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Kane D.</td>
                                        <td>
                                            <span class="sparkbar">7,5,9,3,5,2,5</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Jack Bird</td>
                                        <td>
                                            <span class="sparkbar">10,8,1,3,3,8,7</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Hughe L.</td>
                                        <td>
                                            <span class="sparkbar">2,8,9,8,5,1,5</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Jack Bird</td>
                                        <td>
                                            <span class="sparkbar">1,8,2,3,9,8,5</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Hughe L.</td>
                                        <td>
                                            <span class="sparkbar">10,8,1,3,2,8,5</span>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6">
                <div class="card">
                    <div class="header">
                        <h2>Visits from countries</h2>
                        <ul class="header-dropdown">
                            <li class="dropdown"> <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="zmdi zmdi-more-vert"></i></a>
                                <ul class="dropdown-menu float-right">
                                    <li><a href="javascript:void(0);" class=" waves-effect waves-block">Action</a></li>
                                    <li><a href="javascript:void(0);" class=" waves-effect waves-block">Another action</a></li>
                                    <li><a href="javascript:void(0);" class=" waves-effect waves-block">Something else here</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="body">
                        <ul class="country-state">
                            <li class="m-b-20">
                                <h4 class="m-b-0">6350</h4> <small>From India</small>
                                <div class="float-right">58%</div>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width:58%;"> <span class="sr-only">58% Complete</span></div>
                                </div>
                            </li>
                            <li class="m-b-20">
                                <h4 class="m-b-0">3250</h4> <small>From UAE</small>
                                <div class="float-right">90%</div>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-inverse" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width:90%;"> <span class="sr-only">90% Complete</span></div>
                                </div>
                            </li>
                            <li class="m-b-20">
                                <h4 class="m-b-0">1250</h4> <small>From Australia</small>
                                <div class="float-right">70%</div>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width:70%;"> <span class="sr-only">70% Complete</span></div>
                                </div>
                            </li>
                            <li  class="m-b-20">
                                <h4 class="m-b-0">1350</h4> <small>From USA</small>
                                <div class="float-right">70%</div>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width:70%;"> <span class="sr-only">70% Complete</span></div>
                                </div>
                            </li>
                            <li>
                                <h4 class="m-b-0">1250</h4> <small>From UK</small>
                                <div class="float-right">65%</div>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width:65%;"> <span class="sr-only">65% Complete</span></div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6">
                <div class="card">
                    <div class="header">
                        <h2>PATIENT prograss</h2>
                        <ul class="header-dropdown">
                            <li class="dropdown"> <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="zmdi zmdi-more-vert"></i></a>
                                <ul class="dropdown-menu float-right">
                                    <li><a href="javascript:void(0);" class=" waves-effect waves-block">Action</a></li>
                                    <li><a href="javascript:void(0);" class=" waves-effect waves-block">Another action</a></li>
                                    <li><a href="javascript:void(0);" class=" waves-effect waves-block">Something else here</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="body">
                        <ul class="basic-list">
                            <li>Mark Otto <span class="label-danger label">21%</span></li>
                            <li>Jacob Thornton <span class="label-purple label">50%</span></li>
                            <li>Jacob Thornton<span class="label-success label">90%</span></li>
                            <li>M. Arthur <span class="label-info label">75%</span></li>
                            <li>Jacob Thornton <span class="label-warning label">60%</span></li>
                            <li>M. Arthur <span class="label-success label">91%</span></li>
                        </ul>
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
<script src="assets/js/pages/index.js"></script>
<script src="assets/js/pages/charts/sparkline.min.js"></script>
<script>
    $(document).ready(function(){
        $("#showpermentdata").hide();
        $("#showperment").click(function(){
            $("#showpermentdata").show();
            $("#showtemporydata").hide();
        })
        $("#showtempory").click(function(){
            $("#showpermentdata").hide();
            $("#showtemporydata").show();
        })
    });
</script>
</body>
</html>
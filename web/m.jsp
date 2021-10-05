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
<!-- Swift Themes. You can choose a theme from css/themes instead of get all themes -->
<link href="assets/css/themes/all-themes.css" rel="stylesheet" />
<style>
    .text{
                position: relative;
                max-width: 600px;
                height: auto;
                border: 3px solid #eee;
                margin: 35px auto;
                box-shadow: -1px -2px 0px 0px #eee;
                border-radius: 5px;
                box-sizing: border-box;
                background: #eee;
                padding: 10px;
                
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
                                    String sql="select * from doctor_reg_perment where  email='"+pic+"'";
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
                <li class="active open"><a href="doctor_dashboard.jsp"><i class="zmdi zmdi-home"></i><span>Dashboard</span></a></li>
                <li><a href="show_appointment.jsp" class="menu-toggle"><i class="zmdi zmdi-account-add"></i><span>Appointment Request</span> </a>
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
            <h2>Buy Medicine</h2>
            <small class="text-muted">Buy Best Medicine From This System.</small>
        </div>
        <div class="container">
            <div class="row">
                
            </div>
            <div class="row">
                <div class="col-12">
                    
                    <div class="container product mb-5"> 
                        <div class="row">
                        <div class="col-12 mb-3 mt-3">
                            <form>
                                <input type="text" class="search-item" name="search" placeholder="Search..">
                            </form>
                        </div>
                    </div>
                    <div class="row">
                    <%
                                                            ResultSet rd=insertcommand("select * from medicine_table");
                                                            while(rd.next()){
                                                                String filename = rd.getString("m_filename");
                                                                out.print("<div class='col-4 mt-3'>");
                                                                out.print("<div class='card-product shop-items'>");
                                                                out.print("<div class='top-section shop-item-details'>");
                                            %>
                                            <img id="image-container" class="shop-item-image" src="images/product/<%=filename%>">
                        <% 
                                                                
                                                                out.print("<div class='price shop-item-price'>$"+rd.getString(3)+"</div>");
                                                                out.print("</div>");
                                                                out.print("<div class='product-info'>");
                                                                out.print("<h1 class='name shop-item-title'>"+rd.getString(2)+"<p class='dis'>"+rd.getString(4)+"</p></h1>");
                                                                
                                                                out.println("<a class='btn-product shop-item-button' href='#'>Add to cart</a>");
                                                                out.print("</div>");
                                                                out.println("</div>");
                                                                out.println("</div>");
                                                                
                                                                
                                                            }
                        %>    
                        <section class="container content-section">
                                <h2 class="section-header">CART</h2>
                                <div class="cart-row">
                                    <span class="cart-item cart-header cart-column">ITEM</span>
                                    <span class="cart-price cart-header cart-column">PRICE</span>
                                    <span class="cart-quantity cart-header cart-column">QUANTITY</span>
                                </div>
                                <div class="cart-items">
                                </div>
                                <div class="cart-total">
                                    <strong class="cart-total-title">Total</strong>
                                    <span class="cart-total-price">$0</span>
                                </div>
                                <button class="btn btn-primary btn-purchase" type="button">PURCHASE</button>
                            </section>
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
<script src="assets/js/pages/charts/sparkline.min.js"></script>
<script src="assets/js/store.js"></script>
</body>
</html>
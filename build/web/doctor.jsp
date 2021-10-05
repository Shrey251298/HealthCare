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
<%  String pics=(String)session.getAttribute("paitentid"); %>
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
		width: 100%;height: 100%;max-height: 180px;border: 6px solid #dee2e6;border-radius: 10px;margin: 0px 25px;max-width: 180px; position: relative; top: -100px;
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
    padding: 15px 44px !important;
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
                                             ResultSet im=insertcommand("select * from profile_img where userid = '"+pics+"' ");
                                             while(im.next()){
                                                 int status=im.getInt("status");
                                                 if(status == 0){
                                                     ResultSet image=insertcommand("select * from paitent_image where email = '"+pics+"' ");
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
                                    String sql="select * from paitent_reg where email='"+pics+"'";
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
                    
                    <li><a data-placement="bottom" title="Go to Profile" href="paitent_dashboard.jsp"><i class="zmdi zmdi-account"></i></a></li>                    
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
                                  doctor=insertcommand("select count(*) from doctor_reg_perment");;
                                  while(doctor.next()){
                                      drow=doctor.getString(1);
                                      out.println(drow);
                                  }
                            %><i>Doctor</i></span></li>
                    <li><span>04<i>Visit</i></span></li>
                </ul>
            </div>
        </div>
        <!-- #User Info --> 
        <!-- Menu -->
        <div class="menu">
            <ul class="list">
                <li class="header">MAIN NAVIGATION</li>
               <li ><a href="paitent_dashboard.jsp"><i class="zmdi zmdi-home"></i><span>Dashboard</span></a></li>
                <li class="active open"><a href="doctor.jsp"><i class="zmdi zmdi-home"></i><span>Doctor</span></a></li>
                <li ><a href="appointment.jsp"><i class="zmdi zmdi-home"></i><span>Appointment</span></a></li>
                <li><a href="javascript:void(0);" class="menu-toggle"><i class="zmdi zmdi-shopping-cart"></i><span>Product</span> </a>
                    <ul class="ml-menu">
                        <li> <a href="healthcareproduct.jsp">Health Product</a></li>
                        <li> <a href="medicine.jsp">Medicine</a></li>
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
            <h2>Search Doctor</h2>
            <small class="text-muted">Welcome to Healthcare application</small>
        </div>
        
        <div class="row clearfix">
            <div class="col-12" >
                <div class="card card-body" style="padding: 50px; border-radius: 30px;">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <form action="doctor.jsp">
                            <div class="row">
                                <div class="col-10">
                                    <input type="text" name="search" class="form-control">
                                </div>
                                <div class="col-2">
                                    <input type="submit" value="Search" class="form-control btn btn-primary" style="position: relative;top: -10px;padding-top: 7px;">
                                </div>    
                            </div>
                        </form>
                    </div>
                </div>
            </div>
                    <hr>        
             <div class="container">	
                    <div class="row">
                        <div class="col-10" style="margin: 50px 90px ;">
                  <% 
                        String type = request.getParameter("search");
                        if(type==null ||type.trim().equals(""))
                        {
                        ResultSet doc=insertcommand("select * from doctor_reg_perment");
                        while(doc.next()){
                            out.print("<div class='card' id='card2'  style='margin: 0px; border: 1px solid rgba(0,0,0,.125);border-radius: .25rem; max-width: 200px;' data-toggle='modal' data-target='#defaultModal"+doc.getString(3)+"'>");
                            out.print("<div class='card-body text-center'>");
                            out.print("<h3 class='card-title'>"+doc.getString(3)+"</h3>");
                            out.print("<p class='card-text'>"+doc.getString(16)+"</p>");
                            out.print("<p class='card-text'>"+doc.getString(9)+"</p>");
                            out.print("</div>");
                            out.print("</div>");
                            
                        }  
                        }
                        
                        else if(type.equals("pain in teeth")){
                             ResultSet doc=insertcommand("select * from doctor_reg_perment where department='dentalcare' ");
                        while(doc.next()){
                            out.print("<div class='card' id='card2'  style='margin: 0px; border: 1px solid rgba(0,0,0,.125);border-radius: .25rem; max-width: 200px;' data-toggle='modal' data-target='#defaultModal"+doc.getString(3)+"'>");
                            out.print("<div class='card-body text-center'>");
                            out.print("<h3 class='card-title'>"+doc.getString(3)+"</h3>");
                            out.print("<p class='card-text'>"+doc.getString(16)+"</p>");
                            out.print("<p class='card-text'>"+doc.getString(9)+"</p>");
                            out.print("</div>");
                            out.print("</div>");
                            
                        }  
                           }
                        else if(type.equals("diabetes")){
                                ResultSet doc=insertcommand("select * from doctor_reg_perment where department='Endocrinologists' ");
                        while(doc.next()){
                            out.print("<div class='card' id='card2'  style='margin: 0px; border: 1px solid rgba(0,0,0,.125);border-radius: .25rem; max-width: 200px;' data-toggle='modal' data-target='#defaultModal"+doc.getString(3)+"'>");
                            out.print("<div class='card-body text-center'>");
                            out.print("<h3 class='card-title'>"+doc.getString(3)+"</h3>");
                            out.print("<p class='card-text'>"+doc.getString(16)+"</p>");
                            out.print("<p class='card-text'>"+doc.getString(9)+"</p>");
                            out.print("</div>");
                            out.print("</div>");
                            
                        }  
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
 <%
                          ResultSet  doc=insertcommand("select * from doctor_reg_perment");
                        while(doc.next()){
                            String name=doc.getString("fname");
                            int status=doc.getInt("status");
                            String email=doc.getString("email");
                            ResultSet dname=insertcommand("select * from paitent_reg where email='"+pics+"'");
                            if(dname.next()){
                            String fname=dname.getString("fname");
                           out.print("<div class='modal fade ' id='defaultModal"+doc.getString(3)+"' tabindex='-1' role='dialog'>"
    +"<div class='modal-dialog modal-lg' style='margin: 1.75rem 5.75rem !important; max-width: 1050px; role='document'>"
                                   +"  <div class='modal-body' style='padding: 0px 16px; padding-bottom: 1rem; '> "
          +"  	<div class='row'>"
          +"  		<div class='col-12' style='padding: 2px;'>"
          +"  					<div id='carouselExampleIndicators' class='carousel slide' data-ride='carousel'>"
	+"							  <ol class='carousel-indicators'>"
	+"							    <li data-target='#carouselExampleIndicators' data-slide-to='0' class='active'></li>"
	+"							    <li data-target='#carouselExampleIndicators' data-slide-to='1'></li>"
	+"							    <li data-target='#carouselExampleIndicators' data-slide-to='2'></li>"
	+"							  </ol>"
	+"							  <div class='carousel-inner'>"
	+"							    <div class='carousel-item active'>"
	+"							      <img class='d-block w-100' src='po.jpg' alt='First slide' style='height: 100%; max-height: 350px;'>"
	+"							    </div>"
	+"							    <div class='carousel-item'>"
	+"							      <img class='d-block w-100' src='po3.jpg' alt='Second slide' style='height: 100%; max-height: 350px;'>"
	+"							    </div>"
	+"							    <div class='carousel-item'>"
	+"							      <img class='d-block w-100' src='po2.jpg' alt='Third slide' style='height: 100%; max-height: 350px;'>"
	+"							    </div>"
	+"							  </div>"
	+"							  <a class='carousel-control-prev' href='#carouselExampleIndicators' role='button' data-slide='prev'>"
	+"							    <span class='carousel-control-prev-icon' aria-hidden='true'></span>"
	+"							    <span class='sr-only'>Previous</span>"
	+"							  </a>"
	+"							  <a class='carousel-control-next' href='#carouselExampleIndicators' role='button' data-slide='next'>"
	+"							    <span class='carousel-control-next-icon' aria-hidden='true'></span>"
	+"							    <span class='sr-only'>Next</span>"
	+"							  </a>"
	+"							</div>"
         +"   		</div>							"
         +"   	</div>"
         +"   	<div class='row'>"
         +"   		<div class='col-3' style='background: #aaa; padding: 0px;'>");
         if(status == 0){
             ResultSet img=insertcommand("select * from doctor_image where email='"+email+"'");
             while(img.next()){
                 String filename=img.getString("filename");
                 out.print("<img src='image/"+filename+"'>");
             }
         }
         else{
             out.print("<img src='image/default-profile-pic.png' class='img-profile'>");
         }
         
         out.print("   			<div class='container-fluid' style='position: absolute; top: 130px;'>"
         +"   				<div class='row'>"
         +"   					<div class='col-12 ml-3 mb-3'>"
         +"   						<button class='btn btn-outline-primary btn-sm' style='background: #eee;'>CALL</button>"
         +"                                               <a href='log.jsp?name="+pics+"&with="+doc.getString(1)+"' class='btn btn-outline-dark btn-sm' style='background: #eee;'>CHAT</a>"
         +"   					</div>"
         +"   				</div>"
         +"   				<div class='row'>"
         +"   					<div class='col-12' style='padding: 0px 20px;'>"
         +"   						<h5 style='font-size: 12px'><b>OFFICE HOURS</b></h5>"
         +"   						<table cellpadding='4'>"
         +"   							<tr>"
         +"   								<td>Mon-Thus</td>"
       +"     								<td>8:00am-5:00pm</td>"
       +"     							</tr>"
       +"     							<tr>"
       +"     								<td>Fri</td>"
       +"     								<td>9:00am-3:00pm</td>"
       +"     							</tr>"
       +"     							<tr>"
       +"     								<td>Sat-Sun</td>"
     +"       								<td>10:00am-2:00pm</td>"
     +"       							</tr>"
     +"       						</table>"
   +"         					</div>"
   +"         				</div>"
   +"         				<div class='row'>"
   +"         					<div class='col-12 mt-3' style='padding: 0px 20px;'>"
   +"         						<h5 style='font-size: 12px;'><b>WHAT OTHERS ARE SAYING:</b></h5>"
   +"         						<small class='smal'>BEDSIDE MANNER:</small>"
   +"         						<p style='font-size: 24px;'>Excellent</p>"
   +"         						<small class='smal'>AVG. WAIT TIME:</small>"
   +"         						<p style='font-size: 24px;'>10 Minutes</p>"
   +"         						<small class='smal'>FOLLOW-UP:</small>"
  +"          						<p style='font-size: 24px;'>Quick</p>"
+"            					</div>"
+"            				</div>"
+"            			</div>"
+"            		</div>"
+"            		<div class='col-9' style='padding-left: 0px;'>"
+"                            <div class='row'>"
+"                                <div class='col-12'>"
+"                                                <nav class='navbar navbar-expand-lg navbar-dark bg-dark '>"
+"						  <button class='navbar-toggler' type='button' data-toggle='collapse' data-target='#navbarNav' aria-controls='navbarNav' aria-expanded='false' aria-label='Toggle navigation'>"
+"						    <span class='navbar-toggler-icon'></span>"
+"						  </button>"
+"						  <div class='collapse navbar-collapse' id='navbarNav'>"
+"						    <ul class='navbar-nav' style='background:#555; padding: 0px;'>"
+"						      <li class='nav-item active'>"
+"						        <a class='nav-link' href='#information'>INFORMATION</a>"
+"						      </li>"
+"						      <li class='nav-item'>"
+"						        <a class='nav-link' href='#public'>PUBLICATIONS</a>"
+"						      </li>"
+"						      <li class='nav-item'>"
+"						        <a class='nav-link' href='#deits'>DEITS</a>"
+"						      </li>"
+"						      <li class='nav-item'>"
+"						        <a class='nav-link' href='#comment'>COMMENTS</a>"
+"						      </li>"
+"						    </ul>"
+"						  </div>"
+"						</nav>"
  +"                              </div>"
       +"                     </div>"
+"						<div class='row'>"
+"							<div class='col-12' style='padding-right:0px;'> <a name='information'></a>"
+"								<div class='card' style='width: 100%; max-width: 800px; border-radius: 0px!important; border: 1px solid #eee;margin-bottom: 0px;'>"
+"									<div class='card-body'>"
+"										<div class='row'>"
+"											<div class='col-8'>"
+"												<h1>"+doc.getString(3)+"</h1>"
+"												<small>"+doc.getString(16)+"</small>		"
+"											</div>		"
+"											<div class='col-4'>"
+"												<a href='appointment.jsp?doctorname="+doc.getString(3)+"&paitent="+fname+"&paitentname="+dname.getString(5)+"&mobile="+dname.getString(8)+"&email="+dname.getString(2)+"&doctoremail="+doc.getString(1)+"' class='btn btn-primary' style='font-size: 12px; padding: 10px 30px;'>MAKE APPOINTMENT</a>	"
+"											</div>"
+"										</div>"
+"									</div>"
+"								</div>"
+"							</div>"
+"						</div>"
+"						<div class='row'>"
+"							<div class='col-12' style='padding-right:0px;'> "
+"								<div class='card' style='width: 100%; max-width: 800px; border-radius: 0px!important; border: 1px solid #eee;margin-bottom: 0px;'>"
+"									<div class='card-body'>"
+"										<div class='row'> "
+"											<div class='col-4'>"
+"												<h2>EDUCATION & TRAINING:</h2>"
+"												<small>MEDICAL EDUCATION:</small>"
+"												<p style='font-size: 16px;'>"+doc.getString("degree")+"</p>"
+"												<small>WORK EXPERIENNCE:</small>"
+"												<p style='font-size: 16px;'>"+doc.getString("workofexperience")+"</p>"
+"											</div>		"
+"											<div class='col-4'>"
+"												<h2 class='mt-4'>SPOKEN LANGUAGES:</h2>"
+"												<small>ENGLISH</small><br>		"
+"												<small>RESIDENCY:</small>"
+"												<p style='font-size: 16px;'>"+doc.getString("address")+"</p>"
+"												<small>SPECIALIST:</small>"
+"												<p style='font-size: 16px;'>"+doc.getString("department")+"</p>		"        
+"											</div>"
+"										</div>"
+"									</div>"
+"								</div>"
+"							</div>"
+"						</div>"
+"						<div class='row'>"
+"							<div class='col-12' style='padding-right:0px;'>"
+"								<div class='card' style='width: 100%; max-width: 800px; border-radius: 0px!important; border: 1px solid #eee;margin-bottom: 0px;'>"
+"									<div class='card-body'>"
+"										<div class='row'>"
+"											<div class='col-4'>"
+"												<div class='card' style=' border: 1px solid #eee;margin-bottom: 0px;'>"
+"													<div class='card-body'>"
+"														<small class='card-title'>DIABETES</small>"
+"														<p class='card-text'>Diabetes Superfoods</p>"
+"													</div>"
+"												</div>"
+"											</div>"
+"											<div class='col-4'>"
+"												<div class='card' style=' border: 1px solid #eee;margin-bottom: 0px;'>"
+"													<div class='card-body'>"
+"														<small class='card-title'>ORAL CANCER</small>"
+"														<p class='card-text'>Due to tobacco and alcohol. </p>"
+"													</div>"
+"												</div>"
+"											</div>"
+"											<div class='col-4'>"
+"												<div class='card' style=' border: 1px solid #eee;margin-bottom: 0px;'>"
+"													<div class='card-body'>"
+"														<small class='card-title'>Abdominal Pain</small>"
+"														<p class='card-text'>Due to Discomfort & irregularities.</p>"
+"													</div>"
+"												</div>"
+"											</div>"
+"											<div class='col-4 mt-4'>"
+"												<div class='card' style=' border: 1px solid #eee;margin-bottom: 0px;'>"
+"													<div class='card-body'>"
+"														<small class='card-title'>Fever</small>"
+"														<p class='card-text'>A fever is a body temperature that is higher than normal.</p>"
+"													</div>"
+"												</div>"
+"											</div>"
+"										</div>"
+"									</div>"
+"								</div>"
+"							</div>"
+"						</div>"
+"						<div class='row'>"
+"							<div class='col-12' style='padding-right:0px;'>"
+"								<div class='card' style='width: 100%; max-width: 800px; border-radius: 0px!important; border: 1px solid #eee;margin-bottom: 0px;'>"
+"									<div class='card-body'>"
+"										<div class='row'>"
+"											<div class='col-12'>"
+"												<h4>RECOMMENDED DEITS:</h4>"
+"											</div>"
+"										</div>"
+"										<div class='row'>"
+"											<div class='col-12'>"
+"												<div id='carouselExampleIndicators' class='carousel slide' data-ride='carousel'>"
+"												  <div class='carousel-inner'>"
+"												    <div class='carousel-item active'>"
+"												    	<div class='conatiner' style='margin: 0px 30px'>"
+"												    		<div class='card-group'>"
+"														      <div class='card' style='max-width: 280px; border: 1px solid #eee;margin-bottom: 0px; margin-right:10px'>"
+"														      		<img src='carb.jpg' width='279px' height='110px'>"
+"														      	<div class='card-body'>"
+"														      		<h4 class='card-title'>Carbohydrates</h4>"
+"														      		<p class='card-text' style='font-size: 12px;'>Carbohydrates are the sugars, starches and fibers found in fruits, grains, vegetables and milk products.</p>"
+"														      	</div>"
+"														      </div>"
+"														      <div class='card' style='max-width: 280px; border: 1px solid #eee;margin-bottom: 0px;'>"
+"														      		<img src='minerals_orig.jpg' width='279px' height='110px'>"
+"														      	<div class='card-body'>"
+"														      		<h4 class='card-title'>Mineral</h4>"
+"														      		<p class='card-text' style='font-size: 12px;'> A mineral is a chemical element required as an essential nutrient by organisms to perform functions necessary for life.</p>"
+"														      	</div>"
+"														      </div>"        
+"														    </div>  "
+"														</div>    "
+"												    </div>"
+"												    <div class='carousel-item'>"
+"												      <div class='conatiner' style='margin: 0px 30px'>"
+"												    		<div class='card-group'>"
+"														      <div class='card' style='max-width: 280px; border: 1px solid #eee;margin-bottom: 0px; margin-right:10px'>"
+"														      		<img src='Vitamin Lead.jpg' width='279px' height='110px'>"
+"														      	<div class='card-body'>"
+"														      		<h4 class='card-title'>Vitamin</h4>"
+"														      		<p class='card-text' style='font-size: 12px'>A vitamin is an organic molecule that is an essential micronutrient that an organism needs in small quantities for the proper functioning of its metabolism.</p>"
+"														      	</div>"
+"														      </div>"
+"														      <div class='card' style='max-width: 280px; border: 1px solid #eee;margin-bottom: 0px;'>"
+"														      		<img src='Protein.jpg' width='279px' height='110px'>"
+"														      	<div class='card-body'>"
+"														      		<h4 class='card-title'>Protein</h4>"
+"														      		<p class='card-text' style='font-size:12px'>Proteins are essential nutrients for the human body.They are one of the building blocks of body tissue and can also serve as a fuel source.</p>"
+"														      	</div>"
+"														      </div>"        
+"														    </div>  "
+"													</div>"
+"												    </div>"
+"												    <div class='carousel-item'>"
+"												      <div class='conatiner' style='margin: 0px 30px'>"
+"												    		<div class='card-group'>"
+"														      <div class='card' style='max-width: 280px; border: 1px solid #eee;margin-bottom: 0px; margin-right:10px'>"
+"														      		<img src='sugar.jpg' width='279px' height='110px'>"
+"														      	<div class='card-body'>"
+"														      		<h4 class='card-title'>Sugar & Disease</h4>"
+"														      		<p class='card-text' style='font-size:12px;'>Summary Consuming too much added sugar increases heart disease risk factors such as obesity, high blood pressure and inflammation. High-sugar diets have been linked to an increased risk of dying from heart disease.</p>"
+"														      	</div>"
+"														      </div>"
+"														      <div class='card' style='max-width: 280px; border: 1px solid #eee;margin-bottom: 0px;'>"
+"														      		<img src='egg.jpg' width='279px' height='110px'>"
+"														      	<div class='card-body'>"
+"														      		<h4 class='card-title'>Egg</h4>"
+"														      		<p class='card-text' style='font-size:12px;'>One large egg has varying amounts of 13 essential vitamins and minerals, high-quality protein, all for 70 calories.</p>"
+"														      	</div>"
+"														      </div>"        
+"														    </div>  "
+"													</div>"
+"												    </div>"
+"												  </div>"
+"												  <a class='carousel-control-prev' href='#carouselExampleIndicators' role='button' data-slide='prev'>"
+"												    <span class='carousel-control-prev-icon' aria-hidden='true'></span>"
+"												    <span class='sr-only'>Previous</span>"
+"												  </a>"
+"												  <a class='carousel-control-next' href='#carouselExampleIndicators' role='button' data-slide='next'>"
+"												    <span class='carousel-control-next-icon' aria-hidden='true'></span>"
+"												    <span class='sr-only'>Next</span>"
+"												  </a>"
+"												</div>		"
+"											</div>"
+"										</div>"
+"									</div>"
+"								</div>"
+"							</div>"
+"						</div>"
+"                                                <div class='row'>"
+"							<div class='col-12' style='padding-right:0px;'>"
+"								<div class='card' style='width: 100%; max-width: 800px; border-radius: 0px!important; border: 1px solid #eee;margin-bottom: 0px;'>"
+"									<div class='card-body'>"
+"										<div class='row'>"
+"											<div class='col-12'>"
+"												<h4>COMMENTS:</h4>"
+"											</div>"
+"										</div>"
+"										<div class='row'>"
+"											<div class='col-12'>"
+"                                                                                          <form action='processcomment.jsp' method='post'>"
+"                                                                                                  <input type='hidden' name='doctor' value='"+doc.getString(3)+"'>"
+"                                                                                                  <input type='hidden' name='doctoremail' value='"+doc.getString(1)+"'>"    
+"                                                                                                  <input type='hidden' name='paitentname' value='"+fname+"'>"            
+"                                                                                                <div class='text'><textarea name='msg' rows='4' cols='70' placeholder='Leave Your Comments' ></textarea></div>"
+"                                                                                                <input type='submit' class='btn btn-primary' value='Comment' style='float: right;margin: 0px 80px 15px 0px; font-size: 12px; padding: 10px 60px;'>"
+"                                                                                            </form>"
+"                                                                                             <h4 style='width: 100px;margin-left: 100px;'>"+fname+"</h4>"        
+"											</div>"
+"										</div>"
+"									</div>"
+"								</div>"
+"							</div>"
+"						</div>"    
+"            	</div>"
+"             </div>"
+"        </div>"
+"    </div>"
+"</div>");
                            }  }
                        %>
                       
</body>
</html>

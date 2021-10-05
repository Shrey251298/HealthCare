package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class paitent_005fdashboard_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


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

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write('\n');
  String pic=(String)session.getAttribute("paitentid"); 
      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta charset=\"UTF-8\">\n");
      out.write("<meta http-equiv=\"X-UA-Compatible\" content=\"IE=Edge\">\n");
      out.write("<meta content=\"width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no\" name=\"viewport\">\n");
      out.write("<title>:: Swift - Hospital Admin ::</title>\n");
      out.write("<link rel=\"icon\" href=\"favicon.ico\" type=\"image/x-icon\">\n");
      out.write("<link href=\"assets/plugins/bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\" />\n");
      out.write("<link href=\"https://fonts.googleapis.com/icon?family=Material+Icons\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("<link href=\"assets/plugins/morrisjs/morris.css\" rel=\"stylesheet\" />\n");
      out.write("<!-- Custom Css -->\n");
      out.write("<link href=\"assets/css/main.css\" rel=\"stylesheet\">\n");
      out.write("<!-- Swift Themes. You can choose a theme from css/themes instead of get all themes -->\n");
      out.write("<link href=\"assets/css/themes/all-themes.css\" rel=\"stylesheet\" />\n");
      out.write("<style>\n");
      out.write("    .text{\n");
      out.write("                position: relative;\n");
      out.write("                max-width: 600px;\n");
      out.write("                height: auto;\n");
      out.write("                border: 3px solid #eee;\n");
      out.write("                margin: 35px auto;\n");
      out.write("                box-shadow: -1px -2px 0px 0px #eee;\n");
      out.write("                border-radius: 5px;\n");
      out.write("                box-sizing: border-box;\n");
      out.write("                background: #eee;\n");
      out.write("                padding: 10px;\n");
      out.write("                \n");
      out.write("            }\n");
      out.write("            .text:after{\n");
      out.write("                 content: '';\n");
      out.write("                position: absolute;\n");
      out.write("                width: 30px;\n");
      out.write("                height: 35px;\n");
      out.write("                border-right: 1px solid transparent;\n");
      out.write("                border-bottom: 35px solid transparent;\n");
      out.write("                border-left: 30px solid #eee;\n");
      out.write("                top: 101%;\n");
      out.write("                left: 10%;  \n");
      out.write("\n");
      out.write("            }        \n");
      out.write("</style>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body class=\"theme-cyan\">\n");
      out.write("<!-- Page Loader -->\n");
      out.write("<div class=\"page-loader-wrapper\">\n");
      out.write("    <div class=\"loader\">\n");
      out.write("        <div class=\"preloader\">\n");
      out.write("            <div class=\"spinner-layer pl-cyan\">\n");
      out.write("                <div class=\"circle-clipper left\">\n");
      out.write("                    <div class=\"circle\"></div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"circle-clipper right\">\n");
      out.write("                    <div class=\"circle\"></div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <p>Please wait...</p>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("<!-- #END# Page Loader --> \n");
      out.write("<!-- Overlay For Sidebars -->\n");
      out.write("<div class=\"overlay\"></div>\n");
      out.write("<!-- #END# Overlay For Sidebars -->\n");
      out.write("<!-- #Float icon -->\n");
      out.write("<ul id=\"f-menu\" class=\"mfb-component--br mfb-zoomin\" data-mfb-toggle=\"hover\">\n");
      out.write("  <li class=\"mfb-component__wrap\">\n");
      out.write("    <a href=\"#\" class=\"mfb-component__button--main g-bg-cyan\">\n");
      out.write("      <i class=\"mfb-component__main-icon--resting zmdi zmdi-plus\"></i>\n");
      out.write("      <i class=\"mfb-component__main-icon--active zmdi zmdi-close\"></i>\n");
      out.write("    </a>\n");
      out.write("    <ul class=\"mfb-component__list\">\n");
      out.write("      <li>\n");
      out.write("        <a href=\"doctor-schedule.html\" data-mfb-label=\"Doctor Schedule\" class=\"mfb-component__button--child bg-blue\">\n");
      out.write("          <i class=\"zmdi zmdi-calendar mfb-component__child-icon\"></i>\n");
      out.write("        </a>\n");
      out.write("      </li>\n");
      out.write("      <li>\n");
      out.write("        <a href=\"patients.html\" data-mfb-label=\"Patients List\" class=\"mfb-component__button--child bg-orange\">\n");
      out.write("          <i class=\"zmdi zmdi-account-o mfb-component__child-icon\"></i>\n");
      out.write("        </a>\n");
      out.write("      </li>\n");
      out.write("\n");
      out.write("      <li>\n");
      out.write("        <a href=\"payments.html\" data-mfb-label=\"Payments\" class=\"mfb-component__button--child bg-purple\">\n");
      out.write("          <i class=\"zmdi zmdi-balance-wallet mfb-component__child-icon\"></i>\n");
      out.write("        </a>\n");
      out.write("      </li>\n");
      out.write("    </ul>\n");
      out.write("  </li>\n");
      out.write("</ul>\n");
      out.write("<!-- #Float icon -->\n");
      out.write("<!-- Morphing Search  -->\n");
      out.write("\n");
      out.write("<!-- Top Bar -->\n");
      out.write("<nav class=\"navbar clearHeader\">\n");
      out.write("    <div class=\"col-12\">\n");
      out.write("        <div class=\"navbar-header\"> <a href=\"javascript:void(0);\" class=\"bars\"></a> <a class=\"navbar-brand\" href=\"admin_dashboard.jsp\">Healthcare</a> </div>\n");
      out.write("        <ul class=\"nav navbar-nav navbar-right\">\n");
      out.write("            <!-- Notifications -->\n");
      out.write("           \n");
      out.write("            <!-- #END# Tasks -->\n");
      out.write("            <li><a href=\"javascript:void(0);\" class=\"js-right-sidebar\" data-close=\"true\"><i class=\"zmdi zmdi-settings\"></i></a></li>\n");
      out.write("        </ul>\n");
      out.write("    </div>\n");
      out.write("</nav>\n");
      out.write("<!-- #Top Bar -->\n");
      out.write("<section> \n");
      out.write("    <!-- Left Sidebar -->\n");
      out.write("    <aside id=\"leftsidebar\" class=\"sidebar\"> \n");
      out.write("        <!-- User Info -->\n");
      out.write("        <div class=\"user-info\">\n");
      out.write("            <div class=\"admin-image\"> \n");
      out.write("                                 ");

                                         try{
                                             ResultSet im=insertcommand("select * from profile_img where userid = '"+pic+"' ");
                                             while(im.next()){
                                                 int status=im.getInt("status");
                                                 if(status == 0){
                                                     ResultSet image=insertcommand("select * from paitent_image where email = '"+pic+"' ");
                                                     while(image.next()){
                                                         String filename=image.getString("filename");
                                    
      out.write("\n");
      out.write("                                                        <img src=\"image/");
      out.print(filename);
      out.write("\">\n");
      out.write("                                    ");

                                                     }
                                                 }
                                                 else{
                                    
      out.write("\n");
      out.write("                                                    <img src=\"image/default-profile-pic.png\">\n");
      out.write("                                    ");

                                                 }
                                             }
                                         }
                                         catch(Exception e){e.printStackTrace();}
                                
      out.write("\n");
      out.write("            </div>\n");
      out.write("            <div class=\"admin-action-info\"> <span>Welcome</span>\n");
      out.write("                \n");
      out.write("                                ");

                                    try{
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_healthcare_system","root","tiger");
                                    Statement st=con.createStatement();
                                    String sql="select * from paitent_reg where  email='"+pic+"'";
                                    ResultSet rs=st.executeQuery(sql);
                                    while(rs.next()){
                                        String firstname = rs.getString("fname");
                                
      out.write("      \n");
      out.write("                                <h3>");
      out.print(firstname);
      out.write("</h3>\n");
      out.write("                                ");
 }
                                    }
                                          catch(Exception e){
                                          out.println(e);
                                          }
                                
      out.write("\n");
      out.write("                <ul>\n");
      out.write("                    \n");
      out.write("                    <li><a data-placement=\"bottom\" title=\"Go to Profile\" href=\"paitent_dashboard.jsp\"><i class=\"zmdi zmdi-account\"></i></a></li>                    \n");
      out.write("                    <li><a href=\"javascript:void(0);\" class=\"js-right-sidebar\" data-close=\"true\"><i class=\"zmdi zmdi-settings\"></i></a></li>\n");
      out.write("                    <li><a data-placement=\"bottom\" title=\"Full Screen\" href=\"logout.jsp\" ><i class=\"zmdi zmdi-sign-in\"></i></a></li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"quick-stats\">\n");
      out.write("                <h5>Today Report</h5>\n");
      out.write("                <ul>\n");
      out.write("                    <li><span>");

                            paitent=insertcommand("select count(*) from paitent_reg");
                                  while(paitent.next()){
                                      row=paitent.getString(1);
                                      out.println(row);
                                  }
                            
      out.write("<i>Patient</i></span></li>\n");
      out.write("                    <li><span>");

                                  doctor=insertcommand("select count(*) from doctor_reg_perment");;
                                  while(doctor.next()){
                                      drow=doctor.getString(1);
                                      out.println(drow);
                                  }
                            
      out.write("<i>Doctor</i></span></li>\n");
      out.write("                    <li><span>04<i>Visit</i></span></li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <!-- #User Info --> \n");
      out.write("        <!-- Menu -->\n");
      out.write("        <div class=\"menu\">\n");
      out.write("            <ul class=\"list\">\n");
      out.write("                <li class=\"header\">MAIN NAVIGATION</li>\n");
      out.write("                <li class=\"active open\"><a href=\"paitent_dashboard.jsp\"><i class=\"zmdi zmdi-home\"></i><span>Dashboard</span></a></li>\n");
      out.write("                <li><a href=\"doctor.jsp\"><i class=\"zmdi zmdi-home\"></i><span>Doctor</span></a></li>\n");
      out.write("                <li><a href=\"appointment.jsp\"><i class=\"zmdi zmdi-home\"></i><span>Appointment</span></a></li>\n");
      out.write("                <li><a href=\"javascript:void(0);\" class=\"menu-toggle\"><i class=\"zmdi zmdi-shopping-cart\"></i><span>Product</span> </a>\n");
      out.write("                    <ul class=\"ml-menu\">\n");
      out.write("                        <li> <a href=\"healthcareproduct.jsp\">Health Product</a></li>\n");
      out.write("                        <li> <a href=\"medicine.jsp\">Medicine</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </li>\n");
      out.write("                \n");
      out.write("                <li><a href=\"javascript:void(0);\" class=\"menu-toggle\"><i class=\"zmdi zmdi-local-convenience-store\"></i><span>Service</span> </a>\n");
      out.write("                    <ul class=\"ml-menu\">\n");
      out.write("                        <li> <a href=\"javascript:void(0);\" class=\"menu-toggle\">Mediclaim</a>\n");
      out.write("                            <ul class=\"ml-menu\">\n");
      out.write("                                <li> <a href=\"#\" data-toggle=\"modal\" data-target=\"#CashlessMediclaim\">Cashless Mediclaim</a></li>                         \n");
      out.write("                                <li> <a href=\"#\"  data-toggle=\"modal\" data-target=\"#ReimbursementMediclaim\">Reimbursement Mediclaim</a></li>\n");
      out.write("                            </ul>\n");
      out.write("                        </li>\n");
      out.write("                        <li> <a href=\"#\">Ambulance</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </li>\n");
      out.write("                <li class=\"header\">LABELS</li>\n");
      out.write("                <li> <a href=\"javascript:void(0);\"><i class=\"zmdi zmdi-chart-donut col-red\"></i><span>Important</span> </a> </li>\n");
      out.write("                <li> <a href=\"javascript:void(0);\"><i class=\"zmdi zmdi-chart-donut col-amber\"></i><span>Warning</span> </a> </li>\n");
      out.write("                <li> <a href=\"javascript:void(0);\"><i class=\"zmdi zmdi-chart-donut col-blue\"></i><span>Information</span> </a> </li>\n");
      out.write("            </ul>\n");
      out.write("        </div>\n");
      out.write("        <!-- #Menu -->\n");
      out.write("    </aside>\n");
      out.write("    <!-- #END# Left Sidebar --> \n");
      out.write("    <!-- Right Sidebar -->\n");
      out.write("    <aside id=\"rightsidebar\" class=\"right-sidebar\">\n");
      out.write("        <ul class=\"nav nav-tabs tab-nav-right\" role=\"tablist\">\n");
      out.write("            <li class=\"nav-item\"><a class=\"nav-link active\" data-toggle=\"tab\" href=\"#skins\">Skins</a></li>\n");
      out.write("            \n");
      out.write("        </ul>\n");
      out.write("        <div class=\"tab-content\">\n");
      out.write("            <div role=\"tabpanel\" class=\"tab-pane in active in active\" id=\"skins\">\n");
      out.write("                <ul class=\"demo-choose-skin\">\n");
      out.write("                    <li data-theme=\"red\">\n");
      out.write("                        <div class=\"red\"></div>\n");
      out.write("                        <span>Red</span> </li>\n");
      out.write("                    <li data-theme=\"purple\">\n");
      out.write("                        <div class=\"purple\"></div>\n");
      out.write("                        <span>Purple</span> </li>\n");
      out.write("                    <li data-theme=\"blue\">\n");
      out.write("                        <div class=\"blue\"></div>\n");
      out.write("                        <span>Blue</span> </li>\n");
      out.write("                    <li data-theme=\"cyan\" class=\"active\">\n");
      out.write("                        <div class=\"cyan\"></div>\n");
      out.write("                        <span>Cyan</span> </li>\n");
      out.write("                    <li data-theme=\"green\">\n");
      out.write("                        <div class=\"green\"></div>\n");
      out.write("                        <span>Green</span> </li>\n");
      out.write("                    <li data-theme=\"deep-orange\">\n");
      out.write("                        <div class=\"deep-orange\"></div>\n");
      out.write("                        <span>Deep Orange</span> </li>\n");
      out.write("                    <li data-theme=\"blue-grey\">\n");
      out.write("                        <div class=\"blue-grey\"></div>\n");
      out.write("                        <span>Blue Grey</span> </li>\n");
      out.write("                    <li data-theme=\"black\">\n");
      out.write("                        <div class=\"black\"></div>\n");
      out.write("                        <span>Black</span> </li>\n");
      out.write("                    <li data-theme=\"blush\">\n");
      out.write("                        <div class=\"blush\"></div>\n");
      out.write("                        <span>Blush</span> </li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("        </div>\n");
      out.write("    </aside>\n");
      out.write("    <!-- #END# Right Sidebar --> \n");
      out.write("</section>\n");
      out.write("\n");
      out.write("<section class=\"content profile-page\">\n");
      out.write("    <div class=\"container-fluid\">\n");
      out.write("        <div class=\"row clearfix\">\n");
      out.write("            <div class=\"col-md-12 p-l-0 p-r-0\">\n");
      out.write("                <section class=\"boxs-simple\">\n");
      out.write("                    <div class=\"profile-header\">\n");
      out.write("                        <div class=\"profile_info\">\n");
      out.write("                            <div class=\"profile-image\"> \n");
      out.write("                                ");

                                         try{
                                             ResultSet im=insertcommand("select * from profile_img where userid = '"+pic+"' ");
                                             while(im.next()){
                                                 int status=im.getInt("status");
                                                 if(status == 0){
                                                     ResultSet image=insertcommand("select * from paitent_image where email = '"+pic+"' ");
                                                     while(image.next()){
                                                         String filename=image.getString("filename");
                                    
      out.write("\n");
      out.write("                                                        <img src=\"image/");
      out.print(filename);
      out.write("\">\n");
      out.write("                                    ");

                                                     }
                                                 }
                                                 else{
                                    
      out.write("\n");
      out.write("                                                    <img src=\"image/default-profile-pic.png\">\n");
      out.write("                                    ");

                                                 }
                                             }
                                         }
                                         catch(Exception e){e.printStackTrace();}
                                
      out.write("\n");
      out.write("                            </div>\n");
      out.write("                            ");

                                    try{
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_healthcare_system","root","tiger");
                                    Statement st=con.createStatement();
                                    String sql="select * from paitent_reg where  email='"+pic+"'";
                                    ResultSet rs=st.executeQuery(sql);
                                    while(rs.next()){
                                        String firstname = rs.getString("fname");
                                
      out.write("      \n");
      out.write("                               <h4 class=\"mb-0\"><strong>");
      out.print(firstname);
      out.write("</strong></h4>\n");
      out.write("                                ");
 }
                                    }
                                          catch(Exception e){
                                          out.println(e);
                                          }
                                
      out.write("\n");
      out.write("                            \n");
      out.write("                            <span class=\"text-muted col-white\">Paitent</span>\n");
      out.write("                            <div class=\"mt-10\">\n");
      out.write("                                <form action=\"PatientUploadImage\" method=\"post\" enctype=\"multipart/form-data\">\n");
      out.write("                                   \n");
      out.write("                                <input type=\"file\" name=\"file\"  class=\"btn btn-raised btn-default bg-green btn-sm\" >\n");
      out.write("                                <input type=\"submit\" value=\"Upload Image\">\n");
      out.write("                                </form>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </section>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"row clearfix mt-5\">\n");
      out.write("            <div class=\"col-lg-4 col-md-12\">\n");
      out.write("                <div class=\"card\">\n");
      out.write("                    <div class=\"header\">\n");
      out.write("                        <h2>About Me</h2>\n");
      out.write("                        <hr>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"body\">\n");
      out.write("                        \n");
      out.write("                       ");

                                    try{
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_healthcare_system","root","tiger");
                                    Statement st=con.createStatement();
                                    String sql="select * from paitent_reg where  email='"+pic+"'";
                                    ResultSet ad=st.executeQuery(sql);
                                    while(ad.next()){ 
                                
      out.write(" \n");
      out.write("                                <div class=\"profile-desc\">\n");
      out.write("                         \n");
      out.write("                        </div>\n");
      out.write("                                        <ul class=\"list-group list-group-unbordered\">\n");
      out.write("                                            <li class=\"list-group-item\">\n");
      out.write("                                                <b>ID :</b>\n");
      out.write("                                                <div class=\"profile-desc-item pull-right ml-5\">");
      out.print(ad.getString(1));
      out.write("</div>\n");
      out.write("                                            </li>\n");
      out.write("                                            <li class=\"list-group-item\">\n");
      out.write("                                                <b>Email :</b>\n");
      out.write("                                                <div class=\"profile-desc-item pull-right ml-4\">");
      out.print(ad.getString(2));
      out.write("</div>\n");
      out.write("                                            </li>\n");
      out.write("                                             <li class=\"list-group-item\">\n");
      out.write("                                                <b> Contact :</b>\n");
      out.write("                                                <div class=\"profile-desc-item pull-right ml-3\">");
      out.print(ad.getString(8));
      out.write("</div>\n");
      out.write("                                            </li>\n");
      out.write("                                            <li class=\"list-group-item\">\n");
      out.write("                                                <b>Address :</b>\n");
      out.write("                                                <div class=\"profile-desc-item pull-right ml-3\">");
      out.print(ad.getString(10));
      out.write("</div>\n");
      out.write("                                            </li>\n");
      out.write("                                        </ul>\n");
      out.write("                                        \n");
      out.write("                               ");
 }
                                    }
                                          catch(Exception e){
                                          out.println(e);
                                          }
                                
      out.write("   \n");
      out.write("                        <p class=\"text-default\"></p>\n");
      out.write("                        <blockquote>\n");
      out.write("                            <small>Designer <cite title=\"Source Title\">Source Title</cite></small> \n");
      out.write("                        </blockquote>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"card\">\n");
      out.write("                    <div class=\"header\">\n");
      out.write("                        <h2>My Portfolio Status</h2>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"body\">\n");
      out.write("                        <ul class=\"list-unstyled\">\n");
      out.write("                            <li>\n");
      out.write("                                <div>Behance</div>\n");
      out.write("                                <div class=\"progress\">\n");
      out.write("                                    <div class=\"progress-bar progress-bar-success progress-bar-striped active\" role=\"progressbar\" aria-valuenow=\"40\" aria-valuemin=\"0\" aria-valuemax=\"100\" style=\"width: 40%\"> <span class=\"sr-only\">40% Complete (success)</span> </div>\n");
      out.write("                                </div>\n");
      out.write("                            </li>\n");
      out.write("                            <li>\n");
      out.write("                                <div>Themeforest</div>\n");
      out.write("                                <div class=\"progress\">\n");
      out.write("                                    <div class=\"progress-bar progress-bar-info progress-bar-striped active\" role=\"progressbar\" aria-valuenow=\"20\" aria-valuemin=\"0\" aria-valuemax=\"100\" style=\"width: 20%\"> <span class=\"sr-only\">20% Complete</span> </div>\n");
      out.write("                                </div>\n");
      out.write("                            </li>\n");
      out.write("                            <li>\n");
      out.write("                                <div>Dribbble</div>\n");
      out.write("                                <div class=\"progress\">\n");
      out.write("                                    <div class=\"progress-bar progress-bar-warning progress-bar-striped active\" role=\"progressbar\" aria-valuenow=\"60\" aria-valuemin=\"0\" aria-valuemax=\"100\" style=\"width: 60%\"> <span class=\"sr-only\">60% Complete (warning)</span> </div>\n");
      out.write("                                </div>\n");
      out.write("                            </li>\n");
      out.write("                            <li>\n");
      out.write("                                <div>Pinterest</div>\n");
      out.write("                                <div class=\"progress\">\n");
      out.write("                                    <div class=\"progress-bar progress-bar-danger progress-bar-striped active\" role=\"progressbar\" aria-valuenow=\"80\" aria-valuemin=\"0\" aria-valuemax=\"100\" style=\"width: 80%\"> <span class=\"sr-only\">80% Complete (danger)</span> </div>\n");
      out.write("                                </div>\n");
      out.write("                            </li>\n");
      out.write("                        </ul>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-lg-8 col-md-12\">\n");
      out.write("                <div class=\"card\">\n");
      out.write("                    <div class=\"body\"> \n");
      out.write("                        <!-- Nav tabs -->\n");
      out.write("                        <ul class=\"nav nav-tabs tab-nav-right\" role=\"tablist\">\n");
      out.write("                            <li class=\"nav-item\"><a class=\"nav-link active\" data-toggle=\"tab\" href=\"#mypost\">My Post</a></li>\n");
      out.write("                            <li class=\"nav-item\"><a class=\"nav-link\" data-toggle=\"tab\" href=\"#usersettings\">Health Tips</a></li>\n");
      out.write("                        </ul>\n");
      out.write("                        \n");
      out.write("                        <!-- Tab panes -->\n");
      out.write("                        <div class=\"tab-content\">\n");
      out.write("                            <div role=\"tabpanel\" class=\"tab-pane in active\" id=\"mypost\">\n");
      out.write("                                <div class=\"wrap-reset\">\n");
      out.write("                                    ");

                                    ResultSet com=insertcommand("select * from postcomment where paitent='"+pic+"' ");
                                    while(com.next())
                                    {
                                        out.print("<div class='text'>");
                                        out.print("<p>"+com.getString("msg")+"</p>");
                                        out.print("<small>"+com.getString("paitentname")+"</small>");
                                        out.print("</div>");    
                                    }
                                    
      out.write("    \n");
      out.write("                                    \n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            <div role=\"tabpanel\" class=\"tab-pane\" id=\"usersettings\">\n");
      out.write("                               <div class=\"body\">\n");
      out.write("                                    <div class=\"row clearfix\">\n");
      out.write("                                        <div class=\"col-sm-12\">\n");
      out.write("                                            \n");
      out.write("                                            <div class=\"card-group\">\n");
      out.write("                                            <div class=\"col-6\">\n");
      out.write("                                                <div class=\"card bg-danger\" style=\"border:1px solid #000;\">\n");
      out.write("                                            <div class=\"card-header\">\n");
      out.write("                                                <h6>Skin Tips</h6>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"card-body\">\n");
      out.write("                                                <marquee direction=\"up\">\n");
      out.write("\t\t\t\t\t\t");

                                                  try{
                                                    Class.forName("com.mysql.jdbc.Driver");
                                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_healthcare_system","root","tiger");
                                                    Statement st=con.createStatement();
                                                    String sql="select * from skintips";
                                                    ResultSet r=st.executeQuery(sql);
                                                    while(r.next()){
                                                        out.print("<p>"+r.getString(2)+"</p>");
                                                    }
                                                }
                                                catch(Exception e){
                                                      out.println(e);
                                                      }
                                            
      out.write("\n");
      out.write("\t\t\t\t\t</marquee>\n");
      out.write("                                            </div>\n");
      out.write("                                            </div>   \n");
      out.write("                                        </div>\n");
      out.write("                                            <div class=\"col-6\">\n");
      out.write("                                                <div class=\"card bg-primary\" style=\"border:1px solid #000;\">\n");
      out.write("                                            <div class=\"card-header\">\n");
      out.write("                                                <h6>Hair Tips</h6>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"card-body\">\n");
      out.write("                                                <marquee direction=\"up\">\n");
      out.write("\t\t\t\t\t\t");

                                                  try{
                                                    Class.forName("com.mysql.jdbc.Driver");
                                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_healthcare_system","root","tiger");
                                                    Statement st=con.createStatement();
                                                    String sql="select * from hairtips";
                                                    ResultSet r=st.executeQuery(sql);
                                                    while(r.next()){
                                                        out.print("<p>"+r.getString(2)+"</p>");
                                                    }
                                                }
                                                catch(Exception e){
                                                      out.println(e);
                                                      }
                                            
      out.write("\n");
      out.write("\t\t\t\t\t</marquee>\n");
      out.write("                                            </div>\n");
      out.write("                                            </div>   \n");
      out.write("                                        </div>\n");
      out.write("                                            <div class=\"col-6\">\n");
      out.write("                                                <div class=\"card bg-danger\" style=\"border:1px solid #000;\">\n");
      out.write("                                            <div class=\"card-header\">\n");
      out.write("                                                <h6>Eye Tips</h6>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"card-body\">\n");
      out.write("                                                <marquee direction=\"up\">\n");
      out.write("\t\t\t\t\t\t");

                                                  try{
                                                    Class.forName("com.mysql.jdbc.Driver");
                                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_healthcare_system","root","tiger");
                                                    Statement st=con.createStatement();
                                                    String sql="select * from eyetips";
                                                    ResultSet r=st.executeQuery(sql);
                                                    while(r.next()){
                                                        out.print("<p>"+r.getString(2)+"</p>");
                                                    }
                                                }
                                                catch(Exception e){
                                                      out.println(e);
                                                      }
                                            
      out.write("\n");
      out.write("\t\t\t\t\t</marquee>\n");
      out.write("                                            </div>\n");
      out.write("                                            </div>   \n");
      out.write("                                        </div>\n");
      out.write("                                            <div class=\"col-6\">\n");
      out.write("                                                <div class=\"card bg-primary\" style=\"border:1px solid #000;\">\n");
      out.write("                                            <div class=\"card-header \">\n");
      out.write("                                                <h6> Tips</h6>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"card-body\">\n");
      out.write("                                                <marquee direction=\"up\">\n");
      out.write("\t\t\t\t\t\t");

                                                  try{
                                                    Class.forName("com.mysql.jdbc.Driver");
                                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_healthcare_system","root","tiger");
                                                    Statement st=con.createStatement();
                                                    String sql="select * from tips";
                                                    ResultSet r=st.executeQuery(sql);
                                                    while(r.next()){
                                                        out.print("<p>"+r.getString(2)+"</p>");
                                                    }
                                                }
                                                catch(Exception e){
                                                      out.println(e);
                                                      }
                                            
      out.write("\n");
      out.write("\t\t\t\t\t</marquee>\n");
      out.write("                                            </div>\n");
      out.write("                                            </div>  \n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                    \n");
      out.write("                               </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</section>\n");
      out.write("<!-- Modal Part Of Mediclam -->                              \n");
      out.write("<div class=\"modal fade\" id=\"CashlessMediclaim\" tabindex=\"-1\" role=\"dialog\">\n");
      out.write("    <div class=\"modal-dialog\" role=\"document\">\n");
      out.write("        <div class=\"modal-content\">\n");
      out.write("            <div class=\"modal-header\">\n");
      out.write("                <h4 class=\"modal-title\" id=\"defaultModalLabel\">Cashless Mediclaim</h4>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"modal-body\">\n");
      out.write("                <p> Cashless mediclaim service offers an insured person the benefit of availing medical treatment at the best hospitals, without having to pay from his/her own pocket.</p> \n");
      out.write("                <p>Hospitalization bills, up to the sum insured are directly settled by the insurance company. In this process, prior approval of the TPA (Third-Party Administrator) is required.</p>\n");
      out.write("                <p>If cashless mediclaim facility is offered in your health insurance policy, you need not run around arranging funds at the time of medical emergency.</p>\n");
      out.write("                <p> This cashless mediclaim service can be availed only in network hospitals of the insurer.</p>\n");
      out.write("                <p>Thus, we can say that under such facility, the insurer directly pays to the hospital for the customers’ medical treatment.</p>\n");
      out.write("                <p> And the insured is saved from running for money at a crucial time.</p>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"modal-footer\">\n");
      out.write("                <button type=\"button\" class=\"btn btn-link waves-effect\" data-dismiss=\"modal\">CLOSE</button>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("<div class=\"modal fade\" id=\"ReimbursementMediclaim\" tabindex=\"-1\" role=\"dialog\">\n");
      out.write("    <div class=\"modal-dialog\" role=\"document\">\n");
      out.write("        <div class=\"modal-content\">\n");
      out.write("            <div class=\"modal-header\">\n");
      out.write("                <h4 class=\"modal-title\" id=\"defaultModalLabel\">Reimbursement Mediclaim</h4>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"modal-body\">\n");
      out.write("                <p>The reimbursement claim for health insurance can be made if the policyholder opts to go to a hospital of his/ her choice, which is a non-empanelled hospital.</p> \n");
      out.write("                <p>In this case, the cashless claim facility cannot be used.</p> \n");
      out.write("                <p>Therefore, the insured has to pay all his/ her medical bills and other costs involved in hospitalization and treatment and then claim reimbursement.</p> \n");
      out.write("                <p>In order to avail reimbursement claim you have to provide the necessary documents including original bills to the insurance provider.</p> \n");
      out.write("                <p>The company will then evaluate the claim to see its scope under the policy cover and then makes a payment to the insured.</p> \n");
      out.write("                <p>In case the treatment is not covered under the policy, the claim will be rejected.</p>\n");
      out.write("                <p>The insurance provider generally provides reasons for the rejection.</p>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"modal-footer\">\n");
      out.write("                <button type=\"button\" class=\"btn btn-link waves-effect\" data-dismiss=\"modal\">CLOSE</button>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("<!-- //Modal Part Of Mediclam -->\n");
      out.write("<div class=\"color-bg\"></div>\n");
      out.write("<!-- Jquery Core Js --> \n");
      out.write("<script src=\"assets/bundles/libscripts.bundle.js\"></script> <!-- Lib Scripts Plugin Js -->\n");
      out.write("<script src=\"assets/bundles/morphingsearchscripts.bundle.js\"></script> <!-- morphing search Js --> \n");
      out.write("<script src=\"assets/bundles/vendorscripts.bundle.js\"></script> <!-- Lib Scripts Plugin Js --> \n");
      out.write("\n");
      out.write("<script src=\"assets/plugins/jquery-sparkline/jquery.sparkline.min.js\"></script> <!-- Sparkline Plugin Js -->\n");
      out.write("<script src=\"assets/plugins/chartjs/Chart.bundle.min.js\"></script> <!-- Chart Plugins Js --> \n");
      out.write("\n");
      out.write("<script src=\"assets/bundles/mainscripts.bundle.js\"></script><!-- Custom Js -->\n");
      out.write("<script src=\"assets/bundles/morphingscripts.bundle.js\"></script><!-- morphing search page js --> \n");
      out.write("<!--<script src=\"assets/js/pages/index.js\"></script>-->\n");
      out.write("<script src=\"assets/js/pages/charts/sparkline.min.js\"></script>\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}

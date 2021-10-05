<%-- 
    Document   : index
    Created on : 6 Feb, 2019, 3:40:51 PM
    Author     : Prashant Lapi
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>index</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/abhi.css">
	
	<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/animate.min.css">
<style>
    .error_form_fname {
  visibility: hidden;
  width: 120px;
  background-color: black;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 5px 0;

  /* Position the tooltip */
  position: absolute;
  top: -13px;
  right: 1px;
  font-size: 10px;
  z-index: 1;
}
.error_form_lname {
  visibility: hidden;
  width: 120px;
  background-color: black;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 5px 0;

  /* Position the tooltip */
  position: absolute;
  top: -13px;
  right: 1px;
  font-size: 10px;
  z-index: 1;
}
.error_form_password {
  visibility: hidden;
  width: 120px;
  background-color: black;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 5px 0;

  /* Position the tooltip */
  position: absolute;
  top: -13px;
  right: 1px;
  font-size: 10px;
  z-index: 1;
}
.error_form_retype_password {
  visibility: hidden;
  width: 120px;
  background-color: black;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 5px 0;

  /* Position the tooltip */
  position: absolute;
  top: -13px;
  right: 1px;
  font-size: 10px;
  z-index: 1;
}
.error_form_email {
  visibility: hidden;
  width: 120px;
  background-color: black;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 5px 0;

  /* Position the tooltip */
  position: absolute;
  top: -13px;
  right: 1px;
  font-size: 10px;
  z-index: 1;
}
.error_form_contact {
  visibility: hidden;
  width: 120px;
  background-color: black;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 5px 0;

  /* Position the tooltip */
  position: absolute;
  top: -13px;
  right: 1px;
  font-size: 10px;
  z-index: 1;
}
.error_form_country {
  visibility: hidden;
  width: 120px;
  background-color: black;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 5px 0;

  /* Position the tooltip */
  position: absolute;
  top: -13px;
  right: 1px;
  font-size: 10px;
  z-index: 1;
}
.error_form_address {
  visibility: hidden;
  width: 120px;
  background-color: black;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 5px 0;

  /* Position the tooltip */
  position: absolute;
  top: -13px;
  right: 1px;
  font-size: 10px;
  z-index: 1;
} 
.error_form_mcino {
  visibility: hidden;
  width: 120px;
  background-color: black;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 5px 0;

  /* Position the tooltip */
  position: absolute;
  top: -13px;
  right: 1px;
  font-size: 10px;
  z-index: 1;
} 
.error_form_cln {
  visibility: hidden;
  width: 120px;
  background-color: black;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 5px 0;

  /* Position the tooltip */
  position: absolute;
  top: -13px;
  right: 1px;
  font-size: 10px;
  z-index: 1;
} 
.error_form_clno {
  visibility: hidden;
  width: 120px;
  background-color: black;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 5px 0;

  /* Position the tooltip */
  position: absolute;
  top: -13px;
  right: 1px;
  font-size: 10px;
  z-index: 1;
} 
.error_form_degree {
  visibility: hidden;
  width: 120px;
  background-color: black;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 5px 0;

  /* Position the tooltip */
  position: absolute;
  top: -13px;
  right: 1px;
  font-size: 10px;
  z-index: 1;
} 
.error_form_woe {
  visibility: hidden;
  width: 120px;
  background-color: black;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 5px 0;

  /* Position the tooltip */
  position: absolute;
  top: -13px;
  right: 1px;
  font-size: 10px;
  z-index: 1;
} 
</style>
    </head>
    <body>
	
<!-- login model -->
		<div class="modal fade mt-auto" id="mymodal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h3 style="margin-left: 180px; margin-top: 10px;" class="text-primary d-i1">LOGIN</h3>
						<span class="btn btn-lg" data-dismiss="modal">&times;</span>
					</div>
					<div class="modal-body">
						<div class="a">
                                                    <form action="process.jsp" method="post" class="fomr">
                                                                <div class="radio">
                                                                   <input type="radio" name="d" id="pa" value="paiten" required>
                                                                   <label for="pa">Paitent</label>
                                                                   <input type="radio"  name="d" id="do" value="docto" required>
                                                                    <label for="do">Doctor</label>
                                                                </div>    
								<div>
									<input type="text" name="login" required>
									<label>login</label>	
								</div>
								<div>
									<input type="password" name="pass" required>
									<label>Password</label>
								</div>
                                                                    <button class="btn btn-primary btn-lg btn-block" type="submit" >Login</button><br>
							</form>
						</div>	
					</div>
						<div class="container-justify ml-5 mr-5 text-center pb-5">
							
							<a class="btn-link " href="#" id="forgot_btn">Forgot Password ?</a><br>
                                                        <form id="forgot_pass" action="forgot-process.jsp" method="post">
								<input type="text" class="form-control mt-3" name="e_mail" placeholder="Enter Your Email">
								<input type="submit" class="btn btn-default mt-2" value="Submit">
							</form><br>
							<small>Don't have an account ?</small><a href="#" class="btn-link ml-2" data-toggle="modal" data-target="#mymodal1">Create New One Now</a>
						
						</div> 
				</div>
			</div>
		</div>
	
<!-- login model -->
<!-- registration model -->
	<div class="modal about-modal fade" id="mymodal1" tabindex="-1" role="dialog">
					<div class="modal-dialog" role="document" style="max-width: 600px;">
						<div class="modal-content" >
							<div class="modal-header">
								<h2 style="margin-left: 230px; margin-top: 10px;" class="text-primary d-i12">Register</h2>
								<span class="btn btn-lg" data-dismiss="modal">&times;</span>
							</div>
							<div class="modal-body" style="z-index: 0; max-height: 830px; height: auto;">
								<div class="c">
                                                                    <form id="msform" action="RegistrationProcess" method="post" class="fomr" >
										<!-- progress -->
										<ul id="progressbar">
											<li class="active">Account Setup</li>
											<li>Personal Details</li>
											<li>Location</li>
											<li>Choose</li>
											<li id="doctor-div">Doctor Detail</li>
										</ul>

										<!-- fieldsets -->
										
										<fieldset style="position: relative !important;">
											<h2 class="fs-title">Create your account</h2>
											<h3 class="fs-subtitle">This is step 1</h3>
										<div>	
											<input type="text" name="e_mail" id="form_email" required />
                                                                                        <span class="error_form_email" id="email_error_message"></span>
											<label>Email</label>
										</div>
										<div>	
											<input type="password" name="pass" id="form_password" required />
                                                                                        <span class="error_form_password" id="password_error_message"></span>
											<label>Password</label>
										</div>
										<div>	
											<input type="password" name="cpass" id="form_retype_password" required/>
                                                                                        <span class="error_form_retype_password" id="retype_password_error_message"></span>
											<label>Confirm Password</label>
										</div>	
											<input type="button" name="next"  class="next action-button" value="Next" />
										</fieldset>
									
										<fieldset>
											<h2 class="fs-title">Personal Details</h2>
											<h3 class="fs-subtitle">This is step 2</h3>
										<div>	
											<input type="text" name="fname" id="form_fname"  required />
                                                                                        <span class="error_form_fname" id="fname_error_message"></span>
											<label>First Name</label>
										</div>
										<div>
											<input type="text" name="lname" id="form_lname" required />
                                                                                        <span class="error_form_lname" id="lname_error_message"></span>
											<label>Last Name</label>
										</div>
										<div>	
											<input type="date" name="bod" required/>
											<label>Date Of Birth</label>
										</div>
                                                                                <div class="radio">
                                                                                    <h6 class="pull-left text-secondary" style="position: relative;top: -10px;">Gender</h6>
                                                                                    <input type="radio" name="gender" id="male" value="male" required>
                                                                                    <label for="male">Male</label>
                                                                                    <input type="radio"  name="gender" id="female" value="female" required>
                                                                                    <label for="female">Female</label>
                                                                                </div> 
											
											<input type="button" name="previous" class="previous action-button" value="Previous">
											<input type="button" name="next" class="next action-button" value="Next" />
										</fieldset>
										<fieldset>
											<h2 class="fs-title">Location</h2>
											<h3 class="fs-subtitle">This is step 3</h3>
										<div>	
											<input type="tel" name="cn" id="form_contact" required />
                                                                                        <span class="error_form_contact" id="contact_error_message"></span>
											<label>Contact No</label>
										</div>
										<div>	
											<input type="text" name="city" id="form_country" required />
                                                                                        <span class="error_form_country" id="country_error_message"></span>
											<label>Country</label>
										</div>
										<div>	
											<textarea name="address" id="form_address" required></textarea>
                                                                                        <span class="error_form_address" id="address_error_message"></span>
											<label>Address</label>
										</div>	
											<input type="button" name="previous" class="previous action-button" value="Previous">
											<input type="button" name="next" class="next action-button" value="Next" />
										</fieldset>
										<fieldset>
											<h2 class="fs-title">Choose</h2>
											<h3 class="fs-subtitle">This is step 4</h3>

										<div>
                                                                                    <ul class="ul">
                                                                                        <li class="li">
                                                                                            <label class="label">
                                                                                                <input type="radio" id="patient-form" name="q" value="paitent">Paitent
                                                                                                <div class="icon-box">
                                                                                                    <i class="fa fa-user" aria-hidden="true"></i>
                                                                                                </div>
                                                                                            </label>
                                                                                        </li>
                                                                                        <li class="li">
                                                                                            <label class="label">
                                                                                                <input type="radio" id="doctor-form" name="q" value="doctor">Doctor
                                                                                                <div class="icon-box">
                                                                                                    <i class="fa fa-user" aria-hidden="true"></i>
                                                                                                </div>
                                                                                            </label>
                                                                                        </li>
                                                                                    </ul>
                                                                                    
											
										</div>	
											<input type="button" name="previous" class="previous action-button" value="Previous" />
											<input type="submit" name="submit" id="submit" class="confirm action-button" value="Submit" />
											<input type="button" name="next" id="next" class="next action-button" value="Next" />
										</fieldset>
										
										<fieldset id="doctor-div">
											<h2 class="fs-title">Doctor Detail</h2>
											<h3 class="fs-subtitle">This is step 5</h3>
											<div>	
												<input type="text" name="mno" id="form_mno" onfocus="this.value=''" value="input here" required/>
                                                                                                <span class="error_form_mcino" id="mno_error_message"></span>
												<label>M.C.I No.</label>
											</div>
											<div>	
												<input type="text" name="cln" id="form_cln" onfocus="this.value=''" value="input here" required/>
                                                                                                <span class="error_form_cln" id="cln_error_message"></span>
												<label>Clinic Name</label>
											</div>
											<div>	
												<input type="text" name="clno" id="form_clno" onfocus="this.value=''" value="input here" required />
                                                                                                <span class="error_form_clno" id="clno_error_message"></span>
												<label>Clinic Mobile No.</label>
											</div>
                                                                                        <div style="height: 50px;">
                                                                                            <select name="department" required>
                                                                                                <option value="dentalcare" seleted>Dental Care</option>
                                                                                                <option value="Anesthesiologists">Anesthesiologists</option>
                                                                                                <option value="Cardiologists">Cardiologists</option>
                                                                                                <option value="Dermatologists">Dermatologists</option>
                                                                                                <option value="Endocrinologists">Endocrinologists</option>
                                                                                                <option value="Family Physicians">Family Physicians</option>
                                                                                                <option value="Gastroenterologists">Gastroenterologists</option>
                                                                                            </select>
                                                                                            <label>Department</label>
                                                                                        </div>
                                                                                        <div>
                                                                                            
                                                                                        </div>
											<div>	
												<input type="text" name="de" id="form_degree" onfocus="this.value=''" value="input here" required/>
                                                                                                <span class="error_form_degree" id="degree_error_message"></span>
												<label>Degree</label>
											</div>
											<div>	
												<input type="text" name="woe" id="form_woe" onfocus="this.value=''" value="input here" required/>
                                                                                                <span class="error_form_woe" id="woe_error_message"></span>
												<label>Work OF Experience</label>
											</div>
											<input type="button" name="previous" class="previous action-button" value="Previous" />
											<input type="submit" name="submit"  class="confirm action-button" value="Submit"/>
										</fieldset>
									</form>
								</div>
							</div>
						</div>
					</div>
	</div>
<!-- registration model -->

<header>
		<nav id="nav" class="navbar navbar-expand-lg  navbar-light">
			<a href="index.jsp" class="navbar-brand ml-3"> <img src="images/logo.png" class="img-fluid img-logo"> </a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsenavbar">
					<span class="navbar-toggler-icon"></span>
				</button>	
				<div class="collapse navbar-collapse"></div>
				<div class="collapse navbar-collapse text-center" id="collapsenavbar">
					<ul class="navbar-nav mr-auto">
						<li class="nav-item">
							<a href="index.jsp" class="nav-link">Home</a>
						</li>
						<li class="nav-item">
							<a href="#Service" class="nav-link">Services</a>
						</li>
						<li class="nav-item">
							<a href="#department" class="nav-link">Department</a>
						</li>
						<li class="nav-item">
							<a href="#specialist" class="nav-link">Specialists</a>
						</li>
						<li class="nav-item">
							<a href="#about" class="nav-link">About Us</a>
						</li>
						<li class="nav-item">
							<a href="#contact" class="nav-link">Contact Us</a>
						</li>
					</ul>
				<button class="btn btn-outline-primary text-primary bg-white mr-3" data-toggle="modal" data-target="#mymodal">Login</button>
				</div> 					
		</nav>
</header>
<div class="bgimg">
	<div class="container-fluid"><div class="d-flex justify-content-center main-title"><h1 class="text-white d-i display-1">Welcome To E-HealthCare</h1></div>
		</div>
		
</div>
<div class="container sec-time">
	<div class="card-group text-white text-center">
		<div class="card cd bg-primary wow slideInLeft" data-wow-duration="1s" data-wow-delay="4s">
			<div class="card-block">
				<div class="card-title pt-2">
					<h5 class="">Skin Tips</h5>
				</div>
				<div class="card-text h-t1"><br>
                                    <marquee direction="up">
						<%
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
                                            %>
					</marquee>	
				</div>
				<span class="icon1 i-c">
						<i class="fa fa-clock-o"></i>
				</span>
			</div>
		</div>
		<div class="card cd bg-primary wow slideInLeft" data-wow-duration="1s" data-wow-delay="3s">
			<div class="card-block">
				<div class="card-title pt-2">
					<h5>Hair Tips</h5>
				</div>
				<div class="card-text h-t1"><br>
					<marquee direction="up">
						<%
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
                                            %>
					</marquee>	
				</div>
				<span class="icon1">
						<i class="fa fa-calendar-minus-o"></i>
				</span>
			</div>
		</div>
		<div class="card cd bg-primary wow slideInLeft" data-wow-duration="1s" data-wow-delay="2s">
			<div class="card-block">
				<div class="card-title pt-2">
					<h5 class="h-t">Eye Tips</h5>
				</div>
				<div class="card-text h-t1">
					<marquee direction="up">
						<%
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
                                            %>
					</marquee>			
				</div>
				<span class="icon2">
						<i class="fa fa-newspaper-o"></i>
				</span>
			</div>
		</div>
		<div class="card cd bg-primary wow slideInLeft" data-wow-duration="1s" data-wow-delay="1s">
			<div class="card-block">
				<div class="card-title pt-2">
					<h5 class="text-white h-t">Health Tips</h5>
				</div>
				<div class="card-text h-t1">
					<marquee direction="up">
						<%
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
                                            %>
					</marquee>			
				</div>
				<span class="icon2">
						<i class="fa fa-plus-circle"></i>
				</span>
			</div>
		</div>
	</div>
</div>
<section id="about" class="section-padding about-section about header-section2 ">
	<a name="about"></a>
			<div class="container">
				<div class="row">

				<div class="col-sm-6">
					<div class="about-box">
						<figure class="figure">
						<img src="images/about_modal.jpg" class="figure-img img-fluid wow zoomInLeft" data-wow-duration="2s" data-wow-delay="1s"height="400px" width="400px">
						</figure>
					</div>
				</div>


					<div class="col-sm-6 wow zoomInRight" data-wow-duration="2s" data-wow-delay="1s">
						<div class="section-title"><br>
							<div class="section-subtitle text-dark">About Us</div>
							<h2>We are <strong>Creative</strong></h2>
						</div>

						<div class="about-item">
							<p>
								Better user interface for the user. All user have their own profile. Security for the shopping of the customers. People can get the detail of product information by viewing the pictures of health care product.
								Patients can search for doctor and makeonline appointments.
							</p>
							<p>
									Patient can also register complaint or compliment on any doctor in feedback. 
									E-healthcare adviser is a web application which provide online medicine service at their doorstep. The user living at remote village it can connect with internet and get services.	 
							</p>	
						</div>	
						<div class="hgt-20"></div>
						<div class="home-button">
							<!-- Start modal of about-->
											<div class="modal fade p-auto" id="about-modal">
												<div class="modal-dialog" style="max-width: 1000px !important;">
													<div class="modal-content">
														<div class="modal-header">
															<h3 class="text-dark">About Us</h3>
															<span class="btn btn-lg" data-dismiss="modal">&times;</span>
														</div>
														<div class="modal-body">
															<img src="images\about_modal.jpg" class="img-fluid"  width="600px"  style="margin-left: 200px; ">
															<p class="ml-5 mr-5 par">
															<br>
															Better user interface for the user. All user have their own profile. Security for the shopping of the customers. People can get the detail of product information by viewing the pictures of health care product. Patients can search for doctor and makeonline appointments. Patient can also register complaint or compliment on any doctor in feedback. Admin has the authority to add/delete users, grant permission to doctors, to generate and view reports. He also views the complaints of patients and takes necessary actions.
															</p>
															<p class="ml-5 mr-5 par1">
															E-healthcare adviser is a web application which provide online medicine service at their doorstep. The user living at remote village it can connect with internet and get services. This helps the patient to maintain a neat health record and to lead a healthy life.
	
															</p>
														</div>
														<div class="modal-footer">
															<button class="btn btn-primary" data-dismiss="modal">Close</button>
														</div> 
													</div>
												</div>
											</div>
										<!-- End modal of cardiology-->
                                        
							<button class="btn btn-outline-dark"  data-toggle="modal" data-target="#about-modal">Read More</button>
						</div>		
					</div>				
				</div>
			</div>					
</section>
<section class="bg-primary  text-white header-section1 wow zoomIn" data-wow-duration="1s" data-wow-delay="1s">
	<div class="container">
		<a href="#" class="btn bg-white pull-right text-primary BOOK wow flipInX " data-wow-duration="2s" data-wow-delay="1s"><b>Book an Appointment</b></a>
		<h1 class="wow slideInLeft" data-wow-duration="1s" data-wow-delay="1s">How we can help...</h1>
		<small class="wow flipInX" data-wow-duration="3s" data-wow-delay="1s">We offer a wide range of procedures to help you get the perfect smile.</small>
		
	</div>
</section>
<section class="bg-light text-center">
<a name="Service"></a>
			<!-- services -->
		<div class="container ff">
			<div class="w3ls-titles text-center mb-5">
				<h3 class="title text-service text-primary wow fadeInUp" data-wow-duration="1s" data-wow-delay="1s" >Our Best Services</h3>
				
				<p class="mt-4 wow fadeInUp" data-wow-duration="1s" data-wow-delay="1s">Get Our Services & Live Healthy Life...</p>				
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-4">
					<div class="row wow fadeInLeftBig" data-wow-duration="1s" data-wow-delay="1s">
						<div class="col-3 p-0 text-right">
							<div class="wthree_features_grid">
								<i class="fi fa fa-plus-circle"></i>
							</div>
						</div>
						<div class="col-9 agile-why-text-2">
							<h4 class="text-dark font-weight-bold mb-3 h-t">HealthCare Tips</h4>
							<p class="o-p">Implement some tips to improve health..</p>
						</div>
					</div>
					<div class="row my-5 wow fadeInLeftBig" data-wow-duration="1s" data-wow-delay="2s">
						<div class="col-3 p-0 text-right">
							<div class="wthree_features_grid">
								<i class="fi fa fa-tooth"></i>
							</div>
						</div>
						<div class="col-9 agile-why-text-2">
							<h4 class="text-dark font-weight-bold mb-3 h-t">Dental services</h4>
							<p class="o-p">Practicing good dental health is important to maintaining a healthy mouth, teeth and gums.It will also help your appearance and quality of life.</p>
						</div>
					</div>
					<div class="row wow fadeInLeftBig" data-wow-duration="1s" data-wow-delay="3s">
						<div class="col-3 p-0 text-right">
							<div class="wthree_features_grid">
								<i class="fi fa fa-user-md"></i>
							</div>
						</div>
						<div class="col-9 agile-why-text-2">
							<h4 class="text-dark font-weight-bold mb-3 h-t">Physiotherapy</h4>
							<p class="o-p"> The treatment of disease, injury, or deformity by physical methods such as massage, heat treatment, and exercise rather than by drugs or surgery.</p>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-md-4 img text-center wow zoomIn" data-wow-duration="1s" data-wow-delay="1s">
					<img src="images/b3.png" alt=" " class="img-fluid img-service">
				</div>
				<div class="col-lg-4 col-md-4">
					<div class="row wow fadeInRightBig" data-wow-duration="1s" data-wow-delay="1s">
						<div class="col-9 agile-why-text-2">
							<h4 class="text-dark font-weight-bold mb-3 h-t">Ambulance</h4>
							<p class="o-p" style="font-size: 14px;">Ambulance is a self-propelled vehicle specifically designed to transport critically sick or injured people to a medical facility.</p>
						</div>
						<div class="col-3 p-0">
							<div class="wthree_features_grid">
								<i class="fi1 fa fa-ambulance"></i>
							</div>
						</div>
					</div>
					<div class="row my-5 wow fadeInRightBig" data-wow-duration="1s" data-wow-delay="2s">
						<div class="col-9 agile-why-text-2">
							<h4 class="text-dark font-weight-bold mb-3 h-t">Blood Bank</h4>
							<p class="o-p" style="font-size: 15px;">Blood donation is a most important social service to the humankind. As being a human, we must donate blood to save others life.  </p>
						</div>
						<div class="col-3 p-0">
							<div class="wthree_features_grid">
								<i class="fi1 fa fa-tint"></i>
							</div>
						</div>
					</div>
					<div class="row wow fadeInRightBig" data-wow-duration="1s" data-wow-delay="3s">
						<div class="col-9 agile-why-text-2">
							<h4 class="text-dark font-weight-bold mb-3 h-t">Laboratory</h4>
							<p class="o-p">A room or building equipped for scientific experiments, research, or teaching, or for the manufacture of drugs or chemicals.
							</p>
						</div>
						<div class="col-3 p-0">
							<div class="wthree_features_grid">
								<i class="fi1 fa fa-flask"></i>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<!-- //services -->
</section>
<section id="depart">
	<a name="department"></a>
	<div class="our-departments">
        <div class="container">
            <div class="row wow zoomIn" data-wow-duration="1s" data-wow-delay="1s">
                <div class="col-12">
                    <div class="our-departments-wrap">
                        <h2 class="wow bounceInDown" data-wow-duration="1s" data-wow-delay="1s">Our Departments</h2>

                        <div class="row" >
                            <div class="col-12 col-md-6 col-lg-4  wow zoomInDown" data-wow-duration="2s" data-wow-delay="1s">
                                <div class="our-departments-cont">
                                    <header class="entry-header d-flex flex-wrap align-items-center">
                                        <img src="images/cardiogram.png" alt="">

                                        <h3>Cardioology</h3>
                                    </header>

                                    <div class="entry-content">
                                        <p>The term cardiology is derived from the Greek words “cardio,” which refers to the heart and “logy” meaning “study of”. </p>
                                    </div>

                                    <footer class="entry-footer">
                                    	<!-- Start modal of cardiology-->
											<div class="modal fade p-auto" id="cardiology">
												<div class="modal-dialog" style="max-width: 1000px !important;">
													<div class="modal-content">
														<div class="modal-header">
															<h3 class="text-dark">Cardiology</h3>
															<span class="btn btn-lg" data-dismiss="modal">&times;</span>
														</div>
														<div class="modal-body">
															<img src="images\department\cardiology.jpg" class="img-fluid" width="600px"  style="margin-left: 190px;">
															<p class="ml-5 mr-5 mt-3">

															The term cardiology is derived from the Greek words “cardio,” which refers to the heart and “logy” meaning “study of.” Cardiology is a branch of medicine that concerns 

                                                            diseases and disorders of the heart, which may range from congenital defects through to acquire heart diseases such as coronary artery disease and congestive heart failure.

																
															</p>
														</div>
														<div class="modal-footer">
															<button class="btn btn-primary" data-dismiss="modal">Close</button>
														</div> 
													</div>
												</div>
											</div>
										<!-- End modal of cardiology-->
                                        <a href="#" data-toggle="modal" data-target="#cardiology">read more</a>
                                    </footer>
                                </div>
                            </div>

                            <div class="col-12 col-md-6 col-lg-4 wow zoomInDown" data-wow-duration="2s" data-wow-delay="1s">
                                <div class="our-departments-cont">
                                    <header class="entry-header d-flex flex-wrap align-items-center">
                                        <img src="images/stomach-2.png" alt="">

                                        <h3>Gastroenterology</h3>
                                    </header>

                                    <div class="entry-content">
                                        <p> Gastroenterology is the study of the normal function and diseases of the esophagus, stomach, small intestine, colon and rectum, pancreas, gallbladder, bile ducts and liver.</p>
                                    </div>

                                    <footer class="entry-footer">
                                    	<!-- Start modal of Gastroenterology-->
											<div class="modal fade p-auto" id="gastroenterology">
												<div class="modal-dialog" style="max-width: 1000px !important;">
													<div class="modal-content">
														<div class="modal-header">
															<h3 class="text-dark">Gastroenterology</h3>
															<span class="btn btn-lg" data-dismiss="modal">&times;</span>
														</div>
														<div class="modal-body">
															<img src="images\department\gastroenterology.jpg" class="img-fluid" width="600px"  style="margin-left: 200px;">
															<p class="ml-5 mr-5 mt-3"> 
																 Gastroenterology is the study of the normal function and diseases of the esophagus, stomach, small intestine, colon and rectum, pancreas, gallbladder, bile ducts and liver.
															</p>
															<p class="ml-5 mr-5 par">	 		
                                                                 A gastroenterologist needs to have a detailed understanding of the normal physiology of all the above mentioned organs as well as motility through the intestines and gastrointestinal tract in order to maintain a healthy digestion, absorption of nutrients,  removal of waste and metabolic processes.

															</p>
														</div>
														<div class="modal-footer">
															<button class="btn btn-primary" data-dismiss="modal">Close</button>
														</div> 
													</div>
												</div>
											</div>
										<!-- End modal of Gastroenterology-->
                                        <a href="#" data-toggle="modal" data-target="#gastroenterology">read more</a>
                                    </footer>
                                </div>
                            </div>

                            <div class="col-12 col-md-6 col-lg-4 wow zoomInDown" data-wow-duration="2s" data-wow-delay="1s">
                                <div class="our-departments-cont">
                                    <header class="entry-header d-flex flex-wrap align-items-center">
                                        <img src="images/blood-sample-2.png" alt="">

                                        <h3>Medical Lab</h3>
                                    </header>

                                    <div class="entry-content">
                                        <p>Medical laboratory technology is the branch of medical science responsible for performing laboratory investigations relating to the diagnosis, treatment, and prevention of disease.</p>
                                    </div>

                                    <footer class="entry-footer">
                                    	<!-- Start modal of Medical Lab-->
											<div class="modal fade p-auto" id="medicallab">
												<div class="modal-dialog" style="max-width: 1000px !important;">
													<div class="modal-content">
														<div class="modal-header">
															<h3 class="text-dark">Medical Lab</h3>
															<span class="btn btn-lg" data-dismiss="modal">&times;</span>
														</div>
														<div class="modal-body">
															<img src="images\department\lab.jpg" class="img-fluid" width="600px"  style="margin-left: 190px;">
															<p class="ml-5 mr-5 mt-3">
																Medical laboratory technology is the branch of medical science responsible for performing laboratory investigations relating to the diagnosis, treatment, and prevention of disease.
															</p>
															<p class="ml-5 mr-5 par">	
                                                                Laboratory scientists (medical and clinical technologists as well as medical and clinical laboratory technicians) facilitate the diagnosis of diseases, as well as the implementation and monitoring of therapies to treat disease. Laboratory scientists are responsible for examining and analysing blood, body fluids, tissues, and cells in an effort to help clinicians determine the underlying cause of an illness, the stage of a disease, or the effectiveness of therapy. 
															</p>
														</div>
														<div class="modal-footer">
															<button class="btn btn-primary" data-dismiss="modal">Close</button>
														</div> 
													</div>
												</div>
											</div>
										<!-- End modal of Medical Lab-->
                                        <a href="#" data-toggle="modal" data-target="#medicallab">read more</a>
                                    </footer>
                                </div>
                            </div>

                            <div class="col-12 col-md-6 col-lg-4 wow zoomInDown" data-wow-duration="2s" data-wow-delay="1s">
                                <div class="our-departments-cont">
                                    <header class="entry-header d-flex flex-wrap align-items-center">
                                        <img src="images/teeth.png" alt="">

                                        <h3>Dental Care</h3>
                                    </header>

                                    <div class="entry-content">
                                        <p>A healthy mouth, free of infections, injuries and other problems with teeth and gums, is important in maintaining your overall health.</p>
                                    </div>

                                    <footer class="entry-footer">
                                        <!-- Start modal of Dental Care-->
											<div class="modal fade p-auto" id="dentalcare">
												<div class="modal-dialog" style="max-width: 1000px !important;">
													<div class="modal-content">
														<div class="modal-header">
															<h3 class="text-dark">Dental Care</h3>
															<span class="btn btn-lg" data-dismiss="modal">&times;</span>
														</div>
														<div class="modal-body">
															<img src="images\department\dental.jpg" class="img-fluid" width="600px"  style="margin-left: 190px;">
															<p class="ml-5 mr-5 mt-3">
																Dental or oral health is concerned with your teeth, gums and mouth. The goal is to prevent complications such as tooth decay (cavities) and gum disease and to maintain the overall health of your mouth.
															</p>
															<p class="ml-5 mr-5 par">	
                                                                A healthy mouth, free of infections, injuries and other problems with teeth and gums, is important in maintaining your overall health.
                                                            </p>
                                                            <p class="ml-5 mr-5 par">    
                                                                Although a different set of medical professionals focuses on dental health, they are still part of your regular health care team.
                                                            </p>
                                                            <p class="ml-5 mr-5 par">    
                                                                Disease and other conditions can affect your dental health and dental problems can affect other parts of your body. Failing to properly care for your oral health may lead to other health problems.

															</p>
														</div>
														<div class="modal-footer">
															<button class="btn btn-primary" data-dismiss="modal">Close</button>
														</div> 
													</div>
												</div>
											</div>
										<!-- End modal of Dental Care-->
                                        <a href="#" data-toggle="modal" data-target="#dentalcare">read more</a>
                                    </footer>
                                </div>
                            </div>

                            <div class="col-12 col-md-6 col-lg-4 wow zoomInDown" data-wow-duration="2s" data-wow-delay="1s">
                                <div class="our-departments-cont">
                                    <header class="entry-header d-flex flex-wrap align-items-center">
                                        <img src="images/stretcher.png" alt="">

                                        <h3>Surgery</h3>
                                    </header>

                                    <div class="entry-content">
                                        <p>Surgery is when a surgeon cuts tissue in the body. It is often used to remove a cancer. It can be used to treat many types of cancer.</p>
                                    </div>

                                    <footer class="entry-footer">
                                         <!-- Start modal of Surgery-->
											<div class="modal fade p-auto" id="surgery">
												<div class="modal-dialog" style="max-width: 1000px !important;">
													<div class="modal-content">
														<div class="modal-header">
															<h3 class="text-dark">Surgery</h3>
															<span class="btn btn-lg" data-dismiss="modal">&times;</span>
														</div>
														<div class="modal-body">
															<img src="images\department\surgrey.jpg" class="img-fluid" width="600px"  style="margin-left: 190px;">
															<p class="ml-5 mr-5 mt-3 par">
																Surgery is when a surgeon cuts tissue in the body. It is often used to remove a cancer. It can be used to treat many types of cancer.
															</p>
															<p class="ml-5 mr-5 par1">	
                                                                Surgery can be used for lots of reasons, such as to:
                                                                <br>
                                                                ⦁	diagnose cancer.<br>
                                                                ⦁	remove cancer<br>
                                                                ⦁	find out how big the cancer is and if it has spread to other parts of the body<br>
                                                                ⦁	control symptoms of cancer<br>
                                                                ⦁	restore parts of the body (for example, bladder reconstruction)<br>
                                                                ⦁	improve the appearance of part of the body (for example, breast reconstruction)<br>

															</p>
														</div>
														<div class="modal-footer">
															<button class="btn btn-primary" data-dismiss="modal">Close</button>
														</div> 
													</div>
												</div>
											</div>
										<!-- End modal of Surgery-->
                                        <a href="#" data-toggle="modal" data-target="#surgery">read more</a>
                                    </footer>
                                </div>
                            </div>

                            <div class="col-12 col-md-6 col-lg-4 wow zoomInDown" data-wow-duration="2s" data-wow-delay="1s">
                                <div class="our-departments-cont">
                                    <header class="entry-header d-flex flex-wrap align-items-center">
                                        <img src="images/scanner.png" alt="">

                                        <h3>Neurology</h3>
                                    </header>

                                    <div class="entry-content">
                                        <p>Neurology is the branch of medicine that deals with disorders of the nervous system, which include the brain, blood vessels, muscles and nerves.</p>
                                    </div>

                                    <footer class="entry-footer">
                                        <!-- Start modal of Neurology-->
											<div class="modal fade p-auto" id="neurology">
												<div class="modal-dialog" style="max-width: 1000px !important;">
													<div class="modal-content">
														<div class="modal-header">
															<h3 class="text-dark">Neurology</h3>
															<span class="btn btn-lg" data-dismiss="modal">&times;</span>
														</div>
														<div class="modal-body">
															<img src="images\department\neurology.jpg" class="img-fluid" width="600px"  style="margin-left: 190px;">
															<p class="ml-5 mr-5 mt-3">
																Neurology is the branch of medicine that deals with disorders of the nervous system, which include the brain, blood vessels, muscles and nerves. The main areas of neurology are: the autonomic, central and peripheral nervous systems. A physician who works in the field of neurology is called a Neurologist a neurosurgeon treats neurological disorders via surgery.
															</p>
															<p class="ml-5 mr-5 par">	
                                                                After 8 years of medical school, neurologists must complete postgraduate residency for 3 to 4 years. After completion of residency, some neurologists may continue on with fellowships in other areas of neurology. These may include behavioural neurology, clinical neurophysiology, epilepsy, interventional neurology or pain management.
															</p>
														</div>
														<div class="modal-footer">
															<button class="btn btn-primary" data-dismiss="modal">Close</button>
														</div> 
													</div>
												</div>
											</div>
										<!-- End modal of Neurology-->
                                        <a href="#" data-toggle="modal" data-target="#neurology">read more</a>
                                    </footer>
                                </div>
                            </div>

                            <div class="col-12 col-md-6 col-lg-4 mb-md-0 wow zoomInDown" data-wow-duration="2s" data-wow-delay="1s">
                                <div class="our-departments-cont">
                                    <header class="entry-header d-flex flex-wrap align-items-center">
                                        <img src="images/bones.png" alt="">

                                        <h3>Orthopaedy</h3>
                                    </header>

                                    <div class="entry-content">
                                        <p>Orthopaedics is a medical specialty that focuses on the diagnosis, correction, prevention, and treatment of patients with skeletal deformities - disorders of the bones, joints, muscles, ligaments, tendons, nerves and skin. These elements make up the musculoskeletal system.</p>
                                    </div>

                                    <footer class="entry-footer">
                                        <!-- Start modal of Orthopaedy-->
											<div class="modal fade p-auto" id="orthopaedy">
												<div class="modal-dialog" style="max-width: 1000px !important;">
													<div class="modal-content">
														<div class="modal-header">
															<h3 class="text-dark">Orthopaedy</h3>
															<span class="btn btn-lg" data-dismiss="modal">&times;</span>
														</div>
														<div class="modal-body">
															<img src="images\department\orthopaedics.jpg" class="img-fluid" width="600px"  style="margin-left: 190px;">
															<p class="ml-5 mr-5 mt-3">
															 
															 Orthopaedics is a medical specialty that focuses on the diagnosis, correction, prevention, and treatment of patients with skeletal deformities - disorders of the bones, joints, muscles, ligaments, tendons, nerves and skin. These elements make up the musculoskeletal system.
															</p>
															<p class="ml-5 mr-5 par"> 
                                                             Your body's musculoskeletal system is a complex system of bones, joints, ligaments, tendons, muscles and nerves and allows you to move, work and be active. Once devoted to the care of children with spine and limb deformities, orthopaedics now cares for patients of all ages, from new-borns with clubfeet, to young athletes requiring arthroscopic surgery, to older people with arthritis.

                                                             The physicians who specialize in this area are called orthopaedic surgeons or orthopaedists.

	
															</p>
														</div>
														<div class="modal-footer">
															<button class="btn btn-primary" data-dismiss="modal">Close</button>
														</div> 
													</div>
												</div>
											</div>
										<!-- End modal of Orthopaedy-->
                                        <a href="#" data-toggle="modal" data-target="#orthopaedy">read more</a>
                                    </footer>
                                </div>
                            </div>

                            <div class="col-12 col-md-6 col-lg-4 mb-lg-0 wow zoomInDown" data-wow-duration="2s" data-wow-delay="1s">
                                <div class="our-departments-cont">
                                    <header class="entry-header d-flex flex-wrap align-items-center">
                                        <img src="images/blood-donation-2.png" alt="">

                                        <h3>Podiatry</h3>
                                    </header>

                                    <div class="entry-content">
                                        <p>Podiatry is a medical specialty that focuses on the diagnosis, treatment, prevention and management of diseases, defects and injuries of the foot, ankle and lower limb.</p>
                                    </div>

                                    <footer class="entry-footer">
                                        <!-- Start modal of Podiatry-->
											<div class="modal fade p-auto" id="podiatry">
												<div class="modal-dialog" style="max-width: 1000px !important;">
													<div class="modal-content">
														<div class="modal-header">
															<h3 class="text-dark">Podiatry</h3>
															<span class="btn btn-lg" data-dismiss="modal">&times;</span>
														</div>
														<div class="modal-body">
															<img src="images\department\podiatry.jpg" class="img-fluid" width="600px"  style="margin-left: 190px;">
															<p class="ml-5 mr-5 mt-3 par">
																The treatment of the feet and their ailments
                                                                Podiatry is a medical specialty that focuses on the diagnosis, treatment, prevention and management of diseases, defects and injuries of the foot, ankle and lower limb. This includes ankle and foot injuries, problems with gait or walking, complications related to medical conditions such as diabetes and arthritis and diseases of the skin or nail such as cracked heels, ingrown toenails, neuromas, warts and other fungal conditions.
                                                            </p>
                                                            <p class="ml-5 mr-5 par1">    
                                                                A doctor of podiatric medicine (DPM) is called a podiatrist. A podiatrist is a licensed physician and/or surgeon who has undergone specialist training in assessing, diagnosing and treating medical conditions related to the foot, ankle and lower limb.


															</p>
														</div>
														<div class="modal-footer">
															<button class="btn btn-primary" data-dismiss="modal">Close</button>
														</div> 
													</div>
												</div>
											</div>
										<!-- End modal of Podiatry-->
                                        <a href="#" data-toggle="modal" data-target="#podiatry">read more</a>
                                    </footer>
                                </div>
                            </div>

                            <div class="col-12 col-md-6 col-lg-4 mb-0 wow zoomInDown" data-wow-duration="2s" data-wow-delay="1s">
                                <div class="our-departments-cont">
                                    <header class="entry-header d-flex flex-wrap align-items-center">
                                        <img src="images/glasses.png" alt="">

                                        <h3>Ophthalmology</h3>
                                    </header>

                                    <div class="entry-content">
                                        <p>Ophthalmology is a branch of medicine dealing with the diagnosis, treatment and prevention of diseases of the eye and visual system.</p>
                                    </div>

                                    <footer class="entry-footer">
                                        <!-- Start modal of Ophthalmology-->
											<div class="modal fade p-auto" id="ophthalmology">
												<div class="modal-dialog" style="max-width: 1000px !important;">
													<div class="modal-content">
														<div class="modal-header">
															<h3 class="text-dark">Ophthalmology</h3>
															<span class="btn btn-lg" data-dismiss="modal">&times;</span>
														</div>
														<div class="modal-body">
															<img src="images\department\ophthalmology.jpg" class="img-fluid" width="600px"  style="margin-left: 190px;">
															<p class="ml-5 mr-5 mt-3 par">
																The branch of medicine concerned with the study and treatment of disorders and diseases of the eye.
															</p>
															<p class="ml-5 mr-5 par1">	
                                                                Ophthalmology is a branch of medicine dealing with the diagnosis, treatment and prevention of diseases of the eye and visual system.
                                                            </p>    
                                                            <p class="ml-5 mr-5 par">
                                                                The eye, its surrounding structures and the visual system can be affected by a number of clinical conditions. Ophthalmology involves diagnosis and therapy of such conditions, along with microsurgery.
                                                            </p>
                                                            <p class="ml-5 mr-5 par">    
                                                                Eye health services are becoming more and more important as the UK population ages. An ageing population means there are more and more incidences of age-related diseases of the eye, such as age-related macular degeneration. These eye diseases can be successfully treated if caught early, and can be managed effectively with existing treatments and medicines


															</p>
														</div>
														<div class="modal-footer">
															<button class="btn btn-primary" data-dismiss="modal">Close</button>
														</div> 
													</div>
												</div>
											</div>
										<!-- End modal of Ophthalmology-->
                                        <a href="#" data-toggle="modal" data-target="#ophthalmology">read more</a>
                                    </footer>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="specialists bg-light text-center header-section">
<a name="specialist"></a>	
<h1 class="text-primary mb-5 ou wow rotateIn" data-wow-duration="2s" data-wow-delay="1s">OUR SPECIALISTS</h1>
<div class="container">
		<div class="row">
			<div class="col-xl-4 col-md-4 col-sm-4 mb-5 wow slideInLeft" data-wow-duration="2s" data-wow-delay="1s">
				<div class="card">
				  <img src="images\specialist\a.jpg" class="card-img-top img-fluid" alt="..."> 
					  <div class="card-body">
					<h2 class="card-title">PHYHOLOGIST</h2>
					<p class="card-text">DR.Jack Will</p>
					<ul>
						<li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
						<li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
						<li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
					</ul>
					  </div>
				</div>
			</div>
			<div class="col-xl-4 col-md-4 col-sm-4 mb-5 wow zoomIn" data-wow-duration="1s" data-wow-delay="1s">
				<div class="card c2" >
				  <img src="images\specialist\b.jpg" class="card-img-top img-fluid " alt="...">
					  <div class="card-body">
					<h2 class="card-title">DIRECTOR</h2>
					<p class="card-text">DR.John Willky</p>
					<ul>
						<li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
						<li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
						<li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
					</ul>
					  </div>
				</div>
			</div>
			<div class="col-xl-4 col-md-4 col-sm-4 mb-5 wow slideInRight" data-wow-duration="2s" data-wow-delay="1s">
				<div class="card c3">
				  <img src="images\specialist\d.jpg" class="card-img-top img-fluid" alt="...">
					  <div class="card-body">
					<h2 class="card-title">HOD</h2>
					<p class="card-text">DR.MONA</p>
					<ul>
						<li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
						<li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
						<li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
					</ul>
					  </div>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="bg-primary text-center text-white header-section1 wow zoomIn" data-wow-duration="1s" data-wow-delay="1s">
	<div class="container wow zoomIn" data-wow-duration="1s" data-wow-delay="1s" >
		<h1>Supporting Spinal Health</h1><br>
		<small>We believe spinal health plays a vital role in human organism functioning. Get a free</small><br>
		<small>consultation today to avoid problems with your health tomorrow.</small><br><br>
		<a href="#" class="btn bg-white text-primary"><b>Free Consultation</b></a>
	</div>
</section>
<section class="contact text-center header-section">
	<a name="contact"></a>
	<div class="container">
		<h1 class="text-primary ou wow fadeInDown" data-wow-duration="1s" data-wow-delay="2s">Contact Us</h1>
	<div class="b wow fadeInDown" data-wow-duration="1s" data-wow-delay="1s">	
            <form action="contactmail" method="post">
		<div>
			<input type="text" name="name" required="">
			<label>Name</label>
		</div>
		<div>
			<input type="email" name="mail" required="">
			<label>Email</label>
		</div>
        <div>
			<input type="text" name="sub" required="">
			<label>Subject</label>
		</div>
		<div>
			<textarea required="" name="mes"></textarea>
			<label>Message</label>
		</div>
    <input type="submit" id="contactsubmit" value="Submit" class="btn btn-primary">
	</form>
	</div>

	</div>
</section>
<br>
<br>
<br>
<footer class="text-center p-auto footer-section">
	<div class="container p-1">
		<div class="footer-main mt-4">	
		<a href="index.jsp" class="btn btn-link text-dark font_link" style="font-size: small;">Home</a>
		<a href="#Service" class="btn btn-link text-dark font_link" style="font-size: small;">Service</a>
		<a href="#department" class="btn btn-link text-dark font_link" style="font-size: small;">Department</a>
		<a href="#specialist" class="btn btn-link text-dark font_link" style="font-size: small;">Specialists</a>
		<a href="#about" class="btn btn-link text-dark font_link" style="font-size: small;">About Us </a>
		<a href="#contact" class="btn btn-link text-dark font_link" style="font-size: small;">Contact Us</a>
		<a href="sign-in.html" class="btn btn-link text-dark font_link" style="font-size: smaller;">Admin Login</a>
		</div>
	</div>
	<div class="container">
		<div class="footer-copy-redes">
		<div class="main-copy-redes">
			<div class="footer-copy text-dark font_link p-4" style="font-size: small;">
				&copy;2018, All Right Reserved - | CopyRights |.
			</div>
			<div class="footer-copy text-dark font_link pb-3" style="font-size: small;">
				Developed By:- Abhishek Panat  & Prashant Agrawal.
			</div>
		</div>
	</div>
	</div>
	
</footer>

<!-- JQUERYS Started-->

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="js/tilt.jquery.js"></script>
			<script type="text/javascript">
				$(document).ready(function(){
					$('.card').tilt({
						maxTilt: 10,
						glare: true,
						maxGlare: .4
					})
				})
			</script>

<!-- easing -->
	<script src="js/easing.js"></script>
	<script src="js/form.js"></script>
	<!--  necessary snippets for few javascript files -->
	<script src="js/medic.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.js"></script>
<script>
var wow = new WOW(
  {
    boxClass:     'wow',      // animated element css class (default is wow)
    animateClass: 'animated', // animation css class (default is animated)
    offset:       0,          // distance to the element when triggering the animation (default is 0)
    mobile:       true,       // trigger animations on mobile devices (default is true)
    live:         true,       // act on asynchronously loaded content (default is true)
    callback:     function(box) {
      // the callback is fired every time an animation is started
      // the argument that is passed in is the DOM node being animated
    },
    scrollContainer: null,    // optional scroll container selector, otherwise use window,
    resetAnimation: true,     // reset animation on end (default is true)
  }
);
wow.init();
</script>
	
	<!-- Necessary-JavaScript-File-For-Bootstrap -->
<script src="js/SmoothScroll.min.js"></script>
	<script src="js/move-top.js"></script>
<a href="#" id="toTop" style="background-color: #007bff;"><span id="toTopHover" ></span></a>
<script type="text/javascript">
						$(document).ready(function(){
							$('#doctor-div').hide();
							$('#next').hide();
							$('#patient-form').bind('change', function(e){
								$('#doctor-div').hide();
								$('#submit').show();
								$('#next').hide();
							});
							$('#doctor-form').bind('change', function(e){
								$('#doctor-div').show();
								$('#next').show();
								$('#submit').hide();
							});
						});
</script>
<script>
$(document).ready(function(){
	$("#forgot_pass").hide();
	$("#forgot_btn").click(function(){
		$("#forgot_pass").show();
	});
});
</script>
<script>
    $(function () {
        
        $("fname_error_message").hide();
        $("lname_error_message").hide();
        $("email_error_message").hide();
        $("password_error_message").hide();
        $("retype_password_error_message").hide();
        $("contact_error_message").hide();
        $("country_error_message").hide();
        $("address_error_message").hide();
        $("mno_error_message").hide();
        $("cln_error_message").hide();
        $("clno_error_message").hide();
        $("degree_error_message").hide();
        $("woe_error_message").hide();
        
        var error_fname = false;
        var error_lname = false;
        var error_email = false;
        var error_password = false;
        var error_retype_password = false;
        var error_contact = false;
        var error_country = false;
        var error_address = false;
        var error_mno = false;
        var error_cln = false;
        var error_clno = false;
        var error_degree = false;
        var error_woe = false;
        
        $("#form_fname").focusout(function(){
            check_fname();
        });
        $("#form_lname").focusout(function(){
            check_lname();
        });
        $("#form_email").focusout(function(){
            check_email();
        });
        $("#form_password").focusout(function(){
            check_password();
        });
        $("#form_retype_password").focusout(function(){
            check_retype_password();
        });
        $("#form_contact").focusout(function(){
            check_contact();
        });
        $("#form_country").focusout(function(){
            check_country();
        });
        $("#form_address").focusout(function(){
            check_address();
        });
        $("#form_mno").focusout(function(){
            check_mno();
        });
        $("#form_cln").focusout(function(){
            check_cln();
        });
        $("#form_clno").focusout(function(){
            check_clno();
        });
        $("#form_degree").focusout(function(){
            check_degree();
        });
        $("#form_woe").focusout(function(){
            check_woe();
        });
        
        function check_fname(){
            var pattern = /^[a-zA-Z]*$/;
            var fname = $("#form_fname").val()
            if(pattern.test(fname) && fname !== ''){
                $("#fname_error_message").hide();
                $("#form_fname").css("border-bottom","2px solid #34f458");
            }
            else{
                $("#fname_error_message").html("should contain only character");
                $("#fname_error_message").show();
                $(".error_form_fname").css("visibility","visible");
                $("#form_fname").css("border-bottom","2px solid #f90a0a");
                error_fname = true;
            }
        }
        function check_lname(){
            var pattern = /^[a-zA-Z]*$/;
            var lname = $("#form_lname").val()
            if(pattern.test(lname) && lname !== ''){
                $("#lname_error_message").hide();
                $("#form_lname").css("border-bottom","2px solid #34f458");
            }
            else{
                $("#lname_error_message").html("should contain only character");
                $("#lname_error_message").show();
                $(".error_form_lname").css("visibility","visible");
                $("#form_lname").css("border-bottom","2px solid #f90a0a");
                error_lname = true;
            }
        }
        
        function check_password(){
            var password_length = $("#form_password").val().length;
            if(password_length < 8){
                $("#password_error_message").html("Atleast 8 Characters");
                $("#password_error_message").show();
                $(".error_form_password").css("visibility","visible");
                $("#form_password").css("border-bottom","2px solid #f90a0a");
                error_password = true;
            }
            else{
                $("#password_error_message").hide();
                $("#form_password").css("border-bottom","2px solid #34f458");
            }
        }
        function check_retype_password(){
            var password = $("#form_password").val();
            var retype_password = $("#form_retype_password").val();
            if(password !== retype_password){
                $("#retype_password_error_message").html("Password Did Not Match");
                $("#retype_password_error_message").show();
                $(".error_form_retype_password").css("visibility","visible");
                $("#form_retype_password").css("border-bottom","2px solid #f90a0a");
                error_retype_password = true;
            }
            else{
                $("#retype_password_error_message").hide();
                $("#form_retype_password").css("border-bottom","2px solid #34f458");
            }
        }
        function check_email(){
            var pattern = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
            var email = $("#form_email").val();
            if(pattern.test(email) && email !== ''){
                $("#email_error_message").hide();
                $("#form_email").css("border-bottom","2px solid #34f458");
            }
            else{
                $("#email_error_message").html("Invalid Email");
                $("#email_error_message").show();
                $(".error_form_email").css("visibility","visible");
                $("#form_email").css("border-bottom","2px solid #f90a0a");
                error_email = true;
            }
        }
        function check_contact(){
            var pattern = /^[0-9]{10}$/;
            var contact = $("#form_contact").val();
            if(pattern.test(contact) && contact !== ''){
                $("#contact_error_message").hide();
                $("#form_contact").css("border-bottom","2px solid #34f458");
            }
            else{
                $("#contact_error_message").html("Invalid Contact No.");
                $("#contact_error_message").show();
                $(".error_form_contact").css("visibility","visible");
                $("#form_contact").css("border-bottom","2px solid #f90a0a");
                error_contact = true;
            }
        }
        function check_country(){
            var pattern = /^[a-zA-Z]*$/;
            var country = $("#form_country").val();
            if(pattern.test(country) && country !== ''){
                $("#country_error_message").hide();
                $("#form_country").css("border-bottom","2px solid #34f458");
            }
            else{
                $("#country_error_message").html("Enter valid country");
                $("#country_error_message").show();
                $(".error_form_country").css("visibility","visible");
                $("#form_country").css("border-bottom","2px solid #f90a0a");
                error_country = true;
            }
        }
        
        
        function check_cln(){
            var pattern = /^[a-zA-Z]*$/;
            var cln = $("#form_cln").val();
            if(pattern.test(cln) && cln !== ''){
                $("#cln_error_message").hide();
                $("#form_cln").css("border-bottom","2px solid #34f458");
            }
            else{
                $("#cln_error_message").html("Enter Valid Clinic Name");
                $("#cln_error_message").show();
                $(".error_form_cln").css("visibility","visible");
                $("#form_cln").css("border-bottom","2px solid #f90a0a");
                error_cln = true;
            }
        }
        function check_clno(){
            var pattern = /^[0-9]{10}$/;
            var clno = $("#form_clno").val();
            if(pattern.test(clno) && clno !== ''){
                $("#clno_error_message").hide();
                $("#form_clno").css("border-bottom","2px solid #34f458");
            }
            else{
                $("#clno_error_message").html("Invalid Contact No.");
                $("#clno_error_message").show();
                $(".error_form_clno").css("visibility","visible");
                $("#form_clno").css("border-bottom","2px solid #f90a0a");
                error_clno = true;
            }
        }
        function check_degree(){
            var pattern = /^[a-zA-Z]*$/;
            var degree = $("#form_degree").val();
            if(pattern.test(degree) && degree !== ''){
                $("#degree_error_message").hide();
                $("#form_degree").css("border-bottom","2px solid #34f458");
            }
            else{
                $("#degree_error_message").html("Enter Valid Degree");
                $("#degree_error_message").show();
                $(".error_form_degree").css("visibility","visible");
                $("#form_degree").css("border-bottom","2px solid #f90a0a");
                error_degree = true;
            }
        }
        function check_woe(){
            var pattern = /^[0-9]$/;
            var woe = $("#form_woe").val();
            if(pattern.test(woe) && woe !== ''){
                $("#woe_error_message").hide();
                $("#form_woe").css("border-bottom","2px solid #34f458");
            }
            else{
                $("#woe_error_message").html("Enter Only Integer Value");
                $("#woe_error_message").show();
                $(".error_form_woe").css("visibility","visible");
                $("#form_woe").css("border-bottom","2px solid #f90a0a");
                error_woe = true;
            }
        }
       
    })
</script> 

<!-- JQUERYS Ended-->	
</body>
</html>

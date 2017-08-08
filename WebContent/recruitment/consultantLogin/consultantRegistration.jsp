<%--
	    Document   : Consultant Registration
	    Created on : Apr 12, 2017, 7:05:25 PM
	    Author     : miracle
	--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ page import="java.util.List" isErrorPage="true"%>
<%@ page import="com.mss.msp.util.ApplicationConstants"%>
<!DOCTYPE html>
<html>
<head>
<!-- new styles -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ServicesBay :: Consultant Registration Page</title>

<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/bootstrap.min.css"/>">
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/font-awesome.min.css"/>">
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/animate.css"/>">
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/main.css"/>">
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/responsive.css"/>">
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/general/GridStyle.css"/>">
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/general/profilediv.css"/>">
<link rel="stylesheet" type="text/css"
	href="<s:url value='/includes/css/accountDetails/details.css'/>">


<script type="text/JavaScript"
	src="<s:url value="/includes/js/general/jquery.min.js"/>"></script>

<script type="text/JavaScript"
	src="<s:url value="/includes/js/bootstrap.min.js"/>"></script>

<script type="text/javascript"
	src="<s:url value="/includes/js/general/popupoverlay.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/Ajax/GeneralAjax.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/Ajax/AppConstants.js"/>"></script>

<script language="JavaScript" type="text/javascript"
	src="<s:url value="/includes/js/general/ProfilePage.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/general/jquery.maskedinput.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/register/modernizr.custom.04022.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/account/formVerification.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/main.js"/>"></script>
	<script
	src="https://www.google.com/recaptcha/api.js?onload=conCaptchaCallBack&render=explicit"
	async defer></script>
	<script type="text/javascript"
		src="<s:url value="/includes/js/Ajax/ConsultantAjax.js"/>"></script>



<style type="text/css">
.checkbox-inline {
	margin: 5px 4px 1px 19px !important
}

/* added for registration */
.msg-info {
	border-color: #b8dbf2 !important;
}

.msg {
	background: #fefefe;
	color: #666666;
	font-weight: bold;
	font-size: small;
	padding: 12px;
	padding-left: 16px;
	border-top: solid 3px #CCCCCC;
	border-radius: 5px;
	margin-bottom: 10px;
	-webkit-box-shadow: 0 10px 10px -5px rgba(0, 0, 0, .08);
	-moz-box-shadow: 0 10px 10px -5px rgba(0, 0, 0, .08);
	box-shadow: 0 10px 10px -5px rgba(0, 0, 0, .08);
	overflow: hidden;
}

.msg i {
	color: skyblue;
	font-size: 21px;
}

.af-wrapper {
	box-shadow: 0 0 8px rgba(0, 0, 0, 0.3);
	margin: 3% auto;
	max-width: 100%;
	min-width: 280px;
	position: relative;
	width: 80%;
}

#userLoginForm div {
	margin: 7px 0;
}
</style>

</head>
<body oncontextmenu="return false">
	<div id="wrap">
		<header id="header">
			<!--header-->
			<div class="header_top">
				<!--header_top-->
				<div class="container">
					<s:include value="/includes/template/header.jsp" />
				</div>
			</div>

		</header>

		<div id="main">
			<div class=" ">
				<div class="row">
					<!-- Main Content-->

					<div class="col-sm-12" style="">
						<!-- Add Form Area -->
						<div class="col-lg-10 col-lg-offset-1">
							<div class="af-wrapper" id="profileBox"
								style="float: left; width: 94%; margin: 1% 3%;">
								<!-- Add Form Header-->
								<div class=" ">

									<div class="msg msg-info">
										<span> <i class="fa fa-pencil-square-o pull-left"
											aria-hidden="true"></i>
										</span>
										<h4 class="pull-left" style="margin: 0">
											<b>Consultant Registration</b>
										</h4>
									</div>
								</div>
								<!-- Add Form-->
								<div class="col-sm-12" style="margin-bottom: 20px">
									<br>

									<s:form action="doConsultantRegistration" method="post"
										theme="simple" onSubmit="return consultantValidation()"
										id="userLoginForm" name="userLoginForm"
										enctype="multipart/form-data">


										<div class="col-sm-12" style="padding: 0; margin: 0">
											<div class="col-sm-4 required" style="margin: 0">
												<label class="labelStyle2">First Name</label>
												<s:textfield name="consultantFirstName" type="text"
													cssClass="form-control" id="consultantFirstName"
													maxLength="60" placeholder="First Name"
													onblur="clearErrorMsg(this);" />
												<span id="consultantFirstNamespan"></span>
											</div>
											<div class="col-sm-4 required" style="margin: 0">
												<label class="labelStyle2">Last Name</label>
												<s:textfield name="consultantLastName" type="text"
													cssClass="form-control" id="consultantLastName"
													maxLength="60" placeholder="Last Name"
													onblur="clearErrorMsg(this);" />
												<span id="consultantLastNamespan"></span> <br />
											</div>

											<div class="col-sm-4 required" style="margin: 0">
												<button style="display: none;"
													class="consultantExistedslide_open " id="emailBtn">Slide</button>

												<label class="labelStyle2">Email Id</label>
												<s:textfield name="consultantEmail" type="email"
													cssClass="form-control" id="consultantEmail" maxLength="60"
													placeholder="Email Id"
													onblur="clearErrorMsg(this);consultantEmailIdCheck();" />
												<span id="consultantEmailspan"></span>
											</div>
										</div>
										<div class="col-sm-4 required">
											<label class="labelStyle2">Mobile No </label>
											<s:textfield name="consultantMobile" type="text"
												cssClass="form-control" id="consultantMobile"
												placeholder="Mobile Number" onblur="clearErrorMsg(this);" />
											<span id="consultantMobilespan"></span>
										</div>
										<script type="text/javascript">
											$("#consultantMobile").mask(
													"(999)-999-9999");
										</script>
										<div class="col-sm-4">
											<label class="labelStyle2"> Experience </label>
											<s:select cssClass="form-control" type="text"
												name="consultantExperience" id="consultantExperience"
												headerKey="" headerValue="Select Experience"
												list="%{consultantExperienceList}" onchange="expValidate()"
												onblur="clearErrorMsg(this);" />
											<span id="consultantExperiencespan"></span>
										</div>
										<div class="col-sm-4" style="display: none;">
											<label class="labelStyle2"> Working Country </label>
											<s:select name="consultantWorkingCountry" type="text"
												id="consultantWorkingCountry" placeholder="Country"
												headerKey="-1" headerValue="Select Country" theme="simple"
												cssClass="SelectBoxStyles" value="3" list="%{countryList}"
												onchange="regStateChange(this.id)"
												onblur="clearErrorMsg(this);" />
											<span id="consultantWorkingCountryspan"></span>
										</div>


										<div class="col-sm-4">
											<label class="labelStyle2"> <%--<span class="accDetailsError">*</span>--%>
												Qualification
											</label>
											<s:textarea cssClass="form-control" id="consultantEducation"
												type="text" name="consultantEducation" rows="2"
												placeholder="Qualification" maxlength="200" tabindex=""
												cssStyle="height:29px;" />
										</div>
										<div class="row"></div>
										<div class="col-sm-4 required">
											<label class="labelStyle2"> Upload Resume </label>
											<s:file name="consultantResume" id="file" cssClass=""
												tabindex=""
												onblur="clearErrorMsg(this); return resumeValidation();" />
											<span id="addCnsltError" style="color: #4E4E4E">Upload
												PDF or Doc or Docx file.</span>
										</div>

										<div class="col-sm-4">
											<div id="conRegRecaptcha"></div>
											<span id="conRegRecaptchaSpan"></span>
										</div>



										
										<br />






										<div class="col-sm-12 ">



											<div class="col-sm-1 pull-right">
												<s:submit value="Register" id="submit"
													cssClass="add_searchButton form-control fa fa-floppy-o"
													style="width:75px;height:30px" type="button" />
											</div>

											<div class="col-sm-1 pull-right">
												<s:reset value="Reset" id="reset"
													cssClass="add_searchButton form-control fa fa-eraser"
													style="width:75px;height:30px" type="button"
													onclick="clearRegistraionForm()" />
											</div>

										</div>
										<s:token />
									</s:form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Slide in -->

	<div id="consultantExistedslide" class="login-form">

		<div class="modal-content">


			<div class="modal-header "
				style="background-color: rgb(68, 145, 223); background-color: rgb(68, 145, 223); border-top-right-radius: 0px; border-top-left-radius: 0px;">
				<button type="button" class="consultantExistedslide_close close"
					data-dismiss="modal" aria-label="Close">

					<i class="fa fa-times"></i>
				</button>
				<h4 class="modal-title" id="myModalLabel" style="color: white">
					<span id="existedEmail"></span> is already registered with us
				</h4>
			</div>



			<%--	<div class="modal-header"
				style="background-color: rgb(68, 145, 223); background-color: rgb(68, 145, 223); border-top-right-radius: 0px; border-top-left-radius: 0px;">
				<button class="consultantExistedslide_close">
					<i class="fa fa-times"></i>
				</button>
				<h4 class="modal-title" style="color: white">Login to your
					account</h4>
			</div>  --%>


			<div class="modal-body">
				<%
					if (request.getAttribute("errorMessage") != null) {
				%>
				<script type="text/javascript">
					$('#myLogin').modal('show');
				</script>
				<%
					out.println(request.getAttribute("errorMessage"));
				%>
				<%
					}
				%>
				<s:form action="/general/consultantLoginCheck.action" method="post"
					name="userLoginForm" id="userLoginForm"
					onsubmit="return conLoginRecaptchaValidation()">

					<s:hidden id="existedEmailId" name="emailId" />
					<div class="logCredential">
						<i class="fa fa-key"></i> <input type="password"
							placeholder="Enter your password to Login" class="frgt_pwd"
							name='password' pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}"
							id="password"
							title="Must be at least 6 characters long, and contain at least one number, one uppercase and one lowercase letter"
							required data-type="Password" tabindex="2" />
					</div>

					<div id="conLoginRecaptcha"></div>

					<span id="conLoginRecaptchaSpan"></span>

					<p id="wrapper" class="frgt_pwd">
						<a
							class="consultantExistedslide_close consultantForgotPwdslide_open"
							href=""> <font>Forgot password?</font></a>
					</p>
					<div class="LoginButton">
						<button type="submit">LogIn</button>
					</div>
				</s:form>



			</div>



		</div>

	</div>





	<!-- end silde in -->

	<!--start Slide in 2 -->

	<div id="consultantForgotPwdslide" class="">

		<div class="modal-content">


			<div class="modal-header "
				style="background-color: rgb(68, 145, 223); background-color: rgb(68, 145, 223); border-top-right-radius: 0px; border-top-left-radius: 0px;">
				<button type="button" class="consultantForgotPwdslide_close close"
					data-dismiss="modal" aria-label="Close">

					<i class="fa fa-times"></i>
				</button>

				<h4 class="modal-title" id="myModalLabel" style="color: white">Forgot
					your password</h4>
			</div>



			<%--	<div class="modal-header"
				style="background-color: rgb(68, 145, 223); background-color: rgb(68, 145, 223); border-top-right-radius: 0px; border-top-left-radius: 0px;">
				<button class="consultantExistedslide_close">
					<i class="fa fa-times"></i>
				</button>
				<h4 class="modal-title" style="color: white">Login to your
					account</h4>
			</div>  --%>


			<div class="modal-body">

				<span id="Loading" style="color: red; width: auto;display:none">Loading....</span> <span
					id="resultMessage" style="width: auto"></span>
				<s:form id="forgotPassword" name="forgotPassword" theme="simple">
					<div class="logCredential">
						<i class="fa fa-envelope"></i> <input type="email"
							class="frgt_pwd" pattern="[^@]+@[^@]+\.[a-zA-Z]{2,6}"
							placeholder="Please enter your Email Address" id="forgotEmailId"
							name="forgotEnailId" required="required" />
					</div>
					<div id="conFPassReCaptcha"></div>
					<div>
						<span id="conFPassRecaptchaSpan"></span>
					</div>
	                                                    &nbsp;
	                         <input style="margin: 0px 0px 0px 84px"
						type="button" class="add_searchButton" value="Reset Password"
						name="FPass" id="" onclick="return conFpassInReg('forgotEmailId','resultMessage','Loading'); " />

				</s:form>



			</div>

			<font color="white">...................................................................................</font>

		</div>

	</div>

	<!--  <div id="consultantForgotPwdslide" class="well">
			<div class="modal-header"
				style="background-color: rgb(68, 145, 223); background-color: rgb(68, 145, 223); border-top-right-radius: 0px; border-top-left-radius: 0px;">
				<button class="consultantForgotPwdslide_close">
					<i class="fa fa-times"></i>
				</button>
				<h4 class="modal-title" style="color: white">Login to your
					account</h4>
			</div>
	
	-->

	</div>
	<!-- Slide 2 end.. -->

	<script>
		$(document).ready(function() {

			$('#consultantExistedslide').popup({
				focusdelay : 400,
				outline : true,
				vertical : 'middle'
			});

			$('#consultantForgotPwdslide').popup({
				focusdelay : 400,
				outline : true,
				vertical : 'middle'
			});

			$(".consultantForgotPwdslide_close").click(function() {
				// alert('clicked!');
				document.getElementById('resultMessage').innerHTML = "";
				document.getElementById('forgotEmailId').value = "";
			});

		});
	</script>

	<style>
#consultantExistedslide_background, #consultantForgotPwdslide_background
	{
	-webkit-transition: all 0.3s 0.3s;
	-moz-transition: all 0.3s 0.3s;
	transition: all 0.3s 0.3s;
}

#consultantExistedslide, #consultantForgotPwdslide,
	#consultantExistedslide_wrapper, #consultantForgotPwdslide_wrapper {
	-webkit-transition: all 0.4s;
	-moz-transition: all 0.4s;
	transition: all 0.4s;
}

#consultantExistedslide, #consultantForgotPwdslide {
	-webkit-transform: translateX(0) translateY(-40%);
	-moz-transform: translateX(0) translateY(-40%);
	-ms-transform: translateX(0) translateY(-40%);
	transform: translateX(0) translateY(-40%);
}

.popup_visible #consultantExistedslide {
	-webkit-transform: translateX(0) translateY(0);
	-moz-transform: translateX(0) translateY(0);
	-ms-transform: translateX(0) translateY(0);
	transform: translateX(0) translateY(0);
}

.popup_visible #consultantForgotPwdslide {
	-webkit-transform: translateX(0) translateY(0);
	-moz-transform: translateX(0) translateY(0);
	-ms-transform: translateX(0) translateY(0);
	transform: translateX(0) translateY(0);
}
</style>

	<!-- End Silde2 -->

	<footer id="footer">
		<!--Footer-->
		<div class="footer-bottom" id="footer_bottom">
			<div class="container">
				<s:include value="/includes/template/footer.jsp" />
			</div>
		</div>
	</footer>
	<script type="text/JavaScript"
		src="<s:url value="/includes/js/jquery.scrollUp.min.js"/>"></script>
	<script type="text/JavaScript"
		src="<s:url value="/includes/js/general/placeholders.min.js"/>"></script>
	

</body>
</html>

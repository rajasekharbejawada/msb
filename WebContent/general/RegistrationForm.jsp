
<%--
    Document   : AccountAdd
    Created on : Apr 12, 2015, 7:05:25 PM
    Author     : Anton Franklin
--%>


<%@page import="java.util.Iterator"%>
<%@ page contentType="text/html; charset=UTF-8"
	errorPage="../exception/ErrorDisplay.jsp"%>
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
<title>ServicesBay :: Registration Page</title>

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
	<script src='https://www.google.com/recaptcha/api.js'></script>
<style>
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
</style>


</head>
<body oncontextmenu="return false"
	onload="regStateChange(document.getElementById('country').id);">
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
								style="float: left; margin-top: 15px; margin-bottom: 20px">
								<!-- Add Form Header-->
								<div class="msg msg-info">
									<div class=" ">
										<%
											String flag = request.getParameter("regFlag");
										%>
										<span> <i class="fa fa-pencil-square-o pull-left"
											aria-hidden="true"></i>
										</span>
										<%
											if ("vc".equalsIgnoreCase(flag)) {
										%>
										<h4 class="panel-title">

											<b>Vendor Registration</b>
										</h4>
										<%
											} else {
										%>
										<h4 class="panel-title">
											<b>Customer Registration</b>
										</h4>
										<%
											}
										%>



									</div>
								</div>
								<!-- Add Form-->
								<div class="col-sm-12" style="margin-bottom: 20px">
									<br>

									<s:form action="userRegistration.action" method="post"
										theme="simple" onSubmit="return custVenRegValidation()"
										id="userRegForm" name="userRegForm"
										enctype="multipart/form-data">

										<h4>
											<b> <%
 	if ("vc".equalsIgnoreCase(flag)) {
 %> Vendor Information <%
 	} else {
 %> Customer Information <%
 	}
 %>
											</b>
										</h4>
										<div class="row">
											<div class="col-sm-4" style="display: none">
												<input name="regFlag" id="regFlag"
													value="<%=request.getParameter("regFlag")%>"><br>

											</div>
											<div class=" ">
												<div class="col-sm-4 required">
													<label class="labelStyle2"> <%
 	if ("vc".equalsIgnoreCase(flag)) {
 %> Vendor Name <%
 	} else {
 %> Customer Name <%
 	}
 %>
													</label>
													<s:textfield cssClass="form-control" id="orgName"
														type="text" name="orgName" placeholder="Name"
														onblur="clearErrorMsg(this);javascript: orgNameCheck('#orgName','#orgNameCheckSpan')"
														tabindex="1" />
													<span id="orgNameCheckSpan" class="accDetailsError"></span>

												</div>

												<div class="col-sm-4 required">
													<label class="labelStyle2">Website URL </label>
													<s:textfield cssClass="form-control" id="org_web_address"
														type="text" maxLength="60" name="org_web_address"
														placeholder="Website URL"
														onblur="clearErrorMsg(this);javascript: orgWebAddressCheck('#org_web_address','#orgWebCheckSpan')"
														tabindex="2" />
													<span id="orgWebCheckSpan" class="accDetailsError"></span>
												</div>



												<div class="col-sm-4 pull-left">
													<label class="labelStyle2"> No. of Employees </label>
													<s:textfield name="noOfEmployees" type="text" maxLength="7"
														id="noOfEmployees" placeholder="Number of Employees"
														cssClass="form-control" tabindex="3" />

												</div>

											</div>
											<div>
												<div class="row"></div>
												<div class="col-sm-4 required">
													<label class="labelStyle2">Mail Extension </label>
													<s:textfield cssClass="form-control" id="email_ext"
														maxLength="60" name="email_ext" list="accountTypeList"
														placeholder="example.com" value="%{account.email_ext}"
														cssStyle="width:100%;" onchange="getValidMailExtention()"
														tabindex="4" onblur="clearErrorMsg(this);" />
													<span id="orgExtCheckSpan" class="accDetailsError"></span>

												</div>
											</div>
										</div>

										<div class="">
											<h4>
												
											 <%	if ("vc".equalsIgnoreCase(flag)) {
 %><b>Vendor Admin Details</b> <%
 	} else {
 %><b>Customer Admin Details</b> <%
 	}
 %>
											</h4>
											

											<div class="row required">
												<div class="col-sm-4">
													<span><label class="labelStyle2"> First Name</label>
														<s:textfield name="first_name" type="text" id="first_name"
															maxLength="30" placeholder="First Name"
															x-moz-errormessage="Please enter the First Name"
															cssClass="form-control" tabindex="5"
															onblur="clearErrorMsg(this);" /> <span
														id="first_nameSpan" class="accDetailsError"></span> </span>
												</div>
												<div class="col-sm-4 required">
													<label class="labelStyle2">Last Name </label>
													<s:textfield name="last_name" type="text" id="last_name"
														maxLength="30" placeholder="Last Name"
														cssClass="form-control" tabindex="6"
														onblur="clearErrorMsg(this);" />
													<span id="last_nameSpan" class="accDetailsError"></span>
												</div>
												<div class="col-sm-4 required">
													<label class="labelStyle2">Office Phone </label>
													<s:textfield name="office_Phone" type="text"
														id="office_Phone" placeholder="Phone"
														cssClass="form-control" tabindex="7"
														onblur="clearErrorMsg(this);" />

													<span id="office_PhoneSpan" class="accDetailsError"></span>

												</div>
												<div class="row"></div>
												<div class="col-sm-4 required">
													<label class="labelStyle2"> Office Email </label>
													<s:textfield name="office_emailId" type="email"
														maxLength="60" id="office_emailId"
														placeholder="Office Email Address"
														onblur="clearErrorMsg(this);return regOfficeEmailValidation()"
														cssClass="form-control" tabindex="8" />
													<span id="office_emailIdSpan" class="accDetailsError"></span>
												</div>












												<div class="col-sm-4 required">
													<label class="labelStyle2">Address</label>
													<s:textfield name="address1" type="text" maxLength="100"
														id="address1" placeholder="Address"
														cssClass="form-control" tabindex="9"
														onblur="clearErrorMsg(this);" />
													<span id="address1Span" class="accDetailsError"></span>
												</div>
												<!--Linked to State and Country-->
												<div class="col-sm-4 required">
													<label class="labelStyle2">City </label>
													<s:textfield name="city" type="text" maxLength="20"
														id="city" placeholder="City" cssClass="form-control"
														tabindex="10" onblur="clearErrorMsg(this);" />
													<span id="citySpan" class="accDetailsError"></span>

												</div>
												<div class="row"></div>
												<div class="col-sm-4 required">
													<label class="labelStyle2">Country </label>
													<s:select name="country" type="text" id="country"
														required="required" placeholder="Country" headerKey="-1"
														headerValue="Select Country" theme="simple"
														cssClass="SelectBoxStyles" value="3" list="%{countryList}"
														onchange="regStateChange(this.id)" tabindex="11"
														onblur="clearErrorMsg(this);" />
													<span id="countrySpan" class="accDetailsError"></span>
												</div>

												<div class="col-sm-4 required">
													<label class="labelStyle2">State</label>
													<s:select name="state1" type="text" id="state1"
														required="required" placeholder="State" headerKey="-1"
														headerValue="Select State" theme="simple" list="{}"
														cssClass="SelectBoxStyles" tabindex="12"
														onblur="clearErrorMsg(this);" />
													<span id="state1Span" class="accDetailsError"></span>

												</div>
												<div class="col-sm-4 required" style="margin: 24px -27px 9px 18px ">
													<div class="g-recaptcha"
														data-sitekey="6LfmzR8UAAAAAJhXhE8Qii1X1kwYz4Oq2nRjj0bI"></div>
													<span id="captchaSpan"></span>
												</div>
																							</div>
										</div>
										<div class="col-sm-12 ">
											<!--<div class="col-lg-6"></div>-->

											<div class="col-sm-1 pull-right">
												<s:submit value="Register" id="submit"
													cssClass="add_searchButton fa fa-floppy-o"
													style="width:75px;height:30px" type="button" />
											</div>

											<div class="col-sm-1 pull-right">
												<s:reset value="Reset" id="reset"
													cssClass="add_searchButton fa fa-eraser"
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

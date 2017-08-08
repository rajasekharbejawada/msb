<%-- 
    Document   : AccountAdd
    Created on : Apr 12, 2015, 7:05:25 PM
    Author     : NagireddySeerapu
--%>



<%@page import="java.util.Iterator"%>
<%@ page contentType="text/html; charset=UTF-8"
	errorPage="../../exception/403.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ page import="java.util.List" isErrorPage="true"%>
<%@ page import="com.mss.msp.util.ApplicationConstants"%>
<%@page import="com.mss.msp.recruitment.ConsultantVTO"%>
<!DOCTYPE html>
<html>
<head>
<!-- new styles -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ServicesBay :: Consultant Details Page</title>
<link rel="stylesheet"
	href='<s:url value="/includes/css/general/dhtmlxcalendar.css"/>'
	type="text/css">
<link rel="stylesheet"
	href='<s:url value="/includes/css/general/dhtmlxcalendar_omega.css"/>'
	type="text/css">

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
	href="<s:url value="/includes/css/general/selectivity-full.css"/>">
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/media_queries.css"/>">
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/general/sweetalert.css"/>">

<script type="text/JavaScript"
	src="<s:url value="/includes/js/general/jquery.min.js"/>"></script>

<script type="text/JavaScript"
	src="<s:url value="/includes/js/bootstrap.min.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/main.js"/>"></script>
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/general/taskiframe.css"/>">
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/general/profilediv.css"/>">


<script type="text/JavaScript"
	src="<s:url value="/includes/js/general/dhtmlxcalendar.js"/>"></script>

<script type="text/JavaScript"
	src="<s:url value="/includes/js/general/GridNavigation.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/general/jquery.toggle.js"/>"></script>

<script type="text/JavaScript"
	src="<s:url value="/includes/js/Ajax/AppConstants.js"/>"></script>


<script type="text/javascript"
	src="<s:url value="/includes/js/general/consultantOverlay.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/fileUploadScript.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/jquery.form.js"/>"></script>

<script type="text/JavaScript"
	src="<s:url value="/includes/js/jquery.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/general/sweetalert.min.js"/>"></script>
<style>
</style>
<script>
	//function downloadConsultantResume() {
		//var acc_attachment_id = document.getElementById('consultantResumeId').value;
		//window.location = 'downloadConsultantResume.action?acc_attachment_id='
			//	+ acc_attachment_id;
	//}

	function openDialogforConsultantAttachment() {

		var specialBox = document.getElementById('resumeAttachOverlay');
		if (specialBox.style.display == "block") {
			specialBox.style.display = "none";
		} else {
			specialBox.style.display = "block";
		}
		// Initialize the plugin    
		$('#consultResumeAttachment_popup').popup();

	}

	function consultantAttachOverlayClose() {

		var specialBox = document.getElementById("resumeAttachOverlay");
		if (specialBox.style.display == "block") {
			specialBox.style.display = "none";
		} else {
			specialBox.style.display = "block";
		}
		// Initialize the plugin    
		$('#consultResumeAttachment_popup').popup();
	}
	var myCalendar;

	function doOnLoad() {
		flag = $("#accountFlaghidden").val();

		if (flag == '1' || flag == '3' || flag == '13' || flag == '7') {
			$('.consultant_details input').prop("disabled", true);
			$('.consultant_details select').prop("disabled", true);
			$('.csr_social input').prop("disabled", true);
			$('.csr_social textarea').prop("disabled", true);
			$('#consult_education').prop("disabled", true);
			$('#AddressBox input').prop("disabled", true);
			$('#AddressBox select').prop("disabled", true);
			$('.details input').prop("disabled", true);
			$('.details select').prop("disabled", true);

			$('#skillCategoryValue').selectivity({
				readOnly : true
			});

			$('#preSkillCategoryValue').selectivity({
				readOnly : true
			});

		}

		myCalendar = new dhtmlXCalendarObject(
				[ "consult_favail", "consult_dob" ]);
		myCalendar.setSkin('omega');
		myCalendar.setDateFormat("%m-%d-%Y ");
		myCalendar.hideTime();
	}
</script>



</head>
<body oncontextmenu="return false" style="overflow-x: hidden"
	onload="loadConsultRelocation();doOtherSkill(); doOtherSecondrySkill(); 
        loadConsultantAvaliable(); doOnLoad();
        
        defaultClick();  ">
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
			<section id="generalForm">
				<!--form-->
				<div class="container">
					<div class="row">
						<s:include value="/includes/menu/LeftMenu.jsp" />
						<!-- content start -->
						<div class="col-sm-12 col-md-9 col-lg-9 right_content"
							style="background-color: #fff">



							<!-- Nav tabs -->

							<ul class="nav nav-tabs">
								<li class="active" id="consultantLi"><a
									aria-expanded="false" onclick="cheadingMessage(this);"
									id="c_details" href="#Consultant" data-toggle="tab">
										Consultant Details </a></li>
								<li id="attachLi" class=""><a aria-expanded="false"
									onclick="showAttachmentDetails(document.getElementById('consult_id').value);
                                        cheadingMessage(this);"
									id="c_attach" href="#consult_attach" data-toggle="tab">
										Attachments </a></li>
								<li id="backgroundVerificationTab" class=""><a
									aria-expanded="false" id="c_background_attach"
									href="#consult_background_verification" data-toggle="tab"
									onclick="showBackGroundAttachmentDetails(document.getElementById('consult_id').value);">
										Background Verification </a></li>

								<s:if test="%{#session.primaryrole==13||#session.primaryrole==3||#session.primaryrole==1||#session['usrgrpid']==1}">
								 <%--  <s:property value="%{pageFlag}"/>  --%> 
								<s:if test="%{pageFlag=='submitList'}">
								<s:url var="myUrl"
									action="../../Requirements/getSubmissionList.action?pageFlag=submitList">
								</s:url>
								</s:if>
								<s:elseif test='%{pageFlag=="techReviewList"}'>
								<s:url var="myUrl"
									action="../../recruitment/consultant/getTechReviewDetails.action?pageFlag=techReviewList">
								</s:url>
								</s:elseif>
								</s:if>
								<s:if test="%{#session.primaryrole==15||#session.primaryrole==16}">
								
								</s:if>
								<s:else>
								<s:if test="pageFlag=='profileForVendorCustomer'">
													<s:url var="myUrl"
														action="../../Requirements/requirementedit.action">
														<s:param name="jdId"><s:property value="%{jdId}"/></s:param>
														<s:param name="customerFlag">customer</s:param>
														 <s:param name="accountSearchID"><s:property value="%{accountSearchID}"/></s:param>
														<s:param name="requirementId" value="%{requirementId}" ></s:param>
														<s:param name="accountFlag">MyRequirements</s:param> 
														<s:param name="reqFlag">consultantTab</s:param>
														
													</s:url>
								</s:if>
								<s:if test="pageFlag=='profileForVendorCustomer'&& vendor=='yes'">
													<s:url var="myUrl"
														action="../../Requirements/requirementedit.action">
														<s:param name="jdId"><s:property value="%{jdId}"/></s:param>
														 <s:param name="accountSearchID"><s:property value="%{accountSearchID}"/></s:param>
														<s:param name="requirementId" value="%{requirementId}" ></s:param>
														<s:param name="accountFlag">MyRequirements</s:param> 
														<s:param name="vendor">yes</s:param>
														 <s:param name="reqFlag">consultantTab</s:param> 
													</s:url>
								</s:if>
								<span class="pull-right"><s:a href='%{#myUrl}'>
										<img src="<s:url value="/includes/images/backButton.png"/>"
											height="25" width="25">
									</s:a></span>
                                </s:else>


							</ul>
							
							<br>
							<%-- <ul class="active_details">
								<li class="dropdown" style="margin: 12px"><a
									class=" active_details "
									onclick="lockScreen();
                                                                                frameportion()"
									data-toggle="dropdown" href="#" title="Click Me For Menu"
									style="background-color: #fff; width: 40px; cursor: pointer;"><img
										src="<s:url value="/includes/images/toggleMenu.png"/>"
										height="40" width="38"></a> <headingmess id="headingmessage"
										class="accDetails">Profile</headingmess>

									<ul class="active_details dropdown-menu  "
										style="position: absolute; z-index: 10000; min-width: 180px;">


										<li class="  " id="consultantLi"><a aria-expanded="false"
											href="#Consultant" data-toggle="tab" id="c_details"
											onclick="cheadingMessage(this);
                                                                                    unlockScreen();"
											style="background-color: #fff; width: 40px; cursor: pointer;"><img
												src="<s:url value="/includes/images/icons/editProfile.png"/>"
												height="15" width="15"><font style="color: blue">&nbsp;Profile
											</font></a></li>

										<li class="  " id="attachLi"><a aria-expanded="false"
											href="#consult_attach" data-toggle="tab" id="c_attach"
											onclick="cheadingMessage(this);showAttachmentDetails(document.getElementById('consult_id').value);"
											unlockScreen();"
											style="background-color: #fff; width: 40px; cursor: pointer;"><font
												style="color: blue"><i class="fa fa-paperclip"
													style="color: #2081c1;"> </i>&nbsp;Attachments </font></a></li>

									</ul></li>
							</ul>
 --%>
							<%-- tab content starts --%>
							<div class="tab-content" style="overflow: hidden">

								<%-- consultant details --%>
								<div class="tab-pane fade in active" id="Consultant">

									<s:if test="hasActionMessages()">
										<div>
											<s:actionmessage cssClass="actionMessagecolor" />
										</div>
									</s:if>

									<div class="panel-body">
										<!-- content start -->

										<!-- Content start -->
										<s:if test="%{updateMessage =='success'}">
											<span id="fadeout_message"><successMessage>
												<font style="color: green"> Your Details Updated
													Successfully!</font></successMessage></span>
										</s:if>
										<s:if test="%{updateMessage=='failure'}">
											<font style="color: green"> Sorry, Details not
												updated! Please try again. </font>
										</s:if>
										<span><consult_error id="consultDetailsErrMsg"></consult_error></span>
										<form action="updateConsultantProfile" id="consultantForm"
											theme="simple">
											<div class="col-sm-4 pull-right">
												<span id="resultMessage"></span>
											</div>
											<s:hidden id="consultFlag" name="consultFlag"
												value="%{consultFlag}" />
											<s:hidden value="%{ConsultantVTO.consult_id}"
												name="consult_id" />
											<s:hidden name="consultidhidden" id="consultidhidden"
												value="%{consult_id}" />
											<s:hidden name="requirementIdhiddeen"
												id="requirementIdhiddeen" value="%{requirementId}" />
											<s:hidden name="accountFlaghidden" id="accountFlaghidden"
												value="%{accountFlag}" />
											<s:hidden name="consultStatushidden" id="consultStatushidden"
												value="%{consultStatus}" />

											<s:hidden name="consultantIdProofAttach"
												value="%{consultantVTO.consultantIdProofAttach}"
												id="consultantIdProofAttach" />
											<s:hidden id="consultantIdProofhidden"
												name="consultantIdProofhidden"
												value="%{consultantVTO.consultantIdProof}" />

											<div class="row">
                                               <s:if test="#session.primaryrole == 15 || #session.primaryrole == 16 ">
                                               <div class="col-sm-10 consultant_details">
                                               </s:if>
                                               <s:else>
                                               <div class="col-sm-12 consultant_details">
                                               </s:else>
												
													<div class="backgroundcolor">
														<%-- <div class="panel-heading">
										<h4 class="panel-title">
											<font color="#ffffff">Consultant Details</font>
											<s:if test="%{accountFlag=='CSR'}">
											<s:url var="myUrl"
												action="../../Requirements/getSubmissionList.action">
											</s:url>
											</s:if>
											
											<span class="pull-right"><s:a href='%{#myUrl}'>
													<i class="fa fa-undo"></i>
												</s:a></span> 

										</h4>

									</div> --%>
													</div>


													<div class="col-sm-4 required">
														<label class="labelStylereq">First Name</label>
														<s:textfield cssClass="form-control"
															name="consult_fstname"
															value="%{consultantVTO.consult_fstname}"
															id="consult_fstname" placeholder="First Name"
															tabindex="1"
															onkeyup="requiredTextValidation(this,'consult_error', 'First Name')"
															maxlength="30" />
													</div>
													<div class="col-sm-4">
														<label class="labelStylereq">Middle Name</label>
														<s:textfield cssClass="form-control"
															name="consult_midname"
															value="%{consultantVTO.consult_midname}"
															placeholder="Middle Name" id="consult_midname"
															tabindex="2" maxlength="30" />
													</div>
													<div class="col-sm-4">
														<span class="required"> <label
															class="labelStylereq">Last Name</label> <s:textfield
																cssClass="form-control" name="consult_lstname"
																value="%{consultantVTO.consult_lstname}"
																id="consult_lstname"
																onkeyup="requiredTextValidation(this,'consult_error', 'Last Name')"
																placeholder="Last Name" tabindex="3" maxlength="30" />
														</span>
													</div>

													<div class="col-sm-4 required">
														<s:hidden value="%{consultantVTO.consult_email}"
															name="consult_email" />


														<label class="labelStylereq">Email Id</label>
														<s:textfield cssClass="form-control" disabled="true"
															value="%{consultantVTO.consult_email}"
															pattern="[^@]+@[^@]+\.[a-zA-Z]{2,}" id="consult_email"
															placeholder="Email Id" tabindex="1"
															onkeyup="consultvalid_email(this, 'mandatory')" />
													</div>
													<div class="col-sm-4">
														<label class="labelStylereq">Availability</label>
														<s:select cssClass="form-control SelectBoxStyles "
															value="%{consultantVTO.consult_available}"
															name="consult_available" id="consult_available"
															onkeyup="consultvalid_avail()" headerKey="-1"
															headerValue="Select Availability"
															list="#@java.util.LinkedHashMap@{'Y':'Yes','N':'No'}"
															onchange="availableValidation();" tabindex="5" />
													</div>
													<%--<div class="col-sm-3" id="consult_add_date_div">
												<label class="labelStylereq">Available Date</label>
												<div class="calImage">
													<s:textfield cssClass="form-control" name="consult_favail"
														id="consult_add_date"
														value="%{consultantVTO.consult_favail}" disabled="true"
														placeholder="Date" onfocus="removeResultMessage()"
														onkeypress="return consultantDateRepository(this)"
														onchange="availableValidation()" tabindex="2">
														<i class="fa fa-calendar"></i>
													</s:textfield>
												</div>
											</div>  --%>

													<div class="col-sm-4" id="consult_add_date_div">
														<s:hidden id="consult_favail1" name="consult_favail1"
															value="%{consultantVTO.consult_favail}" />
														<label class="labelStylereq">Available Date</label>
														<div class="calImage">
															<s:textfield cssClass="form-control"
																name="consult_favail"
																value="%{consultantVTO.consult_favail}"
																id="consult_favail" disabled="true" placeholder="Date"
																onkeypress="return consultantDateRepository(this)"
																onchange="availableValidation()" tabindex="6">
																<i class="fa fa-calendar"></i>
															</s:textfield>
														</div>
													</div>

													<div class="col-sm-4 required">
														<label class="labelStylereq">Date of Birth</label>
														<div class="calImage">
															<s:textfield cssClass="form-control" name="consult_dob"
																value="%{consultantVTO.consult_dob}" id="consult_dob"
																onkeypress="return consultantDateRepository(this)"
																tabindex="7">
																<i class="fa fa-calendar"></i>
															</s:textfield>
														</div>
													</div>
													<div class="col-sm-4">
														<label class="labelStylereq">Home Phone</label>
														<s:textfield cssClass="form-control"
															name="consult_homePhone"
															value="%{consultantVTO.consult_homePhone}"
															id="consult_homePhone" placeholder="Home Phone"
															tabindex="8" />
													</div>
													<div class="col-sm-4">
														<span class="required"> <label
															class="labelStylereq">Mobile No</label> <s:textfield
																cssClass="form-control" name="consult_mobileNo"
																value="%{consultantVTO.consult_mobileNo}"
																id="consult_mobileNo" placeholder="Mobile Number"
																tabindex="9" onkeyup="mobValidation()" />
														</span>
													</div>
													<div class="col-sm-4">
														<label class="labelStylereq">Alternate Email Id</label>
														<s:textfield cssClass="form-control"
															name="consult_alterEmail"
															value="%{consultantVTO.consult_alterEmail}"
															id="consult_alterEmail" placeholder="Alternate Email Id"
															onkeyup="consultvalid_email(this,'optional')"
															tabindex="10" maxlength="60" />
														<span><email_error></email_error></span>
													</div>
													<%-- <div class="col-sm-4">
												<label class="labelStylereq">SSN No</label>
												<s:textfield cssClass="form-control" name="consult_ssnNo"
													value="%{consultantVTO.consult_ssnNo}" id="consult_ssnNo"
													placeholder="SSN Number" tabindex="11" maxlength="20" />
											</div>
											 --%>
													<div class="col-sm-4">
														<label class="labelStylereq">SSN No</label>
														<div class="input-group">
															<s:textfield cssClass="form-control" name="consult_ssnNo"
																value="%{consultantVTO.consult_ssnNo}"
																id="consult_ssnNo" placeholder="SSN Number"
																tabindex="11" maxlength="20" />
															<span class="add-on input-group-addon" id=""
																title="Click here to Show/Hide SSN" tabindex="100"
																style="cursor: pointer;"> <i
																id="consultSSNCheckbox" class="fa fa-eye"></i>
															</span>
														</div>
													</div>
													<div class="col-sm-4">
														<label class="labelStylereq">Living Country</label>
														<s:select cssClass="form-control SelectBoxStyles"
															name="consult_lcountry" headerKey=""
															headerValue="Select Country"
															value="%{consultantVTO.consult_lcountry}" list="country"
															placeholder="Living Country" id="consult_lcountry"
															tabindex="12" />
														<%--s:radio label="Marital Status" name="consult_mStatus" value="%{consultantVTO.consult_mStatus}" id="consult_mStatus" required="true" list="#@java.util.LinkedHashMap@{'S':'Single','M':'Married'}"  /--%>
													</div>
												</div>
												<s:if
													test="#session.primaryrole == 15 || #session.primaryrole == 16">

													<div class="col-sm-2">
														<div class="" style="margin: 10% 30px;">
															<s:url id="image" action="rImage"
																namespace="/renderImage">
																<s:param name="path"
																	value="%{consultantVTO.consultantImagePath}"></s:param>
															</s:url>
															<div class="imgcol">
																<a href="#"> <img src="<s:property value="#image"/>"
																	class="consultUploadProfileImage_popup_open"
																	onclick="openDialogforUploadProfileImage()"
																	value="east" title="Change Image on Click" alt="photo"
																	height="110px" width="100px"> <br> <font
																	style="font-size: 10px;"
																	class="consultUploadProfileImage_popup_open btn btn-xs btn-info "
																	onclick="openDialogforUploadProfileImage()"
																	value="east" title="Change Image on Click">Change
																		Photo</font></a>
															</div>
														</div>

													</div>
												</s:if>

											</div>
											<%--  <s:if test="%{accountFlag=='CSR' && consultStatus=='Processing'}">
											<br>
											<h4>
												<b style="color: #3090C7">CSR Details</b>
											</h4>
                                                   
                                                    <div class="col-sm-3">
																	<label class="labelStylereq" style="color: #56a5ec;">
																		CSR Status </label>
																	<s:select name="csrstatus" id="csrstatus" value="%{consultantVTO.csrAppStatus}"
																		tabindex="2" headerKey="-1" headerValue="Please select"
																		list="#@java.util.LinkedHashMap@{'Approve':'Approve','Reject':'Reject'}"
																		cssClass="SelectBoxStyles form-control" />
																</div>
																
																
																
																
																
																
<div class="form-group col-sm-7">
												<label class="labelStyle" id="labelLevelStatusReq">CSR Comments
												</label>
												<s:textarea name="csrComments" id="csrComments"
													cssClass="form-control" value="%{consultantVTO.csrAppComments}"
													placeholder="Enter CSR Comments Here" rows="3" 
													/>
											</div>	
											<div class="col-sm-2 pull-right" style="margin-top:65px">
											<input type="button" value="Update" style="margin:5px 0px;" class="add_searchButton form-control" onclick="updateCSRStatus();"/>
											
											
											</div>
											
											
											
											
											</s:if> --%>

											<br>
											<div class="row"></div>
											<div class="row">
												<h4>
													<b style="color: #3090C7; margin-left:30px">Social Media Profile</b>
												</h4>
											</div>
											<div class="row"></div>
											<div class="csr_social">
												<div class="col-sm-6">
													<label class="labelStylereq">LinkedIn</label>
													<s:textfield cssClass="form-control"
														name="consult_linkedInId" id="consult_linkedInId"
														placeholder="LinkedIn"
														value="%{consultantVTO.consult_linkedInId}" tabindex="13"
														maxlength="120" />
												</div>
												<div class="col-sm-6">
													<label class="labelStylereq">Facebook</label>
													<s:textfield cssClass="form-control"
														name="consult_facebookId" id="consult_facebookId"
														value="%{consultantVTO.consult_facebookId}"
														placeholder="Facebook" tabindex="14" maxlength="120" />
												</div>
												<div class="row"></div>
												<div class="col-sm-6">
													<label class="labelStylereq">Twitter</label>
													<s:textfield cssClass="form-control"
														name="consult_twitterId" id="consult_twitterId"
														value="%{consultantVTO.consult_twitterId}"
														placeholder="Twitter" tabindex="15" maxlength="120" />
												</div>
											</div>
											<%--<div class="col-sm-3">
												<label class="labelStylereq">Identity Proof</label>
												<s:select cssClass="form-control SelectBoxStyles"
													value="%{consultantVTO.consultantIdProof}" headerKey="0"
													headerValue="Select ID Proof" name="consultantIdProof"
													id="consultantIdProof"
													list="#@java.util.LinkedHashMap@{'VS':'Visa','PP':'Passport','DL':'Driving Licence'}"
													tabindex="16" onchange="getVisaDetails();" />
											</div>

											<div class="col-sm-3" id="visaSelectDiv"
												style="display: none">
												<label class="labelStylereq">Visa Type</label>
												<s:select cssClass="form-control SelectBoxStyles"
													value="%{consultantVTO.consultantVisa}" headerKey="0"
													headerValue="Select Visa" name="consultantVisa"
													id="consultantVisa"
													list="#@java.util.LinkedHashMap@{'A-3':'A-3','G-5':'G-5','NATO-7':'NATO-7','B-1':'B-1','H-1B':'H-1B','H-1B1':'H-1B1','H-1B':'H-1B','H-2A':'H-2A','H-2B':'H-2B','J-1':'J-1'}"
													tabindex="17" />
											</div>

											<div class="col-sm-3" id="proofdownloadDiv"
												style="display: none">
												<label class="labelStylereq"></label>
												<s:label>
													<figcaption>
														Download ID Proof
														<button id="idProofDownload" type='button' tabindex="18"
															onclick="doConsultAttachmentDownload(-1)">
															<img src='../../includes/images/download.png' height=25
																width=25>
														</button>
														<img src='../../includes/images/deleteImage.png' height=20
															width=20 onclick="removeConsultantAttachement();">
													</figcaption>
												</s:label>

												<s:if test='downloadFlag=="noVisa"'>
													<span id="resume"><font
														style='color: red; font-size: 15px;'>No Attachment
															exists !!</font></span>
												</s:if>
												<s:if test='downloadFlag=="noVisaFile"'>
													<span id="resume"><font
														style='color: red; font-size: 15px;'>File Not Found
															!!</font></span>
												</s:if>
											</div>
											<div class="col-sm-3" id="proofuploadDiv"
												style="display: none">
												<label class="labelStylereq"></label>
												<s:label>
													<figcaption>
														Upload ID Proof
														<button id="idProofUpload" type='button' tabindex="19"
															class="consultVisaAttachment_popup_open"
															onclick="openDialogforVisaAttachment()">
															<img src='../../includes/images/Browse.png' height=25
																width=25>
														</button>
													</figcaption>
												</s:label>
											</div>
                                                --%>

											<div class="row"></div>
											<!-- Contact Information , start  -->
											<div class="col-sm-6" style="">
												<span id="updateResultp">Permanent Address Updated
													successfully</span>
												<div id="AddressBox">
													<div class="contactInfoDiv">
														<table>
															<tr id="trStyleContact">
																<td>&nbsp;&nbsp;Permanent Address &nbsp;&nbsp;</td>
															</tr>
														</table>
													</div>

													<div class="col-lg-10 col-md-offset-1">
														<div>
															<span class="required"><label
																class="labelStylereq">Address Line 1</label></span>
															<s:textfield cssClass="form-control" id="consult_Address"
																placeholder="Address Line 1" required="true"
																value="%{consultantVTO.consult_Address}"
																name="consult_Address"
																oninvalid="setCustomValidity('Must be valid fn')"
																onchange="try{setCustomValidity('')}catch(e){}"
																onkeyup="requiredTextValidation(this,'paddress_error', 'Address')"
																onclick="removedCheckedAddress();" maxlength="100"
																tabindex="16" />
															<span><paddress_error></paddress_error></span>
														</div>
														<div>
															<label class="labelStylereq">Address Line 2</label>
															<s:textfield cssClass="form-control"
																id="consult_Address2" placeholder="Address Line 2"
																value="%{consultantVTO.consult_Address2}"
																name="consult_Address2"
																onclick="removedCheckedAddress();" maxlength="100"
																tabindex="17" />
														</div>
														<div>
															<span class="required"> <label
																class="labelStylereq">City</label> <s:textfield
																	cssClass="form-control" id="consult_City"
																	placeholder="City"
																	value="%{consultantVTO.consult_City}"
																	name="consult_City"
																	oninvalid="setCustomValidity('Must be valid fn')"
																	pattern="[a-zA-Z]{3,}"
																	onchange="try{setCustomValidity('')}catch(e){}"
																	onkeyup="requiredTextValidation(this,'pcity_error', 'City')"
																	onclick="removedCheckedAddress();" maxlength="20"
																	tabindex="18" /></span> <span><pcity_error></pcity_error></span>
															<%-- <s:select cssClass="form-control SelectBoxStyles" name="consult_CCountry" id="consult_CCountry" label="Country" headerKey="" headerValue="Select Country" list="consult_CCountry" onchange="ConsultantStateChange()" tabindex="1"/>
                                                                <s:select cssClass="form-control SelectBoxStyles" label="State" id="consult_CState" name="consult_CState"    headerKey="" headerValue="Select state" list="{'Relocation','Travel'}" /> --%>
														</div>
														<div>
															<span class="required"> <label
																class="labelStylereq">Country</label> <s:select
																	cssClass="form-control SelectBoxStyles"
																	id="consult_Country"
																	onchange="ConsultantEditStateChange()" list="country"
																	value="%{consultantVTO.consult_Country}"
																	name="consult_Country"
																	onclick="removedCheckedAddress();" tabindex="19" />
															</span>
														</div>
														<div>
															<span class="required"><label
																class="labelStylereq">State</label> <s:select
																	cssClass="form-control SelectBoxStyles"
																	id="consult_State" name="consult_State"
																	value="%{consultantVTO.consult_State}" headerKey=""
																	headerValue="Select state" list="permanentState"
																	onchange="requiredSelectValidation(this,'pstate_error', 'State')"
																	tabindex="20" /></span> <span><pstate_error></pstate_error></span>
															<%-- onchange="alert(this.options[this.selectedIndex].innerHTML)" --%>
														</div>
														<%-- <s:textfield cssClass="form-control " label="State" id="consult_State" list="{'abc','cde'}" value="%{consultantVTO.consult_State}" name="consult_State" required="true" onchange="try{setCustomValidity('')}catch(e){}" onkeyup="pStateValidation()"  />   --%>
														<div>
															<span class="required"><label
																class="labelStylereq">Zip</label></span>
															<s:textfield cssClass="form-control" id="consult_Zip"
																required="true" placeholder="Zip"
																value="%{consultantVTO.consult_Zip}" name="consult_Zip"
																minlength="4" maxlength="10"
																oninvalid="setCustomValidity('Must be valid fn')"
																onchange="try{setCustomValidity('')}catch(e){}"
																onkeyup="requiredTextValidation(this,'pzip_error', 'Zip')"
																onclick="removedCheckedAddress();" tabindex="21" />
															<%--s:textfield cssClass="form-control" label="Phone" id="consult_Phone" value="%{consultantVTO.consult_Phone}" name="consult_Phone" required="true" oninvalid="setCustomValidity('Must be valid fn')"  onchange="try{setCustomValidity('')}catch(e){}" onkeyup="pPhoneValidation()" onclick="removedCheckedAddress();"/--%>
															<span><pzip_error></pzip_error></span>
														</div>
													</div>
												</div>
											</div>
											<div class="col-sm-6">
												<span id="updateResultc">Current Address Updated
													successfully</span>
												<div id="AddressBox">
													<div class="contactInfoDiv" id="trStyleContact">

														Mailing Address &nbsp;
														<s:checkbox label="Same as Permanent Address"
															name="consult_checkAddress" tabindex="22"
															id="consult_checkAddress"
															value="%{consultantVTO.address_flag}"
															onclick="sameAsAddress();"></s:checkbox>
													</div>
													<div class="col-lg-10 col-md-offset-1">
														<div>
															<span class="required"> <label
																class="labelStylereq">Address Line 1</label> <s:textfield
																	cssClass="form-control"
																	value="%{consultantVTO.consult_CAddress}"
																	id="consult_CAddress" placeholder="Address Line 1"
																	name="consult_CAddress"
																	oninvalid="setCustomValidity('Must be valid fn')"
																	onchange="try{setCustomValidity('')}catch(e){}"
																	onkeyup="requiredTextValidation(this,'caddress_error', 'Address')"
																	maxlength="100" tabindex="23" />
															</span> <span><caddress_error></caddress_error></span>
														</div>
														<div>
															<label class="labelStylereq">Address Line 2</label>
															<s:textfield cssClass="form-control"
																value="%{consultantVTO.consult_CAddress2}"
																id="consult_CAddress2" placeholder="Address Line 2"
																name="consult_CAddress2" maxlength="100" tabindex="24" />
														</div>
														<div>
															<span class="required"> <label
																class="labelStylereq">City</label> <s:textfield
																	cssClass="form-control"
																	value="%{consultantVTO.consult_CCity}"
																	id="consult_CCity" placeholder="City"
																	name="consult_CCity"
																	oninvalid="setCustomValidity('Must be valid fn')"
																	pattern="[a-zA-Z]{3,}"
																	onchange="try{setCustomValidity('')}catch(e){}"
																	onkeyup="requiredTextValidation(this,'city_error', 'City')"
																	maxlength="20" tabindex="25" />
															</span> <span><city_error></city_error></span>
															<%-- <s:select cssClass="form-control SelectBoxStyles" name="consult_CCountry" id="consult_CCountry" label="Country" headerKey="" headerValue="Select Country" list="consult_CCountry" onchange="ConsultantStateChange()" tabindex="1"/>
                                                                <s:select cssClass="form-control SelectBoxStyles" label="State" id="consult_CState" name="consult_CState"    headerKey="" headerValue="Select state" list="{'Relocation','Travel'}" /> --%>
														</div>
														<div>
															<span class="required"> <label
																class="labelStylereq">Country</label> <s:select
																	cssClass="form-control SelectBoxStyles"
																	value="%{consultantVTO.consult_CCountry}"
																	list="country" id="consult_CCountry"
																	name="consult_CCountry"
																	onchange="ConsultantCurrentStateChange()"
																	onkeyup="pCCountryValidation()" tabindex="26" /></span>
														</div>
														<div>
															<span class="required"> <label
																class="labelStylereq">State</label> <s:select
																	cssClass="form-control SelectBoxStyles"
																	name="consult_CState" id="consult_CState"
																	value="%{consultantVTO.consult_CState}" headerKey=""
																	headerValue="Select  state" list="currentState"
																	onchange="requiredSelectValidation(this,'cstate_error', 'State')"
																	tabindex="27" /> <%-- onchange="alert(this.options[this.selectedIndex].innerHTML)" --%>
															</span> <span><cstate_error></cstate_error></span>
														</div>
														<%--  <s:textfield cssClass="form-control" label="State" value="%{consultantVTO.consult_CState}"  id="consult_CState" name="consult_CState" required="true" onkeyup="pCStateValidation()" />  --%>
														<div>
															<span class="required"> <label
																class="labelStylereq">Zip</label> <s:textfield
																	cssClass="form-control"
																	value="%{consultantVTO.consult_CZip}" id="consult_CZip"
																	placeholder="Zip" name="consult_CZip" minlength="4"
																	maxlength="10"
																	oninvalid="setCustomValidity('Must be valid fn')"
																	onchange="try{setCustomValidity('')}catch(e){}"
																	onkeyup="requiredTextValidation(this,'czip_error', 'Zip')"
																	tabindex="28" /></span> <span><czip_error></czip_error></span>
														</div>
													</div>
												</div>
											</div>
									</div>
									<%--<div class="col-sm-3" id="proofuploadDiv">

												<label class="labelStylereq"></label>
												<s:label>
													<figcaption>
														Upload Resume
														<button id="" type='button' tabindex="19"
															class="consultResumeAttachment_popup_open"
															onclick="openDialogforResumeAttachment()">
															<img src='../../includes/images/Browse.png' height=25
																width=25>
														</button>
													</figcaption>
												</s:label>
											</div>

											<s:if
												test="(consultantVTO.consult_acc_attachment_id!=null) && consultantVTO.consult_acc_attachment_id!=0">
												<div class="col-sm-3" id="proofuploadDiv">

													<label class="labelStylereq"></label>
													<s:label>
														<figcaption>
															Download Resume
															<button id="idProofUpload" type='button' tabindex="19"
																class="" onclick="downloadConsultantResume()">
																<i class="fa fa-download"></i>
																<s:hidden id="consultantResumeId"
																	value="%{consultantVTO.consult_acc_attachment_id}"></s:hidden>
															</button>
														</figcaption>
													</s:label>
												</div>

											</s:if>
											
											 --%>

									<div class="col-sm-12">
										<div class="form-group col-sm-12">
											<label class="labelStylereq">Education</label>
											<s:textarea cssClass="form-control"
												value="%{consultantVTO.consult_education}"
												id="consult_education"
												placeholder="Enter Education Details Here"
												name="consult_education" maxlength="500" tabindex="29" />
										</div>
									</div>

									<div class="details">
										<div class="col-sm-8">
											<div class="col-sm-12 required">
												<label class="labelStylereq skills">Primary Skills</label>
												<s:select cssClass="commentsStyle" name="primarySkillValue"
													tabindex="30" id="primarySkillValue" list="reqCategory"
													multiple="true"
													value="%{consultantVTO.primarySkillSetList}" />
												<s:hidden id="primaryValues" name="primaryValues" />
											</div>
										</div>
										<s:hidden id="primaryHidden" name="primaryHidden"
											value="%{reqCategory}" />
										<div class="col-sm-4" id="other" style="display: none">
											<span class="required"> <label class="labelStylereq">Other
													Primary Skills </label> <s:textfield cssClass="form-control"
													name="consult_otherSkills"
													value="%{consultantVTO.consult_otherSkills}"
													id="consult_otherSkills" placeholder="Other Primary Skills"
													tabindex="31" onblur="return doSkillValidate()" />

											</span> <span><otherSkills_error></otherSkills_error></span> <span
												id="primaryErrMsg"></span>
										</div>

										<div class="col-sm-8">
											<div class="col-sm-12 required">

												<label class="labelStylereq skills">Secondary&nbsp;Skills</label>

												<s:select cssClass="commentsStyle"
													name="skillCategoryValueList" id="skillCategoryValue"
													list="skillValuesMap" multiple="true"
													onfocus="clearErrosMsgForGrouping()"
													value="%{consultantVTO.skillSetList}" tabindex="32" />
												<s:hidden id="skillValues" name="skillValues" />
											</div>
											<s:hidden id="secondaryHidden" name="secondaryHidden"
												value="%{skillValuesMap}" />

											<div class="col-sm-4" id="secondary" style="display: none">
												<span class="required"> <label class="labelStylereq">Other
														Secondary Skills </label> <s:textfield cssClass="form-control"
														name="consult_otherSecSkills"
														value="%{consultantVTO.consult_otherSecSkills}"
														id="consult_otherSecSkills"
														placeholder="Other Secondary Skills" tabindex="33"
														onblur="return doSecSkillValidate()" />

												</span> <span><otherSecSkills_error></otherSecSkills_error></span>
												<span id="secErrMsg"></span>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="col-sm-4 ">
												<span class="required"> <label class="labelStylereq">Job
														Title</label> <s:textfield cssClass="form-control"
														name="consult_jobTitle"
														value="%{consultantVTO.consult_jobTitle}"
														id="consult_jobTitle" placeholder="Job Title"
														tabindex="34" maxlength="30"
														onkeyup="requiredTextValidation(this,'jobTitle_error', 'Job Title')" />

												</span> <span><jobTitle_error></jobTitle_error></span>
											</div>

											<div class="col-sm-4">
												<span class="required"> <label class="labelStylereq">Experience</label>
													<s:select cssClass="form-control SelectBoxStyles"
														value="%{consultantVTO.consult_experience}"
														name="consult_experience" id="consult_experience"
														headerKey="" headerValue="Select Experience"
														list="experience"
														onchange="requiredSelectValidation(this,'experience_error', 'Experience')"
														tabindex="35" />
												</span> <span><experience_error></experience_error></span>
											</div>

											<%--<div class="col-sm-4">
												<span class="required"> <label class="labelStylereq">Working
														Country</label> <s:select cssClass="form-control SelectBoxStyles"
														value="%{consultantVTO.consult_wcountry}"
														name="consult_wcountry" id="consult_wcountry" headerKey=""
														headerValue="Select Country" list="country" tabindex="36"
														onchange="workingCountryValidate()" />
												</span>
											</div>  --%>
											<div class="col-sm-4">
												<label class="labelStylereq">Expected Salary</label>
												<s:textfield cssClass="form-control"
													value="%{consultantVTO.consult_salary}"
													name="consult_salary" id="consult_salary"
													placeholder="Rate/Salary" tabindex="36" maxlength="10" />
											</div>
										</div>
										<div class="col-sm-12">
											<div class="col-sm-4">
												<label class="labelStylereq">Working Country</label>
												<s:select cssClass="form-control SelectBoxStyles"
													value="%{consultantVTO.consult_wcountry}" list="country"
													id="consult_wcountry" name="consult_wcountry"
													onchange="ConsultantCurrentWorkingStateChange(this,consultwState)"
													tabindex="37" />
											</div>

											<div class="col-sm-4">
												<label class="labelStylereq">Working State</label>
												<s:select cssClass="form-control SelectBoxStyles"
													name="consultwState" id="consultwState"
													value="%{consultantVTO.consultwState}" headerKey=""
													headerValue="Select State" list="consultantWState"
													tabindex="38" />
											</div>
											<%--  <div class="col-sm-4 ">
												<span class="required"> <label class="labelStylereq">Industry</label>
													<s:select cssClass="form-control SelectBoxStyles "
														value="%{consultantVTO.consult_industry}"
														name="consult_industry" id="consult_industry" headerKey=""
														headerValue="Select Industry" list="industry"
														onchange="industryValidate()" tabindex="37" />
												</span>

											</div> --%>

											<div class="col-sm-4">
												<label class="labelStylereq">City</label>
												<s:textfield cssClass="form-control"
													value="%{consultantVTO.consultwCity}" name="consultwCity"
													id="consultwCity" placeholder="City" tabindex="39"
													maxlength="10" />
											</div>
										</div>
										<%-- <div class="col-sm-4">
										<label class="labelStylereq">Expected Salary</label>
										<s:textfield cssClass="form-control"
											value="%{consultantVTO.consult_salary}" name="consult_salary"
											id="consult_salary" placeholder="Rate/Salary" tabindex="39"
											maxlength="10" />
									</div> --%>


										<div class="col-sm-12">
											<div class="col-sm-4 ">
												<label class="labelStylereq">Relocation</label>
												<s:select cssClass="form-control SelectBoxStyles"
													value="%{consultantVTO.consult_relocation}"
													name="consult_relocation" id="consult_relocation"
													headerKey="-1" headerValue="Select Relocation"
													list="{'Yes','No'}" onchange="handleSelect(this)"
													tabindex="40" />
											</div>

											<%--s:textfield cssClass="form-control" value="%{consultantVTO.consult_workPhone}"  name="consult_workPhone" id="consult_workPhone" label="Work Phone" placeholder="Work Phone " tabindex="1"/--%>
											<div class="col-sm-4">
												<span class="required"><label
													class="labelStylereq pref_country">Preferred
														Country</label> <s:select cssClass="form-control SelectBoxStyles"
														value="%{consultantVTO.consult_preferredCountry}"
														name="consult_preferredCountry"
														id="consult_preferredCountry" headerKey="-1"
														headerValue="Select Country" list="country"
														onchange="GetPStatesOfConsultantByPCountry('consult_preferredCountry','consult_preferredRegion','consult_preferredState','consult_error')"
														tabindex="41" /> </span>
											</div>


											<div class="col-sm-4 pref_region_div"
												id="divConsult_preferredRegion">
												<span class="required"><label
													class="labelStylereq pref_region">Preferred Region</label>
													<s:select cssClass="form-control SelectBoxStyles"
														value="%{consultantVTO.consult_preferredRegion}"
														name="consult_preferredRegion"
														id="consult_preferredRegion" headerKey="-1"
														headerValue="Select Preferred Region" list="regionName"
														onchange="GetPStatesOfConsultantByPCountryAndPRegion('consult_preferredCountry','consult_preferredRegion','consult_preferredState','consult_error')"
														tabindex="42" /></span>
											</div>
											<div class="col-sm-4 pref_state_div">
												<span class="required"><label
													class="labelStylereq pref_state">Preferred State</label> <s:select
														cssClass=""
														value="%{consultantVTO.consult_preferredState}"
														name="consult_preferredState" multiple="true"
														id="consult_preferredState" list="preState" tabindex="43" /></span>
												<s:hidden id="PrefstateValues" name="PrefstateValues" />
											</div>
										</div>
									</div>


									<%
										if (session.getAttribute("primaryrole").toString().equals("16")
												|| session.getAttribute("primaryrole").toString().equals("15")) {
									%>

									<div class="row">
										<div class="col-sm-12 ">

											<div class="col-sm-4 pull-right ">
												<s:submit type="button" cssStyle="margin:12px;"
													name="savetask" cssClass="cssbutton"
													onclick="return ConsultDetails_valid()" tabindex="44">
													<i class="fa fa-refresh"></i>&nbsp;Update</s:submit>
											</div>
										</div>
									</div>
									<%
										}

										else if (request.getAttribute("accountFlag") != null
												&& (request.getAttribute("accountFlag").toString().equals("11")
														|| request.getAttribute("accountFlag").toString().equals("16"))) {
									%>

									<div class="row">
										<div class="col-sm-12 ">

											<div class="col-sm-4 pull-right ">
												<s:submit type="button" cssStyle="margin:12px;"
													name="savetask" cssClass="cssbutton"
													onclick="return ConsultDetails_valid()" tabindex="44">
													<i class="fa fa-refresh"></i>&nbsp;Update</s:submit>
											</div>
										</div>
									</div>
									<%
										}
									%>




									</form>
									<div class="row"></div>


									<%
										if (request.getAttribute("accountFlag") != null
												&& request.getAttribute("accountFlag").toString().equals("1")
												&& request.getAttribute("consultStatus") != null
												&& request.getAttribute("consultStatus").toString().equals("Processing")) {
									%>
									<br>
									<h4>
										<b style="color: #3090C7">CSR Approval</b>
									</h4>

									<div class="col-sm-3">
										<label class="labelStylereq" style="color: #56a5ec;">
											CSR Status </label>
										<s:select name="csrstatus" id="csrstatus"
											value="%{consultantVTO.csrAppStatus}" tabindex="2"
											headerKey="-1" headerValue="Please select"
											list="#@java.util.LinkedHashMap@{'Approve':'Release To customer','Reject':'Reject'}"
											cssClass="SelectBoxStyles form-control" />
									</div>






									<div class="form-group col-sm-7">
										<label class="labelStyle" id="labelLevelStatusReq">CSR
											Comments </label>
										<s:textarea name="csrComments" id="csrComments"
											cssClass="form-control"
											value="%{consultantVTO.csrAppComments}"
											placeholder="Enter CSR Comments Here" rows="3" />
									</div>
									<div class="col-sm-2 pull-right" style="margin-top: 65px">
										<input id="scrollToTop" type="button" value="Update"
											style="margin: 5px 0px;"
											class="add_searchButton form-control"
											onclick="updateCSRStatus();" />


									</div>



									<%
										}
									%>
								</div>


								<div id="consultVisaAttachment_popup">
									<div id="visaAttachOverlay">

										<div class="backgroundcolor">
											<table>
												<tr>
													<td style=""><h4>
															<font color="#ffffff">&nbsp;&nbsp;Upload Identity
																Proof&nbsp;&nbsp; </font>
														</h4></td>
													<span class=" pull-right"><h5>
															<a href="" class="consultVisaAttachment_popup_close"
																onclick="visaAttachOverlayClose();"><i
																class="fa fa-times-circle-o fa-size"></i></a>&nbsp;
														</h5></span>
											</table>
										</div>
										<div>
											<br>

											<div>
												<div class="inner-addtaskdiv-elements">
													<div id="message"></div>
													<s:hidden id="consultantId" name="consultantId"
														value="%{consult_id}" />
													<s:file name="file" id="file"
														onclick="return idProofFileValidation();" />
												</div>
												<s:submit type="button"
													cssClass="cssbutton pull-right fa fa-upload"
													style="margin:13px 16px" value="Upload"
													onclick="return teAttachemntUpload();" id="addButton" />

											</div>

										</div>

									</div>
								</div>
								<div id="consultResumeAttachment_popup">
									<div id="resumeAttachOverlay">

										<div class="backgroundcolor">
											<table>
												<tr>
													<td style=""><h4>
															<font color="#ffffff">&nbsp;&nbsp;Upload
																Attachment &nbsp;&nbsp; </font>
														</h4></td>
													<span class=" pull-right"><h5>
															<a href="" class="consultResumeAttachment_popup_close"
																onclick="resumeAttachOverlayClose();"><i
																class="fa fa-times-circle-o fa-size"></i></a>&nbsp;
														</h5></span>
											</table>
										</div>



										<div>

											<s:form action="consultResumeUpload"
												id="consultantAttachmentId" theme="simple"
												enctype="multipart/form-data"
												onsubmit="return consultAttachmentValidation();">
												<div>
													<s:hidden id="tabFlag" name="tabFlag" value="%{tabFlag}" />
													<s:hidden id="consult_id" name="consult_id"
														value="%{#session['userId']}" />
													<div class="inner-addtaskdiv-elements">
														<div id="message"></div>
													</div>
													<div class="col-sm-12 required">
														<label class="labelStylereq">Attachment Title</label>
														<s:textfield cssClass="form-control"
															name="attachmentTitle" id="attachment_title"
															placeholder="Attachment Title" maxlength="30" />
													</div>
													<br> <br>

													<div class="col-sm-12 required">
														<label class="labelStylereq">Attachment Type</label>
														<s:select cssClass="form-control SelectBoxStyles"
															headerKey="0" headerValue="Select Attachment Type"
															name="attachmentType" id="attachment_type"
															list="#@java.util.LinkedHashMap@{'VS':'Visa','PP':'Passport','DL':'Driving Licence', 'CV':'Resume', 'OT':'Others'}" />
													</div>
													<br> <br>
													<div class="col-sm-12 required">
														<label class="labelStylereq">Attach File</label>
														<s:file name="consultAttachment" id="consultAttachment"
															onchange="return resumeAddValidation();" />
													</div>
													<br>

													<%--<s:submit cssClass="cssbutton task_popup_close" value="AddTask" theme="simple" onclick="addTaskFunction();" />--%>
													<div class="col-sm-12 required">
														<s:submit id="consultAttachUpload" type="button"
															cssClass="cssbutton fa fa-upload pull-right"
															value="Upload" theme="simple"
															onclick="return editResumeValidation(); msgclr()" />
													</div>
													<br>
												</div>
										</div>
										<s:token />
										</s:form>

									</div>

								</div>
								<!--  Consultant Background attachment new modal start -->

								<!-- Modal -->
								<div class="modal fade" id="myModal" role="dialog">
									<div class="modal-dialog">

										<!-- Modal content-->
										<div class="modal-content">

											<div class="backgroundcolor">
												<table>
													<tr>
														<td style=""><h4>
																<font color="#ffffff">&nbsp;&nbsp;Upload
																	Attachment &nbsp;&nbsp; </font>
															</h4></td>
														<span class=" pull-right"><h5>

																<!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
																<a href="" class="consultResumeAttachment_popup_close"
																	data-dismiss="modal"><i
																	class="fa fa-times-circle-o fa-size"></i></a>&nbsp;
															</h5></span>
												</table>
											</div>

											<!-- <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div> -->
											<div class="modal-body">
												<s:form action="consultBackgroundUpload"
													id="consultantBackgroundAttachmentForm" theme="simple"
													enctype="multipart/form-data"
													onsubmit="return consultBackgroundAttachmentValidation();">
													<s:hidden name="consult_id" id="current_consult_id" />
													<s:hidden name="current_requirementId"
														id="current_requirementId" />
													<s:hidden name="tabFlag" value="%{tabFlag}" />
													<div class="inner-addtaskdiv-elements">
														<div id="backgroundAttachmentmessage"></div>
													</div>
													<div class="col-sm-12 required">
														<label class="labelStylereq">Attachment Title</label>
														<s:textfield cssClass="form-control"
															name="backgroundAttachmentTitle"
															id="backgroundAttachmentTitle"
															placeholder="Attachment Title" maxlength="30" />
													</div>
													<br>
													<br>

													<div class="col-sm-12 required">
														<label class="labelStylereq">Attachment Type</label>
														<s:select cssClass="form-control SelectBoxStyles"
															headerKey="0" headerValue="Select Attachment Type"
															name="backgroundAttachmentType"
															id="backgroundAttachmentType"
															list="#@java.util.LinkedHashMap@{'EV':'Employee Verification','CD':'Consent and Disclosure'}" />
													</div>
													<br>
													<br>
													<div class="col-sm-12 required">
														<label class="labelStylereq">Attach File</label>
														<s:file name="consultBackgroundAttachment"
															id="consultBackgroundAttachment"
															onchange="return backgroundAddValidation();" />
													</div>
													<br>


													<div class="col-sm-12 required">
														<s:submit id="consultBackgroundAttachUpload" type="button"
															cssClass="cssbutton fa fa-upload pull-right"
															value="Upload" theme="simple"
															onclick="return backgroundAttachmentValidation();" />
													</div>
													<br>

													<br>
													<br>
													<br>
													<br>

												</s:form>
											</div>
											<!-- <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div> -->
										</div>

									</div>
								</div>

								<!--  Consultant Background attachment new modal end -->
								<div id="consultUploadProfileImage_popup">
									<div id="profileImageAttachOverlay">

										<div class="overlayOrButton_color">
											<table>
												<tr>
													<td style=""><h4>
															<font color="#ffffff">&nbsp;&nbsp;Change Profile
																Image&nbsp;&nbsp; </font>
														</h4></td>
													<span class=" pull-right"><h5>
															<a href="#" class="consultUploadProfileImage_popup_close"
																onclick="profileImageOverlayClose()"><i
																class="fa fa-times-circle-o fa-size"></i></a>&nbsp;
														</h5></span>
											</table>
										</div>
										<div>
											<br>
											<s:form action="consultantProfileImageUpdate"
												id="imageUpdateFormId" theme="simple"
												enctype="multipart/form-data">
												<div>
													<span><imageErrorMsg></imageErrorMsg></span>
													<div class="inner-addtaskdiv-elements">
														<div id="message"></div>



														<s:hidden value="%{#session['userId']}" name="contactId"></s:hidden>



														<s:file name="imageupdate" id="imageupdate"
															onchange="return ValidateFileUpload();" />
													</div>
													<%--<s:submit cssClass="cssbutton task_popup_close" value="AddTask" theme="simple" onclick="addTaskFunction();" />--%>

													<center>
														<button id="profileImageUpdateButton" type="submit"
															class="cssbutton" onclick="return ValidateImageUpload();"
															theme="simple">
															<i class="fa fa-plus-square">&nbsp;ADD</i>
														</button>
													</center>
													<br>
												</div>
										</div>
										</s:form>
									</div>
								</div>
								<%-- consultant_attachments tab--%>

								<div class="tab-pane fade" id="consult_attach"
									onclick="getConsultantAttachments.action">
									<div id="loadingConsultantResumes" class="loadingImg">
										<span id="LoadingContent"> <img
											src="<s:url value="/includes/images/Loader1.gif"/>"></span> ></span>
									</div>

									<div class="row">
										<s:if test="#session.primaryrole == 15 || #session.primaryrole == 16">
											<div class="col-sm-12 ">
												<%-- 
											<div class="col-sm-4 pull-right " id="proofuploadDiv">
												<button id="" type='button' tabindex="19"
													class="consultResumeAttachment_popup_open"
													onclick="openDialogforConsultantAttachment();">
													Add Attachment</button>
											</div>
											--%>
												<a href="" class="consultResumeAttachment_popup_open"
													onclick="openDialogforConsultantAttachment();"><button
														class="pull-right cssbutton">
														<i class="fa fa-plus-square"></i> Add
													</button></a> <br /> <br /> <br />
											</div>
										</s:if>
										<div class="col-lg-12">
											<s:if test='downloadFlag=="noResume"'>
												<span id="resume"><font
													style='color: red; font-size: 15px;'>No Attachment
														exists !!</font></span>
											</s:if>
											<s:if test='downloadFlag=="noFile"'>
												<span id="resume"><font
													style='color: red; font-size: 15px;'>File Not Found
														!!</font></span>
											</s:if>
											<table id="consult-attach_pagenav"
												class="CSSTable_task  responsive">
												<tr>
													<th>Attachment&nbsp;Name</th>
													<th>Attachment Title</th>
													<th>Attachment Type</th>
													<!--<th>Location</th>-->
													<th>Date Of Attachment</th>
													<th>Download Link</th>
													<th>Status</th>
												</tr>
											</table>
											<br> <label> Display <select
												id="con_paginationOption" class="disPlayRecordsCss"
												onchange="con_pagerOption()" style="width: auto">
													<option>10</option>
													<option>15</option>
													<option>25</option>
													<option>50</option>
											</select> Attachments per page
											</label> <br>
											<div id="cattach_pageNavPosition" align="right"
												style="margin-right: 0vw; display: none"></div>
										</div>
									</div>
									<%-- add attachment pop-up--%
								<div id="consultantAttachment_popup" style="display: none">
										<div id="consultantAttachOverlay">

											<div class="backgroundcolor">
												<table>
													<tr>
														<td style=""><h4>
																<font color="#ffffff">&nbsp;&nbsp;
																Add Attachments&nbsp;&nbsp; </font>
															</h4></td>
														<span class=" pull-right"><h5>
																<a href="" class="consultantAttachment_popup_close"
																	onclick="consultantAttachOverlayClose();"><i
																	class="fa fa-times-circle-o fa-size"></i></a>&nbsp;
															</h5></span>
												</table>
											</div>
											<div>
												<br>

												<div>
													<div class="inner-addtaskdiv-elements">
													
														<div id="message"></div>
														<div class="col-sm-3">
												<label class="labelStylereq">Identity Proof</label>
												<s:select cssClass="form-control SelectBoxStyles"
													value="%{consultantVTO.consultantIdProof}" headerKey="0"
													headerValue="Select ID Proof" name="consultantIdProof"
													id="consultantIdProof"
													list="#@java.util.LinkedHashMap@{'VS':'Visa','PP':'Passport','DL':'Driving Licence'}"
													tabindex="16" onchange="getVisaDetails();" />
											</div>
													</div> 
													<s:submit type="button"
														cssClass="cssbutton pull-right fa fa-upload"
														style="margin:13px 16px" value="Upload"
														onclick="" id="addButton" />

												</div>

											</div>

										</div>
									</div> --%>
								</div>



								<!--  Consultant Background Verification grid Div start -->
								<div class="tab-pane fade" id="consult_background_verification">



									<div class="row">
										<div class="col-sm-12 ">
											<button id="backgroundAttachmentUploadBtn" type="button"
												class="pull-right cssbutton" data-toggle="modal"
												data-target="#myModal" style="display: none;">
												<i class="fa fa-plus-square"></i> Add
											</button>
											<!-- <a href="#" class="consultResumeAttachment_popup_open"
												onclick="openDialogforConsultantBackgroundAttachment();"><button
													class="pull-right cssbutton">
													<i class="fa fa-plus-square"></i> Add
												</button></a>-->

											<br /> <br /> <br />
										</div>
										<div class="col-lg-12">
											<s:if test='downloadFlag=="noResume"'>
												<span id="resume"><font
													style='color: red; font-size: 15px;'>No Attachment
														exists !!</font></span>
											</s:if>
											<s:if test='downloadFlag=="noFile"'>
												<span id="resume"><font
													style='color: red; font-size: 15px;'>File Not Found
														!!</font></span>
											</s:if>
											<table id="consult_background_attacment_table"
												class="CSSTable_task  responsive">
												<tr>
													<th>Attachment&nbsp;Name</th>
													<th>Attachment Title</th>
													<th>Attachment Type</th>
													<!--<th>Location</th>-->
													<th>Uploaded Date</th>

													<th>Download Link</th>
													<th>Upload ScannedCopy</th>
													<th>Status</th>
												</tr>
											</table>
											<!--  <br> <label> Display <select
												id="con_paginationOption" class="disPlayRecordsCss"
												onchange="con_pagerOption()" style="width: auto">
													<option>10</option>
													<option>15</option>
													<option>25</option>
													<option>50</option>
											</select> Attachments per page
											</label> <br>
											<div id="cattach_pageNavPosition" align="right"
												style="margin-right: 0vw; display: none"></div> -->
										</div>
									</div>

								</div>

								<!--  Consultant Background Verification grid Div end -->
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
	<!--/Footer-->

	<script type="text/javascript"
		src="<s:url value="/includes/js/general/popupoverlay.js"/>"></script>
	<script type="text/javascript"
		src="<s:url value="/includes/js/general/pagination.js"/>"></script>
	<script type="text/JavaScript"
		src="<s:url value="/includes/js/general/selectivity-full.min.js"/>"></script>
	<script type="text/JavaScript"
		src="<s:url value="/includes/js/general/jquery.maskedinput.js"/>"></script>
	<script type="text/JavaScript"
		src="<s:url value="/includes/js/jquery.scrollUp.min.js"/>"></script>

	<script type="text/JavaScript"
		src="<s:url value="/includes/js/general/jquery.maskssn.js"/>"></script>

	<script>
		$(document).ready(function() {
			$('#scrollToTop').click(function() {
				$('html, body').animate({
					scrollTop : 0
				}, 800);
				return false;
			});
		});
		$(document)
				.ready(
						function() {
							$('#skillCategoryValue').selectivity({
								multiple : true,
								placeholder : 'Type to search skills'
							});

							$('#primarySkillValue').selectivity({
								multiple : true,
								placeholder : 'Type to search skills'
							});

							$('#primarySkillValue')
									.change(
											function() {
												var priSkillId = [];
												$(
														"#primarySkillValue :selected")
														.each(
																function() {
																	// alert($(this).text());
																	if ((($(this)
																			.text())
																			.toUpperCase()) === "OTHERS") {
																		document
																				.getElementById("other").style.display = "block";
																		//document.getElementById('primaryErrMsg').innerHTML="<font color='red'>Other Skills is required</font>";
																		return false;
																	} else {
																		$(
																				"#consult_otherSkills")
																				.val(
																						"");
																		document
																				.getElementById("other").style.display = "none";

																	}
																	//document.getElementById("other").style.display = "none";
																	priSkillId
																			.push($(
																					this)
																					.val());

																});
												//alert(priSkillId);

												// addConsultantSkillChange(priSkillId);
												//doOtherSkill();

											});

							$("#skillCategoryValue")
									.change(
											function() {
												// alert("secondary skills");
												$(
														"#skillCategoryValue :selected")
														.each(
																function() {
																	// alert($(this).text());
																	if ((($(this)
																			.text())
																			.toUpperCase()) === "OTHERS") {
																		document
																				.getElementById("secondary").style.display = "block";
																		return false;
																	} else {
																		//alert("empty secondary skill values");
																		$(
																				"#consult_otherSecSkills")
																				.val(
																						"");

																		document
																				.getElementById("secondary").style.display = "none";

																	}

																});

												//doOtherSecondrySkill();

											});

						});
		$('#consult_preferredState').selectivity({
			multiple : true,
			placeholder : 'Type to Search States'

		});
	</script>
	<script type="text/javascript">
		$("#consult_mobileNo").mask("(999)-999-9999");

		$("#consult_homePhone").mask("(999)-999-9999");

		$('#consult_ssnNo').unmask().maskSSN('999-99-9999', {
			maskedChar : 'X',
			maskedCharsLength : 5
		});

		//alert(document.getElementById('consultSSNCheckbox').className);
		$("#consultSSNCheckbox")
				.click(
						function() {

							if (document.getElementById('consultSSNCheckbox').className == "fa fa-eye") {
								$("#consult_ssnNo").mask("999-99-9999");
								document.getElementById('consultSSNCheckbox').className = "fa fa-eye-slash";
							} else {

								document.getElementById('consultSSNCheckbox').className = "fa fa-eye";

								$('#consult_ssnNo').unmask().maskSSN(
										'999-99-9999', {
											maskedChar : 'X',
											maskedCharsLength : 5
										});
							}

						});
	</script>
	<script type="text/javascript">
		var flag = document.getElementById("downloadFlag").value;
		//alert(flag);
		if (flag == "noResume" || flag == "noFile") {
			//alert("in if");
			var consult_id = document.getElementById('consult_id').value;
			//alert(consult_id);
			showAttachmentDetails(consult_id);
			document.getElementById('attachLi').className = 'active active_details';
			document.getElementById('consult_attach').className = 'tab-pane fade in active  ';
			document.getElementById('Consultant').className = 'tab-pane fade ';
			cheadingMessage(c_attach);
			//window.location = '../consultant/getConsultantAttachments.action?consult_id='+consult_id;
			// javascript: ajaxReplaceDiv('/getConsultantAttachments','#consult_attach','consult_id='+consult_id);

		} else {
			document.getElementById('consultantLi').className = 'active';

		}

		function handleSelect(a) {
			if (a.value == 'Yes') {
				$("#consult_preferredCountry").show();
				$(".pref_country").show();
				$("#consult_preferredCountry").val('-1');
			} else {
				$("#consult_preferredCountry").hide();
				$(".pref_country").hide();
				$(".pref_region").hide();
				$("#consult_preferredRegion").hide();
				//$("#consult_preferredState").hide();
				//$(".pref_state").hide();
				$(".pref_state_div").hide();
				$("#PrefstateValues").val('');

			}
		}
	</script>

	<script type="text/javascript">
		var flag = document.getElementById("tabFlag").value;

		if (flag == "attachmentTab") {
			document.getElementById('consult_attach').className = 'tab-pane fade in active';
			document.getElementById('Consultant').className = 'tab-pane fade ';
			cheadingMessage(c_attach);
			showAttachmentDetails(document.getElementById('consult_id').value);
		}
	</script>




	<script type="text/javascript">
		var recordPage = 10;
		function con_pagerOption() {

			var paginationSize = document
					.getElementById("con_paginationOption").value;
			if (isNaN(paginationSize)) {

			}
			recordPage = paginationSize;
			// alert(recordPage)
			$('#consult-attach_pagenav').tablePaginate({
				navigateType : 'navigator'
			}, recordPage);

		};
		$('#consult-attach_pagenav').tablePaginate({
			navigateType : 'navigator'
		}, recordPage);
	</script>

	<script>
		setTimeout(function() {
			$('#resume').remove();
		}, 3000);
	</script>
	<script>
		$("#fadeout_message").show().delay(5000).fadeOut();
	</script>

	<script type="text/JavaScript"
		src="<s:url value="/includes/js/general/placeholders.min.js"/>"></script>
	<script type="text/JavaScript"
		src="<s:url value="/includes/js/Ajax/jQueryAjaxFileUpload.js"/>"></script>
	<script type="text/javascript"
		src="<s:url value="/includes/js/Ajax/ConsultantAjax.js?version=1.1"/>"></script>
	<script type="text/JavaScript"
		src="https://cdnjs.cloudflare.com/ajax/libs/d3-collection/1.0.3/d3-collection.min.js"></script>
</body>
</html>
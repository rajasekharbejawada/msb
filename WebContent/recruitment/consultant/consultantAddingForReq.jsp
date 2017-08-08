
<%-- 
    Document   : consultantAddingForReq
    Created on : Jul 20, 2015, 6:51:13 PM
    Author     : praveen<pkatru@miraclesoft.com>
--%>


<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ page contentType="text/html; charset=UTF-8"
	errorPage="../exception/403.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<!-- new styles -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ServicesBay :: Consultant Adding For Requirement</title>
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
	href='<s:url value="/includes/css/general/profilediv.css"/>'>
<link rel="stylesheet"
	href='<s:url value="/includes/css/general/dhtmlxcalendar.css"/>'
	type="text/css">
<link rel="stylesheet"
	href='<s:url value="/includes/css/general/dhtmlxcalendar_omega.css"/>'
	type="text/css">
<link rel="stylesheet" type="text/css"
	href='<s:url value="/includes/css/general/requirementStyle.css"/>'>
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/general/selectivity-full.css"/>">
	  <link rel="stylesheet" type="text/css" href="<s:url value="/includes/css/general/sweetalert.css"/>">
	  <script type="text/JavaScript"
	src="<s:url value="/includes/js/general/jquery.min.js"/>"></script>
	
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>

<script type="text/JavaScript"
	src="<s:url value="/includes/js/general/GridNavigation.js"/>"></script>

<script type="text/JavaScript"
	src="<s:url value="/includes/js/bootstrap.min.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/main.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/general/jquery.toggle.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/CountriesAjax.js"/>"></script>
<script language="JavaScript"
	src='<s:url value="/includes/js/general/dhtmlxcalendar.js"/>'></script>
<script language="JavaScript"
	src='<s:url value="/includes/js/Ajax/EmployeeProfile.js"/>'></script>

<script language="JavaScript"
	src='<s:url value="/includes/js/general/sortable.js"/>'></script>
<%--script type="text/javascript" src="<s:url value="/includes/js/Ajax/vendorAjax.js"/>"></script--%>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/jquery.js"/>"></script>
<script language="JavaScript"
	src='<s:url value="/includes/js/Ajax/requirement.js?version=1.4"/>'></script>
<script type="text/javascript"
		src="<s:url value="/includes/js/general/pagination.js"/>"></script>
<%-- <script language="JavaScript"
	src='<s:url value="/includes/js/Ajax/GeneralAjax.js"/>'></script> --%>
  <script type="text/JavaScript" src="<s:url value="/includes/js/general/sweetalert.min.js"/>"></script>
  <link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/general/dhtmlxcalendar_omega.css"/>">
<script type="text/JavaScript"
	src="<s:url value="/includes/js/general/dhtmlxcalendar.js"/>"></script>
<style>
.selectivity-dropdown {
	top: 60px !important;
	height: 110px !important;
}

.selectivity-dropdown {
	width: 15em !important;
}

.selectivity-results-container {
	height: 110px !important;
}

.selectivity_block{
border: 2px dashed rgba(0,113,189,1);
 position: absolute;
  top: 52px;
  z-index: 999;
  background: #fff;
  color: #45b5de;
 
  display:none;
  margin-left: 15px;
}
</style>

</head>

<body oncontextmenu="return false" ng-app="myApp" ng-controller="myCtrl">
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
			<div class="container">
				<div class="row">
					<!-- Main Content-->
					<s:include value="/includes/menu/LeftMenu.jsp" />
					<div class="col-sm-12 col-md-9 col-lg-9 right_content" style="">
						<!-- Add Form Area -->
						<ul class="nav nav-tabs">
													<s:if test="vendor!='yes'">
													<li class=" active_details" id="detailsLi"><a
														aria-expanded="false" href="#details" onclick=" pagerOption12();" data-toggle="tab">Add Consultant For Job </a>
													</li>
												</s:if>
												<s:if test="vendor=='yes'">
													<li class=" active_details" id="detailsLi"><a
														aria-expanded="false" href="#details"   data-toggle="tab">Requirement&nbsp;In&nbsp;Detail</a>
													</li>
												</s:if>
												
												<li class="active_details" id="consultantListLi" ><a
													aria-expanded="false" href="#consultantList" onclick=" pagerOptionSL();"
													data-toggle="tab" >Submitted&nbsp;List</a></li> 

											
												<div id="jquery-msg-overlay" class="black-on-white "
													style="position: absolute; z-index: 1500; top: 71px; right: 0px; left: 0px; bottom: 0px; display: none"
													onclick="unlockScreen();">
													<img src="<s:url value="/includes/images/blank.png"/>"
														id="jquery-msg-bg"
														style="width: 100%; height: 100%; top: 0px; left: 0px;" />
												</div>

												
												
												
												
												
												
												

											</ul>
											<div class="tab-content">
											<div class="tab-pane fade in active row" id="details">
											
  
													<div class="" id="selectivityProfileBox"
														style="margin-top: 5px; background-color: white">


														<div class="col-lg-12">
							<div class="" id="selectivityProfileBox"
								style="float: left; margin-top: 15px; margin-bottom: 20px">
								<!-- Add Form Header-->
								<div class="backgroundcolor">
									<div class="panel-heading">
										<h4 class="panel-title">
											<font color="#ffffff">Add Consultant For Job</font>
											<s:url var="myUrl"
												action="getLoginUserRequirementList.action">
												<s:param name="accountFlag">MyRequirements</s:param>
												<s:param name="orgid">
													<s:property value="%{orgid}" />
												</s:param>
												<s:param name="vendor">yes</s:param>
											</s:url>
											<span class="pull-right"><s:a href='%{#myUrl}'>
													<i class="fa fa-undo"></i>
												</s:a></span>

										</h4>

									</div>
								</div>

								<div class="col-sm-12" style="margin-top:1%">
								<div class="col-sm-3"
										style="float: left; margin-top: 0px; margin-bottom: -7px;">
										<label class=""> Job ID :</label> <span
											style="color: #FF8A14;"><s:property value="%{jdId}" /></span>
									</div>
									<div class="col-sm-3"
										style="float: left; margin-top: 0px; margin-bottom: -7px;">
										<label class=""> Job Title :</label> <span
											style="color: #FF8A14;"><s:property
												value="%{jobTitle}" /></span>
									</div>
									
									 
									<div class="col-sm-3"
										style="float: left; margin-top: 0px; margin-bottom: -7px;">
										<label class=""> Rate(Min - Max) :</label> <span
											style="color: #FF8A14;">$<s:property
												value="%{targetRate}" />/Hr
										</span><font style="color: #FF8A14"> -</font> <span
											style="color: #FF8A14;">$<s:property
												value="%{maxRate}" />/Hr
										</span>

									</div>
									 
									<div class="col-sm-3"
										style="float: left; margin-top: 0px; margin-bottom: -7px;">
										<label class=""> Skill Set :</label> <span
											style="color: #FF8A14;"><s:property
												value="%{reqSkillSet}" /></span>
												<s:hidden name="reqSkillSet" id="reqSkillSet" value="%{reqSkillSet}"/>
									</div>
								</div>
							 

								<s:if test="hasActionMessages()">
									<div style="margin-left: 23px;">
										<span id="actionMessage"><s:actionmessage
												cssClass="actionContactMessagecolor" /></span>
									</div>
								</s:if>




								<br>











								<div class="inner-reqdiv-elements">
									<s:form action="storeProofData" theme="simple"
										enctype="multipart/form-data"
										onsubmit="return addconsultantValidation();">

										<br>

										<span><e1></e1></span>

										<s:hidden name="reqId" id="reqId" value="%{requirementId}" />
<s:hidden name="RequirementId" id="RequirementId" value="%{requirementId}" />
										<s:hidden name="resourceType" id="resourceType" />
										<s:hidden name="jdId" id="jdId" value="%{jdId}" />
										<s:hidden name="jobTitle" id="jobTitle" value="%{jobTitle}" />
										<s:hidden name="orgId" id="orgid" value="%{orgid}" />
										<s:hidden name="targetRate" id="targetRate"
											value="%{targetRate}" />
										<s:hidden name="requirementMaxRate" id="requirementMaxRate"
											value="%{maxRate}" />

										<div class="col-sm-6">
											<label>Resource Type</label>
											<s:select id="contactType" name="contactType"
												cssClass="form-control SelectBoxStyles " theme="simple"
												list="#@java.util.LinkedHashMap@{'IC':'Consultant','VC':'Employee'}"
												tabindex="1" />
												<!-- onchange="clearConsultantSubmissionFields();"  -->
										</div>
										
										<s:hidden name="selectedContactType" id="selectedContactType"  />
										
										<div class="row">

											<div class="col-sm-6">
												<s:hidden id="groupingId" name="groupingId"
													value="%{groupingId}" />
													<span id="validationMessage" />
												
												<div class="col-sm-12">
												<label class="labelStylereq" style="color: #56a5ec">Email
													Id</label>

												<s:textfield name="conEmail" id="conEmail"
													placeholder="Email Id" theme="simple"
													cssClass="form-control" tabindex="1"
													
													maxlength="60" ng-keyup="getEmployeesList()" ng-model="conEmail.searchKey"/>
													
</div>

<div class="col-sm-6 selectivity_block">

									<div class="suggestionList1">
<div ng-repeat="consultant in consultants" ng-model="consultant" ng-click="selectEmploye(consultant)">
<a href="" class="suggestionList">{{consultant.Email}} </a>
</div>
</div>
</div>

											</div>


										</div>


	


										
										<div class="row">
											<div id="skillField" style="position: relative"
												class="col-sm-6 ">
												<div class="col-sm-12">
													<label class="labelStylereq skilllist"
														style="margin-left: 10px;">Skills</label>
													<s:select cssClass="commentsStyle"
														name="skillCategoryValueList" id="skillListValue"
														list="skillValuesMap" multiple="true"
														onfocus="clearErrosMsgForGrouping()" tabindex="3" />
													<s:hidden id="propsedSkills" name="propsedSkills" />
													<s:hidden id="tempSkillList" value="%{skillValuesMap}" />
												</div>
											</div>
											
										<div class="col-sm-6  ">
<div class="col-sm-12">
													<label class="labelStylereq">Available&nbsp;From</label>
													<div class="calImage">
														<s:textfield cssClass="form-control" name="availableFrom"
															id="availableFrom" onkeypress="return enterDateRestrict(this);"
															onclick="dobValidate()" tabindex="7"
															placeholder="Available from">
															<i class="fa fa-calendar"></i>
														</s:textfield>
													</div>
												</div>
												</div>
											
										</div>

										<div id="charNum"></div>
<div class="row">
<div class="col-sm-3  ">
<div class="col-sm-12">
													<label class="labelStylereq">Rate&nbsp;From</label>
													
													
													
														 <s:textfield cssClass="form-control" name="rateFrom"
															id="rateFrom" 
															 tabindex="7"
															placeholder="From" style="float:left;">
															
														</s:textfield>
														
														
														
													</div>
												</div>
												<div class="col-sm-3  ">
<div class="col-sm-12">
													<label class="labelStylereq">Rate&nbsp;To</label>
													
													
													
														
														
														
														  <s:textfield cssClass="form-control" name="rateTo"
															id="rateTo" 
															 tabindex="7"
															placeholder="To">
															
														</s:textfield>
													</div>
												</div>
												<div class="col-sm-6">
											<div class="col-sm-4 pull-right" style="padding-top:35px">
												<button type="button" Style="margin-right:10px;"
													id="addConSubmit" Class="add_searchButton form-control"
													value="" onclick="return getAvailableConsultantDetails()" tabindex="5">
													<i class=" fa fa-search"></i>&nbsp;Search</button>
											</div>
										</div>
</div>
										
										<s:token />
										<!--  consultant list table start -->
											<div class="task_content" id="colnsultant_div" align="center"
																	style="display: none">

																	<div>
																		<div>

																			<table id="availableConsultantListTable"
																				class="responsive CSSTable_task" border="5"
																				cell-spacing="2">

																				<tbody>
																					<tr>
																					<th>Candidate&nbsp;Name</th>
																					<th>Email Id</th>
																					<th>Experience</th>
																					<th>SkillSet</th>
																					<th>AvailableFrom</th>
																					<th>Rate($/Hr.)</th>
																					<th>Submit</th>
																					</tr>
																				</tbody>
																			</table>
																			<br /> <label class="page_option pull-left"> Display <select
																				id="paginationOption12" class="disPlayRecordsCss"
																				onchange="pagerOption12()" style="width: auto">
																					<option>10</option>
																					<option>15</option>
																					<option>25</option>
																					<option>50</option>
																			</select> Records per page
																			</label>
																			<!--  <div id="loadingAvailableConsultant" class="loadingImg">
																				<span id="LoadingAvailableContent"> <img
																					src="<s:url value="/includes/images/Loader1.gif"/>"></span>
																			</div> -->
																			
																		 
																		</div>
                                                                     
																	</div>
																	</div>
										<!--  Consultant list table end -->
									</s:form>

								</div>
								
								<br>
							</div>






						</div>

														
													</div>
												</div>
											
											<div class="tab-pane fade in row" id="consultantList">
													<div class="" id="profileBox"
														style="float: left; margin-top: 5px; background-color: white">
														<%--	<div class="backgroundcolor"
															style="background-color: white">
															<div class="panel-heading">
																<h4 class="panel-title">

																	<i id="updownArrowSub" style="color: #56a5ec"
																		onclick="toggleContentRequirementSubmittedList('consultantSearchForm')"
																		class="fa fa-sort-asc"></i>

																</h4>
															</div>
														</div>  --%>


														<div class="col-sm-12" id="consultantSearchForm">
															<div class="row">
																<s:form action="" theme="simple">

																	<s:hidden name="vendor" id="vendor" value="%{vendor}" />
																	<s:hidden name="RequirementId" id="RequirementId"
																		value="%{requirementVTO.RequirementId}" />
																	<s:hidden name="jdId" id="jdId" value="%{jdId}" />

																	<s:hidden name="downloadFlag" id="downloadFlag"
																		value="%{downloadFlag}" />
																	<s:hidden name="customerFlag" id="customerFlag"
																		value="%{customerFlag}" />
																	<s:hidden name="accountFlag" id="accountFlag"
																		value="%{accountFlag}"></s:hidden>
																	<s:hidden name="accountSearchID" id="accountSearchID"
																		value="%{accountSearchID}"></s:hidden>
																	<s:hidden name="gridDownload" id="gridDownload"
																		value="" />

																	
																	<div class="col-sm-3">

																		<label style="color: #56a5ec;" class="labelStylereq">First&nbsp;Name&nbsp;&nbsp;</label>
																		<s:textfield cssClass="form-control"
																			name="consult_name" id="consult_name"
																			value="%{consult_name}" tabindex="2" maxLength="30"
																			placeholder="First Name" />

																	</div>
																	<div class="col-sm-3">

																		<label style="color: #56a5ec;" class="labelStylereq">Last&nbsp;Name&nbsp;&nbsp;</label>
																		<s:textfield cssClass="form-control"
																			name="consult_lstname" id="consult_lstname"
																			value="%{consult_lstname}" tabindex="3"
																			maxLength="30" placeholder="Last Name" />

																	</div>
																	<%--  <div class="col-sm-3">

																		<label style="color: #56a5ec;" class="labelStylereq">SSN&nbsp;Number&nbsp;&nbsp;</label>
																		<s:textfield cssClass="form-control"
																			name="consult_ssnNo" id="consult_ssnNo" tabindex="4"
																			value="%{consult_ssnNo}" placeholder="SSN Number" />

																	</div>
																	--%>

																	<div class="col-sm-3">
																		<label class="labelStylereq">SSN&nbsp;Number</label>
																		<div class="input-group">
																			<s:textfield cssClass="form-control"
																				name="consult_ssnNo" id="consult_ssnNo"
																				placeholder="SSN Number" tabindex="4"
																				value="%{consult_ssnNo}" />
																			<span class="add-on input-group-addon" id=""
																				title="Click here to Show/Hide SSN" tabindex="100"
																				style="cursor: pointer;"> <i
																				id="consultSSNCheckbox" class="fa fa-eye"></i>
																			</span>
																		</div>
																	</div>
																	<s:if test="vendor=='yes'">
																		<div class="col-sm-3">
																			<label style="color: #56a5ec;" class="labelStylereq">Email Id</label>
																			<s:textfield cssClass="form-control"
																				name="consult_email" id="consult_email"
																				value="%{consult_email}" tabindex="5" maxLength="60"
																				placeholder="Email Id" />

																		</div>
																	</s:if>
																	<s:else>
																		<s:hidden name="consult_email" id="consult_email" />
																	</s:else>


																	<div class="col-sm-3">
																		<label style="color: #56a5ec;" class="labelStylereq">Skill&nbsp;Set</label>
																		<s:textfield cssClass="form-control"
																			name="consult_skill" id="consult_skill"
																			value="%{consult_skill}" tabindex="6" maxLength="100"
																			placeholder="Skill Set" />
																	</div>
																	<div class="col-sm-3">
																		<label class="labelStylereq" style="color: #56a5ec">Experience</label>
																		<s:textfield cssClass="form-control"
																			name="yearExperience" id="yearExperience"
																			placeholder="Experience" value="" tabindex="8"
																			maxLength="15" />
																	</div>

																	<s:hidden name="consult_phno" id="consult_phno" />

																	<s:hidden name="consultantFlag" id="consultantFlag"
																		value="%{consultantFlag}" />

																	<div class="col-sm-3 pull-right">


																		<div class="pull-right contact_search">
																			<label class="labelStylereq" style="color: #56a5ec;"></label>
																			<s:submit type="button"
																				cssClass="add_searchButton form-control"
																				id="searchButton" tabindex="7"
																				cssStyle="margin:5px 0px;" value=""
																				onclick="return getConsultantListBySearch();">
																				<i class="fa fa-search"></i>&nbsp;Search</s:submit>
																		</div>
																		

																		<s:hidden name="techSearch" id="techSearch"
																			value="%{techSearch}" />
																		<s:hidden name="reqFlag" id="reqFlag"
																			value="%{reqFlag}" />
																	</div>


																</s:form>
															</div>
														</div>

														<div class="col-sm-12" style="overflow-x:auto" >
															<s:form>
																<span id="conWithRejectValid"></span>
																<s:hidden id="jdId" name="jdId" value="%{jdId}" />
																<s:if test='downloadFlag=="noResume"'>
																	<span id="resume"><font
																		style='color: red; font-size: 15px;'>No
																			Attachment exists !!</font></span>
																</s:if>
																<s:if test='downloadFlag=="noFile"'>
																	<span id="resume"><font
																		style='color: red; font-size: 15px;'>File Not
																			Found !!</font></span>
																</s:if>
																<br />
																<div class="task_content" id="task_div" align="center"
																	style="display: none">

																	<div>
																		<div>

																			<table id="consultantListTable"
																				class="responsive CSSTable_task" border="5"
																				cell-spacing="2">

																				<tbody>
																					<tr>
																						
																						<th>Candidate&nbsp;Name</th>
																						<th>Submitted&nbsp;Date</th>
																						<!-- <th>SSN&nbsp;No.</th> -->
																						
																							<th>Email Id</th>
																						
																						<th>Skill&nbsp;Set</th>
																						
																							<th>Phone&nbsp;No</th>
																						
																						<th>Experience</th>
																						<th>Status</th>
																						<th>Rate</th>
																						<th>Resume</th>
																						
																						<s:if test="accountFlag!='csr'">
																							<th>Proceed</th>
																						</s:if>
																						
																							<th>Withdrawn</th>
																						
																					</tr>

																				</tbody>
																			</table>
																			<br /> <label class="page_option"> Display <select
																				id="paginationOptionSL" class="disPlayRecordsCss"
																				onchange="pagerOptionSL()" style="width: auto">
																					<option>10</option>
																					<option>15</option>
																					<option>25</option>
																					<option>50</option>
																			</select> Records per page
																			</label>
																			<div id="loadingConsultant" class="loadingImg">
																				<span id="LoadingContent"> <img
																					src="<s:url value="/includes/images/Loader1.gif"/>"></span>
																			</div>
																			<div align="right" id="taskpageNavPosition"
																				style="margin-right: 0vw; display: none"></div>
																			<script type="text/javascript">
																				var pager = new Pager(
																						'consultantListTable',
																						10);
																				pager
																						.init();
																				pager
																						.showPageNav(
																								'pager',
																								'taskpageNavPosition');
																				pager
																						.showPage(1);
																			</script>
																		</div>
                                                                        <div class="row">
																		<div class="com-sm-12">
																			<div id="downloading_grid"
																				class="col-sm-6 pull-right">
																				<div class="pull-right  req_btn col-sm-0"
																					style="margin: 0px 0px 0px 10px">
																					<div onclick="downloadPDFSubmittedList()"
																						id="submittedListDownloadPDFButton" tabindex="8"
																						class="fa fa-download cssbutton form-control">&nbsp;DownloadPDF</div>
																				</div>
																				<div class="pull-right  req_btn col-sm-0">
																					<div onclick="downloadXLSSubmittedList()"
																						id="submittedListDownloadXLSButton" tabindex="9"
																						class=" fa fa-download cssbutton form-control">&nbsp;DownloadXLS</div>
																				</div>
																			</div>
																		</div>
																		</div>
																	</div>
															</s:form>

														</div>
														<div id="Migration_popup">
															<div id="recruiterBox" class="marginTasks">
																<div class="backgroundcolor">
																	<table>
																		<tr>
																			<td><h4 style="font-family: cursive">
																					<font class="titleColor">&nbsp;&nbsp;Forwarded&nbsp;By&nbsp;Details&nbsp;&nbsp;
																					</font>
																				</h4></td>
																			<span class="pull-right">
																				<h5>
																					&nbsp;&nbsp;&nbsp;&nbsp;<a href=""
																						class="Migration_popup_close"
																						onclick="migration_overlayClose()"><i
																						class="fa fa-times-circle-o fa-size"></i></a>
																				</h5>
																			</span>
																	</table>
																</div>
																<div>
																	<form>
																		<span><mig></mig></span>
																		<s:hidden name="consult_id" id="consult_id" value="" />
																		<s:hidden name="req_Id" id="req_Id"
																			value="%{requirementVTO.RequirementId}" />
																		<s:hidden name="acc_Id" id="acc_Id" value="" />
																		<s:hidden name="acc_type" id="acc_type" value="" />
																		<!--s:property value="%{vendor}"/-->
																		<s:hidden name="vendor" id="vendor" value="%{vendor}" />
																		<s:hidden name="loginId" id="loginId"
																			value="%{#session['loginId']}" />
																		<s:hidden id="cName" name="cName" value="" />
																		<s:hidden name="roleFlag" id="roleFlag"
																			value="%{#session.primaryrole}" />

																		<center>
																			<table>

																				<div class="inner-techReviewdiv-elements">
																					<s:textfield cssClass="form-control "
																						id="migrationEmailId" type="text" value=""
																						name="migrationEmailId" placeholder=""
																						label="EmailId" onfocus="removeErrorMessages()" />


																				</div>

																			</table>

																		</center>
																		<br />
																		<s:submit cssClass="cssbutton migrationButton"
																			id="migrate" onclick="return userMigration();"
																			value="Migrate" />
																	</form>
																</div>
																<font style="color: #ffffff">.....................
																	..............................
																	..........................................</font>
															</div>
														</div>

														<br> <br>


													</div>


												</div>
											</div>
						
						</div>
					</div>
				</div>
				<!-- Add Form-->
				
				
				<!-- overlays for requirement start -->
				
				<div id="recSkillOverlay_popup">
					<div id="consultantSkillSetBox" class="marginTasks">
						<div class="backgroundcolor">
							<table>
								<tr>
									<td><h4 style="font-family: cursive">
											<font class="titleColor">&nbsp;&nbsp;Skill&nbsp;Details&nbsp;&nbsp;
											</font>
										</h4></td>
									<span class="pull-right">
										<h5>
											&nbsp;&nbsp;&nbsp;&nbsp;<a href=""
												id="consSkillOverlayCloseButton"
												class="recSkillOverlay_popup_close"
												onclick="consultantSkillCloseOverlay()"><i
												class="fa fa-times-circle-o fa-size"></i></a>
										</h5>
									</span>
							</table>
						</div>
						<div>

							<s:textarea name="customerSkillDetails" id="customerSkillDetails"
								disabled="true" cssClass="form-control textareaSkillOverlay" />


						</div>
						<font style="color: #ffffff">.....................
							..............................
							..........................................</font>
					</div>
				</div>
				<div id="conWithdraw_popup">
					<div id="conWithdrawBox" class="marginTasks">
						<div class="backgroundcolor">
							<table>
								<tr>
									<td><h4 style="font-family: cursive">
											<font class="titleColor" id="commentsLabel">&nbsp;Comments</font>
										</h4></td>
									<span class="pull-right">
										<h5>
											&nbsp;&nbsp;&nbsp;&nbsp;<a href="#"
												id="withdrawCommentsClose" class="conWithdraw_popup_close"
												onclick="conWithdrawClose('close')"><i
												class="fa fa-times-circle-o fa-size"></i></a>
										</h5>
									</span>
							</table>
						</div>
						<s:hidden name="reqwithdrawId" id="reqwithdrawId" />
						<s:hidden name="conWithdrawId" id="conWithdrawId" />
						<div class="required">
							<label>Comments</label>
							<s:textarea name="withdrawComments" id="withdrawComments"
								cssClass="form-control textareaSkillOverlay" />
						</div>

						<div class="pull-right btn_pull" id="withdrawButtonDiv">
							<s:submit type="button"
								cssClass="cssbutton conWithdraw_popup_close fa icon-ok"
								id="contactSend" value="OK" onclick="conWithdrawClose('ok');" />
						</div>
						<font style="color: #ffffff">.....................
							..............................
							..........................................</font>
					</div>
				</div>
				<div id="decline_popup" style="display: none">
					<div id="declineBox" class="marginTasks">
						<div class="backgroundcolor">
							<table>
								<tr>
									<td><h4 style="font-family: cursive">
											<font class="titleColor">&nbsp;Rejection&nbsp; </font>
										</h4></td>
									<span class="pull-right">
										<h5>
											&nbsp;&nbsp;&nbsp;&nbsp;<a href="#"
												id="rejectionCommentsClose" class="decline_popup_close"
												onclick="declineClose()"><i
												class="fa fa-times-circle-o fa-size"></i></a>
										</h5>
									</span>
							</table>
						</div>
						<s:hidden name="reqRejectId" id="reqRejectId" />
						<s:hidden name="conRejectId" id="conRejectId" />
						<s:hidden name="createdByOrgId" id="createdByOrgId" />
						<span id="rejectionMessage"></span>
						<div class="required">
							<label>Comments</label>
							<s:textarea name="rejectionComments" id="rejectionComments"
								cssClass="form-control textareaSkillOverlay" />
						</div>

						<div class="pull-right btn_pull" id="declineButtonDiv"
							style="display: none">
							<s:submit type="button"
								cssClass="cssbutton decline_popup_close fa fa-check-circle-o"
								id="declineConsultant" value="OK"
								onclick="doDeclineConsultant();" />
						</div>
						<font style="color: #ffffff">.....................
							..............................
							..........................................</font>
					</div>
				</div>
				
				
				<!-- overlays for requirement end -->
				
				
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

	<script language="JavaScript"
		src='<s:url value="/includes/js/general/popupoverlay.js"/>'></script>
	<script type="text/JavaScript"
		src="<s:url value="/includes/js/general/selectivity-full.min.js"/>"></script>
	<script>
		$(document).ready(function() {
			$('#skillListValue').selectivity({

				multiple : true,
				placeholder : 'Type to search skills'
			});
			document.getElementById('detailsLi').className = 'active active_details';
			//getConsultantListInAddConsultant();
			doOnLoadForDate();
			getConsultantListBySearch();
			getAvailableConsultantDetailsOnload();
			
			
			$("#loadingConsultant").hide();
		
		});
		
		
		function doOnLoadForDate() {
			cnsltDate = new dhtmlXCalendarObject([ "availableFrom" ]);
			cnsltDate.setSkin('omega');
			cnsltDate.setDateFormat("%m-%d-%Y");
			cnsltDate.hideTime();
			var today = new Date();
			cnsltDate.setSensitiveRange(today, null);
			cnsltDOB = new dhtmlXCalendarObject([ "consult_dob" ]);
			cnsltDOB.setSkin('omega');
			cnsltDOB.setDateFormat("%m-%d-%Y");
			cnsltDOB.hideTime();
		}
		function enterDateRestrict(id) {

			$(id).val("");

			// alert("Please select from the Calender !");
			return false;
		}
	</script>
		<script type="text/javascript">
		var recordPage12 = 10;
		function pagerOption12() {
			 
			initSessionTimer();
			var paginationSize = document
					.getElementById("paginationOption12").value;
			
			if (isNaN(paginationSize)) {

			}
			recordPage12 = paginationSize;
			
			$('#availableConsultantListTable').tablePaginate({
				navigateType : 'navigator'
			}, recordPage12);

		};
	 
	</script>
	<script type="text/javascript">
		var recordPage = 10;
		function pagerOptionSL() {
			
			initSessionTimer();
			var paginationSize = document
					.getElementById("paginationOptionSL").value;
			if (isNaN(paginationSize)) {

			}
			recordPageSL = paginationSize;
			$('#consultantListTable').tablePaginate({
				navigateType : 'navigator'
			}, recordPageSL);

		};
		 
	</script>
	<script>
		$("#actionMessage").show().delay(5000).fadeOut();
	</script>
	<script type="text/javascript"
		src="<s:url value="/includes/js/general/pagination.js"/>"></script>
	<script type="text/JavaScript"
		src="<s:url value="/includes/js/jquery.scrollUp.min.js"/>"></script>
	<script type="text/JavaScript"
		src="<s:url value="/includes/js/general/placeholders.min.js"/>"></script>
	<div style="display: none; position: absolute; top:170px;left:320px;overflow:auto; z-index: 1900000" id="menu-popup">
            <table id="completeTable" border="1" bordercolor="#e5e4f2" style="border: 1px dashed gray;" cellpadding="0" class="cellBorder" cellspacing="0" />
        </div>
        
</body>

</html>

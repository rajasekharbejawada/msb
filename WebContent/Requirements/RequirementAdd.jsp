<%@ page contentType="text/html" pageEncoding="UTF-8"%>
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
<title>ServicesBay :: Requirements&nbsp;Add&nbsp;Page</title>

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
<link rel="stylesheet"
	href='<s:url value="/includes/css/general/dhtmlxcalendar.css"/>'
	type="text/css">
<link rel="stylesheet"
	href='<s:url value="/includes/css/general/dhtmlxcalendar_omega.css"/>'
	type="text/css">
	
	<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
	
<script type="text/JavaScript"
	src="<s:url value="/includes/js/general/jquery.min.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/general/GridNavigation.js"/>"></script>

<%-- <script type="text/JavaScript"
	src="<s:url value="/includes/js/bootstrap.min.js"/>"></script> --%>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/main.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/general/jquery.toggle.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/Ajax/GeneralAjax.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/Ajax/AppConstants.js"/>"></script>
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/general/profilediv.css"/>">
<script language="JavaScript"
	src='<s:url value="/includes/js/general/dhtmlxcalendar.js"/>'></script>
<script language="JavaScript"
	src='<s:url value="/includes/js/Ajax/EmployeeProfile.js"/>'></script>
<script language="JavaScript"
	src='<s:url value="/includes/js/Ajax/addLeaveOverlay.js"/>'></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/general/jquery.maskedinput.js"/>"></script>

<script type="text/javascript"
	src="<s:url value="/includes/js/Ajax/requirementAjax.js"/>"></script>

<script type="text/JavaScript"
	src="<s:url value="/includes/js/jquery.js"/>"></script>



<style>
.numeric_field {
	width: 30% !important;
	padding: 0 5px !important;
	float: left;
}

.select_duration {
	width: 70% !important;
}
</style>
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
  margin-left: 0px;
}
</style>
<script>
	function showHideDuration() {
		var RequirementTaxTerm = document.getElementById('RequirementTaxTerm').value;
		if (RequirementTaxTerm == 'CO') {
			document.getElementById('duration').style.display = "block";
		} else {
			document.getElementById('duration').style.display = "none";
		}
	}
	function showHideEndDate() {
		var RequirementTaxTerm = document.getElementById('RequirementTaxTerm').value;
		if (RequirementTaxTerm == 'CO') {
			document.getElementById('endDateDiv').style.display = "block";
		} else {
			document.getElementById('endDateDiv').style.display = "none";
		}
	}
</script>
</head>

<body style="overflow-x: hidden" oncontextmenu="return false"
	onload="showHideEndDate();doOnLoadRequirement();" ng-app="myApp1" ng-controller="reqAddCtrl">
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
							<div class="features_items">
								<div class="col-sm-14 ">
									<div class="" id="selectivityProfileBox"
										style="float: left; margin-top: 5px">
										<br>
										<div class="" style="float: left">
											<label class="labelStyle" id="labelLevelStatusReq">
												Account&nbsp;Name : <span style="color: #FF8A14;"> <s:property
														value="accountName" /></span>
											</label>
										</div>
										<br>
										<%
											String orgId = session.getAttribute(ApplicationConstants.ORG_ID).toString();
										%>
										<div class="backgroundcolor">
											<div class="panel-heading">
												<h4 class="panel-title">
													<font color="#ffffff"> Add&nbsp;Requirement</font>
													<s:if test="accountFlag=='MyRequirements'">
														<s:url var="myUrl"
															action="recruitment/consultant/getLoginUserRequirementList.action">
															<s:param name="accountFlag">MyRequirements</s:param>
														</s:url>
														<span class="pull-right"><s:a href='%{#myUrl}'
																id="reqAddBackButton">
																<i class="fa fa-undo"></i>
															</s:a></span>
													</s:if>
													<s:elseif test="customerFlag=='customer'">
														<s:url var="myUrl"
															action="recruitment/consultant/getLoginUserRequirementList.action">
															<s:param name="orgid"><%=orgId%></s:param>
															<s:param name="customerFlag">customer</s:param>
															<s:param name="accountFlag">MyRequirements</s:param>
														</s:url>
														<span class="pull-right"><s:a href='%{#myUrl}'
																id="reqAddBackButton">
																<i class="fa fa-undo"></i>
															</s:a></span>
													</s:elseif>
													<s:else>
														<s:url var="myUrl"
															action="recruitment/consultant/getAllRequirementList.action">
															<s:param name="orgid"><%=orgId%></s:param>
														</s:url>
														<span class="pull-right"><s:a href='%{#myUrl}'
																id="reqAddBackButton">
																<i class="fa fa-undo"></i>
															</s:a></span>
													</s:else>
												</h4>
											</div>
										</div>
										<div class="col-sm-12">
											<s:form name="requirementAdd" theme="simple">
												<br>
												<span cellspacing="30"> <span><editrequirementerror></editrequirementerror></span>
													<reqAdded></reqAdded>
													<div>
														<span><requirement></requirement></span>
														<div id="loadingAddReq" class="loadingImg"
															style="display: none">
															<span id="LoadingContent"> <img
																src="<s:url value="/includes/images/Loader1.gif"/>"></span>
														</div>


														<%-- <div class="col-sm-3 required" id="">
															<label class="labelStyle" id="labelLevelStatusReq">
																Title </label>
															<s:textfield cssClass="form-control" id="RequirementName"
																type="text" value="%{requirementVTO.RequirementName}"
																placeholder="Title" onfocus="removeErrorMessages()"
																maxLength="50" />
														</div> --%>

														<div class="col-sm-3 required" id="">
															<label class="labelStyle" id="labelLevelStatusReq">
																Title </label>
															<s:textfield cssClass="form-control" id="RequirementName"
																type="text" value="%{requirementVTO.RequirementName}"
																placeholder="Title" 
																maxLength="50" ng-keyup="getRateCardsList()"
																ng-model="RequirementName.searchKey" />

															<div class="col-sm-11 selectivity_block">

																<div class="suggestionList1">
																	<div ng-repeat="rateCard in rateCards"
																		ng-model="rateCard"
																		ng-click="selectRateCard(rateCard)">
																		<a href="" class="suggestionList">{{rateCard.jobTitle}}
																		</a>
																	</div>
																</div>
															</div>
														</div>



														<div class="col-sm-3 required" id="">
															<label class="labelStyle" id="labelLevelStatusReq">
																Number of Positions </label>
															<s:textfield cssClass="form-control"
																id="RequirementNoofResources" type="text"
																value="%{requirementVTO.RequirementNoofResources}"
																onfocus="removeErrorMessages()" placeholder="Positions"
																onkeypress="return acceptNumbers(event)" maxLength="11" />
														</div>

														<div class="col-sm-3 required" id="">
															<label class="labelStyle" id="labelLevelStatusReq">Work
																Center Location </label>
															<s:select id="RequirementLocation"
																list="#@java.util.LinkedHashMap@{'ON':'Onsite','OF':'Offsite','OS':'Offshore'}"
																headerKey="OF" cssClass="SelectBoxStyles form-control"
																onfocus="removeErrorMessages()"
																value="%{requirementVTO.RequirementLocation}" />
														</div>

														<div class="col-sm-3  required">
															<label class="labelStyle" id="labelLevelStatusReq">
																Req.Exp.</label>
															<s:select id="RequirementYears" list="experienceMap"
																headerKey="-1" headerValue="Select Req Experience"
																cssClass="SelectBoxStyles form-control"
																onfocus="removeErrorMessages()"
																value="%{requirementVTO.RequirementExp}" />
														</div>


														<div class="col-sm-3 required" id="">
															<label class="labelStyle" id="labelLevelStatusReq">
																Min&nbsp;Rate </label>
															<div class="input-group">
																<span class="input-group-addon "
																	style="padding-top: 5px">$</span>
																<s:textfield cssClass="form-control"
																	id="RequirementTargetRate" type="text"
																	value="%{requirementVTO.RequirementTargetRate}"
																	onfocus="removeErrorMessages()" placeholder="Min Rate"
																	onkeypress="return RequirementMinRate(event)"
																	maxLength="10" />
																<span class="input-group-addon" style="padding-top: 5px">/Hr</span>
															</div>
														</div>

														<div class="col-sm-3 required" id="">
															<label class="labelStyle" id="labelLevelStatusReq">
																Max&nbsp;Rate </label>
															<div class=" input-group">
																<span class="input-group-addon "
																	style="padding-top: 5px">$</span>
																<s:textfield cssClass="form-control"
																	id="requirementMaxRate" type="text"
																	value="%{requirementVTO.requirementMaxRate}"
																	onfocus="removeErrorMessages()" placeholder="Max Rate"
																	onkeypress="return RequirementMaxRate(event)"
																	maxLength="5"></s:textfield>
																<span class="input-group-addon" style="padding-top: 5px">/Hr</span>
															</div>
														</div>


														<%-- <div class="col-sm-3 required" id="">
															<label class="labelStylereq " style="color: #56a5ec;">Req.Category</label>
															<s:select id="reqCategoryValue" name="reqCategoryValue"
																cssClass="SelectBoxStyles form-control"
																headerValue="Select Category" headerKey="-1"
																theme="simple" list="%{reqCategory}"
																value="%{requirementVTO.reqCatgory}"
																onchange="addRequirementSkillChange();"
																onfocus="removeErrorMessages()" />
														</div>
 --%>
														<div class="col-sm-3 required" id="">
															<label class="labelStylereq " style="color: #56a5ec;">Req.Category</label>
															<a href="#" data-toggle="tooltip" data-placement="top"
																title="Based on Category selected Interview is Processed by same Category Recruiter">
																<img src="/sb/includes/images/icons/isymbol.png"
																width="15" height="15" />
															</a>
															<s:select id="reqCategoryValue" name="reqCategoryValue"
																cssClass="SelectBoxStyles form-control"
																headerValue="Select Category" headerKey="-1"
																theme="simple" list="%{reqCategory}"
																value="%{requirementVTO.reqCatgory}"
																onfocus="removeErrorMessages()" />
														</div>

														<div class="col-sm-3 required" id="">
															<label class="labelStyle" id="labelLevelStatusReq">
																Type </label> <a href="#" data-toggle="tooltip"
																data-placement="top" data-html="true"
																title="&nbsp;<b>1.</b> If Type is Contract then SOW is Processed<br><b>2.</b> If Full-time then consultant becomes Permanent Customer Employee ">
																<img src="/sb/includes/images/icons/isymbol.png"
																width="15" height="15" />
															</a>
															<s:select id="RequirementTaxTerm"
																list="#@java.util.LinkedHashMap@{'CO':'Contract','C2C':'Contract To Hire','PE':'Fulltime'}"
																headerKey="CO" cssClass="SelectBoxStyles form-control"
																onfocus="removeErrorMessages()"
																value="%{requirementVTO.RequirementTaxTerm}"
																onchange="showHideEndDate();" />
														</div>
														<div class="col-sm-3 required" id="">
															<label class="labelStyle" id="labelLevelStatusReq">Desired
																Start Date </label>
															<div class="calImage">
																<s:textfield cssClass="form-control"
																	id="RequirementFrom" placeholder="Start Date"
																	value="%{requirementVTO.RequirementFrom}"
																	onkeypress="return enterDateRepository();"
																	cssStyle="z-index: 10000004;"
																	onfocus="removeErrorMessages()">
																	<i class="fa fa-calendar"></i>
																</s:textfield>
															</div>
														</div>
														<div class="col-sm-3 required" id="endDateDiv"
															style="display: none;">
															<label class="labelStyle" id="labelLevelStatusReq">Expected
																End Date </label>
															<div class="calImage">
																<s:textfield cssClass="form-control" id="RequirementEnd"
																	placeholder="End Date"
																	value="%{requirementVTO.RequirementEnd}"
																	onkeypress="return enterDateRepository();"
																	cssStyle="z-index: 10000004;"
																	onfocus="removeErrorMessages()">
																	<i class="fa fa-calendar"></i>
																</s:textfield>
															</div>
														</div>


														<div class="col-sm-3 required" id="duration"
															style="display: none">
															<label class="labelStylereq" style="color: #56a5ec;">
																Duration </label>
															<div class="form-group input-group"
																style="display: list-item; list-style-type: none; margin: 0">
																<s:textfield
																	cssClass="form-control textMessageBox numeric_field"
																	id="RequirementDuration" type="text"
																	value="%{requirementVTO.RequirementDuration}"
																	placeholder="Duration" onfocus="removeErrorMessages()"
																	maxLength="10"
																	onkeypress="return durationValidation(event)" />
																<s:select id="requirementDurationDescriptor"
																	value="%{requirementVTO.requirementDurationDescriptor}"
																	list="#@java.util.LinkedHashMap@{'Hours':'Hours','Weeks':'Weeks','Months':'Months'}"
																	headerKey="-1" headerValue="Select"
																	cssClass="SelectBoxStyles form-control select_duration "
																	onfocus="removeErrorMessages()" style="" />
															</div>
														</div>


														<s:hidden id="RequirementType"
															list="#@java.util.LinkedHashMap@{'VR':'Vendor'}"
															value="VR" headerKey="" headerValue="--select--"
															cssClass="selectBoxStyle form-control" />
														<s:hidden id="accountSearchID" name="accountSearchID"
															value="%{accountSearchID}" />
													</div>



													<div style="display: none;">
														<label class="labelStyle" id="labelLevelStatusReq">
															Approver</label>
														<s:select id="RequirementContact1" list="recruitmentMap"
															headerKey="-1" headerValue="--select--"
															cssClass="SelectBoxStyles form-control"
															onchange="getid()" onfocus="removeErrorMessages()"
															value="%{requirementVTO.RequirementContact1}" />
													</div>
													<div style="display: none;">
														<label class="labelStyle" id="labelLevelStatusReq">
															Requisitioner</label>
														<s:select id="RequirementContact2" list="recruitmentMap"
															headerKey="-1" headerValue="--select--"
															cssClass="SelectBoxStyles form-control"
															onfocus="removeErrorMessages()"
															value="%{requirementVTO.RequirementContact2}" />
													</div>
													<div style="display: none;">
														<label class="labelStyle" id="labelLevelStatusReq">Billing&nbsp;Contact
														</label>
														<s:select id="billingContact" name="buildingContact"
															list="recruitmentMap" headerKey="-1"
															headerValue="--select--"
															cssClass="SelectBoxStyles form-control"
															onfocus="removeErrorMessages()"
															value="%{requirementVTO.billingContact}" />
													</div> <s:hidden id="RequirementStatus" value="O"
														list="#@java.util.LinkedHashMap@{'O':'Open'}"
														headerKey="DF" headerValue="--select--"
														cssClass="SelectBoxStyles form-control"
														onfocus="removeErrorMessages()" />


													<div></div>
													<div class="col-sm-7 "></div>

													<div class="col-sm-12 required">
														<label class="labelStyle" id="labelLevelStatusReq">Description
														</label>
														<s:textarea name="RequirementJobdesc"
															id="RequirementJobdesc" cssClass="form-control"
															value="%{requirementVTO.RequirementJobdesc}"
															placeholder="Enter Requirement job description Here"
															cols="127" rows="3" onkeyup=" JobCheckCharacters(this)"
															onfocus="removeErrorMessages()" />
														<div class="charNum pull-right" id="JobcharNum"></div>
													</div>
													<div class="col-sm-12 required">
														<label class="labelStyle" id="labelLevelStatusReq">Responsibilities
														</label>
														<s:textarea name="RequirementResponse"
															id="RequirementResponse" cssClass="form-control"
															value="%{requirementVTO.RequirementResponse}"
															placeholder="Enter Requirement Responsibilities Here"
															cols="127" rows="3"
															onkeyup=" ResponseCheckCharacters(this)"
															onfocus="removeErrorMessages()" />
														<div class="charNum pull-right" id="ResponsecharNum"></div>
													</div>
													<div class="col-sm-12 required">
														<label class="labelStyle" id="labelLevelStatusReq">Qualification
														</label>
														<s:textarea name="requirementQualification"
															id="requirementQualification" cssClass="form-control"
															value="%{requirementVTO.RequirementQualification}"
															placeholder="Enter Qualification Here" cols="127"
															rows="3" onkeyup=" QualificationCheckCharacters(this)"
															onfocus="removeErrorMessages()" />
														<div class="charNum pull-right" id="req_Qualification"></div>
													</div>
													<div class="col-sm-14">
														<div class="col-sm-6 ">
															<span class="required"> <s:if
																	test="copyReqFlag==0">
																	<label class="labelStyle skills"
																		id="labelLevelStatusReq">Skill&nbsp;Set </label>
																	<s:select cssClass="" name="skillCategoryValue"
																		id="skillCategoryValue" list="skillSetValuesMap"
																		multiple="true" onfocus="removeErrorMessages()" />
																</s:if> <s:else>
																	<label class="labelStyle skills"
																		id="labelLevelStatusReq">Skill&nbsp;Set </label>
																	<s:select cssClass="" name="skillCategoryValue"
																		id="skillCategoryValue" list="skillSetValuesMap"
																		value="%{requirementVTO.skillSetList}" multiple="true"
																		onfocus="removeErrorMessages()" />
																</s:else>
															</span>
														</div>
														<div class="col-sm-6 ">
															<label class="labelStyle" id="labelLevelStatusReq">Preferred&nbsp;Skills
															</label>
															<s:select cssClass="" name="preSkillCategoryValue"
																id="preSkillCategoryValue" list="preSkillValuesMap"
																multiple="true" onfocus="clearErrosMsgForGrouping()"
																value="%{requirementVTO.preSkillSetList}" />
														</div>
													</div>
													<div class="col-sm-12 ">
														<div class="col-sm-6">
															<div class="charNum pull-right" id="SkillcharNum"></div>
														</div>
														<div class="col-sm-6">
															<div class="charNum pull-right"
																id="PreferredSkillcharNum"></div>
														</div>
													</div>
													<div class="col-sm-12">
														<label class="labelStyle" id="labelLevelStatusReq">Comments
														</label>
														<s:textarea name="RequirementComments"
															id="RequirementComments" cssClass="form-control"
															value="%{requirementVTO.RequirementComments}"
															placeholder="Enter Comments Here" cols="127" rows="3"
															onkeyup="CommentsCheckCharacters(this)"
															onfocus="removeErrorMessages()" />
														<div class="charNum pull-right" id="CommcharNum"></div>
													</div>
													<div class="col-sm-6 pull-right ">

														<div class="col-sm-2 contact_search pull-right">
															<s:submit type="button" id="requirementSubmit"
																cssStyle="margin:5px 14px;"
																cssClass="add_searchButton fa fa-check-circle-o  form-control"
																onclick="return addRequirement()" value="Save"
																theme="simple" />
														</div>
														<div class="col-sm-2 contact_search pull-right">
															<input type="button" id="requirementClear"
																style="margin: 5px 14px;"
																class="add_searchButton  form-control fa fa"
																value="&#xf12d; Clear" theme="simple"
																onfocus="removeErrorMessages()"
																onclick="clearFormFields()" /> &nbsp;
														</div>
													</div>
											</s:form>
										</div>
									</div>
								</div>
								<%--close of future_items--%>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
	<!-- content end -->
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
		src="<s:url value="/includes/js/general/selectivity-full.min.js"/>"></script>
	<link rel="stylesheet" type="text/css"
		href="<s:url value="/includes/css/general/selectivity-full.css"/>">

	<%-- 	<script>	
	$(document).ready(function() {
		$('#skillCategoryValue').selectivity({
			multiple : true,
			placeholder : 'Type to search skills'
		});
		$('#skillCategoryValue').change(function(e) {

			removeErrorMessages();
		});
	});
</script> --%>
	<script>
		$(document).ready(function() {
			$('#skillCategoryValue').selectivity({
				multiple : true,
				placeholder : 'Type to search skills'
			});
			$('#skillCategoryValue').change(function(e) {

				removeErrorMessages();
			});
			$('#preSkillCategoryValue').selectivity({

				multiple : true,
				placeholder : 'Type to search skills'
			});
			$('#preSkillCategoryValue').change(function(e) {

				removeErrorMessages();
			});

			$('[data-toggle="tooltip"]').tooltip();
		});
	</script>
	</script>
	
	<script type="text/JavaScript"
		src="<s:url value="/includes/js/bootstrap.min.js"/>"></script>
</body>
</html>




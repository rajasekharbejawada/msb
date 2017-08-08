<%--
    Document   : MenuSales
    Created on : Feb 3, 2015, 8:32:32 PM
    Author     : Nagireddy
--%>

<%@ page contentType="text/html; charset=UTF-8"
	errorPage="../../exception/403.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ page import="java.util.List" isErrorPage="true"%>
<%@ page import="com.mss.msp.util.ApplicationConstants"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<!DOCTYPE html>

<script type="text/javascript"
	src="<s:url value="/includes/js/jquery.js"/>"></script>
<%
	String actionName = ActionContext.getContext().getName();
	String consultantFlag = request.getParameter("consultantFlag");
	System.out.println("action name" + actionName);
	System.out.println("consultantFlag name" + consultantFlag);
%>
<span id="action" style="display: none"><%=actionName%></span>
<span id="searchFlagForLeftMenu" style="display: none"><%=consultantFlag%></span>

<div class="col-sm-12 col-md-3 col-lg-2 side_menu">
	<div class="left-sidebar">

		<div class="panel-group category-products" id="accordian">


			<div class="panel panel-default left-menu" id="accordian_my">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a id="homeVendorEmpLeftMenu" data-toggle="collapse"
							data-parent="#accordian" href="#homeMenuVenEmp"> <i
							class="fa fa-home leftBullet"></i> <span id="homeAdmin"
							class="pull-right"><i id="testIconHome"
								class="fa fa-sort-asc" style="color: white;"></i></span> Home
						</a>
					</h4>
				</div>
				<div id="homeMenuVenEmp" class="panel-collapse collapse">
					<div class="panel-body">
						<ul id="homeDisplay">
							<%
								String usrId = session.getAttribute(ApplicationConstants.USER_ID).toString();
								String orgId = session.getAttribute(ApplicationConstants.ORG_ID).toString();
							%>
							<s:if test="%{#session['usrgrpid']==1}">
								<li><a id="consultantsHomeMenuVen"
									href="/<%=ApplicationConstants.CONTEXT_PATH%>/recruitment/consultant/getMyConsultantSearch.action?consultantFlag=My"
									onClick="leftMenuToggleIdSearchFlag(this,'homeAdmin','My');"><img
										src="<s:url value="/includes/images/icons/contactSearch.png"/>"
										height="15" width="15">&nbsp;Search&nbsp;Consultant</a></li>
								<li><a id="addConsultantHomeMenuVen"
									href="/<%=ApplicationConstants.CONTEXT_PATH%>/recruitment/consultant/addConsultant.action"
									onClick="leftMenuToggleId(this,'homeAdmin');"><img
										src="<s:url value="/includes/images/icons/addConsultant.png"/>"
										height="15" width="15">&nbsp;Add&nbsp;Consultant</a></li>
								<li><a id="requirementsDashboardUtilitiesMenuVen"
									href="/<%=ApplicationConstants.CONTEXT_PATH%>/recruitment/consultant/getLoginUserRequirementList.action?accountFlag=MyRequirements&orgid=<%=orgId%>&vendor=yes"
									onClick="leftMenuToggleId(this,'homeAdmin');"><img
										src="<s:url value="/includes/images/icons/requirement.png"/>"
										height="15" width="15">&nbsp;Requirements</a></li>

								<li><a id="submissionsHomeProjectManager"
									href="/<%=ApplicationConstants.CONTEXT_PATH%>/Requirements/getSubmissionList.action?pageFlag=submitList"
									onClick="leftMenuToggleId(this,'homeAdmin');"><i
										class="fa fa-users" aria-hidden="true"
										style="color: CornflowerBlue"></i>&nbsp;Submitted&nbsp;Profiles</a></li>

								<li><a id="techReviewsHomeMenuVen"
									href="/<%=ApplicationConstants.CONTEXT_PATH%>/recruitment/consultant/getTechReviewDetails.action?pageFlag=techReviewList"
									onClick="leftMenuToggleId(this,'homeAdmin');"><img
										src="<s:url value="/includes/images/icons/review.png"/>"
										height="15" width="15">&nbsp;Tech&nbsp;Reviews</a></li>

							</s:if>
							<s:if test="%{#session['usrgrpid']==2}">
								<li><a id="contractsUtilitiesMenuVen"
									href="/<%=ApplicationConstants.CONTEXT_PATH%>/sag/sow/getSowList.action"
									onClick="leftMenuToggleId(this,'homeAdmin');"><img
										src="<s:url value="/includes/images/icons/aggrement.png"/>"
										height="15" width="15">&nbsp;Contracts</a></li>
								<li><a id="invoiceUtilitiesMenuVen"
									href="/<%=ApplicationConstants.CONTEXT_PATH%>/sag/getInvoice.action"
									onClick="leftMenuToggleId(this,'homeAdmin');"><img
										src="<s:url value="/includes/images/icons/invoiceImg.png"/>"
										height="15" width="15">&nbsp;Invoice</a></li>
							</s:if>
							<%--  <li><a href="/<%=ApplicationConstants.CONTEXT_PATH%>/users/general/myprofile.action">Profile</a></li>
                            <li><a id="profileHomeMenuVen" href="/<%=ApplicationConstants.CONTEXT_PATH%>/acc/accountcontactedit.action?contactId=<%=usrId%>&accountSearchID=<%=orgId%>&flag=customerlogin" onClick="leftMenuToggleId(this,'homeAdmin');"><img src="<s:url value="/includes/images/icons/editProfile.png"/>" height="15" width="15">&nbsp;Profile</a></li>--%>
							<li><a id="timesheetsHomeMenuVen"
								href="/<%=ApplicationConstants.CONTEXT_PATH%>/users/timesheets/timesheetSearch.action"
								onClick="leftMenuToggleId(this,'homeAdmin');"><img
									src="<s:url value="/includes/images/icons/timesheet_icon.png"/>"
									height="15" width="15">&nbsp;My&nbsp;Timesheets</a></li>
							<li><a id="tasksHomeMenuVen"
								href="/<%=ApplicationConstants.CONTEXT_PATH%>/users/tasks/doTasksSearch.action"
								onClick="leftMenuToggleId(this,'homeAdmin');"><img
									src="<s:url value="/includes/images/icons/addTask.png"/>"
									height="15" width="15">&nbsp;My&nbsp;Tasks</a></li>

						</ul>
					</div>
				</div>
			</div>
			<s:if test="%{#session['usrgrpid']==1}">
				<div class="panel panel-default left-menu" id="accordian_services">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a id="dashboardVendorEmpLeftMenu" data-toggle="collapse"
								data-parent="#accordian" href="#dashboardMenuVen"> <i
								class="fa fa-tachometer leftBullet"></i> <span
								id="dashboardAdmin" class="pull-right"><i
									id="testIconDashboard" class="fa fa-sort-asc"
									style="color: white;"></i></span> Dashboard
							</a>
						</h4>
					</div>
					<div id="dashboardMenuVen" class="panel-collapse collapse">
						<div class="panel-body">
							<ul id="dashboardDisplay">

								<li><a id="requirementsDashboardVenEmp"
									href="/<%=ApplicationConstants.CONTEXT_PATH%>/dashboard/getVendorRequirementsDashboards.action"
									onClick="leftMenuToggleId(this,'dashboardAdmin');"><i
										class="fa fa-bar-chart-o" style="color: blue"></i>&nbsp;Requirements&nbsp;</a></li>

							</ul>
						</div>
					</div>
				</div>
			</s:if>
			<s:if
				test="%{#session['usrgrpid']==1||#session['usrgrpid']==2||#session.primaryrole == 9}">
				<div class="panel panel-default left-menu" id="accordian_services">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a id="utilitiesVendorEmpLeftMenu" data-toggle="collapse"
								data-parent="#accordian" href="#utiltiesMenuVen"> <i
								class="fa fa-cogs leftBullet"></i> <span id="utilitiesAdmin"
								class="pull-right"><i id="testIconUtilities"
									class="fa fa-sort-asc" style="color: white;"></i></span> Utilities

							</a>
						</h4>
					</div>
					<div id="utiltiesMenuVen" class="panel-collapse collapse">
						<div class="panel-body">
							<ul id="utilitiesDisplay">
								<%-- <li><a id="changePasswordUtilitiesMenuVen" href="/<%=ApplicationConstants.CONTEXT_PATH%>/general/changeMyPassword.action" onClick="leftMenuToggleId(this,'utilitiesAdmin');"><img src="<s:url value="/includes/images/icons/changePass.png"/>" height="15" width="15">&nbsp;Change Password</a></li>--%>
								<s:if test="#session.primaryrole == 9">
									<li><a id="consultantsUtilitiesMenuVenAll"
										href="/<%=ApplicationConstants.CONTEXT_PATH%>/recruitment/consultant/getMyConsultantSearch.action?consultantFlag=All"
										onClick="leftMenuToggleIdSearchFlag(this,'utilitiesAdmin','All');"><img
											src="<s:url value="/includes/images/icons/contactSearch.png"/>"
											height="15" width="15">&nbsp;Search&nbsp;Consultant</a></li>
								</s:if>

								<s:if test="%{#session['usrgrpid']==1}">
									<li><a id="consultantsUtilitiesMenuVen"
										href="/<%=ApplicationConstants.CONTEXT_PATH%>/recruitment/consultant/getMyConsultantSearch.action?consultantFlag=Open"
										onClick="leftMenuToggleIdSearchFlag(this,'utilitiesAdmin','Open');"><img
											src="<s:url value="/includes/images/icons/contactSearch.png"/>"
											height="15" width="15">&nbsp;Open&nbsp;Consultants</a></li>

									<li><a id="requirementsDashboardUtilitiesMenuVen"
										href="/<%=ApplicationConstants.CONTEXT_PATH%>/Requirements/vendorRatingAndReveiw.action?vendorOrgId=<%=orgId%>"
										onClick="leftMenuToggleId(this,'utilitiesAdmin');"><img
											src="<s:url value="/includes/images/icons/star.png"/>"
											height="15" width="15">&nbsp;Vendor&nbsp;Reviews</a></li>
								</s:if>
								<s:if test="%{#session['usrgrpid']==2}">
									<li><a id="allTimesheetsUtilitiesMenuVen"
										href="/<%=ApplicationConstants.CONTEXT_PATH%>/users/timesheets/getAllTimeSheets.action"
										onClick="leftMenuToggleId(this,'utilitiesAdmin');"><img
											src="<s:url value="/includes/images/icons/timesheet_icon.png"/>"
											height="15" width="15">&nbsp;Timesheets</a></li>


									<%--  <li><a id="outStandingUtilitiesMenuVen" href="/<%=ApplicationConstants.CONTEXT_PATH%>/sag/getOutstandingInvoiceList.action" onClick="leftMenuToggleId(this,'utilitiesAdmin');"><img src="<s:url value="/includes/images/icons/invoiceImg.png"/>" height="15" width="15">&nbsp;Outstanding&nbsp;Invoices</a></li>--%>
								</s:if>
							</ul>
						</div>
					</div>
				</div>
			</s:if>


			<script type="text/JavaScript"
				src="<s:url value="/includes/js/newVenEmp.js"/>"></script>

			<script type="text/javascript"
				src="<s:url value="/includes/js/jquery.scrollUp.min.js"/>"></script>


		</div>


	</div>
</div>

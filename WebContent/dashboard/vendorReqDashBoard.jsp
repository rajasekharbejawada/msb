<%--
    Document   : Vendor Dashboard
    Created on : July 01, 2015, 07:10:41 PM
--%>

<%@ page contentType="text/html; charset=UTF-8"
	errorPage="../exception/403.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<!-- new styles -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ServicesBay :: Dashboard Page</title>
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

<script type="text/JavaScript"
	src="<s:url value="/includes/js/general/jquery.min.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/jquery.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/jquery.scrollUp.min.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/bootstrap.min.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/main.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/general/jquery.toggle.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/CountriesAjax.js"/>"></script>
<script language="JavaScript"
	src='<s:url value="/includes/js/Ajax/vendorAjax.js"/>'></script>
<script language="JavaScript"
	src='<s:url value="/includes/js/general/sortable.js"/>'></script>
<script language="JavaScript"
	src='<s:url value="/includes/js/Ajax/dashBoardAjax.js"/>'></script>

<script type="text/javascript"
	src="<s:url value="/includes/js/general/glinechart.js"/>"></script>
<script>
	var pager;

	function customerDboard() {
		var paginationSize = 5;
		pager = new Pager('vendorReqDashboardResults', paginationSize);
		pager.init();
		pager.showPageNav('pager', 'pageNavPosition');

		pager.showPage(1);
	};
	function sortables_init() {
		// Find all tables with class sortable and make them sortable
		if (!document.getElementsByTagName)
			return;
		tbls = document.getElementById("vendorReqDashboardResults");
		sortableTableRows = document
				.getElementById("vendorReqDashboardResults").rows;
		sortableTableName = "vendorReqDashboardResults";
		for (ti = 0; ti < tbls.rows.length; ti++) {
			thisTbl = tbls[ti];
			if (((' ' + thisTbl.className + ' ').indexOf("sortable") != -1)
					&& (thisTbl.id)) {
				ts_makeSortable(thisTbl);
			}
		}
	};
</script>
<style>
			.bgcolor
			{
			background-color:#C0C0C0;
			border-radius:0px 20px 20px 0px;
			}
			.bgcolor h4 font
			{
			color: #ffff;
			font-weight: bold;
			}
			.border1
			{
			border:1px solid #ddd !important;
			background-color: #f9f9f9;
			 /* box-shadow: 0 0 8px rgba(0, 0, 0, 0.3) !important; */
			}
			.analysis label
			{
			font-weight:bold !important;
			/* color:green !important; */
			}
			
			</style>
</head>
<body style="overflow-x: hidden" oncontextmenu="return false"
	onload="getVendorReqDashBoardGrid();getAllCounts();">
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
									<div class="backgroundcolor col-sm-12">
														<div class="panel-heading">
															<h1 class="panel-title">
																<font color="#ffffff"><b>DashBoard</b></font>
															</h1>
														</div>
														
														
													</div>
												
								
													</div>
						<div class="col-sm-12 col-md-9 col-lg-9 right_content"
							style="background-color: #fff">
							<div class="features_items">
							<div class="bgcolor col-sm-4" style="margin-top:15px">
							      <div class="panel-heading">
												<h4 class="panel-title">
													<font color="#ffffff">Requirements</font> 
												</h4>
											</div>
										</div>
										<div class="" id="profileBox"
													style="float: left;padding:0;border:1px solid #ddd">
													
													<br>

										<!-- content start -->
										<br>
										<div id="venReqDashboardForm row">
											<div id="loadingRequirementsDash" class="loadingImg">
												<span id="LoadingContent"> <img src="<s:url value="/includes/images/Loader1.gif"/>"></span>
											</div>
											<div class="col-sm-3">
												<label class="labelStylereq " tabindex="1"
													style="color: #56a5ec;">Job Id</label>
												<s:textfield cssClass="form-control" name="job_id"
													id="job_id" placeholder="Job Id" tabindex="1" />
											</div>
											<div class="col-sm-3">
												<label class="labelStylereq " tabindex="2"
													style="color: #56a5ec;">Job Title</label>
												<s:textfield cssClass="form-control" name="jobTitle"
													id="jobTitle" placeholder="Job Title" tabindex="1" />
											</div>

											<div class="col-sm-3">

												<label style="color: #56a5ec;" class="labelStylereq">Consultant
													&nbsp;&nbsp;</label>
												<s:textfield cssClass="form-control" name="candidateName"
													id="candidateName" placeholder="Consultant"
													tabindex="3" maxLength="30" />

											</div>
											<div class="col-sm-3 pull-right" style="margin-bottom: 15px">
												<label class="" style="color: #56a5ec;"></label> <a href="#"
													id="dashBoardGridSearch"><input type="button"
													class="cssbutton_action_search form-control" value="Search"
													onclick="return getVendorReqDashBoardGrid();" tabindex="4"></a>
											</div>
										</div>

										<div class="row"></div>
										<div class="row">
											<div class="col-sm-12">
												<s:form>
													<s:hidden id="accountSearchID" value="%{id}"></s:hidden>
													<div class="emp_Content" id="emp_div" align="center"
														style="display: none">
														<table id="vendorReqDashboardResults"
															class="responsive CSSTable_task sortable" border="5">
															<tbody>
																<tr>
																    <th>Job Id</th>
																	<th>Job Title</th>
																	<th>Consultant</th>
																	<th>Status</th>
																</tr>

															</tbody>
														</table>
														<br /> <label class="page_option"> Display <select
															id="paginationOption" class="disPlayRecordsCss"
															onchange="pagerOption()" style="width: auto">
																<option>5</option>
																<option>10</option>
																<option>15</option>
																<option>20</option>
														</select> Requirements per page
														</label>
														<div align="right" class="pull-right" id="pageNavPosition"
															style="margin-right: 0vw; display: none"></div>
													</div>
												</s:form>
											</div>
										</div>
									</div>
									
									<div class="col-sm-12" style="padding:0;margin-top:35px">
									<div class="bgcolor col-sm-4">
									<div class="panel-heading">
									   <h4 class="panel-title">
									      <font color="#ffffff">Recent Requirements</font>
									   </h4>
									  </div>
									</div>
								<!-- 	<div class="col-sm-12"> -->
										<s:form theme="simple">

											<div class="row col-sm-12 border1" style="margin:0;padding-top:10px;">
												<s:iterator value="requirementlistVTO">
													<div class="col-lg-4 col-md-6">
														<div class="panel panel-white">
															<div class="panel-heading">
																<div class="row">
																	<div class="col-xs-3">
																		<img
																			src="<s:url value="/includes/images/icons/requirement.png"/>"
																			height="70" width="70">
																	</div>
																	<div class="col-xs-9 ">
																		<div class="huge">
																			<label class="labelColor">Positions: </label>
																			<s:property value="noOfPosition"></s:property>
																		</div>
																		<div>
																			<label class="labelColor">Name: </label>
																			<s:property value="title"></s:property>
																		</div>
																		<div>
																			<label class="labelColor">Avg. Rate: $</label>
																			<s:property value="targetRate"></s:property>
																		</div>
																		<div>
																			<label class="labelColor">Customer: </label>
																			<s:property value="customerName"></s:property>
																		</div>

																	</div>
																</div>
															</div>
															<s:url id="addConsult"
																action="/recruitment/consultant/doAddConsultantForReq.action"
																namespace="/" encode="true">
																<s:param name="requirementId" value="%{id}" />
																<s:param name="jdId" value="%{jdId}"></s:param>
																<s:param name="jobTitle" value="%{title}"></s:param>
																<s:param name="orgid">
																	<s:property value="%{orgId}" />
																</s:param>
																<s:param name="targetRate">
																	<s:property value="%{targetRate}" />
																</s:param>
																<s:param name="maxRate">
																	<s:property value="%{requirementMaxRate}" />
																</s:param>
															</s:url>
															<s:a href="%{#addConsult}">
																<div class="panel-footer">
																	<span class="">Add Consultant</span> <span
																		class="pull-right"><i class="fa fa-plus-square"></i></span>
																	<div class="clearfix"></div>
																</div>
															</s:a>
														</div>
													</div>
												</s:iterator>
											</div>

										</s:form>
										<span> <br /></span>

									</div>
									<%-- Current Month TAB starts --%>
												<div class="col-sm-12" style="padding:0;margin-top:35px">
													<div class="bgcolor col-sm-4">
														<div class="panel-heading">
															<h4 class="panel-title">
																<font color="#ffffff">Current Month Analysis</font>
															</h4>
														</div>
														
													</div>
													
														
												<%-- <div class="col-sm-12 border1">
									
									<div>
										<label>Requirements Count:</label>
										<span id="reqCnt"></span>
									</div>
									<div>
										<label>Placed Consultants Count:</label>
										<span id="selCnt"></span>
									</div>
									<div>
										<label> Consultant Submissions:</label>
										<span id="conCnt"></span>
									</div>
									<div>
										<label> Interview Requests:</label>
										<span id="intCnt"></span>
									</div>
									</div> --%>
									<div class="col-sm-12 border1 analysis">
												<br>
												<div class="col-sm-2" style="image-background-color:#F9F9F9">
												<img src="<s:url value="/includes/images/icons/Options-Analysis1.png"/>"
																			height="120" width="120">
												</div>
									<div class="col-sm-4">
									<div>
										<label>Requirements Count:</label>
										<span id="reqCnt"></span>
									</div>
									<div>
										<label>Placed Consultants Count:</label>
										<span id="selCnt"></span>
									</div>
									<div>
										<label> Consultant Submissions:</label>
										<span id="conCnt"></span>
									</div>
									<div>
										<label> Interview Requests:</label>
										<span id="intCnt"></span>
									</div>
									</div>
									
									</div>
									
												<%-- end of cma tab--%>
								</div>
								


								<%--close of future_items--%>
							</div>
						</div>

					</div>
				</div>
				<!-- content end -->
			</section>
			<!--/form-->
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
		src="<s:url value="/includes/js/general/pagination.js"/>"></script>

	<script type="text/javascript">
		var recordPage = 5;
		function pagerOption() {

			var paginationSize = document.getElementById("paginationOption").value;
			if (isNaN(paginationSize)) {

			}
			recordPage = paginationSize;
			$('#vendorReqDashboardResults').tablePaginate({
				navigateType : 'navigator'
			}, recordPage);

		};
		$('#vendorReqDashboardResults').tablePaginate({
			navigateType : 'navigator'
		}, recordPage);
	</script>
	<script>
		sortables_init();
	</script>
	<script type="text/JavaScript"
		src="<s:url value="/includes/js/general/placeholders.min.js"/>"></script>
</body>
</html>

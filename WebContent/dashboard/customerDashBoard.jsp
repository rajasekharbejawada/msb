<%--
    Document   : Requirements Dashboard Page
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
<title>ServicesBay :: Requirements Dashboard Page</title>
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
<%-- <link rel="stylesheet" href='<s:url value="/includes/css/general/dhtmlxcalendar.css"/>' type="text/css">
             <link rel="stylesheet" href='<s:url value="/includes/css/general/dhtmlxcalendar_omega.css"/>' type="text/css">--%>

<script type="text/JavaScript"
	src="<s:url value="/includes/js/general/jquery.min.js"/>"></script>
<%--        <script type="text/JavaScript" src="<s:url value="/includes/js/general/GridNavigation.js"/>"></script>--%>

<script type="text/JavaScript"
	src="<s:url value="/includes/js/main.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/bootstrap.min.js"/>"></script>

<script type="text/JavaScript"
	src="<s:url value="/includes/js/general/jquery.toggle.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/CountriesAjax.js"/>"></script>
<%-- <script language="JavaScript" src='<s:url value="/includes/js/general/dhtmlxcalendar.js"/>'></script>--%>
<script language="JavaScript"
	src='<s:url value="/includes/js/Ajax/vendorAjax.js"/>'></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/jquery.js"/>"></script>
<script language="JavaScript"
	src='<s:url value="/includes/js/general/sortable.js"/>'></script>
<script language="JavaScript"
	src='<s:url value="/includes/js/Ajax/dashBoardAjax.js?version=1.1"/>'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/d3/4.9.0/d3.min.js'></script>
	<script src='https://cdn.rawgit.com/jakezatecky/d3-funnel/v1.0.0/dist/d3-funnel.js'></script>

<script type="text/javascript"
	src="<s:url value="/includes/js/general/glinechart.js"/>"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script> 
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
          
           <script language="JavaScript">
            google.load("visualization", "1", {packages:["corechart"]});   
            animatedcollapse.init();
        </script>
<script>
	var pager;
	//$(document).ready(function(){
	function customerDboard() {
		//alert("hi")
		var paginationSize = 5;
		//pager = new Pager('customerDashboardResults', paginationSize);
		pager = new Pager('customerPieChartDetails', paginationSize);
		
		pager.init();
		pager.showPageNav('pager', 'pageNavPosition');
		// document.getElementById("paginationOption").value=10;

		pager.showPage(1);
	};

	//            function pagerOption(){
	//
	//                paginationSize = document.getElementById("paginationOption").value;
	//                if(isNaN(paginationSize))
	//                    alert(paginationSize);
	//
	//                pager = new Pager('customerDashboardResults', parseInt(paginationSize));
	//                pager.init();
	//                pager.showPageNav('pager', 'pageNavPosition');
	//                pager.showPage(1);
	//
	//            };
</script>

</head>
<body style="overflow-x: hidden" oncontextmenu="return false"
	onload=" getCustomerDashboardList();getTechReviewanalysis();toggleContent1('techreviewsDiv');">
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
						
						<div class="col-sm-12 col-md-9 col-lg-9 right_content"
							style="background-color: #fff">
							<!-- requirements -->
							<div class="features_items">
								<div class="col-sm-12 ">
									<div class="" id="profileBox"
										style="float: left; margin-top: 5px">
										<div class="backgroundcolor">
											<div class="panel-heading">
												<h4 class="panel-title">
													<!--<span class="pull-right"><a href="" class="profile_popup_open" ><font color="#DE9E2F"><b>Edit</b></font></a></span>-->
													<font color="#ffffff">Requirements</font> <i
														id="updownArrow"
														onclick="toggleContent('customerDashboardForm')"
														class="fa fa-minus"></i>
												</h4>
											</div>
										</div>
									</div><!-- profileBox div-->
									</div>
									<div class="col-sm-12 " id="customerDashboardForm">
										<span> <br /></span>
										<!-- content start -->
										<span id="customerDashValidation"> </span>
										<div class="col-sm-12">
											<s:form theme="simple" >

												<div class="inner-reqdiv-elements">
													<div class="row">
														<div class="col-sm-2">
															<label class="" style="color: #56a5ec;">Year </label>
															<s:textfield cssClass="form-control" id="year"
																name="year" placeholder="Year"
																onkeypress="return validationDashboardYear(event)"
																tabindex="1" />
														</div>
														<div class="col-sm-2">
															<label class="" style="color: #56a5ec;">Month </label>
															<s:select id="month"
																cssClass="form-control SelectBoxStyles" name="month"
																headerKey="-1" headerValue="All"
																list="#@java.util.LinkedHashMap@{'01':'January','02':'February','03':'March','04':'April','05':'May','06':'June','07':'July','08':'August','09':'September','10':'October','11':'November','12':'December'}"
																tabindex="2" />
														</div>

														<div class="col-sm-2">
															<div class="row">
																<div class="col-sm-11 pull-right">
																	<label class="" style="color: #56a5ec;"></label>
																	<%--<s:submit type="submit" cssClass="cssbutton_emps form-control"
                                                                                value="Search" onclick="getVendorDashboardList();"/> --%>
																	<a href="#" id="dashboardSearch"><button
																			type="button" class="add_searchButton form-control"
																			value="" style="margin: 5px 0px;"
																			onclick="getCustomerDashboardList();" tabindex="3">
																			<i class="fa fa-search"></i>&nbsp;Search
																		</button></a>
																</div>
															</div>
														</div>
													</div>
												</div>
										</div>
                                           <div id="loadingConsultant" class="loadingImg">
															<span id="LoadingContent">
															 <img src="<s:url value="/includes/images/Loader1.gif"/>"></span>
											</div>

										<%--div class="row">
                                                    <div class="col-sm-4"> <s:submit type="submit" cssClass="cssbutton_emps field-margin"
                                                              value="Search" cssStyle="margin:0px"/></div>
                                                    <div class="col-sm-4"></div>
                                                </div--%>

										</s:form>
										<span> <br /></span>
										<%--<s:submit cssClass="css_button" value="show"/><br>--%>
									<%--	<div class="col-sm-12">
											<br>
											<s:form>
												<s:hidden id="accountSearchID" value="%{id}"></s:hidden>
												<div class="emp_Content" id="emp_div" align="center"
													style="display: none">
													<table id="customerDashboardResults"
														class="responsive CSSTable_task" border="5">
														<tbody>
															<tr>
																<%--<th>Req.Won</th>
                                                                        <th>Req.Lost</th> --%>
															<%--	<th>Month</th>
																<th>Opened</th>
																<th>Released</th>
																<th>Open&nbsp;For&nbsp;Resume</th>
																<th>Closed</th>
																<th>Others</th>
																<th>Total</th>
															</tr>
															<s:if test="customerDashBoardList.size == 0">
																<tr>
																	<td colspan="7"><font
																		style="color: red; font-size: 15px; text-align: center">No
																			Records to display</font></td>
																</tr>
															</s:if>

															<s:iterator value="customerDashBoardList">
																<tr>
																	<%-- <td><s:property value="noOfReqWon"></s:property></td>
                                                                             <td><s:property value="noOfReqLose"></s:property></td>--%>
															<%--		<td><s:property value="month"></s:property></td>
																	<td><s:property value="open"></s:property></td>
																	<td><s:property value="released"></s:property></td>
																	<td><s:property value="openForResume"></s:property></td>
																	<td><s:property value="closed"></s:property></td>
																	<td><s:property value="othersCount"></s:property></td>
																	<td><s:property value="total"></s:property></td>

																</tr>
															</s:iterator>

														</tbody>
													</table>
													<br /> <label class="page_option"> Display <select
														id="paginationOption" class="disPlayRecordsCss"
														onchange="pagerOption()" style="width: auto">
															<option>5</option>
															<option>10</option>
															<option>12</option>
													</select> Months per page
													</label>
													<div align="right" class="pull-right" id="pageNavPosition"
														style="margin-right: 0vw; display: none"></div>
											</s:form>
											<script type="text/javascript">
												var dashPager = new Pager(
														'customerDashboardResults',
														10);
												dashPager.init();
												dashPager.showPageNav(
														'dashPager',
														'pageNavPosition');
												dashPager.showPage(1);
											</script>
										</div> --%>
										
									<div class="col-sm-12">
								<div class="col-lg-12 panel panel-default panel-heading">
									<i class="fa fa-bar-chart-o fa-fw"></i><span id="chartTitle"></span>
									<div align="center">
										
									</div>
									<div id="individualCustomerYearChart"></div>

								</div>
							</div>
							
							 <div class="col-sm-12"><br></div>
                            <div class="col-sm-12" id="piechartDiv">
                                <div class="col-lg-12 panel panel-default panel-heading">
                                    <i class="fa fa-bar-chart-o fa-fw"></i><span id="norecordsPie"></span><font color="green">Requirement Analysis</font><div align="center"><span id="pieChartTitle"></span></div>
                                    <br>
                                    
                                   <div class="col-sm-6">
                                         <div id="requirementPieChart" style="width: 500px; height: 250px;"></div></div>
                                        <div class="col-sm-6" id="funnelPanel">  
                                        <div id="funnelContainer">
                                   <div id="funnel" ></div></div></div>

                                </div>
                            </div>
							<div id="pieChartDrillDownGrid" style="display:none">
							    	<table id="customerPieChartDetails"
														class="responsive CSSTable_task" border="5">
														<tbody>
															<tr>
																<th>Job Id</th>
																<th>Job Title</th>
																<th>Status</th>
																<th>No.of.Submissions</th>
															</tr>
														</tbody>
													</table>
													<br /> <label class="page_option"> Display <select
														id="paginationOption" class="disPlayRecordsCss"
														onchange="pagerOption()" style="width: auto">
																<option>10</option>
															<option>15</option>
															<option>25</option>
													</select> Months per page
													</label>
													<div align="right" class="pull-right" id="pageNavPosition"
														style="margin-right: 0vw; display: none"></div>
														<script type="text/javascript">
												var dashPager = new Pager(
														'customerPieChartDetails',
														10);
												dashPager.init();
												dashPager.showPageNav(
														'dashPager',
														'pageNavPosition');
												dashPager.showPage(1);
											</script>
							</div>
								</div>
							</div>
	<!-- requirements end-->
	<!--  tech reviews start -->
	<div class="features_items">
								<div class="col-sm-12 ">
									<div class="" id="profileBox"
										style="float: left; margin-top: 5px">
										<div class="backgroundcolor">
											<div class="panel-heading">
												<h4 class="panel-title">
													<!--<span class="pull-right"><a href="" class="profile_popup_open" ><font color="#DE9E2F"><b>Edit</b></font></a></span>-->
													<font color="#ffffff">Tech Reviews</font> <i
														id="updownArrow1"
														onclick="toggleContent1('techreviewsDiv')"
														class="fa fa-minus"></i>
												</h4>
											</div>
										</div>
									</div><!-- profileBox div-->
									</div>
									<div class="col-sm-12 " id="techreviewsDiv">
										<span> <br /></span>
										<!-- content start -->
										<span id="customerDashValidation"> </span>
										<div class="col-sm-12">
											<s:form theme="simple" >

												<div class="inner-reqdiv-elements">
													
												</div>
										</div>


										<%--div class="row">
                                                    <div class="col-sm-4"> <s:submit type="submit" cssClass="cssbutton_emps field-margin"
                                                              value="Search" cssStyle="margin:0px"/></div>
                                                    <div class="col-sm-4"></div>
                                                </div--%>

										</s:form>
										<span> <br /></span>
										
										
									<div class="col-sm-12">
								<div class="col-lg-12 panel panel-default panel-heading">
									<i class="fa fa-bar-chart-o fa-fw"></i><span id="techReviewChartTitle"></span>
									<div align="center">
										
									</div>
									<div id="techReviewChart" align="center"></div>

								</div>
							</div>
							
							 <div class="col-sm-12"><br></div>
                            
							
								</div>
							</div>
<!--  tech reviews end -->



						</div>
						
							
							
							<div class="col-sm-12 col-md-9 col-lg-9 right_content"
							style="background-color: #fff">
						
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
	<script type="text/JavaScript"
		src="<s:url value="/includes/js/jquery.scrollUp.min.js"/>"></script>
	<script type="text/javascript">
		var recordPage = 10;
		/* function pagerOption() {

			var paginationSize = document.getElementById("paginationOption").value;
			if (isNaN(paginationSize)) {

			}
			recordPage = paginationSize;
			 alert(recordPage)
			$('#customerDashboardResults').tablePaginate({
				navigateType : 'navigator'
			}, recordPage);

		};
		$('#customerDashboardResults').tablePaginate({
			navigateType : 'navigator'
		}, recordPage); */
		
		function pagerOption() {
            alert("in pagination");
			var paginationSize = document.getElementById("paginationOption").value;
			if (isNaN(paginationSize)) {

			}
			recordPage = paginationSize;
			 alert(recordPage)
			$('#customerPieChartDetails').tablePaginate({
				navigateType : 'navigator'
			}, recordPage);

		};
	/* 	 $('#customerPieChartDetails').tablePaginate({
			navigateType : 'navigator'
		}, recordPage); */ 
	</script>
	<script type="text/JavaScript"
		src="<s:url value="/includes/js/general/placeholders.min.js"/>"></script>

</body>
</html>

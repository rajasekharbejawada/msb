<%--
    Document   : accountSearch
    Created on : Apr 10, 2015, 11:55:41 AM
    Author     : Kyle Bissell
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
<title>ServicesBay :: Vendors List</title>
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/bootstrap.min.css"/>">
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/home/home.css"/>">
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
	href="<s:url value="/includes/css/responsive_queries.css"/>">
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/general/selectivity-full.css"/>">
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/general/sweetalert.css"/>">
<script type="text/JavaScript"
	src="<s:url value="/includes/js/main.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/general/jquery.min.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/jquery.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/bootstrap.min.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/main.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/Ajax/AppConstants.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/general/jquery.toggle.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/CountriesAjax.js"/>"></script>
<script type="text/JavaScript"
	src='<s:url value="/includes/js/general/dhtmlxcalendar.js"/>'></script>

<script type="text/JavaScript"
	src='<s:url value="/includes/js/general/sortable.js"/>'></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/general/sweetalert.min.js"/>"></script>
<script>
	$(document).ready(function() {
		$(".img-swap").click(function() {
			$(".popup_block").animate({
				width : 'toggle'
			});
		});

		$('#specializationList').selectivity({
			//  items: ['IT', 'Engineering', 'Operations', 'Sales'],
			multiple : true,
			placeholder : 'Type to search a Specialization'
		});

		document.getElementById("loadingAcoountSearch").style.display = "none";
	});
</script>


<script type="text/javascript">
	function sortables_init() {
		// Find all tables with class sortable and make them sortable
		if (!document.getElementsByTagName)
			return;
		tbls = document.getElementById("vendorSearchResults");
		sortableTableRows = document.getElementById("vendorSearchResults").rows;
		sortableTableName = "vendorSearchResults";
		for (ti = 0; ti < tbls.rows.length; ti++) {
			thisTbl = tbls[ti];
			if (((' ' + thisTbl.className + ' ').indexOf("sortable") != -1)
					&& (thisTbl.id)) {
				ts_makeSortable(thisTbl);
			}
		}
	};

	function specialization() {
		var specializationarry = [];
		$("#specializationList :selected").each(function() {
			specializationarry.push($(this).text());
		});
		// alert(specializationarry);
		document.getElementById("specializationList").value = specializationarry;
		//  alert(document.getElementById("specializationList").value); 
		document.getElementById("venSpecializationtemp").value = specializationarry;

	}
</script>
<style>
</style>
</head>
<body style="overflow-x: hidden" oncontextmenu="return false"
	onload="loadPopup();">
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

		<!-- Model popup -->


		<!-- Model popup, end -->
		<div id="main">

			<section id="generalForm">
				<!--form-->
				<div class="container">
					<div class="row">
						<!-- content start -->
						<s:include value="/includes/menu/LeftMenu.jsp" />
						<div class="col-sm-12 col-md-9 col-lg-9 right_content"
							style="background-color: #fff">
							<div class="features_items">
								<div class="col-sm-12 ">
									<div class="" id="profileBox"
										style="float: left; margin-top: 5px">
										<div class="backgroundcolor">
											<div class="panel-heading">
												<h4 class="panel-title">
													<font color="#ffffff">Vendors</font> <i id="updownArrow"
														onclick="toggleContent('getVendorsListForConsultant')"
														class="fa fa-minus"></i>
												</h4>
											</div>
										</div>
										<!-- content start -->
										<div class="col-sm-12">
											<s:form action="getVendorsListForConsultant" method="post"
												theme="simple">
												<br>



												<div class="inner-reqdiv-elements">

													<div class="col-sm-4">
														<s:hidden name="vendorCountryStateFlag"
															value="formsubmittion" />

														<label class="labelStylereq"">Name </label>
														<s:textfield cssClass="form-control" label="Vendor Name"
															id="venName" type="text" name="venName"
															placeholder="Vendor Name" value="%{venName}"
															maxLength="60" />
													</div>
													<div class="col-sm-4">
														<label class="labelStylereq">URL</label>
														<s:textfield cssClass="form-control" id="venUrl"
															type="text" name="venUrl" placeholder="Vendor URL"
															value="%{venUrl}" maxLength="60" />
													</div>
													<div class="col-sm-4">
														<label class="labelStylereq">Zip</label>
														<s:textfield cssClass="form-control" id="venZip"
															name="venZip" placeholder="Zip" value="%{venZip}"
															maxLength="10" />
													</div>

												</div>
												<div class="inner-reqdiv-elements">

													<div class="col-sm-4">
														<label class="labelStylereq">Industry</label>
														<s:select id="vendorIndustry" name="vendorIndustry"
															placeholder="Vendor Industry" value="%{vendorIndustry}"
															list="%{industry}" label="Industry" headerKey="-1"
															headerValue="Select Industry"
															cssClass="SelectBoxStyles form-control" />
													</div>

													<div class="col-sm-4">
														<label class="labelStylereq">Country</label>
														<s:select id="vendorCountry" name="vendorCountry"
															placeholder="Country" value="%{vendorCountry}"
															list="%{country}" label="Country" headerKey="-1"
															headerValue="Select Country"
															cssClass="SelectBoxStyles form-control"
															onchange="javascript: getStates($(vendorCountry).val(),'#vendorState')" />
													</div>

													<div class="col-sm-4">
														<label class="labelStylereq">State</label>
														<s:select id="vendorState" name="vendorState"
															placeholder="State" value="%{vendorState}"
															list="%{permanentState}" label="State" headerKey="-1"
															headerValue="Select State"
															cssClass="SelectBoxStyles form-control" />
													</div>

												</div>

												<div class="col-sm-2 pull-right">

													<s:submit id="vendorSearchButton" type="button"
														cssClass="add_searchButton  form-control"
														cssStyle="margin:28px 0px 15px 0px">
														<i class="fa fa-search"></i>&nbsp;Search</s:submit>
												</div>


											</s:form>
											<br>

											<div id="loadingAcoountSearch" class="loadingImg">
												<span id="LoadingContent"> <img
													src="<s:url value="/includes/images/Loader1.gif"/>"></span>
												></span>
											</div>

											<div class="col-sm-12">
												<s:form>


													<table id="vendorSearchResults"
														class="responsive CSSTable_task sortable" border="5">
														<tbody>
															<tr>
																<th class="unsortable">#</th>
																<th>Name</th>
																<th class="unsortable">URL</th>

																<th>Staffing&nbsp;Mode</th>
																<th>Business&nbsp;Type</th>
																<th>State</th>
																<th>Specialization</th>
																<th class="unsortable">Consult</th>
																<th>Status</th>
															</tr>
															<s:if test="vendorsList.size == 0">
																<tr>
																	<td colspan="6"><font
																		style="color: red; font-size: 15px; text-align: center">No
																			Records to display</font></td>
																</tr>
															</s:if>
															<%
																String flag = "accDetails";
																	int i = 1;
															%>
															<s:iterator value="vendorsList">


																<tr>
																	<td><%=i%></td>
																	<td><s:property value="name"></s:property></td>
																	<td><s:a href="#"
																			onclick="window.open('http://%{url}');">
																			<s:property value="url" />
																		</s:a></td>

																	<td><s:property value="staffingMode"></s:property></td>
																	<td><s:property value="businessType"></s:property></td>
																	<td><s:property value="vendorState"></s:property></td>
																	<td><s:property value="venSpecialization"></s:property></td>
																	<td><center>
																			<s:if test="consultVenAssociateFlag=='yes'">
																				<i class="fa fa-user-plus fa-size"
																					style="opacity: 0.3"></i>
																			</s:if>
																			<s:else>
																				<s:a href="javascript:void(0);"
																					onclick="consultVendors(%{id})">
																					<i class="fa fa-user-plus fa-size"></i>
																				</s:a>
																			</s:else>
																		</center></td>
																	<td><s:property value="status"></s:property></td>


																	<%
																		i++;
																	%>
																</tr>
															</s:iterator>

														</tbody>
													</table>
													<br />
													<s:if test="vendorsList.size > 0">
														<label> Display <select id="paginationOption"
															onchange="pagerOption()" style="width: auto"
															class="disPlayRecordsCss">
																<option>10</option>
																<option>15</option>
																<option>25</option>
																<option>50</option>
														</select> Accounts per page
														</label>
													</s:if>
												</s:form>
											</div>

										</div>
									</div>
								</div>
								<%--close of future_items--%>
							</div>
						</div>
					</div>

				</div>
		</div>

		<!-- content end -->
		</section>
		<!--/form-->
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
	<script type="text/JavaScript"
		src="<s:url value="/includes/js/jquery.scrollUp.min.js"/>"></script>
	<script type="text/javascript"
		src="<s:url value="/includes/js/general/pagination.js"/>"></script>

	<script type="text/javascript">
	function consultVendors(vendorId){
		
	swal({
		 title: "Are You Sure to Submit your Resume to this Vendor ?",
		  
         //text: "Tranfering csr",
         textSize:"170px",
         type: "warning",
         showCancelButton: true,
         confirmButtonColor: "#3498db",
         cancelButtonText: "No",
         confirmButtonText: "Yes",
         closeOnConfirm: false,
         closeOnCancel: false
		},
		function(isConfirm){
		  if (isConfirm) {
			  initSessionTimer();
			    var url = CONTENXT_PATH + '/recruitment/consultantLogin/doConsultantVendorAssociation.action?vendorId=' + vendorId;
			           
			   // alert(url)
			    var req = initRequest(url);
			    req.onreadystatechange = function() {
			        if (req.readyState == 4) {
			            if (req.status == 200) {
			            	// Success
			            }
			        }
			    };
			    req.open("GET", url, "true");
			    req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			    req.send(null);
			  
			  swal("Success", "Submitted Successfully  ", "success");
		  } else {
			  swal("Cancelled", " Cancelled ", "error");
		  }
		});
	}
	
	function consultVendors1(vendorId){
		initSessionTimer();
	    var url = CONTENXT_PATH + '/recruitment/consultantLogin/doConsultantVendorAssociation.action?vendorId=' + vendorId;
	           
	   // alert(url)
	    var req = initRequest(url);
	    req.onreadystatechange = function() {
	        if (req.readyState == 4) {
	            if (req.status == 200) {
	                alert(req.responseText);
//	                if (req.responseText == 'Updated') {
//	                    $("res").html(" <font color='green'>Record Denied Successfully!</font>");
//	                    $("#SOWSpan").show().delay(5000).fadeOut();
//	                } else {
//	                    $("res").html(" <font color='green'>Record saved Successfully!</font>");
//	                    $("#SOWSpan").show().delay(5000).fadeOut();
//	                }

	            }
	        }
	    };
	    req.open("GET", url, "true");
	    req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	    req.send(null);
}
	
	
		var recordPage = 10;
		function pagerOption() {

			var paginationSize = document.getElementById("paginationOption").value;
			if (isNaN(paginationSize))
				alert(paginationSize);
			recordPage = paginationSize;

			$('#vendorSearchResults').tablePaginate({
				navigateType : 'navigator'
			}, recordPage);

		};
		$('#vendorSearchResults').tablePaginate({
			navigateType : 'navigator'
		}, recordPage);
	</script>
	<script>
		sortables_init();
	</script>
	<script type="text/JavaScript"
		src="<s:url value="/includes/js/general/placeholders.min.js"/>"></script>
	<script type="text/JavaScript"
		src="<s:url value="/includes/js/general/selectivity-full.min.js"/>"></script>
	<script type="text/JavaScript"
		src='<s:url value="/includes/js/Ajax/vendorAjax.js"/>'></script>
</body>
</html>

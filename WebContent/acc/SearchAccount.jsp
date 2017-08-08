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
<title>ServicesBay :: Accounts Search Page</title>
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
<script type="text/JavaScript"
	src="<s:url value="/includes/js/main.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/Ajax/AppConstants.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/general/jquery.min.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/jquery.js"/>"></script>
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
	src='<s:url value="/includes/js/Ajax/vendorAjax.js"/>'></script>
<script language="JavaScript"
	src='<s:url value="/includes/js/general/sortable.js"/>'></script>
	
<script>
            $(document).ready(function(){
                $(".img-swap").click(function(){
                    $(".popup_block").animate({
                        width: 'toggle'
                    });
                });
                
                $('#staffingModeList').selectivity({
                    //  items: ['IT', 'Engineering', 'Operations', 'Sales'],
                      multiple: true,
                      placeholder: 'Type to search a staffing Mode'
                  });
                
              
                
                document.getElementById("loadingAcoountSearch").style.display="none";
            });
        </script>


<script type="text/javascript">
            var myCalendar;

            function doOnLoad(){
                myCalendar = new dhtmlXCalendarObject(["accountLastAccessDate"]);
                myCalendar.setSkin('omega');
                myCalendar.setDateFormat("%m-%d-%Y ");
                myCalendar.hideTime();
                var today = new Date();
                var maxPastDate = new Date(today.getFullYear()-3,today.getMonth(),today.getDate());
                myCalendar.setSensitiveRange(maxPastDate, today);
                document.getElementById("accountLastAccessDate").value=overlayDate;
            }
            function sortables_init() {
                // Find all tables with class sortable and make them sortable
                if (!document.getElementsByTagName) return;
                tbls = document.getElementById("accountSearchResults");
                sortableTableRows = document.getElementById("accountSearchResults").rows;
                sortableTableName = "accountSearchResults";
                for (ti=0;ti<tbls.rows.length;ti++) {
                    thisTbl = tbls[ti];
                    if (((' '+thisTbl.className+' ').indexOf("sortable") != -1) && (thisTbl.id)) {
                        ts_makeSortable(thisTbl);
                    }
                }
            };
            
            function setHiddenValues(){
            	var staffingModearray = [];
                $("#staffingModeList :selected").each(function() {
                	staffingModearray.push($(this).text());
                });
              // alert(staffingModearray);
                document.getElementById("staffingModeList").value = staffingModearray;
              //alert(document.getElementById("staffingModeList").value); 
                document.getElementById("staffingModeTemp").value = staffingModearray;
                
                
            }

        </script>
</head>
<body style="overflow-x: hidden" oncontextmenu="return false"
	onload="getSearchAccList(1);loadPopup(); doOnLoad()">
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
													<font color="#ffffff">Account Search</font> <i
														id="updownArrow"
														onclick="toggleContent('searchAccountsBy')"
														class="fa fa-minus"></i>
												</h4>
											</div>
										</div>
										<!-- content start -->
										<div class="col-sm-12">
											<%-- <s:form action="searchAccountsBy" method="post"
												theme="simple" onsubmit="setHiddenValues()">  --%>
												
												<br>
												
												<div class="inner-reqdiv-elements">

													<div class="col-sm-4">
														<label class="labelStylereq" style="color: #56a5ec;">Name
														</label>
														<s:textfield cssClass="form-control" 
															id="accountName" type="text" name="account.name"
															placeholder="Account Name" value="%{account.name}"
															maxLength="60" />
													</div>
													<div class="col-sm-4">
														<label class="labelStylereq" style="color: #56a5ec;">URL</label>
														<s:textfield cssClass="form-control" id="accountUrl"
															type="text" name="account.url" placeholder="Account Url"
															value="%{account.url}" maxLength="60" />
													</div>
													<div class="col-sm-4">
														<label class="labelStylereq" style="color: #56a5ec;">Zip</label>
														<s:textfield cssClass="form-control" id="accountZip"
															type="dropdown" name="account.zip" placeholder="Zip"
															value="%{account.zip}" maxLength="10" />
													</div>

												</div>



												<div class="inner-reqdiv-elements">

													<div class="col-sm-4">
														<label class="labelStylereq" style="color: #56a5ec;">Date
														</label>
														<div class="calImage">
															<s:textfield cssClass="form-control  "
																id="accountLastAccessDate" type="dropdown"
																name="account.lastAccessDate"
																placeholder="Last access date"
																value="%{account.lastAccessDate}"
																onkeypress="return enterDateRepositoryAccount(this)">
																<i class="fa fa-calendar"></i>
															</s:textfield>
														</div>
													</div>
													<div class="col-sm-4">
														<label class="labelStylereq" style="color: #56a5ec;">Country</label>
														<s:select id="accCountry" type="dropdown" listKey="%{id}"
															listValue="%{name}" name="account.country.id"
															placeholder="Country" value="%{account.country.id}"
															list="countries"  headerKey="-1"
															headerValue="Select Country"
															cssClass="SelectBoxStyles form-control"
															onchange="javascript: getStates($(accCountry).val(),'#accountState')" />
													</div>
													<div class="col-sm-4">
														<label class="labelStylereq" style="color: #56a5ec;">State</label>
														<s:select id="accountState" type="dropdown"
															name="account.state.id" placeholder="State"
															value="%{account.state.id}" list="accountState"
															 headerKey="-1" listKey="%{id}"
															listValue="%{name}" headerValue="Select State"
															cssClass="SelectBoxStyles form-control" />
													</div>

												</div>


												<div class="inner-reqdiv-elements">
													<s:if test="#session.primaryrole != 1">
														<div class="col-sm-4">
															<label class="labelStylereq" style="color: #56a5ec;">Type
															</label>
															<s:select id="accountType" type="dropdown"
																name="account.typeId" placeholder="Type"
																value="%{account.typeId}" list="types"
																 headerKey="-1"
																headerValue="Select Account Type"
																cssClass="SelectBoxStyles form-control" />
														</div>
													</s:if>
													<div class="col-sm-4">
														<label class="labelStylereq" style="color: #56a5ec;">Industry</label>
														<s:select id="accountIndustry" type="dropdown"
															name="account.industryId" placeholder="Industry"
															value="%{account.industryId}" list="industries"
															 headerKey="-1"
															headerValue="Select Industry"
															cssClass="SelectBoxStyles form-control" />
													</div>
													<div class="col-sm-4">
														<label class="labelStylereq" style="color: #56a5ec;">Status</label>
														<s:select id="accountStatus" type="dropdown"
															name="account.status" placeholder="Status"
															value="%{account.status}" list="accountStatus"
															 headerKey="-1" headerValue="Select Status"
															cssClass="SelectBoxStyles form-control" />
													</div>
												</div>

												<div class="inner-reqdiv-elements">
													<div class="col-sm-4">
														<span> <label class="labelStyle2">Diversity
														</label> <s:select cssClass="SelectBoxStyles form-control"
																id="diversity" headerKey="-1"
																headerValue="Select Diversity" name="account.diversity"
																value="%{account.diversity}"
																list="#@java.util.LinkedHashMap@{'None':'None','Women’s Business Enterprise (WBE)':'Women’s Business Enterprise (WBE)','Minority Business Enterprise (MBE)':'Minority Business Enterprise (MBE)','Other':'Other'}"
																tabindex="19" /> <%--  list="#@java.util.LinkedHashMap@{'Private':'Private','WBE':'Women’s Business Enterprise (WBE)','MBE':'Minority Business Enterprise (MBE)','O':'Other'}"   --%>
														</span>
													</div>




													<div class="col-sm-4">
														<label class="labelStylereq" style="color: #56a5ec;">Staffing
															Mode </label>
														<s:select id="staffingModeList" cssClass=""
															name="account.staffingMode"
															list="#@java.util.LinkedHashMap@{'Permanent':'Permanent','Contract':'Contract','SOW':'SOW'}"
															tabindex="" multiple="true"
															value="%{account.staffingModeList}" />
														<s:hidden id="staffingModeTemp"
															name="account.staffingModeTemp"></s:hidden>
													</div>

												</div>

												<div class="col-sm-2 pull-right">

													<s:submit id="accountSearchButton" type="button"
														cssClass="add_searchButton  form-control" value=""
														cssStyle="margin:28px 0px 15px 0px" onclick="getSearchAccList(1);">
														<i class="fa fa-search"></i>&nbsp;Search</s:submit>
												</div>


											<%--  </s:form>  --%>
											<br>
											<div class="row"></div>
											<div id="loadingAcoountSearch" class="loadingImg">
												<span id="LoadingContent"> <img
													src="<s:url value="/includes/images/Loader1.gif"/>"></span>
												></span>
											</div>
											<div class="col-sm-12">
												<s:form>
													<s:hidden id="accountSearchID" value="%{id}"></s:hidden>
													<div class="emp_Content" id="emp_div" align="center"
														style="display: none">
														<s:hidden name="pgNo" id="pgNo"/>
												<s:hidden name="searchAccountTotalRecords" id="searchAccountTotalRecords" cssClass="inputTextBlue" theme="simple"/>
														<table id="accountSearchResults"
															class="responsive CSSTable_task sortable" border="5">
															<tbody>
																<tr>
																	<th class="unsortable">#</th>
																	<th>Name</th>
																	<th class="unsortable">URL</th>
																	<th>Account Type</th>
																	<th>Staffing Mode</th>
																	<th>Diversity</th>
																	<th class="unsortable">State</th>
																	<th>Status</th>

																	<th class="unsortable">Recent Activity On</th>
																	<th class="unsortable">Recent Activity By</th>

																</tr>
																<%-- <s:if test="accounts.size == 0">
																	<tr>
																		<td colspan="10"><font
																			style="color: red; font-size: 15px; text-align: center">No
																				Records to display</font></td>
																	</tr>
																</s:if>
																<%
																	String flag = "accDetails";
																		int i = 1;
																%>
																 --%><%-- <s:iterator value="accounts">
																	<!--build url TO goto Account Details-->
																	<s:url id="accountDetailsUrl" action="viewAccount"
																		namespace="/acc" encode="true">
																		<s:param name="accountSearchID" value="%{id}" />
																		<s:param name="accFlag"><%=flag%></s:param>
																	</s:url>
																	<tr>
																		<td><%=i%></td>
																		<td><s:a href="%{accountDetailsUrl}">
																				<s:property value="name"></s:property>
																			</s:a></td>
																		<td><s:a href="#"
																				onclick="window.open('http://%{url}');">
																				<s:property value="url" />
																			</s:a></td>
																		<td><s:property value="type"></s:property></td>
																		<td><s:property value="staffingMode"></s:property></td>
																		<td><s:property value="diversity"></s:property></td>
																		<td><s:property value="state.name"></s:property></td>
																		<td><s:property value="status"></s:property></td>
																		<td><s:property value="lastAccessDateString"></s:property></td>
																		<td><s:a href="#"
																				onclick="getEmpMailPhone(%{lastAccessById});"
																				cssClass="emailPhoneShow_popup_open">
																				<s:property value="lastAccessBy"></s:property>
																			</s:a></td>

																		<%
																			i++;
																		%>
																	</tr>
																</s:iterator>
 --%>
															</tbody>
														</table>
														<br />
														
															<label class="page_option"> Display <select id="paginationOption"
																onchange="getSearchAccList(1)" style="width: auto"
																class="disPlayRecordsCss">
																	<option>10</option>
																	<option>15</option>
																	<option>25</option>
																	<option>50</option>
															</select> Accounts per page
															</label>
														<span id="accountSearch_pageNation"></span>
																										<div align="right" id="searchAccPageNavPosition"
																					style="margin-right: 0vw; display: none"
																					class="pull-right"></div>

																				<script type="text/javascript">
																					var searchAccPag = new Pager(
																							'accountSearchResults',
																							10);
																					searchAccPag
																							.init();
																					searchAccPag
																							.showPageNav(
																									'searchAccPag',
																									'searchAccPageNavPosition');
																					searchAccPag
																							.showPage(1);
																				</script>
										 																		
 												</s:form>
											</div>
										</div>
									</div>
								</div>
								<%--close of future_items--%>
							</div>
						</div>
					</div>
					<s:if test="%{responceFlag==0}">

						<%--  <div class="side_popup">

                                    <div class="popup_block"> 

                                        <div class="addlink" style="height: 30px;" >
                                            <s:url id="myUrl" action="/../../../Requirements/addRequirements.action">
                                                <s:param name="accountSearchID"><s:property value="orgid"/></s:param>
                                                <s:param name="customerFlag" value="%{customerFlag}" ></s:param> 
                                            </s:url>

                                            <div class="alignField">
                                                <a id="addAccountSidePopupLink" href="accountadd.action" class="add_Acc">Add Account</a> </div>
                                        </div>

                                    </div>


                                    <div class="slide_popup account"><i class="fa fa-user-plus fa-2 img-swap" ></i></div>
                                </div>  --%>


					</s:if>
				</div>
		</div>
		<div id="emailPhoneShow_popup">
			<div id="emailPhoneShowBoxOverlay">
				<div class="overlayOrButton_color">
					<table>
						<tr>
							<td><h4 style="">
									<font color="#ffffff">&nbsp;&nbsp;Employee
										Details&nbsp;&nbsp; </font>
								</h4></td>
						</tr>
						<span class=" pull-right"><h5>
								<a href="" class="emailPhoneShow_popup_close close_bg"><i
									class="fa fa-times-circle-o fa-2x"></i></a>
							</h5></span>
					</table>
				</div>
				<div>
					<form action="#" theme="simple">
						<div>
							<div class="inner-reqdiv-elements">
								<table>
									<span><error></error></span>
									<s:textfield name="email"  id="email"
										style="background-color:white;color:black;border:solid 1px #B0B0B0 ;"
										disabled="true" cssClass="form-control" />
									<s:textfield name="contactNo"  id="contactNo"
										style="background-color:white;color:black;border:solid 1px #B0B0B0 ;"
										disabled="true" cssClass="form-control" />

								</table>
							</div>
						</div>
					</form>
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
		src="<s:url value="/includes/js/general/popupoverlay.js"/>"></script>
	<script type="text/JavaScript"
		src="<s:url value="/includes/js/jquery.scrollUp.min.js"/>"></script>
	
	
<%--  <script type="text/javascript">
            var recordPage=10;
            function pagerOption(){

                var paginationSize = document.getElementById("paginationOption").value;
                if(isNaN(paginationSize))
                    alert(paginationSize);
                recordPage=paginationSize;
                
                $('#accountSearchResults').tablesPaginate({navigateType:'navigator'},recordPage,accountSearchResults);

            };
           $('#accountSearchResults').tablesPaginate({navigateType:'navigator'},recordPage,accountSearchResults);
        </script> --%>
	<script>
            sortables_init();
        </script>
	<script type="text/JavaScript"
		src="<s:url value="/includes/js/general/placeholders.min.js"/>"></script>
	<script type="text/JavaScript"
		src="<s:url value="/includes/js/general/selectivity-full.min.js"/>"></script>
		<script type="text/javascript"
		src="<s:url value="/includes/js/general/dynamicPagination.js"/>"></script>		
</body>
</html>

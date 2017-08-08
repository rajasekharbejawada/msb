<%-- 
    Document   : AdminSkill Approval
    Created on : May 11, 2017
    Author     : Tasneem 
--%>

<%@ page contentType="text/html; charset=UTF-8"
	errorPage="../../exception/403.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.mss.msp.util.ApplicationConstants"%>
<!DOCTYPE html>
<html>
<head>
<!-- new styles -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ServicesBay :: Skills</title>

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
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/general/sweetalert.css"/>">


<script type="text/JavaScript"
	src="<s:url value="/includes/js/general/jquery.min.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/general/GridNavigation.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/jquery.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/bootstrap.min.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/main.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/general/jquery.toggle.js"/>"></script>
<%-- <script language="JavaScript" src="<s:url value="/includes/js/account/accountDetailsAJAX.js"/>" type="text/javascript"></script> --%>
<script language="JavaScript"
	src='<s:url value="/includes/js/general/sortable.js"/>'></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/general/sweetalert.min.js"/>"></script>


<script type="text/javascript">
	function sortables_init() {
		// Find all tables with class sortable and make them sortable
		if (!document.getElementsByTagName)
			return;
		tbls = document.getElementById("skillResults");
		sortableTableRows = document.getElementById("skillResults").rows;
		sortableTableName = "skillResults";
		for (ti = 0; ti < tbls.rows.length; ti++) {
			thisTbl = tbls[ti];
			if (((' ' + thisTbl.className + ' ').indexOf("sortable") != -1)
					&& (thisTbl.id)) {
				ts_makeSortable(thisTbl);
			}
		}
	};
	/* function onLoad()
	{
	
	    document.getElementById("loadingCsrSearch").style.display="none";
	    
	
	} */

	function skillApprovalAjax() {

		var usrId = document.getElementById('usrId').value;
		var skill_name = document.getElementById('skillname').value;
		var skill_type = document.getElementById('skilltype').value;
		var action = document.getElementById('action_select').value;
		//alert(action);
        if(action == "-1"){
        	$("#errMsg").html(
			" <font color=#FF4D4D>Please Select Approve/Reject</font>");
        	return false;
        }
		//alert(usrId + " " + skill_name + " " + skill_type+" "+action);
		var url = CONTENXT_PATH + '/users/general/skillApproval.action?empId='
				+ usrId + '&other_skill=' + skill_name + '&skill_type='
				+ skill_type+ '&action_select='+action  ;
		//alert(url);
		var req = initRequest(url);
		req.onreadystatechange = function() {
			if (req.readyState == 4 && req.status == 200) {
				//alert(req.responseText);
				document.getElementById("errMsg").innerHTML = "";
				document.getElementById("resultMessage").innerHTML = "Updated successfully";
				document.getElementById("skillApprove").style.display = "none";

			}
		};
		req.open("GET", url, false);
		req.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		req.send(null);

	}

	function reloadFunc() {
		location.reload();
	}

	function openDialogforSkillApproval(usrId, skillname, skilltype) {
		
		document.getElementById("usrId").value=usrId;
		document.getElementById("skillname").value=skillname;
		document.getElementById("skilltype").value=skilltype;
		console.log(usrId+" "+skillname+" "+skilltype);

		var specialBox = document.getElementById("resumeAttachOverlay");
		if (specialBox.style.display == "block") {
			specialBox.style.display = "none";
		} else {
			specialBox.style.display = "block";
		}
		// Initialize the plugin    
		$('#skillApproval_popup').popup();

	}

	function skillApprovalOverlayClose() {

		//alert(document.getElementById('file').value)
		var specialBox = document.getElementById("resumeAttachOverlay");
		if (specialBox.style.display == "block") {
			specialBox.style.display = "none";
		} else {
			specialBox.style.display = "block";
		}
		// Initialize the plugin    
		$('#skillApproval_popup').popup();
		reloadFunc();
		// getConsultantList();
	}
</script>
</head>
<body style="overflow-x: hidden" oncontextmenu="return false"
	onload="onLoad();">
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
									<div class="" id="profileBox"
										style="float: left; margin-top: 5px">

										<div class="backgroundcolor">
											<div class="panel-heading">
												<h4 class="panel-title">

													<!--<span class="pull-right"><a href="" class="profile_popup_open" ><font color="#DE9E2F"><b>Edit</b></font></a></span>-->
													 <font color="#ffffff">Skills</font> <!--<i id="updownArrow"
														onclick="toggleContent('skillList')" class="fa fa-minus"></i> -->

												</h4>
											</div>

										</div>
										<br>
										<%--                                     <span id="skillList">
                                            <!-- content start -->
                                            <!--<div class="col-sm-12">-->
                                                <s:form action="skillList" theme="simple" >
                                                    <div class="col-sm-4">
                                                        
                                                        <label class="labelStylereq" style="color:#56a5ec;">Skill </label>
                                                        <s:textfield id="skillName"
                                                                     cssClass="form-control"
                                                                     type="text"
                                                                     name="skillName"
                                                                     placeholder="Skill"
                                                                     maxLength="30"
                                                                     tabindex="1" /> 
                                                    </div>
                                                    <div class="row">
                                                    <div class="col-sm-2 pull-right">
                                                       <label class="labelStylereq" style="color:#56a5ec;"></label>
                                                        <span class=""><s:submit type="button"
                                                                  id="skillSearchButton"
                                                                  cssClass="add_searchButton form-control"
                                                                  value="" cssStyle="margin:5px 0px;" 
                                                                  tabindex="4" ><i class="fa fa-search"></i>&nbsp;Search</s:submit></span>
                                                        </div>
                                                    </div>

                                            </s:form>
                                             </span> --%>

										<%--  <div id="loadingCsrSearch" class="loadingImg">
                                                <span id ="LoadingContent" > <img src="<s:url value="/includes/images/Loader1.gif"/>"   ></span>   ></span>
                                            </div>
                                            <br> --%>
										<%--<s:submit cssClass="css_button" value="show"/><br>--%>
										<%-- <span id="resultMessage"></span> --%>
										<div class="col-sm-12">

											<s:form>

												<div class="emp_Content" id="emp_div" align="center"
													style="display: none">

													<table id="skillResults"
														class="responsive CSSTable_task sortable" border="5"
														cell-spacing="2">
														<tbody>
															<tr>
																<!--  <th>User</th> -->
																<th>Skill&nbsp;Name</th>
																<th>Skill&nbsp;Type</th>

																<th class="unsortable">Approve/Reject</th>
															</tr>
															<s:if test="userVTO.size == 0">
																<tr>
																	<td colspan="3"><font
																		style="color: red; font-size: 15px; text-align: center">No
																			Records to display</font></td>
																</tr>
															</s:if>
															<s:iterator value="userVTO">
																<tr>

																	<%-- <s:hidden id="usrId" name="usrId" value="%{empId}" />
																	<s:hidden id="skillname" name="skillname"
																		value="%{skill_name}" />
																		<s:hidden id="skilltype" name="skilltype"
																		value="%{skill_type}" />  --%>
																	<%-- <td><s:property value="empId"></s:property></td>  --%>


																	<td><s:property value="skill_name"></s:property></td>


																	<td><s:property value="skill_type"></s:property></td>

																	<td><s:url var="myUrl">

																			<%--                         <s:param name="skillName" value="%{skill_name}" /> --%>
																		</s:url> <%--  <s:a href='#' onclick="skillApprovalAjax();reloadFunc();">Go</s:a> --%>
																		<%--  <s:a href='#'class="skillApproval_popup_open" onclick="openDialogforSkillApproval();">Go</s:a> --%>
																		<button id="" type='button' tabindex="19"
																			class="skillApproval_popup_open"
																			onclick="openDialogforSkillApproval(<s:property value="empId"/>,'<s:property value="skill_name"/>','<s:property value="skill_type"/>');">GO</button>
																		<!-- <button id="" type='button' tabindex="19"
																			class="skillApproval_popup_open"
																			onclick="openDialogforSkillApproval(%{empId},'%{skill_name}','%{skill_type}');">GO</button> -->

																	</td>
																</tr>
															</s:iterator>
														</tbody>
													</table>
											</s:form>
											<s:if test="userVTO.size > 0">
												<label> Display <select id="paginationOption"
													class="disPlayRecordsCss" onchange="pagerOption()"
													style="width: auto">

														<option>10</option>
														<option>15</option>
														<option>25</option>
														<option>50</option>
												</select> Skills per page
												</label>
											</s:if>
											<!--                                                    <div align="right" id="pageNavPosition" style="margin-right: 0vw;"></div>-->

										</div>
									</div>

								</div>
								<%--close of future_items--%>
							</div>
						</div>
					</div>

				</div>
		</div>
		<div id="skillApproval_popup" style="display: none">
			<div id="resumeAttachOverlay">

				<div class="backgroundcolor">
					<table>
						<tr>
							<td style=""><h4>
									<font color="#ffffff">&nbsp;&nbsp;Approve/Reject&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp; </font>
								</h4></td>
							<span class=" pull-right"><h5>
									<a href="" class="skillApproval_popup_close"
										onclick="skillApprovalOverlayClose();"><i
										class="fa fa-times-circle-o fa-size"></i></a>&nbsp;
								</h5></span>
					</table>
				</div>



				<div>


					<div>
						<s:hidden id="usrId" name="usrId" />
						<s:hidden id="skillname" name="skillname" />
						<s:hidden id="skilltype" name="skilltype" />
                        <span id="resultMessage"></span>
                        <span id="errMsg"></span>
						<div class="col-sm-12 required">
						<span class="required"><label class="labelStylereq">Skill Approve/Reject</label>
							<s:select headerKey="-1" cssClass="form-control SelectBoxStyles"
								headerValue="Please Select" list="{'Approve','Reject'}"
								name="action_select" id="action_select" /></span>
						</div>
						<br> <br>


						<s:submit id="skillApprove"  value="OK"
							cssClass="add_searchButton"
							onclick="return skillApprovalAjax();" cssStyle="margin-right:15px;width: 80px;"/>

						<br>
					</div>
				</div>
				<font color="white">............................................................................</font>
				<%-- 	<s:token /> --%>

			</div>
          
		</div>
		<%-- Start overlay for Skill Aprroval --%>
		<%--<div id="csrTerminateOverlay_popup" >
                        <div id="csrTerminateBox">
                            <div class="backgroundcolor">
                                <table>
                                    <tr><td><h4 style="font-family:cursive"><font class="titleColor" >&nbsp;&nbsp;Termination &nbsp;&nbsp; </font></h4></td>
                                    <span class="pull-right"> <h5 >&nbsp;&nbsp;&nbsp;&nbsp;<a href="" class="csrTerminateOverlay_popup_close" onclick="csrTerminateOverlay()" ><img src="<s:url value="/includes/images/close_button.jpg"/>" height="25" width="25"></a></h5></span>
                                </table>
                            </div>
                            <div>
                                <div class="inner-reqdiv-elements">

                            <s:hidden id="userId" name="userId"/>


                            Terminate the CSR?<div  id="csrName" ></div>
                        </div>

                        <div class="pull-left " >
                            <s:submit type="button" cssClass="cssbutton csrTerminateOverlay_popup_close" id="contactCancel" onclick="csrTerminateOverlay()" value="Cancel"/>  
                        </div>  
                        <div class="pull-right " > 

                            <s:submit type="button" cssClass="cssbutton" id="contactSend" value="Ok" onclick="saveContactDetails()"/> 

                        </div>

                    </div>
                    <font style="color: #ffffff">..................... ..............................  ..........................................</font>
                </div>   
            </div> 
                    --%>
		<%-- end overlay for csr termination --%>

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
	<script type="text/javascript"
		src="<s:url value="/includes/js/general/popupoverlay.js"/>"></script>
	<script type="text/JavaScript"
		src="<s:url value="/includes/js/jquery.scrollUp.min.js"/>"></script>
	<script type="text/javascript"
		src="<s:url value="/includes/js/general/pagination.js"/>"></script>

	<script type="text/javascript">
		var recordPage = 10;
		function pagerOption() {
			var paginationSize = document.getElementById("paginationOption").value;
			if (isNaN(paginationSize))
			//alert(paginationSize);
			{

			}
			recordPage = paginationSize;

			$('#skillResults').tablePaginate({
				navigateType : 'navigator'
			}, recordPage);

		};
		$('#skillResults').tablePaginate({
			navigateType : 'navigator'
		}, recordPage);
	</script>
	<script type="text/JavaScript"
		src="<s:url value="/includes/js/general/placeholders.min.js"/>"></script>
	<!--/Footer-->
	<script>
		 sortables_init();
	</script>

</body>
</html>



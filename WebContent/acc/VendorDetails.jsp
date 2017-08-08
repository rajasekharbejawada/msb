 <%-- 
    Document   : dashboard
    Created on : Feb 3, 2015, 7:50:23 PM
    Author     : Nagireddy
--%>



<%@page import="com.mss.msp.usr.task.TasksVTO"%>

<%@page import="java.util.Iterator"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
<%@ page import="java.util.List" isErrorPage="true"%>
<%@ page import="com.mss.msp.util.ApplicationConstants"%>
<!DOCTYPE html>
<html>
    <head>


        <!-- new styles -->

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ServicesBay :: Task Search</title>

       
<script language="JavaScript" type="text/javascript"
	src="<s:url value="/struts/dojo/struts_dojo.js"/>"></script>
<script language="JavaScript" type="text/javascript"
	src="<s:url value="/struts/ajax/dojoRequire.js"/>"></script>
<%--ACCOUNT DETAILS SPECIFIC--%>
<link rel="stylesheet" type="text/css"
	href="<s:url value='/includes/css/accountDetails/details.css'/>">
<%----%>
<link rel="stylesheet" href="<s:url value="/struts/xhtml/styles.css"/>"
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
	href="<s:url value="/includes/css/general/profilediv.css"/>">
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/general/requirementStyle.css"/>">
<link rel="stylesheet"
	href='<s:url value="/includes/css/general/dhtmlxcalendar.css"/>'
	type="text/css">
<link rel="stylesheet"
	href='<s:url value="/includes/css/general/dhtmlxcalendar_omega.css"/>'
	type="text/css">
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/accountDetails/projects.css"/>">
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/jquery.msg.css"/>">
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/general/addAccountStyles.css"/>">
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/general/selectivity-full.css"/>">

<script language="JavaScript" src="<s:url value="/struts/utils.js"/>"
	type="text/javascript"></script>


<script type="text/JavaScript"
	src="<s:url value='/includes/js/general/dhtmlxcalendar.js'/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/jquery.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/general/jquery.min.js"/>"></script>
<%--script type="text/JavaScript" src="<s:url value="/includes/js/general/GridNavigation.js"/>"></script--%>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/bootstrap.min.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/main.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/general/jquery.toggle.js"/>"></script>
<script language="JavaScript"
	src='<s:url value="/includes/js/general/dhtmlxcalendar.js"/>'></script>

<!--        <script type="text/JavaScript" src="<s:url value="/includes/js/general/ProfilePage.js"/>"></script>-->
<!-- this file for writing all profile function and  jquerys -->
<!-- this is overlay jquery responsive and centered-->
<script type="text/JavaScript"
	src="<s:url value="/includes/js/general/jquery.maskedinput.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/Ajax/GeneralAjax.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/Ajax/AppConstants.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/Ajax/vendorAjax.js"/>"></script>
<script language="JavaScript"
	src='<s:url value="/includes/js/CountriesAjax.js"/>'></script>
<script language="JavaScript"
	src='<s:url value="/includes/js/account/projectOverlays.js"/>'></script>
        <%-- for date picket end--%>
       
 <script type="text/JavaScript" src="<s:url value="/includes/js/jquery.js"/>"></script>
        <sx:head />
        

        <script type="text/javascript">
        function sortables_init() {
                // Find all tables with class sortable and make them sortable
                if (!document.getElementsByTagName) return;
                tbls = document.getElementById("homeRedirectTable");
                sortableTableRows = document.getElementById("homeRedirectTable").rows;
                sortableTableName = "homeRedirectTable";
                for (ti=0;ti<tbls.rows.length;ti++) {
                    thisTbl = tbls[ti];
                    if (((' '+thisTbl.className+' ').indexOf("sortable") != -1) && (thisTbl.id)) {
                        ts_makeSortable(thisTbl);
                    }
                }
            };

        </script>
       <script>
                   function pagerOption(){
                	  
                paginationSize = document.getElementById("paginationOption").value;
                if(isNaN(paginationSize))
                    alert(paginationSize);

                pager = new Pager('teamTaskTable', parseInt(paginationSize));
                pager.init();
                pager.showPageNav('pager', 'pageNavPosition');
                pager.showPage(1);

            };
        </script>
    <script>
            $(document).ready(function(){
                $(".img-swap").click(function(){
                    $(".popup_block").animate({
                        width: 'toggle'
                    });
                });
            });
            
            
            
            
            
        </script>
       <script language="JavaScript"
	src='<s:url value="/includes/js/account/projectOverlays.js"/>'></script>
       
    </head>





    <body style="overflow-x: hidden" oncontextmenu="return false"  onload="getVendors();">
        <div id="wrap">
        <header id="header"><!--header-->
            <div class="header_top"><!--header_top-->
                <div class="container">

                    <s:include value="/includes/template/header.jsp"/> 

                </div>
            </div>

        </header>





                    <div id="main">

        <section id="generalForm"><!--form-->
 

            <div class="container">
                <div class="row">
                  
                    <!-- Model popup -->
                    
                         <s:include value="/includes/menu/LeftMenu.jsp"/> 
                        
                        <!-- Model popup, end -->
<div class="col-sm-12 col-md-9 col-lg-9 right_content" style="background-color:#fff">
                        <!-- content start -->
                        <div class="tab-pane fade in " id="subvendors">

																	<!-- content start -->
																	<div class="panel-body">
																		<div class="row">
																			<div class="col-sm-12">
																				<div id="addVendorTier_popup">
																					<div id="AddVendorTierOverlay">
																						<div
																							style="background-color: #3bb9ff; padding: 0px">
																							<table>
																								<tr>
																									<td><h4 style="">
																											<font color="#ffffff">&nbsp;&nbsp;Add
																												Vendor Tier&nbsp;&nbsp; </font>
																										</h4></td>
																								</tr>
																								<span class=" pull-right"><h5>
																										<a href="" class="addVendorTier_popup_close"
																											onclick="addVendorTierOverlay();"><i
																											class="fa fa-times-circle-o fa-size"></i></a>
																									</h5></span>
																							</table>
																						</div>
																						<div id="VendorTierDiv">
																							<span><e></e></span>
																							<div class="innerAddConElements">
																								<label class="labelStyleAddCon">Type Of
																									Tier</label>
																								<s:select id="vendorTier"
																									cssClass="reqSelectStyle" name="vendorTier"
																									list="addVendorTierMap" />
																							</div>
																							<div class="">
																								<s:submit id="addVendorTier"
																									cssClass="cssbutton"
																									onclick="addVendorTierType();">
																									<i class="fa fa-plus-square"></i>&nbsp;Add</s:submit>
																							</div>
																						</div>
																					</div>
																				</div>
																				<div id="editVendorTier_popup">
																					<div id="EditVendorTierOverlay">
																						<div class="overlayOrButton_color">
																							<table>
																								<tr>
																									<td><h4>
																											<font color="#ffffff">Edit Vendor Tier
																												Details</font>
																										</h4></td>


																									<td><span class=" pull-right"><h5>
																												<a href=""
																													class="editVendorTier_popup_close"
																													onclick="editVendorTierOverlayClose();"><i
																													class="fa fa-times-circle-o fa-size"></i></a>
																											</h5></span></td>
																								</tr>
																							</table>
																						</div>
																						<div id="VendorTierDiv">
																							<span><e1></e1></span>
																							<div class="innerAddConElements">
																								<s:hidden id="tierId" name="tierId" />
																								<label class="labelStyleAddCon">Status</label>
																								<s:select id="vendorTierStatus"
																									cssClass="SelectBoxStyles form-control"
																									name="vendorTierStatus"
																									list="#@java.util.LinkedHashMap@{'Active':'Active','Inactive':'Inactive'}" />

																							</div>
																							<div class="innerAddConElements">
																								<label class="labelStyleAddCon">Tier</label>
																								<s:select
																									cssClass="SelectBoxStyles form-control"
																									name="vendorTier" id="vendorTier" headerKey="0"
																									headerValue="--select--" list="vendorTierMap" />
																							</div>
																							<div class="innerAddConElements">
																								<label class="labelStyleAddCon">Head
																									Hunter</label>
																								<s:checkbox name="PF" id="PF" />
																							</div>
																							<div class="pull-right">
																								<s:submit type="button"
																									cssStyle="margin:5px 0px;"
																									id="editVendorTierStatus"
																									cssClass="add_searchButton form-control"
																									value="" onclick="editVendorTierDetails();">
																									<i class="fa fa-floppy-o"></i>&nbsp;Save</s:submit>
																							</div>
																						</div>
																					</div>
																				</div>

																				<div class="row" id="vendorDiv">
																					<div class="col-sm-4">
																						<label class="labelStyle" style="color: #56a5ec">Type
																							of Tier</label>
																						<s:select id="vendorTierType"
																							name="vendorTierType"
																							cssClass="SelectBoxStyles form-control"
																							tabindex="1" headerKey="-1" headerValue="All"
																							theme="simple" list="vendorTierMap" />
																					</div>
																					<div class="col-sm-4">
																						<label class="labelStylereq"
																							style="color: #56a5ec">Status</label>
																						<s:select id="TierStatus" name="TierStatus"
																							cssClass="SelectBoxStyles form-control"
																							tabindex="2" headerKey="-1" headerValue="All"
																							theme="simple"
																							list="#@java.util.LinkedHashMap@{'Active':'Active','Inactive':'Inactive'}" />
																					</div>
																					<div class="col-sm-4 pull-right">
																						<div
																							class="col-sm-4 col-md-5 pull-right contact_search">
																							<label class="labelStylereq"
																								style="color: #56a5ec"></label>
																							<s:form action="addVendorForCustomer"
																								theme="simple">
																								<s:hidden name="accountSearchID"
																									id="accountSearchID" />
																								<s:submit id="addVendorButton" type="button"
																									cssClass="add_searchButton form-control"
																									tabindex="4" cssStyle="margin:5px 0px;">
																									<i class="fa fa-plus-square"></i>&nbsp;Add</s:submit>
																							</s:form>
																						</div>
																						<div
																							class="col-sm-4 col-md-5 pull-right contact_search">
																							<label class="labelStylereq"
																								style="color: #56a5ec"></label>
																							<s:submit id="searchVendorButton" type="button"
																								value=""
																								cssClass="add_searchButton form-control"
																								tabindex="3" onclick="searchVendorTier()"
																								cssStyle="margin:5px 0px;">
																								<i class="fa fa-search"></i>&nbsp;Search</s:submit>
																						</div>

																					</div>
																				</div>
																				<br>

																				<s:form>
																					<div class="task_content" id="task_div"
																						align="center" style="display: none">

																						<div>
																							<div>
																								<table id="vendorTierTable"
																									class="responsive CSSTable_task" border="5"
																									cell-spacing="2">
																									<tbody>
																										<tr>
																											<th>Vendor</th>
																											<th>Tier</th>
																											<th>Created Date</th>
																											<th>Is Headhunter</th>
																											<th>Status</th>
																										</tr>
																									</tbody>
																								</table>
																								<br /> <label class="page_option">
																									Display <select id="vendor_paginationOption"
																									tabindex="5" class="disPlayRecordsCss"
																									onchange="vendor_pagerOption()"
																									style="width: auto">
																										<option>10</option>
																										<option>15</option>
																										<option>25</option>
																										<option>50</option>
																								</select> Accounts per page
																								</label>
																								<div id="loadingVendor" class="loadingImg">
																									<span id="LoadingContent"> <img
																										src="<s:url value="/includes/images/Loader1.gif"/>"></span>
																									></span>
																								</div>
																								<div align="right"
																									id="vendorTierTablepageNavPosition"
																									style="margin-right: 0vw; display: none"
																									class="pull-right"></div>
																							</div>
																						</div>
																					</div>
																				</s:form>
																				<script type="text/javascript">
																					var vpager = new Pager(
																							'vendorTierTable',
																							10);
																					vpager
																							.init();
																					vpager
																							.showPageNav(
																									'vpager',
																									'vendorTierTablepageNavPosition');
																					vpager
																							.showPage(1);
																				</script>
																			</div>
																		</div>
																	</div>
																</div>
                         <%--   <div class="side_popup">

                <div class="popup_block"> 

                    <div class="addlink" >
                       
                        

                        <div class="alignField">

                           
                           
                          <a href="../tasks/addTask.action" >Add Task</a>
                            </div>
                       
                        </div>
                    </div>

                   <div class="slide_popup task_sidePopup img-swap"><i></i></div>
                </div> --%>  
                </div>
                </div>
                    </div>
                          
                <!-- content end -->
                
                

        </section><!--/form-->
        </div>
</div>
        <footer id="footer"><!--Footer-->
            <div class="footer-bottom" id="footer_bottom">
                <div class="container">
                    <s:include value="/includes/template/footer.jsp"/>
                </div>
            </div>
        </footer><!--/Footer-->
        <script type="text/JavaScript" src="<s:url value="/includes/js/general/popupoverlay.js"/>"></script>
        <script type="text/JavaScript" src="<s:url value="/includes/js/jquery.scrollUp.min.js"/>"></script>
        <script type="text/javascript" src="<s:url value="/includes/js/general/pagination.js"/>"></script> 

        <script type="text/javascript">
            var recordPage=10;
            function pagerOption(){

                var paginationSize = document.getElementById("paginationOption").value;
                if(isNaN(paginationSize))
                {
                       
                }
                recordPage=paginationSize;
                // alert(recordPage)
                $('#teamTaskTable').tablePaginate({navigateType:'navigator'},recordPage);

            };
            $('#teamTaskTable').tablePaginate({navigateType:'navigator'},recordPage);
        </script>
     
 <script type="text/javascript">
            var recordPage=10;
            function pagerOption(){

                var paginationSize = document.getElementById("tpaginationOption").value;
                if(isNaN(paginationSize))
                {
                       
                }
                recordPage=paginationSize;
                //alert(recordPage)
                $('#timesheet_results').tablePaginate({navigateType:'navigator'},recordPage);

            };
            $('#timesheet_results').tablePaginate({navigateType:'navigator'},recordPage);
        </script>
         <script>
        $("#msg_clr").show().delay(5000).fadeOut();
        </script>
        <script language="JavaScript"
		src="<s:url value="/includes/js/account/accountDetailsAJAX.js"/>"
		type="text/javascript"></script>
	<script language="JavaScript"
		src="<s:url value="/includes/js/account/formVerification.js"/>"
		type="text/javascript"></script>
	<script language="JavaScript"
		src="<s:url value="/includes/js/account/accountValidation.js"/>"
		type="text/javascript"></script>
	<%----%>
	<script type="text/javascript"
		src="<s:url value="/includes/js/general/popupoverlay.js"/>"></script>

	<script type="text/JavaScript"
		src="<s:url value="/includes/js/general/taskOverlay.js"/>"></script>
	<script type="text/JavaScript"
		src="<s:url value="/includes/js/general/selectivity-full.min.js"/>"></script>
    <script type="text/JavaScript" src="<s:url value="/includes/js/general/placeholders.min.js"/>"></script>
        <div style="display: none; position: absolute; top:170px;left:320px;overflow:auto; z-index: 1900000" id="menu-popup">
            <table id="completeTable" border="1" bordercolor="#e5e4f2" style="border: 1px dashed gray;" cellpadding="0" class="cellBorder" cellspacing="0" />
        </div>

    </body>
</html>

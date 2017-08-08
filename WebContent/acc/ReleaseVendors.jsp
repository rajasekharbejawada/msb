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

        <link rel="stylesheet" type="text/css" href="<s:url value="/includes/css/bootstrap.min.css"/>">
        <link rel="stylesheet" type="text/css" href="<s:url value="/includes/css/home/home.css"/>">
        <link rel="stylesheet" type="text/css" href="<s:url value="/includes/css/font-awesome.min.css"/>">
        <link rel="stylesheet" type="text/css" href="<s:url value="/includes/css/animate.css"/>">
        <link rel="stylesheet" type="text/css" href="<s:url value="/includes/css/main.css"/>">
        <link rel="stylesheet" type="text/css" href="<s:url value="/includes/css/responsive.css"/>">
        <link rel="stylesheet" href='<s:url value="/includes/css/general/dhtmlxcalendar.css"/>' type="text/css">
        <link rel="stylesheet" href='<s:url value="/includes/css/general/dhtmlxcalendar_omega.css"/>' type="text/css">
        <link rel="stylesheet" type="text/css" href="<s:url value="/includes/css/general/profilediv.css"/>">

       
        <script type="text/JavaScript" src="<s:url value="/includes/js/general/jquery.min.js"/>"></script>
        <script type="text/JavaScript" src="<s:url value="/includes/js/general/GridNavigation.js"/>"></script>
        <%-- aklakh js single file end --%>
        <%-- aklakh css single file start --%>
        <link rel="stylesheet" type="text/css" href="<s:url value="/includes/css/general/GridStyle.css"/>">
        <%-- aklakh css single file end --%>
        <%-- for date picket start--%>
        <script type="text/JavaScript" src="<s:url value="/includes/js/general/jquery.toggle.js"/>"></script>
       
        
        <script type="text/JavaScript" src="<s:url value="/includes/js/bootstrap.min.js"/>"></script>
        <script type="text/JavaScript" src="<s:url value="/includes/js/main.js"/>"></script>
      
        <script language="JavaScript" src='<s:url value="/includes/js/general/dhtmlxcalendar.js"/>'></script>
        <%-- for date picket end--%>
       <script type="text/JavaScript"
	src="<s:url value="/includes/js/Ajax/vendorAjax.js"/>"></script>
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
       
    </head>





    <body style="overflow-x: hidden" oncontextmenu="return false"  onload="getReleaseVendorsListForCsr();">
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

                        <!-- content start -->
                        <div class="col-sm-12 col-md-9 col-lg-9 right_content" style="background-color:#fff">
                            <div class="features_items">
                                <div class="col-lg-14 ">
                                    <div class="" id="profileBox" style="float: left; margin-top: 5px">
                                        <div class="backgroundcolor" >
                                            <div class="panel-heading">
                                                <h4 class="panel-title">

                                                   
                                                    <font color="#ffffff">Release Vendor Search</font>
                                                    <i id="updownArrow" onclick="toggleContent('showReleaseVendorDetails')" class="fa fa-minus"></i>

                                                </h4>
                                            </div>

                                        </div>
                                        <!-- content start -->
                                        <span id="venodrSearchValidation"></span>
                                        <div class="col-sm-13">
                                            <s:form action="showReleaseVendorDetails"  theme="simple">
                                               <s:hidden name="requirementId" id="requirementId" value="%{requirementId}"/>
                                                <s:hidden name="orgId" id="orgId" value="%{orgId}"/>
                                               <input type="hidden" id="vendorsIdString" name="vendorsIdString" />
                                               <s:hidden name="taxTerm" id="taxTerm" value="%{taxTerm}"/>
                                              
                                                <div class="inner-reqdiv-elements">
                                                    <div class="">
                                                        <div class="col-sm-4">
                                                            <label class="labelStylereq" style="color:#56a5ec;">Vendor Name</label>
                                                            <s:textfield id="vendorName" cssClass="form-control"  name="vendorName" placeholder="Vendor Name" tabindex="1" maxLength="60"/>
                                                        </div>
                                                     
                                                      <div class="col-sm-4">
                                                            <label class="labelStylereq" style="color: #56a5ec;">Tier : </label>
                                                            <s:select  id="tier"  name="tier" label="Tier"  cssClass="SelectBoxStyles form-control" headerKey="-1" headerValue="All" theme="simple" list="#@java.util.LinkedHashMap@{1:'Tier-1',2:'Tier-2',3:'Tier-3'}" tabindex="1"/>
                                                        </div>
                                                       
                                                      <div class="col-sm-2">
                                                                    <label class="labelStylereq" style=""></label>
                                                                    <input type="button"  class="add_searchButton form-control " id="searchButton" value="search" tabindex="3" style="margin:6px 0px;" onclick="getReleaseVendorsListForCsr()"/>
                                                                     
                                                                </div>
                                                       
                                                    </div>
                                                </div>
                                                <div class="inner-reqdiv-elements">
                                                    <div class="">
                                                        
                                                        <div class="col-sm-4 pull-right">
                                                           
                                                          
                                                         <s:checkbox cssClass="checkboxAlign" name="allVendors" id="allVendors" onclick="onClickHandlerForCSR(this)" />&nbsp;&nbsp;
                            <s:label value = "Release All" cssClass="textLabel-i"/>
                              
                                                                
                                                                 <div style="display:none;margin-right:77px; margin-top:-37px;" onclick="doReleaseRequirementForCSR()" id="vendorReleaseButton" class=" fa fa-arrow-circle-o-right cssbutton pull-right" >&nbsp;Release</div>
                                                                    </div>
                                                            </div>
                                                             
                             
                                                        </div>
                                                    </div>
                                                                    <div class="row"></div>
                                                                    
                                                                     
                            
                                             
                                            </s:form>
                                            
                                            
                                       <%--     <div id="loadingVendorSearch" class="loadingImg">
                                                    <span id ="LoadingContent" > <img src="<s:url value="/includes/images/Loader1.gif"/>"   ></span>   ></span>
                                                </div>   --%>  
                                               
                                                <span><releaseMessage></releaseMessage></span>
                                            <s:form>
                                                <div class="emp_Content" id="emp_div" align="center" style="display: none">
                                                    <table id="releaseReqTable" class="responsive CSSTable_task " border="5" cell-spacing="2" style="margin-top: 13px;">
                                                        <tbody>
                                                            <tr>
                                                                <th>VendorName</th>
                                                                <th>Tier</th>
                                                                <th>IsHeadHunter</th>
                                                                <th>Release</th>
                                                               
                                                            </tr>
                                                            

                                                            
                                                        </tbody>
                                                    </table>
                                                    <br/>
                                                    
                                                        <label> Display <select id="paginationOption" class="disPlayRecordsCss" onchange="pagerOption()" style="width: auto">
                                                                <option>10</option>
                                                                <option>15</option>
                                                                <option>25</option>
                                                                <option>50</option>
                                                            </select>
                                                            Vendors per page
                                                        </label>
                 <div class="main-login-form">
				<div class="login-group">
					<div class="form-group1">
						<label for="lg_username" class="sr-only">Username</label>
						
                    Denim you probably haven't heard of. Lorem ipsum dolor met consectetur adipisicing sit amet, consectetur adipisicing elit, of 
            	
					</div> 
				</div>
				<button type="submit" class="login-button1"><i class="fa fa-info"></i></button>
			</div>
                                                    <div align="right" class="pull-right" id="pageNavPosition" style="margin-right: 0vw;display: none"></div>
                                                </div>
                                            </s:form>



                                        </div>
                                    </div>
                                </div>
                                <%--close of future_items--%>
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
    <script type="text/JavaScript" src="<s:url value="/includes/js/general/placeholders.min.js"/>"></script>
        <div style="display: none; position: absolute; top:170px;left:320px;overflow:auto; z-index: 1900000" id="menu-popup">
            <table id="completeTable" border="1" bordercolor="#e5e4f2" style="border: 1px dashed gray;" cellpadding="0" class="cellBorder" cellspacing="0" />
        </div>

    </body>
</html>


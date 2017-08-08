<%-- 
    Document   : Rate Cards
    Created on : July 06, 2017, 08:50:23 PM
    Author     : Manikanta
--%>

<%@ page contentType="text/html; charset=UTF-8" errorPage="../../exception/403.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.mss.msp.util.ApplicationConstants"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- new styles -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ServicesBay :: Rate&nbsp;Cards&nbsp;Page</title>

        <link rel="stylesheet" type="text/css" href="<s:url value="/includes/css/bootstrap.min.css"/>">
        <link rel="stylesheet" type="text/css" href="<s:url value="/includes/css/font-awesome.min.css"/>">
        <link rel="stylesheet" type="text/css" href="<s:url value="/includes/css/animate.css"/>">
        <link rel="stylesheet" type="text/css" href="<s:url value="/includes/css/main.css"/>">
        <link rel="stylesheet" type="text/css" href="<s:url value="/includes/css/responsive.css"/>">
        <link rel="stylesheet" type="text/css" href="<s:url value="/includes/css/general/GridStyle.css"/>">
        <link rel="stylesheet" type="text/css" href='<s:url value="/includes/css/general/profilediv.css"/>'>
        <link rel="stylesheet" type="text/css" href='<s:url value="/includes/css/general/addAccountStyles.css"/>'>

        <script type="text/JavaScript" src="<s:url value="/includes/js/general/jquery.min.js"/>"></script>
        <script type="text/JavaScript" src="<s:url value="/includes/js/general/GridNavigation.js"/>"></script>
        <script type="text/JavaScript" src="<s:url value="/includes/js/jquery.js"/>"></script>
        <script type="text/JavaScript" src="<s:url value="/includes/js/bootstrap.min.js"/>"></script>
        <script type="text/JavaScript" src="<s:url value="/includes/js/main.js"/>"></script>
        <script type="text/JavaScript" src="<s:url value="/includes/js/general/jquery.toggle.js"/>"></script>

        <script language="JavaScript" src='<s:url value="/includes/js/general/sortable.js"/>'></script>
        

        <script type="text/javascript">
            $(document).ready(function(){
                
                document.getElementById("loadingRateCardSearch").style.display="none";
                
            });
            function sortables_init() {
                // Find all tables with class sortable and make them sortable
                if (!document.getElementsByTagName) return;
                tbls = document.getElementById("empCategorizationResults");
                sortableTableRows = document.getElementById("empCategorizationResults").rows;
                sortableTableName = "empCategorizationResults";
                for (ti=0;ti<tbls.rows.length;ti++) {
                    thisTbl = tbls[ti];
                    if (((' '+thisTbl.className+' ').indexOf("sortable") != -1) && (thisTbl.id)) {
                        ts_makeSortable(thisTbl);
                    }
                }
            };
           
        </script>
    </head>
    <body oncontextmenu="return false" style="overflow-x: hidden">
        <div id="wrap">

            <header id="header"><!--header-->
                <div class="header_top"><!--header_top-->
                    <div class="container">
                        <s:include value="/includes/template/header.jsp"/> 
                    </div>
                </div>

            </header>

            <div id="main">
                <section id="generalForm">

                    <div class="container">
                        <div class="row">
                            <s:include value="/includes/menu/LeftMenu.jsp"/> 
                            <!-- content start -->
                            <div class="col-sm-12 col-md-9 col-lg-9 right_content" style="background-color:#fff">
                                <div class="features_items">
                                    <div class="col-lg-12 ">
                                        <div class="" id="profileBox" style="float: left; margin-top: 5px">

                                            <div class="backgroundcolor" >
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">

                                                       
                                                        <font color="#ffffff">Rate card&nbsp;Search</font>
                                                        <i id="updownArrow" onclick="toggleContent('getRateCardList')" class="fa fa-minus"></i> 
                                                    </h4>
                                                </div>

                                            </div>
                                            <!-- content start -->
                                              
                                           
                                            <div class="row">
                                                <s:form action="/Requirements/getRateCardList" theme="simple" >
                                                    
                                                        <div class="col-sm-4">
                                                            <label class="labelStylereq" style="color:#56a5ec;">Job&nbsp;Title </label>
                                                            <s:textfield id="jobTitle"
                                                                         cssClass="form-control"
                                                                         type="text"
                                                                         name="jobTitle"
                                                                         tabindex="1"
                                                                         placeholder="Job title" maxLength="150"
                                                                         /> 
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <label class="labelStylereq" style="color:#56a5ec;">Min Rate </label>
                                                            <s:textfield id="minRate"
                                                                         cssClass="form-control"
                                                                         type="text"
                                                                         name="minRate"
                                                                         tabindex="2"
                                                                         placeholder="Min Rate" 
                                                                         /> 
                                                        </div >
                                                        <div class="col-sm-4">
                                                            <label class="labelStylereq" style="color:#56a5ec;">Max Rate </label>
                                                            <s:textfield id="maxRate"
                                                                         cssClass="form-control"
                                                                         type="text"
                                                                         name="maxRate"
                                                                         tabindex="3"
                                                                         placeholder="Max Rate" 
                                                                         /> 
                                                        </div >
                                                        <br>
                                                        
                                                        <div class="col-sm-2 pull-right">

                                                            <s:submit type="button" cssStyle="margin:5px 0px;" id="accAuthSearchButton"
                                                                      cssClass="add_searchButton form-control" tabindex="3"
                                                                      value=""><i class="fa fa-search"></i>&nbsp;Search</s:submit>
                                                        </div>
                                                        <div class="col-sm-2 pull-right">
                                                         <div align="right">
                                                                <button type="button" id="accAuthAddButton" style="margin: 5px 0px;" tabindex="4" class="add_searchButton form-control addAuthAccOverlay_popup_open cssbutton" onclick="addAuthAccOverlayFun();addOrUpdateRatecardChecking('a');clearRatecardValuesForAdd();"  style=""><i class="fa fa-plus-square"></i>&nbsp;Add</button>
                                                        </div>
                                                        </div>
                                                        
                                                        
                                           
                                                </s:form>
                                            </div>
                                                <div class="row">
                                                <div class="col-sm-12">
                                                    <div id="loadingRateCardSearch" class="loadingImg">
                                                                                                <span id ="LoadingContent" > <img src="<s:url value="/includes/images/Loader1.gif"/>"   ></span>   ></span>
                                                                                            </div>
                                                    <s:form>
                                                        <div class="emp_Content" id="emp_div" align="center" style="display: none"    >
                                                            <table id="rateCardResults" class="responsive CSSTable_task sortable" border="5" cell-spacing="2">
                                                                <tbody>
                                                                    <tr>

                                                                        <th class="unsortable">Job&nbsp;Title</th>

                                                                        <th class="unsortable">Min Rate</th>

                                                                        <th class="unsortable">Max Rate</th>
                                                                        
  																		<th class="unsortable">Comments</th>
  																		
                                                                        <th class="unsortable">Created&nbsp;Date</th>
                                                                    </tr>
                                                                    <s:if test="rateCardVTO.size == 0">
                                                                        <tr>
                                                                            <td colspan="4"><font style="color: red;font-size: 15px;text-align: center">No Records to display</font></td>
                                                                        </tr>
                                                                    </s:if>

                                                                    <s:iterator value="rateCardVTO">
                                                                        <tr>
                                                                            <%-- <s:hidden id="action_id" name="action_id" value="action_id"/> --%>
                                                                            <td><s:a href='#' cssClass="addAuthAccOverlay_popup_open" onclick="addAuthAccOverlayFun();addOrUpdateRatecardChecking('u');setRatecardValues('%{rateCardId}','%{jobTitle}','%{minRate}','%{maxRate}','%{comments}');"><s:property value="jobTitle"></s:property></s:a></td>
                                                                            <td><s:property value="minRate"></s:property></td>
                                                                            <td><s:property value="maxRate"></s:property></td>
                                                                            <s:if test="comments.length()>9">  
                                                                                <td><s:a href="#" cssClass="authAccOverlay_popup_open" onclick="authAccOverlayFun('%{comments}')" ><s:property  value="%{comments.substring(0,10)}"/>...</s:a></td>
                                                                            </s:if>
                                                                            <s:else>
                                                                                <td><s:property  value="%{comments}"/></td>
                                                                            </s:else>
                                                                            <td><s:property value="createdDate"></s:property></td>
                                                                            </tr>
                                                                    </s:iterator>
                                                                </tbody>
                                                            </table>
                                                            <br/>
                                                            <s:if test="rateCardVTO.size > 0">
                                                                <label> Display <select id="paginationOption" tabindex="5" class="disPlayRecordsCss" onchange="pagerOption()" style="width: auto">
                                                                        <option>10</option>
                                                                        <option>15</option>
                                                                        <option>25</option>
                                                                        <option>50</option>
                                                                    </select>
                                                                    Rate cards per page
                                                                </label>
                                                            </s:if>
                                                            <div align="right" id="pageNavPosition" style="margin-right: 0vw;display: none"></div>
                                                        </div>
                                                    </s:form>


                                                </div>
                                           </div>
                                            <%--</s:form>--%>
                                        </div>

                                        <%--close of future_items--%>

                                    </div>

                                </div>

                            </div>

                        </div>

                    </div>
                    <%-- Start overlay for Display Description --%>
                    <div id="authAccOverlay_popup" >
                        <div id="authAccBox">
                            <div class="backgroundcolor">
                                <table>
                                    <tr><td><h4 style="font-family:cursive"><font class="titleColor" >&nbsp;&nbsp;Description &nbsp;&nbsp; </font></h4></td>
                                    <span class="pull-right"> <h5 >&nbsp;&nbsp;&nbsp;&nbsp;<a href="" id="authDescCloseButton" class="authAccOverlay_popup_close" onclick="authAccOverlayFun()" ><i class="fa fa-times-circle-o fa-size"></i></a></h5></span>
                                </table>
                            </div>
                            <div>
                                <div class="inner-reqdiv-elements">
                                    <s:textarea id="outputMessageOfauthAcc" disabled="true" cssClass="form-control textareaActionDescOverlay"></s:textarea>
                                    </div>
                                </div>
                                <font style="color: #ffffff">..................... ..............................  ..........................................</font>
                            </div>   
                        </div> 

                    <%-- end overlay for Display Description --%>
                    <%-- Start overlay for for Add Acc Authorization  --%>
                    <div id="addAuthAccOverlay_popup" >
                        <div id="addAuthAccBox">
                            <div class="backgroundcolor">
                                <table>
                                    <tr><td><h4 id="" style="font-family:cursive"><font id="overlayHeading" class="titleColor"></font></h4></td>
                                    <span class="pull-right"> <h5 >&nbsp;&nbsp;&nbsp;&nbsp;<a href="" id="authAddCloseButton" class="addAuthAccOverlay_popup_close" onclick="addAuthAccOverlayFun();reloadRateCardPage();" ><i class="fa fa-times-circle-o fa-size"></i></a></h5></span>
                                </table>
                            </div>
                            <div>
                            <span id="validationMessage" style='margin-left:18px'></span>
                            <s:hidden id="overlayRatecardId" name="overlayRatecardId"/>
                              <%--   <s:hidden id="overlayActionId" value="overlayActionId"/>
                                <s:hidden id="overlayActionName" value="overlayActionName"/>
                                <s:hidden id="overlayActionStatus" value="overlayActionStatus"/>
                                <s:hidden id="overlayActionDesc" value="overlayActionDesc"/>
                                 <s:hidden id="actionHiddenName" name="actionHiddenName" value=""></s:hidden>  --%>
                                <br>
                                <div class="inner-addAcc-elements required" id="accNameDiv">
                                    <label class="addAcclabelStyle" style="color:#56a5ec;">Job&nbsp;Title </label>
                                    <s:textfield id="overlayJobTitle" 
                                                 cssClass="form-control"
                                                 type="text"
                                                 name="overlayJobTitle"
                                                 placeholder="Job Title"                                                 
                                                 maxLength="150"
                                                 /> 
                                </div>
                                <div class="inner-addAcc-elements required" id="">
                                    <label class="addAcclabelStyle" style="color:#56a5ec;">Min&nbsp;Rate </label>
                                    <s:textfield id="overlayMinRate" 
                                                 cssClass="form-control"
                                                 type="text"
                                                 name="overlayMinRate"
                                                 placeholder="Minimum Rate"                                                 
                                                 onkeyup="rateValidation(this);"
                                                 /> 
                                </div>
                                <div class="inner-addAcc-elements required" id="accNameDiv">
                                    <label class="addAcclabelStyle" style="color:#56a5ec;">Max&nbsp;Rate </label>
                                    <s:textfield id="overlayMaxRate" 
                                                 cssClass="form-control"
                                                 type="text"
                                                 name="overlayMaxRate"
                                                 placeholder="Maximum Rate"                                                 
                                                 onkeyup="rateValidation(this);"
                                                 /> 
                                </div>
                              
                                
                                <div class="inner-addAcc-elements required" id="descDiv">
                                    <label class="addAcclabelStyle" style="color:#56a5ec;">Comments </label>
                                    <s:textarea id="overlayComments" cssClass="form-control" name="overlayComments" placeholder="Enter Comments Here" onkeydown="actionAuthDescription(this)"  onfocus="return removeErrorMsg();"/>

                                </div>
                                <span class="charNum" id="addingAccAuthValid"></span> 
                               
                                <div class="col-sm-5 pull-right" id="addDiv">
                                    <button type="button" id="authAddButton" style="margin: 5px 0px;" class="add_searchButton  form-control" onclick="insertOrUpdateRatecard('0');" value=""><i class="fa fa-plus-square"></i>&nbsp;Add</button>
                                </div>
                                <div class="col-sm-5 pull-right" id="updateDiv">
                                    <button type="button" id="authUpdateButton" style="margin: 5px 0px;" class="add_searchButton  form-control" onclick="insertOrUpdateRatecard('1');" value=""><i class="fa fa-refresh"></i>&nbsp;Update</button>
                                </div>
                                
                            </div>   
                        </div> 
                    </div>

                    <%-- end overlay for Add Acc Authorization  --%>

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
        </footer>

        <script type="text/javascript" src="<s:url value="/includes/js/general/popupoverlay.js"/>"></script>
        <script type="text/JavaScript" src="<s:url value="/includes/js/jquery.scrollUp.min.js"/>"></script>

        <!--/Footer-->
        <script>
            sortables_init();
        </script>
        <script>
            var message=$("#accAuthId").html("");
            $("#accAuthId").show().delay(15000).fadeOut();
        </script>
        <script type="text/javascript" src="<s:url value="/includes/js/general/pagination.js"/>"></script> 

        <script type="text/javascript">
            var recordPage=10;
            function pagerOption(){
                var paginationSize = document.getElementById("paginationOption").value;
                if(isNaN(paginationSize))
                {
                }
                recordPage=paginationSize;
                $('#empCategorizationResults').tablePaginate({navigateType:'navigator'},recordPage);
            };
            $('#empCategorizationResults').tablePaginate({navigateType:'navigator'},recordPage);
        </script>
        <script type="text/JavaScript" src="<s:url value="/includes/js/general/placeholders.min.js"/>"></script>
        <script language="JavaScript" src='<s:url value="/includes/js/Ajax/GeneralAjax.js"/>'></script>
        <script type="text/JavaScript" src="<s:url value="/includes/js/general/popupoverlay.js"/>"></script>
        <div style="display: none; position: absolute; top:170px;left:320px;overflow:auto; z-index: 1900000" id="menu-popup">
            <table id="completeTable" border="1" bordercolor="#e5e4f2" style="border: 1px dashed gray;" cellpadding="0" class="cellBorder" cellspacing="0" />
        </div>

    </body>
</html>



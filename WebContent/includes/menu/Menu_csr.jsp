<%--
    Document   : empMenu
    Created on : Feb 3, 2015, 8:32:32 PM
    Author     : Nagireddy
--%>

<%@ page contentType="text/html; charset=UTF-8" errorPage="../../exception/403.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
<%@ page import="java.util.List" isErrorPage="true"%>
<%@ page import="com.mss.msp.util.ApplicationConstants"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<!DOCTYPE html>


<script type="text/javascript" src="<s:url value="/includes/js/jquery.js"/>"></script> 
<%
            String actionName = ActionContext.getContext().getName();
            
        %>
         <span id="action" style="display: none"><%=actionName%></span>


<div class="col-sm-12 col-md-3 col-lg-2 side_menu">
    <div class="left-sidebar">

        <div class="panel-group category-products" id="accordian">


            <div class="panel panel-default left-menu" id="accordian_my">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a id="accountsCsrLeftMenu" data-toggle="collapse" data-parent="#accordian" href="#accountsMenuCsr">
                            <i  class="fa fa-briefcase leftBullet"></i>
                            <span id="accountsAdmin" class="pull-right"><i id="testIconAccounts" class="fa fa-sort-asc" style="color: white;"></i></span>
                            Home
                        </a>
                    </h4>
                </div>
                <div id="accountsMenuCsr" class="panel-collapse collapse">
                <%
                                String orgId = session.getAttribute(ApplicationConstants.ORG_ID).toString();
                            %>
                    <div class="panel-body" >
                        <ul id="accountsDisplay">
                            <li><a id="searchAccountsCsr" href="/<%=ApplicationConstants.CONTEXT_PATH%>/acc/searchAccountsBy.action" onClick="leftMenuToggleId(this,'accountsAdmin');"><img src="<s:url value="/includes/images/icons/SearchGlobe.png"/>" height="15" width="15">&nbsp;Search&nbsp;Accounts</a> </li>
                             <li><a id="tasksSearchCsr" href="/<%=ApplicationConstants.CONTEXT_PATH%>/users/tasks/doTasksSearch.action" onClick="leftMenuToggleId(this,'accountsAdmin');"><img src="<s:url value="/includes/images/icons/addTask.png"/>" height="15" width="15">&nbsp;My&nbsp;Tasks</a></li>
                        <li><a id="requirementsHomeCSR" href="/<%=ApplicationConstants.CONTEXT_PATH%>/recruitment/consultant/getLoginUserRequirementList.action?orgid=<%=orgId%>&customerFlag=customer&accountFlag=MyRequirements" onClick="leftMenuToggleId(this,'accountsAdmin');"><img src="<s:url value="/includes/images/icons/requirement.png"/>" height="15" width="15">&nbsp;Requirements</a></li>
                         <li><a id="submissionsHomeProjectManager" href="/<%=ApplicationConstants.CONTEXT_PATH%>/Requirements/getSubmissionList.action?pageFlag=submitList" onClick="leftMenuToggleId(this,'accountsAdmin');"><i class="fa fa-users" aria-hidden="true" style="color: CornflowerBlue"></i>&nbsp;Submitted&nbsp;Profiles</a></li>
                        <li><a id="vendorList" href="/<%=ApplicationConstants.CONTEXT_PATH%>/acc/doGetVendorList.action" onClick="leftMenuToggleId(this,'accountsAdmin');"><img src="<s:url value="/includes/images/icons/vendor_Copy.png"/>" height="15" width="15">&nbsp;Vendors</a></li>
                         <li><a id="techReviewsCSR" href="/<%=ApplicationConstants.CONTEXT_PATH%>/recruitment/consultant/getTechReviewDetails.action?pageFlag=techReviewList" onClick="leftMenuToggleId(this,'accountsAdmin');"><img src="<s:url value="/includes/images/icons/review.png"/>" height="15" width="15">&nbsp;Tech&nbsp;Reviews</a></li>
<%--                          <li><a id="techReviewsCSR" href="/<%=ApplicationConstants.CONTEXT_PATH%>/recruitment/consultant/getTechReviewDetails.action" onClick="leftMenuToggleId(this,'accountsAdmin');"><img src="<s:url value="/includes/images/icons/review.png"/>" height="15" width="15">&nbsp;Tech&nbsp;Reviews</a></li> --%>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="panel panel-default left-menu" id="accordian_services">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a id="dashboardCsrLeftMenu" data-toggle="collapse" data-parent="#accordian" href="#dashboardMenuCsr">
                            <i class="fa fa-tachometer leftBullet"></i>
                            <span id="dashboardAdmin" class="pull-right"><i id="testIconDashboard" class="fa fa-sort-asc" style="color: white;"></i></span>
                            Dashboard
                        </a>
                    </h4>
                </div>
                <div id="dashboardMenuCsr" class="panel-collapse collapse">
                    <div class="panel-body">
                        <ul id="dashboardDisplay">
                            <li><i class="fa fa-bar-chart-o" style="color: blue;"></i><a id="dashboardDetailsCsr" href="/<%=ApplicationConstants.CONTEXT_PATH%>/dashboard/dashBoardDetails.action" onClick="leftMenuToggleId(this,'dashboardAdmin');">&nbsp;Requirements</a></li>

                        </ul>
                    </div>
                </div>
            </div>
          <%--  <div class="panel panel-default left-menu" id="accordian_team">
                <div class="panel-heading" >
                    <h4 class="panel-title">
                        <a id="utilitiesCsrLeftMenu" data-toggle="collapse" data-parent="#accordian" href="#utilitiesMenuCsr">
                            <i  class="fa fa-cogs leftBullet"></i>
                            <span id="utilitiesAdmin" class="pull-right"><i id="testIconUtilities" class="fa fa-sort-asc" style="color: white;"></i></span>
                            Utilities
                        </a>
                    </h4>
                </div>
                <div id="utilitiesMenuCsr" class="panel-collapse collapse">
                    <div class="panel-body">
                        <ul id="utilitiesDisplay">
                            <li><a id="changeMyPasswordCsr" href="/<%=ApplicationConstants.CONTEXT_PATH%>/general/changeMyPassword.action" onClick="leftMenuToggleId(this,'utilitiesAdmin');"><img src="<s:url value="/includes/images/icons/changePass.png"/>" height="15" width="15">&nbsp;Change Password</a></li>
                           
                        </ul>
                    </div>
                </div>
            </div>--%>

<script type="text/JavaScript" src="<s:url value="/includes/js/newCsr.js"/>"></script>

      <script type="text/javascript" src="<s:url value="/includes/js/jquery.scrollUp.min.js"/>"></script> 

        </div>


    </div>
</div>

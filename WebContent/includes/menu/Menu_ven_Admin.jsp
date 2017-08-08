 <%-- 
    Document   : Menu ven Admin
    Created on : June 3, 2015, 8:32:32 PM
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
<div class="col-sm-12 col-md-3 col-lg-2 side_menu" id="cssmenu">
    <div class="left-sidebar">
        <%
            String usrId = session.getAttribute(ApplicationConstants.USER_ID).toString();
            String orgId = session.getAttribute(ApplicationConstants.ORG_ID).toString();
            
            String actionName = ActionContext.getContext().getName();
            System.out.println("action name"+actionName);
        %>
        <span id="action" style="display: none"><%=actionName%></span> 
       
        <div class="panel-group category-products" id="accordian">


            <div class="panel panel-default left-menu" id="accordian_my">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a id="homeVendorAdminLeftMenu"  data-toggle="collapse" data-parent="#accordian" href="#homeMenuVenAdmin">
                            <i  class="fa fa-home leftBullet"></i>
                            <span id="homeAdmin" class="badge pull-right"><i id="testIconHome" class="fa fa-sort-asc" style="color: white;"></i></span>
                            Home
                        </a>
                    </h4>
                </div>
                <div id="homeMenuVenAdmin" class="panel-collapse collapse">
                    <div class="panel-body" >
                        <ul id="homeDisplay">
                            <li><a id="accountInfoHomeMenuVenAdmin" href="/<%=ApplicationConstants.CONTEXT_PATH%>/acc/viewAccount.action?accountSearchID=<%=orgId%>&accFlag=accDetails" onClick="leftMenuToggleId(this,'homeAdmin');"><img src="<s:url value="/includes/images/icons/accountInfo.png"/>" height="15" width="15">&nbsp;Account&nbsp;Details</a></li>
                          <%--   <li><a id="profileHomeMenuVenAdmin" href="/<%=ApplicationConstants.CONTEXT_PATH%>/acc/accountcontactedit.action?contactId=<%=usrId%>&accountSearchID=<%=orgId%>&flag=vendorlogin" onClick="leftMenuToggleId(this,'homeAdmin');"><img src="<s:url value="/includes/images/icons/editProfile.png"/>" height="15" width="15">&nbsp;Profile</a></li>--%>

                            <li><a id="tasksHomeMenuVenAdmin" href="/<%=ApplicationConstants.CONTEXT_PATH%>/users/tasks/doTasksSearch.action" onClick="leftMenuToggleId(this,'homeAdmin');"><img src="<s:url value="/includes/images/icons/addTask.png"/>" height="15" width="15">&nbsp;My&nbsp;Tasks</a></li>
                            <li><a id="timesheetsHomeMenuVenAdmin" href="/<%=ApplicationConstants.CONTEXT_PATH%>/users/timesheets/timesheetSearch.action" onClick="leftMenuToggleId(this,'homeAdmin');"><img  src="<s:url value="/includes/images/icons/timesheet_icon.png"/>" height="15" width="15">&nbsp;My&nbsp;Timesheets</a></li>

                        </ul>
                    </div>
                </div>
            </div>
            <div class="panel panel-default left-menu" id="accordian_services">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a id="dashboardVendorAdminLeftMenu" data-toggle="collapse" data-parent="#accordian" href="#dashboardMenuVenAdmin">
                            <i  class="fa fa-tachometer leftBullet"></i>
                            <span id="dashboardAdmin" class="badge pull-right"><i class="fa fa-sort-asc" id="testIconDashboard" style="color: white;"></i></span>
                            Dashboard
                        </a>
                    </h4>
                </div>
                <div id="dashboardMenuVenAdmin" class="panel-collapse collapse">
                    <div class="panel-body">
                        <ul id="dashboardDisplay">
                            <li><a id="requirementsDashboardVenAdmin" href="/<%=ApplicationConstants.CONTEXT_PATH%>/vendor/vendorDashboard.action" onClick="leftMenuToggleId(this,'dashboardAdmin');"><i class="fa fa-bar-chart-o" style="color: blue"></i>&nbsp;Requirements&nbsp;</a></li>
                         <%--  <li><a id="requirementsDashboardVenEmp" href="/<%=ApplicationConstants.CONTEXT_PATH%>/turnip/getClientRequirementsDashboards.action"><i class="fa fa-bar-chart-o" style="color: blue"></i>&nbsp;Turnip&nbsp;</a></li>  --%> 
                        </ul>
                    </div>
                </div>
            </div>
            <div class="panel panel-default left-menu" id="accordian_services">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a id="utilitiesVendorAdminLeftMenu" data-toggle="collapse" data-parent="#accordian" href="#utilitiesMenuVenAdmin">
                            <i  class="fa fa-cogs leftBullet"></i>
                            <span id="utilitiesAdmin" class="badge pull-right"><i id="testIconUtilities" class="fa fa-sort-asc" style="color: white;"></i></span>
                            Utilities
                        </a>
                    </h4>
                </div>
                <div id="utilitiesMenuVenAdmin" class="panel-collapse collapse">
                    <div class="panel-body">
                        <ul id="utilitiesDisplay">

                            <li><a id="empCategoryUtilitiesMenuVenAdmin" href="/<%=ApplicationConstants.CONTEXT_PATH%>/users/general/getEmployeeCategorization.action" onClick="leftMenuToggleId(this,'utilitiesAdmin');"><img src="<s:url value="/includes/images/icons/empGrouping.png"/>" height="15" width="15">&nbsp;Employee&nbsp;Grouping</a></li>
                        <%--     <li><a id="changePasswordUtilitiesMenuVenAdmin" href="/<%=ApplicationConstants.CONTEXT_PATH%>/general/changeMyPassword.action" onClick="leftMenuToggleId(this,'utilitiesAdmin');"><img src="<s:url value="/includes/images/icons/changePass.png"/>" height="15" width="15">&nbsp;Change Password</a></li>--%> 
                            
                            <li><a id="uploadContactsUtilitiesMenuVenAdmin" href="/<%=ApplicationConstants.CONTEXT_PATH%>/users/general/loadDataForUser.action" onClick="leftMenuToggleId(this,'utilitiesAdmin');"><img src="<s:url value="/includes/images/icons/upload.png"/>" height="12" width="12">&nbsp;Upload&nbsp;Bulk&nbsp;Contacts</a></li>
                            <li><a id="homeRedirectionUtilitiesMenuVenAdmin" href="/<%=ApplicationConstants.CONTEXT_PATH%>/users/general/getHomeRedirectDetails.action" onClick="leftMenuToggleId(this,'utilitiesAdmin');"><img src="<s:url value="/includes/images/icons/homeredirect.png"/>" height="15" width="15">&nbsp;Home&nbsp;Redirection</a></li>
                            <li><a id="loggerSearchUtilitiesMenuVenAdmin" href="/<%=ApplicationConstants.CONTEXT_PATH%>/users/general/searchLogger.action?loggerFlag=left" onClick="leftMenuToggleId(this,'utilitiesAdmin');"><img src="<s:url value="/includes/images/icons/log_search.png"/>" height="15" width="15">&nbsp;Uploaded&nbsp;Status</a></li>
                           <li><a id="resetPasswordUtilitiesMenuVenAdmin" href="/<%=ApplicationConstants.CONTEXT_PATH%>/general/resetUserPassword.action" onClick="leftMenuToggleId(this,'utilitiesAdmin');"><img src="<s:url value="/includes/images/icons/resetPass.png"/>" height="15" width="15">&nbsp;Reset&nbsp;User&nbsp;Password</a></li>
                        </ul>
                    </div>
                </div>
            </div>
<script type="text/JavaScript" src="<s:url value="/includes/js/newVendorAdmin.js"/>"></script>

      <script type="text/javascript" src="<s:url value="/includes/js/jquery.scrollUp.min.js"/>"></script> 


        </div>


    </div>
</div>

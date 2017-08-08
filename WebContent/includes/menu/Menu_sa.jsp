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
            System.out.println("action name"+actionName);
            
        %>
         <span id="action" style="display: none"><%=actionName%></span>
<div class="col-sm-12 col-md-3 col-lg-2 side_menu">
    <div class="left-sidebar">

        <div class="panel-group category-products" id="accordian">
            <!--category-products-->
            <div class="panel panel-default left-menu" id="accordian_my">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a id="accountsSALeftMenu" data-toggle="collapse" data-parent="#accordian" href="#accountsMenuAdmin">
                            <i  class="fa fa-briefcase leftBullet"></i>
                            <span id="accountsAdmin" class="badge pull-right"><i id="testIconAccounts" class="fa fa-sort-asc" style="color: white;"></i></span>
                            Accounts
                        </a>
                    </h4>
                </div>
                <div id="accountsMenuAdmin" class="panel-collapse collapse">
                    <div class="panel-body" >
                        <ul id="accountsDisplay">
                            <li><a id="searchAccountsMenuAdmin" href="/<%=ApplicationConstants.CONTEXT_PATH%>/acc/searchAccountsBy.action" onClick="leftMenuToggleId(this,'accountsAdmin');"><img src="<s:url value="/includes/images/icons/SearchGlobe.png"/>" height="15" width="15">&nbsp;Search&nbsp;Accounts</a> </li>
                            <li><a id="addAccountMenuAdmin" href="/<%=ApplicationConstants.CONTEXT_PATH%>/acc/accountadd.action" onClick="leftMenuToggleId(this,'accountsAdmin');"><img src="<s:url value="/includes/images/leftmenuicons/add.png"/>" height="15" width="15">&nbsp;Add&nbsp;Account</a></li>
                         
                        </ul>
                    </div>
                </div>
            </div>
            <div class="panel panel-default left-menu" id="accordian_csr">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a id="CSRSALeftMenu" data-toggle="collapse" data-parent="#accordian" href="#CSRMenuAdmin">
                            <i  class="fa fa-briefcase leftBullet"></i>
                            <span id="CSRAdmin" class="badge pull-right"><i id="testIconCSR" class="fa fa-sort-asc" style="color: white;"></i></span>
                            CSR
                        </a>
                    </h4>
                </div>
                <div id="CSRMenuAdmin" class="panel-collapse collapse">
                    <div class="panel-body" >
                        <ul id="CSRDisplay">
                            <li><a id="csrListAccountsMenuAdmin" href="/<%=ApplicationConstants.CONTEXT_PATH%>/users/general/csrList.action" onClick="leftMenuToggleId(this,'CSRAdmin');"><img src="<s:url value="/includes/images/icons/SearchGlobe.png"/>" height="15" width="15">&nbsp;Search&nbsp;CSR</a></li>   
                            <li><a id="assignAccountsMenuAdmin" href="/<%=ApplicationConstants.CONTEXT_PATH%>/acc/assignedRoles.action" onClick="leftMenuToggleId(this,'CSRAdmin');"><img src="<s:url value="/includes/images/leftmenuicons/add_user.png"/>" height="15" width="15">&nbsp;Assign&nbsp;Accounts</a></li>
                        </ul>
                    </div>
                </div>
            </div>
           <div class="panel panel-default left-menu" id="accordian_services">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a id="dashboardSALeftMenu" data-toggle="collapse" data-parent="#accordian" href="#dashboardMenuAdmin">
                            <i  class="fa fa-tachometer leftBullet"></i>
                            <span id="dashboardAdmin" class="badge pull-right"><i id="testIconDashboard" class="fa fa-sort-asc" style="color: white;"></i></span>
                            Dashboard
                        </a>
                    </h4>
                </div>
                <div id="dashboardMenuAdmin" class="panel-collapse collapse">
                    <div class="panel-body">
                        <ul id="dashboardDisplay">
                            <li><a id="requirementsDashboardMenuAdmin" href="/<%=ApplicationConstants.CONTEXT_PATH%>/dashboard/dashBoardDetails.action" onClick="leftMenuToggleId(this,'dashboardAdmin');"><img src="<s:url value="/includes/images/leftmenuicons/chart.png"/>" height="15" width="15">&nbsp;Requirements</a></li>
                           
                        </ul>
                    </div>
                </div>
            </div>             
            <div class="panel panel-default left-menu" id="accordian_team">
                <div class="panel-heading" >
                    <h4 class="panel-title">
                        <a id="utilitiesSALeftMenu"  data-toggle="collapse" data-parent="#accordian" href="#utilitiesMenuAdmin">
                            <i  class="fa fa-cogs leftBullet"></i>
                            <span id="utilitiesAdmin" class="badge pull-right"><i id="testIconUtilities" class="fa fa-sort-asc" style="color: white;"></i></i></span>
                            Utilities
                        </a>
                    </h4>
                </div>
                <div id="utilitiesMenuAdmin" class="panel-collapse collapse">
                    <div class="panel-body">
                        <ul id="utilitiesDisplay">
                            <%--  <li><a id="changePasswordUtilitiesMenuAdmin" href="/<%=ApplicationConstants.CONTEXT_PATH%>/general/changeMyPassword.action" onClick="leftMenuToggleId(this,'utilitiesAdmin');"><img src="<s:url value="/includes/images/icons/changePass.png"/>" height="15" width="15">&nbsp;Change&nbsp;Password</a></li>
                            --%>
                            <li><a id="uploadAccountsUtilitiesMenuAdmin" href="/<%=ApplicationConstants.CONTEXT_PATH%>/users/general/loadData.action" onClick="leftMenuToggleId(this,'utilitiesAdmin');"><img src="<s:url value="/includes/images/icons/upload.png"/>" height="12" width="12">&nbsp;Upload&nbsp;Bulk&nbsp;Accounts</a></li>
                           <li><a id="uploadContactsUtilitiesMenuAdmin" href="/<%=ApplicationConstants.CONTEXT_PATH%>/users/general/loadDataForUser.action" onClick="leftMenuToggleId(this,'utilitiesAdmin');"><img src="<s:url value="/includes/images/icons/upload.png"/>" height="12" width="12">&nbsp;Upload&nbsp;Bulk&nbsp;Contacts</a></li>
                           <li><a id="loggerAccountsMenuAdmin" href="/<%=ApplicationConstants.CONTEXT_PATH%>/users/general/searchLogger.action?loggerFlag=left" onClick="leftMenuToggleId(this,'utilitiesAdmin');"><img src="<s:url value="/includes/images/icons/log_search.png"/>" height="15" width="15">&nbsp;Uploaded&nbsp;Status</a></li>
                           <li><a id="skillsApprovalUtilitiesMenuAdmin" href="/<%=ApplicationConstants.CONTEXT_PATH%>/users/general/skillsApprovalForConsultant.action" onClick="leftMenuToggleId(this,'utilitiesAdmin');"><img src="<s:url value="/includes/images/icons/actionAuth.png"/>" height="12" width="12">&nbsp;Approve&nbsp;Skills&nbsp;</a></li>
                           
                           <li><a id="actionAuthUtilitiesMenuAdmin" href="/<%=ApplicationConstants.CONTEXT_PATH%>/accauth/getAccAuthrization.action" onClick="leftMenuToggleId(this,'utilitiesAdmin');"><img src="<s:url value="/includes/images/icons/actionAuth.png"/>" height="15" width="15">&nbsp;Service&nbsp;Authorization</a></li>
                            <li><a id="homeRedirectUtilitiesMenuAdmin" href="/<%=ApplicationConstants.CONTEXT_PATH%>/users/general/getHomeRedirectDetails.action" onClick="leftMenuToggleId(this,'utilitiesAdmin');"><img src="<s:url value="/includes/images/icons/homeredirect.png"/>" height="12" width="12">&nbsp;Home&nbsp;Redirect</a></li>
                            <li><a id="resetPasswordUtilitiesMenuAdmin" href="/<%=ApplicationConstants.CONTEXT_PATH%>/general/resetUserPassword.action" onClick="leftMenuToggleId(this,'utilitiesAdmin');"><img src="<s:url value="/includes/images/icons/resetPass.png"/>" height="15" width="15">&nbsp;Reset&nbsp;User&nbsp;Password</a></li>
                       </ul>
                    </div>
                </div>
            </div>

     <script type="text/JavaScript" src="<s:url value="/includes/js/newSa.js"/>"></script>

      <script type="text/javascript" src="<s:url value="/includes/js/jquery.scrollUp.min.js"/>"></script>        

        </div>


    </div>
</div>
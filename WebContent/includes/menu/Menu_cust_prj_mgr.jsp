<%--
    Document   : MenuSales
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

<div class="col-sm-12 col-md-3 col-lg-2 side_menu" >
    <div class="left-sidebar">

        <div class="panel-group category-products" id="accordian">
         
            <div class="panel panel-default left-menu" id="accordian_my">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a id="homeCustPMLeftMenu" data-toggle="collapse" data-parent="#accordian" href="#homeProjectManager">
                            <i  class="fa fa-home leftBullet"></i>
                            <span id="homeAdmin" class="pull-right"><i id="testIconHome" class="fa fa-sort-asc" style="color: white;"></i></span>
                            Home
                        </a>
                    </h4>
                </div>
                <div id="homeProjectManager" class="panel-collapse collapse">
                    <div class="panel-body" >
                        <ul id="homeDisplay">
                            <%
                                String usrId = session.getAttribute(ApplicationConstants.USER_ID).toString();
                                String orgId = session.getAttribute(ApplicationConstants.ORG_ID).toString();

                            %>
                            <li><a id="projectsHomeProjectManager" href="/<%=ApplicationConstants.CONTEXT_PATH%>/getMainProjects.action" onClick="leftMenuToggleId(this,'homeAdmin');"><img src="<s:url value="/includes/images/icons/project.png"/>" height="15" width="15">&nbsp;Projects&nbsp;Search</a></li>
                            <li><a id="budgetsHomeProjectManager" href="/<%=ApplicationConstants.CONTEXT_PATH%>/budgets/ProjectBudgetDetails.action" onClick="leftMenuToggleId(this,'homeAdmin');"><img src="<s:url value="/includes/images/icons/dollar.png"/>" height="15" width="15">&nbsp;Project&nbsp;Budget</a></li>
                            <li><a id="requirementsHomeProjectManager" href="/<%=ApplicationConstants.CONTEXT_PATH%>/recruitment/consultant/getLoginUserRequirementList.action?orgid=<%=orgId%>&customerFlag=customer&accountFlag=MyRequirements" onClick="leftMenuToggleId(this,'homeAdmin');"><img src="<s:url value="/includes/images/icons/requirement.png"/>" height="15" width="15">&nbsp;Requirements</a></li>
                            
                            <li><a id="submissionsHomeProjectManager" href="/<%=ApplicationConstants.CONTEXT_PATH%>/Requirements/getSubmissionList.action?pageFlag=submitList" onClick="leftMenuToggleId(this,'homeAdmin');"><i class="fa fa-users" aria-hidden="true" style="color: CornflowerBlue"></i>&nbsp;Submitted&nbsp;Profiles</a></li>

                            <li><a id="timesheetsHomeProjectManager" href="/<%=ApplicationConstants.CONTEXT_PATH%>/users/timesheets/timesheetSearch.action" onClick="leftMenuToggleId(this,'homeAdmin');"><img  src="<s:url value="/includes/images/icons/timesheet_icon.png"/>" height="15" width="15">&nbsp;My&nbsp;Timesheets</a></li>
                            <li><a id="tasksHomeProjectManager" href="/<%=ApplicationConstants.CONTEXT_PATH%>/users/tasks/doTasksSearch.action" onClick="leftMenuToggleId(this,'homeAdmin');"><img src="<s:url value="/includes/images/icons/addTask.png"/>" height="15" width="15">&nbsp;My&nbsp;Tasks</a></li>

                            <li><a id="techReviewsHomeProjectManager" href="/<%=ApplicationConstants.CONTEXT_PATH%>/recruitment/consultant/getTechReviewDetails.action?pageFlag=techReviewList" onClick="leftMenuToggleId(this,'homeAdmin');"><img src="<s:url value="/includes/images/icons/review.png"/>" height="15" width="15">&nbsp;Tech&nbsp;Reviews</a></li>                           
                        </ul>
                    </div>
                </div>
            </div>
            
             <div class="panel panel-default left-menu" id="accordian_services">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a id="dashboardCustPMLeftMenu" data-toggle="collapse" data-parent="#accordian" href="#dashboardMenuCustAdmin">
                            <i  class="fa fa-tachometer leftBullet"></i>
                            <span id="dashboardAdmin" class=" pull-right"><i class="fa fa-sort-asc" id="testIconDashboard" style="color: white;"></i></span>
                            Dashboard
                        </a>
                    </h4>
                </div>
                <div id="dashboardProjectManager" class="panel-collapse collapse">
                    <div class="panel-body">
                        <ul id="dashboardDisplay">
                            <li><a id="customerDashboardCustAdmin" href="/<%=ApplicationConstants.CONTEXT_PATH%>/dashboard/customerDashBoardDetails.action" onClick="leftMenuToggleId(this,'dashboardAdmin');"><i class="fa fa-bar-chart-o" style="color: blue"></i>&nbsp;Requirements</a></li>
                            <li><a id="costcenterDashboardCustAdmin" href="/<%=ApplicationConstants.CONTEXT_PATH%>/costCenter/costCenterDashBoardDetails.action" onClick="leftMenuToggleId(this,'dashboardAdmin');"><i class="fa fa-bar-chart-o" style="color: blue"></i>&nbsp;Cost&nbsp;Center</a></li>
                            <li><a id="projectDashboardCustAdmin" href="/<%=ApplicationConstants.CONTEXT_PATH%>/projectDashBoardDetails.action" onClick="leftMenuToggleId(this,'dashboardAdmin');"><i class="fa fa-bar-chart-o" style="color: blue"></i>&nbsp;Projects</a></li>
                            <%-- <li><a id="customerDashboardCustAdmin" href="/<%=ApplicationConstants.CONTEXT_PATH%>/turnip/getVendorResourcePage.action" ><i class="fa fa-bar-chart-o" style="color: blue"></i>&nbsp;Turnip</a></li>  --%>
                            
                        </ul>
                    </div>
                </div>
            </div>

            <div class="panel panel-default left-menu" id="accordian_services">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a id="utilitiesCustPMLeftMenu" data-toggle="collapse" data-parent="#accordian" href="#utilitiesProjectManager">
                            <i  class="fa fa-cogs leftBullet"></i>
                            <span id="utilitiesAdmin" class="pull-right"><i id="testIconUtilities" class="fa fa-sort-asc" style="color: white;"></i></span>
                            Utilities

                        </a>
                    </h4>
                </div>
                <div id="utilitiesProjectManager" class="panel-collapse collapse">
                    <div class="panel-body">
                        <ul id="utilitiesDisplay">
                            <li><a id="teamTimesheetsUtilitiesProjectManager" href="/<%=ApplicationConstants.CONTEXT_PATH%>/users/timesheets/teamTimesheet.action" onClick="leftMenuToggleId(this,'utilitiesAdmin');"><img  src="<s:url value="/includes/images/icons/timesheet_icon.png"/>" height="15" width="15">&nbsp;Team&nbsp;Timesheets</a></li>
                            <li><a id="teamsTasksUtilitiesProjectManager" href="/<%=ApplicationConstants.CONTEXT_PATH%>/users/tasks/doTeamTasksSearch.action" onClick="leftMenuToggleId(this,'utilitiesAdmin');"><img src="<s:url value="/includes/images/icons/addTask.png"/>" height="15" width="15">&nbsp;Team&nbsp;Tasks</a></li>
                            <li><a id="rateCardsUtilitiesProjectManager" href="/<%=ApplicationConstants.CONTEXT_PATH%>/Requirements/getRateCardList.action" onClick="leftMenuToggleId(this,'utilitiesAdmin');"><i class="fa fa-money" aria-hidden="true" style="color: CornflowerBlue"></i>&nbsp;Rate&nbsp;cards</a></li>

                            


                        </ul>
                    </div>
                </div>
            </div>

<script type="text/JavaScript" src="<s:url value="/includes/js/newCustPrjMngr.js"/>"></script>

      <script type="text/javascript" src="<s:url value="/includes/js/jquery.scrollUp.min.js"/>"></script>


        </div>


    </div>
</div>

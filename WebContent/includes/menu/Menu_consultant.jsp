 <%--
    Document   : menu_consutalnt
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
        
<div class="col-sm-12 col-md-3 col-lg-2 side_menu"  id="cssmenu">
    <div class="left-sidebar">

        <div class="panel-group category-products" id="accordian">
         
            <div class="panel panel-default left-menu" id="accordian_my">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a id="homeVendorConsultLeftMenu" data-toggle="collapse" data-parent="#accordian" href="#homeMenuConsultant">
                            <i  class="fa fa-home leftBullet"></i>
                            <span id="homeAdmin" class="badge pull-right"><i id="testIconHome" class="fa fa-sort-asc" style="color: white;"></i></span>
                            Home
                        </a>
                    </h4>
                </div>
                <div id="homeMenuConsultant" class="panel-collapse collapse">
                    <div id="beforeparentTest" class="panel-body" >
                        <ul id="homeDisplay">
                           
                            <%
                            String usrId = session.getAttribute(ApplicationConstants.USER_ID).toString();
                            String orgId = null;
                            %>
                            <s:if test="#session.primaryrole != 15">
                            <%
                                 orgId = session.getAttribute(ApplicationConstants.ORG_ID).toString();

                            %>
                            </s:if>
                            <li id="liverify"><a id="profileHomeMenuConsultant" href="/<%=ApplicationConstants.CONTEXT_PATH%>/recruitment/consultantLogin/getConsultantProfile.action" onClick="leftMenuToggleId(this,'homeAdmin');"><img src="<s:url value="/includes/images/icons/editProfile.png"/>" height="15" width="15">&nbsp;Profile</a></li>
                         <li><a id="vendorsListForConsultant" href="/<%=ApplicationConstants.CONTEXT_PATH%>/recruitment/consultantLogin/getVendorsListForConsultant.action" onClick="leftMenuToggleId(this,'homeAdmin');"><img src="<s:url value="/includes/images/icons/vendor_Copy.png"/>" height="15" width="15">&nbsp;Vendors</a></li>
                          <%--  <li><a id="timesheetsHomeMenuConsultant" href="/<%=ApplicationConstants.CONTEXT_PATH%>/users/timesheets/timesheetSearch.action"><img  src="<s:url value="/includes/images/icons/timesheet_icon.png"/>" height="15" width="15">&nbsp;Time&nbsp;Sheets</a></li>
                            <li><a id="tasksHomeMenuConsultant" href="/<%=ApplicationConstants.CONTEXT_PATH%>/users/tasks/doTasksSearch.action"><img src="<s:url value="/includes/images/icons/addTask.png"/>" height="15" width="15">&nbsp;Tasks</a></li>   --%>
                            
                            
                        </ul>
                    </div>
                </div>
            </div>
<%-- 
            <div class="panel panel-default left-menu" id="accordian_services">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a id="utilitiesVendorConsultLeftMenu" data-toggle="collapse" data-parent="#accordian" href="#utilitesMenuConsultant">
                            <i  class="fa fa-cogs leftBullet"></i>
                            <span id="utilitiesAdmin" class="badge pull-right"><i id="testIconUtilities"id="testIconUtilities" class="fa fa-sort-asc" style="color: white;"></i></span>
                            Utilities

                        </a>
                    </h4>
                </div>
                <div id="utilitesMenuConsultant" class="panel-collapse collapse">
                    <div class="panel-body">
                        <ul id="utilitiesDisplay">
                            <li><a id="changePasswordUtilitesMenuConsultant" href="/<%=ApplicationConstants.CONTEXT_PATH%>/general/changeMyPassword.action" onClick="leftMenuToggleId(this,'utilitiesAdmin');"><img src="<s:url value="/includes/images/icons/changePass.png"/>" height="15" width="15">&nbsp;Change Password</a></li>
                        </ul>
                    </div>
                </div>
            </div>
--%>
<script type="text/JavaScript" src="<s:url value="/includes/js/newConsultantAdmin.js"/>"></script>

      <script type="text/javascript" src="<s:url value="/includes/js/jquery.scrollUp.min.js"/>"></script> 

        </div>


    </div>
</div>


<%-- 
    Document   : login
    Created on : Feb 3, 2015, 4:04:37 PM
    Author     : Nagireddy
--%>

<%@ page contentType="text/html; charset=UTF-8" errorPage="../exception/403.jsp"%>
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
        <title>ServicesBay :: User Forgot password page</title>

        <link rel="stylesheet" type="text/css" href="<s:url value="/includes/css/bootstrap.min.css"/>">
        <link rel="stylesheet" type="text/css" href="<s:url value="/includes/css/font-awesome.min.css"/>">
        <link rel="stylesheet" type="text/css" href="<s:url value="/includes/css/main.css"/>">
        <link rel="stylesheet" type="text/css" href="<s:url value="/includes/css/responsive.css"/>">
        <link rel="stylesheet" type="text/css" href="<s:url value="/includes/css/home/home.css"/>">
        <!-- end of new styles -->

        <!-- start of js -->
        <script type="text/JavaScript" src="<s:url value="/includes/js/jquery.js"/>"></script>
        <script type="text/JavaScript" src="<s:url value="/includes/js/bootstrap.min.js"/>"></script>
        <script type="text/JavaScript" src="<s:url value="/includes/js/Ajax/GeneralAjax.js"/>"></script>
        <script src='https://www.google.com/recaptcha/api.js'></script>


        <!-- end of js -->

    </head>
    <body   oncontextmenu="return false" >
        <div id="wrap">    
            <header id="header"><!--header-->
                <div class="header_top" id="header_top"><!--header_top-->
                    <div class="container">
                        <s:include value="/includes/template/header.jsp"/> 
                    </div>
                </div><!--/header_top-->

            </header><!--/header-->

            <div id="main">
                <section id="form"><!--form-->

                    <div class="container">

                        <div class="row">

                            <center><div class="col-lg-12" id="row"> 

                                    <h1>Set your new password</h1>

                                </div>   </center>        


                            <!-- Start Special Centered Box -->
                            <div class="col-sm-4 col-sm-offset-4 case">
                                <div class="login-form" ><!--login form-->

                                    <div class="jumbotron">  

                                        <s:form id="formCheckPassword" action="resetPassword" onsubmit="return forgotPasswordCaptchaValidation();">
                                            <input  class="form-control" type="text" value=<%= request.getParameter("emailId")%> disabled="true" placeholder="Email" kl_virtual_keyboard_secure_input="on" />
                                            <input type="hidden" id="emailId"  name="emailId" value=<%= request.getParameter("emailId")%> />
                                            <input type="password" placeholder="Password"  required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" name="password" onchange="form.conformpwd.pattern = this.value;" id="password" title="atleast one capital letter and a number must be there" required data-error-message="password is required!" tabindex="1"/>
                                            <input type="password" placeholder="Confirm password"  id="conformpwd" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" name="conformpwd" required data-type="Password" title="must be same as password" tabindex="2" />
                                             
                                             <div class="g-recaptcha" data-sitekey="6LfmzR8UAAAAAJhXhE8Qii1X1kwYz4Oq2nRjj0bI"></div>
											<span id="captchaSpan" style="font-size:15px;font-family:Times New Roman;"></span>
                                             <button type="submit" class="pwd_btn pull-right">Reset Password</button>
                                        </s:form>



                                        <%--<s:form id="formCheckPassword" action="resetPassword">
         
                                     <input id="emailId" class="form-control" type="text" disabled=""  name="emailId" id="emailId" value="%{emailId}" placeholder="Email" kl_virtual_keyboard_secure_input="on" tabindex="2"/>
                                    <s:textfield  class="form-control" type="text" readonly="true"  name="emailId" id="emailId" />
                                        <%-- <input type="password" placeholder="password"  required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" name="password" onchange="form.pwd2.pattern = this.value;" id="password" title="atleast one capital letter and a number must be there" required data-error-message="password is required!" tabindex="1"/>

                                <input type="password" placeholder="confirm password"  id="confirmpass" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" name="cnfrmpwd" required data-type="Password" title="must be same as password" tabindex="1" />
                                <input type="submit" class="resetPasswordButton" type="submit" value="submit" /> 
                               <s:password name="password" id="password"/>
                               <s:password name="conformpwd" id="conformpwd"/>
                               <s:submit value="ResetPassword" />
                            </s:form>--%>

                                    </div><!--/login form-->
                                </div>

                            </div>
                        </div>
                    </div>
                </section>
            </div>

        </div>
        <div class="login-form modal fade" id="myLogin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                            <div class="modal-dialog" id="Form_login" role="document" >
                                <div class="modal-content">
                                    <div class="modal-header " style="background-color: rgb(52,152,219);background-color: rgba(52,152,219,0.8);  border-top-right-radius: 6px; border-top-left-radius: 6px;"> 
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="myModalLabel" style="color:white">Login to your account</h4>
                                    </div>
                                    <div class="modal-body">
                                        <% if (request.getAttribute("errorMessage") != null) {
                                        %>
                                        <script type="text/javascript">
                                             
                                            $('#myLogin').modal('show');
                                  
                                        </script>  
                                        <% out.println(request.getAttribute("errorMessage"));
                                        %>
                                        <%
                                            }%>
                                        <s:form action="/general/loginCheck.action" method="post" name="userLoginForm" id="userLoginForm" > 
                                            <input type="email" placeholder="Email" class="frgt_pwd" name="emailId" id="emailId" pattern="[^@]+@[^@]+\.[a-zA-Z]{2,6}" required data-error-message="LoginId is required!" tabindex="1"/>

                                            <input type="password" placeholder="Password" class="frgt_pwd"  name='password' pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" id="password" title="Must be at least 6 characters long, and contain at least one number, one uppercase and one lowercase letter" required data-type="Password" tabindex="2" />

                                            <p id="wrapper" class="frgt_pwd"><a  class="slide_open" href="" id="closeLogin" data-dismiss="modal" data-toggle="modal" data-target="#forgotPwd"><font class ="fgtPwd">Forgot Password</font></a></p>
                                            <div class="LoginButton">
                                                <button type="submit" >LogIn</button>
                                            </div>
                                        </s:form>



                                    </div></div></div></div>
                              <div id="slide" style="display: none;">
                            <div id="forgetoverlay" >
                                <div style="width: available;border-top-left-radius: 12px;border-top-right-radius: 12px;background-color: rgb(52, 152, 219);">
                                    <table>
                                        <tr ><td style="width:100%" align="left" colspan="2"><h4 style="font-family:Alike Angular">
                                                    <font color="white" style="font-weight: bold;font-size: 22px;">&nbsp;&nbsp;Forgot your password </font></h4></td>
                                        </tr><span class="pull-right"><h5><a class="slide_close" href=""><img src="<s:url value="/includes/images/close_trans.png"/>" height="25" width="25"></a></h5></span>

                                    </table> 
                                </div>
                                <hr style="margin: 0px;">
                                <div style="font-family: Alike Angular; margin-top: 10px; margin-left: 10px; margin-right: 10px;">

                                    <p> Enter the Email address of your account to reset your password</p>
                                    <span id="Loading" style="color:red; width:auto"></span>
                                    <span id="resultMessage" style="width: auto"></span>
                                    <center>
                                        <s:form id="forgotPassword" name="forgotPassword" >

                                            <input type="email"  class="frgt_pwd" pattern="[^@]+@[^@]+\.[a-zA-Z]{2,6}" placeholder="Valid Email Address" id="forgotEmailId" name="forgotEnailId" required= "required"/>
                                            &nbsp;<input style="margin:4px" type="button" class="passwordButton" value="Reset Password" name="FPass" id="FPass" onclick="return forgotPassword();"/>


                                            <%--<button onclick="forgotPassword();">ResetPassword</button>--%>

                                            <%-- <div id="Loading" style="width: auto;display: none;"/> --%>

                                        </s:form>
                                    </center>
                                    <br><br>
                                </div>
                            </div> 
                                         </div>                                 
        <footer id="footer"><!--Footer-->

            <div class="footer-bottom" id="footer_bottom">
                <div class="container">
                    <s:include value="/includes/template/footer.jsp"/>
                </div>
            </div>

        </footer><!--/Footer-->
         <script>
            $(document).ready(function () {

                $('#slide').popup({
                    focusdelay: 400,
                    outline: true,
                    vertical: 'top'
                });
                $(function(){
                    $("#FPass").click(function(){
                        // alert('clicked!');
                        forgotPassword();
                    });
                });
   
                $(".slide_close").click(function(){
                    // alert('clicked!');
                    document.getElementById('resultMessage').innerHTML = "";
                });
            });
            /*$("[data-toggle]").click(function() {
		  
                 var toggle_el = $(this).data("toggle");
                 var duration = 500;
                  var effect = 'slide';
                  var options = { direction: 'right' };
                  $("#menu_section").toggle();
                  $(toggle_el).toggle();
                  $('#menu_section_details').toggle();
             });*/
        </script>
        <script type="text/javascript" src="<s:url value="/includes/js/general/popupoverlay.js"/>"></script>
        <script type="text/JavaScript" src="<s:url value="/includes/js/general/placeholders.min.js"/>"></script>
    </body>
</html>

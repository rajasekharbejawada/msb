<%--
    Document   : AccountAdd
    Created on : Apr 12, 2015, 7:05:25 PM
    Author     : Anton Franklin1
--%>

<%@page import="com.mss.msp.usersdata.UserVTO"%>
<%@page import="com.mss.msp.usersdata.UsersdataHandlerAction"%>
<%@page import="java.util.Iterator"%>
<%@ page contentType="text/html; charset=UTF-8"
	errorPage="../exception/ErrorDisplay.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ page import="java.util.List" isErrorPage="true"%>
<%@ page import="com.mss.msp.util.ApplicationConstants"%>
<!DOCTYPE html>
<html>
<head>
<!-- new styles -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ServicesBay :: Add Account Page</title>

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
	href="<s:url value='/includes/css/accountDetails/details.css'/>">


<script type="text/JavaScript"
	src="<s:url value="/includes/js/general/jquery.min.js"/>"></script>

<script type="text/JavaScript"
	src="<s:url value="/includes/js/account/formVerification.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/general/jquery.maskedinput.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/bootstrap.min.js"/>"></script>

<script type="text/JavaScript"
	src="<s:url value="/includes/js/Ajax/AppConstants.js"/>"></script>

<script type="text/JavaScript"
	src="<s:url value="/includes/js/main.js"/>"></script>
<script language="JavaScript" type="text/javascript"
	src="<s:url value="/includes/js/general/ProfilePage.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/jquery.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/CountriesAjax.js"/>"></script>
<script>
	$(document).ready(function() {
		var val = document.getElementById("errorMessage").innerHTML;

		if (val == document.getElementById("errorMessage").innerHTML) {

			document.getElementById("addaccountsave").disabled = false;
		}
		//             

	});

	function businessTypeChange() {
		var acc_businessType = document.getElementById('acc_businessType').value;
		//alert(acc_businessType);
		if (acc_businessType == "Other") {
			document.getElementById("businessTypeDescDiv").style.display = "block";
			document.getElementById("minorityGroupDiv").style.display = "none";
			document.getElementById("minorityGroup").value = "-1"
		}
		if (acc_businessType == "Private"
				|| acc_businessType == "Women’s Business Enterprise (WBE)") {
			document.getElementById("businessTypeDescDiv").style.display = "none";
			document.getElementById("minorityGroupDiv").style.display = "none";
			document.getElementById("minorityGroup").value = "-1"
			document.getElementById("businessTypeDesc").value = "";
		}
		if (acc_businessType == "Minority Business Enterprise (MBE)") {

			document.getElementById("minorityGroupDiv").style.display = "block";
			document.getElementById("businessTypeDescDiv").style.display = "none";
			document.getElementById("businessTypeDesc").value = "";
		}

	}
</script>
<style type="text/css">
.checkbox-inline {
	vertical-align: text-bottom !important;
}
</style>

</head>
<body oncontextmenu="return false"
	onload="getStates($(acc_country).val(), '#acc_state');
        clearform();">
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
			<div class="container">
				<div class="row">
					<!-- Main Content-->
					<s:include value="/includes/menu/LeftMenu.jsp" />
					<div class="col-sm-12 col-md-9 col-lg-9 right_content" style="">
						<!-- Add Form Area -->
						<div class="col-lg-12">
							<div class="" id="profileBox"
								style="float: left; margin-top: 15px; margin-bottom: 20px">
								<!-- Add Form Header-->
								<div class="backgroundcolor">
									<div class="panel-heading">
										<h4 class="panel-title">
											<font color="#ffffff">Add Account</font>
										</h4>
									</div>
								</div>
								<!-- Add Form-->
								<div class="col-sm-12" style="margin-bottom: 20px">
									<br>

									<s:form action="accountadd" method="post" theme="simple"
										onSubmit="return validateForm()" id="acc_form" name="acc_form"
										enctype="multipart/form-data">
										<p id="resultMessage" align="center" class="accDetailsError">
											<s:property value="resultMessage" />
										</p>
										<span id="orgExtCheckSpan"></span>
										<s:if test="successMessage=='Account already Exist'">  
											<p id="successMessage" align="center" class="accDetailsExists">
												<s:property value="successMessage" />
											</p>
										</s:if>
										<s:else>
											<p id="successMessage" align="center" class="accDetailsSuccess">
												<s:property value="successMessage" />
											</p>
										</s:else>
										<h4>
											<b>Account Information</b>
										</h4>
										<div class="col-sm-12">
											<div class="row">
												<div class="col-sm-3 required">
													<span> <label class="labelStyle2">Account
															Name</label> <s:textfield cssClass="form-control"
															id="account_name" type="text" maxLength="60"
															name="account.name" placeholder="Account Name"
															value="%{account.name}"
															onblur="javascript: nameCheck('#account_name','#accountNameValidation')"
															tabindex="1" /> <span id="accountNameValidation"
														class="accDetailsError"></span>
													</span>
												</div>
												<div class="col-sm-3 required">
													<span> <label class="labelStyle2">Account
															URL </label> <s:textfield cssClass="form-control"
															id="account_url" type="text" maxLength="60"
															name="account.url" placeholder="Account Url"
															value="%{account.url}"
															onblur="javascript: urlCheck('#account_url','#accountURLValidation')"
															tabindex="2" /> <span id="accountURLValidation"
														class="accDetailsError"></span>
													</span> <br />
												</div>

												<div class="col-sm-3 required">
													<span> <label class="labelStyle2">Account
															Type </label> <s:select cssClass="SelectBoxStyles form-control"
															id="account_type" name="account.typeId"
															list="accountTypeList" value="%{account.typeId}"
															headerKey="" headerValue="Select Account Type"
															cssStyle="width:100%;"
															onchange="javascript: accountTypeDropDown();"
															tabindex="3" /> <span id="accountTypeValidation"
														class="accDetailsError"></span>
													</span>
												</div>
												<div class="col-sm-3 required">
													<span> <label class="labelStyle2">Mail
															Extension </label> <s:textfield cssClass="form-control"
															id="email_ext" maxLength="60" name="account.email_ext"
															list="accountTypeList" placeholder="Mail Extension"
															value="%{account.email_ext}" cssStyle="width:100%;"
															onchange="getValidExtention()" tabindex="4" /> <span
														id="accountTypeValidation" class="accDetailsError"></span>
														<span id="orgExtCheckSpan"></span>
													</span>
												</div>

											</div>
										</div>
										<h4>
											<b>Account Address</b>
										</h4>
										<div class="col-sm-12">
											<div class="row">
												<div class="col-sm-3">
													<span> <label class="labelStyle2"> Address 1
													</label> <s:textfield cssClass="form-control" id="address1"
															type="text" maxLength="100" name="account.address1"
															placeholder="Address 1" value="%{account.address1}"
															tabindex="5" />
													</span>
												</div>
												<div class="col-sm-3">
													<span> <label class="labelStyle2"> Address 2
													</label> <s:textfield cssClass="form-control" id="address2"
															type="text" maxLength="100" name="account.address2"
															placeholder="Address 2" value="%{account.address2}"
															tabindex="6" />
													</span>
												</div>

												<div class="col-sm-3">
													<span> <label class="labelStyle2"> <%--<span class="accDetailsError">*</span>--%>
															City
													</label> <s:textfield cssClass="form-control" id="acc_city"
															type="text" maxLength="20" name="account.city"
															placeholder="City" value="%{account.city}"
															onkeypress="return cityValidate(event);"
															onblur="return digitValidate()" tabindex="7" />
													</span> <span id="cityError"></span> <span id="cityCoError"></span>
												</div>
												<div class="col-sm-3">
													<span> <label class="labelStyle2"> Zip </label> <s:textfield
															cssClass="form-control" id="acc_zip" type="text"
															maxLength="10" name="account.zip" placeholder="Zip"
															value="%{account.zip}"
															onkeypress="return zipValidate(event);"
															onblur="return zipcharValidate()" tabindex="8" />
													</span> <span id="zipError"></span>
												</div>
											</div>
											<!--value="%{account.country.id}"-->
											<div class="row">
												<div class="col-sm-3">
													<span> <label class="labelStyle2">Country </label> <s:select
															id="acc_country" name="account.country.id"
															cssClass="SelectBoxStyles form-control" headerKey=""
															theme="simple" list="countryList" listKey="%{id}"
															listValue="%{name}" value="3"
															onchange="javascript:
                                                                  getStates($(acc_country).val(),'#acc_state');"
															cssStyle="width:100%;" tabindex="9" /> <%-- validateDropDown('acc_country','countryValidation')" --%>
														<span id="countryValidation" class="accDetailsError"></span>
													</span>
												</div>

												<div class="col-sm-3">
													<span> <label class="labelStyle2"> State </label> <s:select
															id="acc_state" name="account.state.id"
															cssClass="SelectBoxStyles form-control" headerKey=""
															headerValue="Select State" theme="simple"
															list="stateList" listKey="%{id}" listValue="%{name}"
															cssStyle="width:100%;" value="%{account.state.id}"
															tabindex="10" /> <%-- onchange="validateDropDown('acc_state','stateValidation')" --%>
														<span id="stateValidation" class="accDetailsError"></span>
													</span>
												</div>

												<div class="col-sm-3">
													<span> <label class="labelStyle2"> Phone </label> <s:textfield
															cssClass="form-control" id="phone1" type="text"
															maxLength="15" name="account.phone" placeholder="Phone"
															value="%{account.phone}" tabindex="11" /> <span
														id="phoneValidation" class="accDetailsError"></span>
													</span>
												</div>
												<div class="col-sm-3">
													<span> <label class="labelStyle2">Fax </label> <s:textfield
															cssClass="form-control" id="fax" type="text"
															maxLength="15" name="account.fax" placeholder="Fax"
															value="%{account.fax}" tabindex="12" /> <span
														id="faxValidation" class="accDetailsError"></span>
													</span>
												</div>
											</div>
											<br />
										</div>

										<h4>
											<b>Basic Information</b>
										</h4>
										<div class="col-sm-12">
											<div class="row">
												<div class="col-sm-3">
													<span> <label class="labelStyle2"> Industry</label>
														<s:select id="acc_industry" name="account.industryId"
															cssClass="SelectBoxStyles form-control"
															cssStyle="width:100%;" headerKey=""
															headerValue="Select Industry" theme="simple"
															list="industryList" value="%{account.industryId}"
															tabindex="13" /> <%--onchange="validateDropDown('acc_industry','industryValidation')" --%>
														<span id="industryValidation" class="accDetailsError"></span>
													</span>
												</div>
												<%-- <div class="col-sm-3">
													<span> <label class="labelStyle2">Region </label> <s:textfield
															cssClass="form-control" id="reqion" type="text"
															maxLength="20" name="account.region" placeholder="Region"
															value="%{account.region}"
															onkeypress="return regionValidate(event);"
															onblur="return rdigitValidate()" tabindex="14" /> <span
														id="regionValidation" class="accDetailsError" />
													</span>
												</div> --%>

												<div class="col-sm-3">
													<label style="color: #56a5ec;" class="labelStyle2">Region
													</label>
													<s:select cssClass="form-control SelectBoxStyles"
														value="%{account.region}" name="account.region"
														id="region" headerKey="-1" headerValue="Select Region"
														list="regionName" />
												</div>

												<div class="col-sm-3" style="display: none">
													<span> <label class="labelStyle2">Territory
													</label> <s:textfield cssClass="form-control" id="acc_territory"
															type="text" maxLength="20" name="account.territory"
															placeholder="Territory" value="%{account.territory}"
															onkeypress="return territoryValidate(event);"
															onblur="return tdigitValidate()" tabindex="15" />
													</span> <span id="territoryError" class=""></span>
												</div>

												<div class="col-sm-3">
													<label class="labelStyle2"> No. of Employees </label>
													<s:textfield cssClass="form-control"
														id="acc_no_of_employees" type="text" maxLength="50"
														name="account.noemp" placeholder="No. of Employees"
														value="%{account.noemp}" tabindex="16" />
												</div>




												<div class="col-sm-3">
													<span> <label class="labelStyle2">Tax ID </label> <s:textfield
															cssClass="form-control" id="acc_tax_id" type="text"
															maxLength="20" name="account.tax_id" placeholder="Tax ID"
															value="%{account.tax_id}" tabindex="17" /> <span
														id="taxValidation" class="accDetailsError"></span>
													</span>
												</div>
											</div>
											<div class="row">

												<div class="col-sm-3">
													<span> <label class="labelStyle2">Stock
															Symbol </label> <s:textfield cssClass="form-control"
															id="acc_stock_symbol" type="text"
															name="account.stockSymbol" placeholder="Stock Symbol"
															value="%{account.stockSymbol}" tabindex="18" />
													</span>
												</div>
												<div class="col-sm-3">
													<span> <label class="labelStyle2">Revenue </label> <s:textfield
															cssClass="form-control" id="acc_revenue" type="text"
															maxLength="9" name="account.revenue"
															placeholder="Revenue" value="%{account.revenue}"
															onkeypress="return revenueValidate(event)" tabindex="19" />
														<span id="revenueValidation" class="accDetailsError"></span>
													</span>
												</div>





												<div class="col-sm-3">
													<span> <label class="labelStyle2">Business
															Type </label> <s:select cssClass="SelectBoxStyles form-control"
															id="acc_businessType" name="account.businessType"
															value="%{account.businessType}"
															list="#@java.util.LinkedHashMap@{'C-Corp':'C-Corp','S-Corp':'S-Corp','LLC':'LLC','DBA':'DBA'}"
															tabindex="19" onchange="businessTypeChange();" /> <%--  list="#@java.util.LinkedHashMap@{'Private':'Private','WBE':'Women’s Business Enterprise (WBE)','MBE':'Minority Business Enterprise (MBE)','O':'Other'}"   --%>
													</span>
												</div>

												<div class="col-sm-3">
													<label class="labelStyle2">Staffing Mode </label>
												</div>
												<div class="col-sm-3">
													<s:checkboxlist cssClass="checkbox-inline"
														labelposition="inline"
														list="#@java.util.LinkedHashMap@{'Permanent':'Permanent','Contract':'Contract','SOW':'SOW'}"
														name="account.staffingMode"
														value="%{account.staffingModeList}" />
												</div>
											</div>

											<div class="col-sm-6" id="businessTypeDescDiv"
												style="display: none">
												<span> <label class="labelStyle2">Description
												</label> <s:textarea cssClass="form-control" id="businessTypeDesc"
														type="text" name="account.businessTypeDesc"
														placeholder="Description" maxlength="200"
														value="%{account.businessTypeDesc}" tabindex="20" />
												</span>
											</div>
											<div class="col-sm-6" id="minorityGroupDiv"
												style="display: none">
												<span> <label class="labelStyle2">Minority
														Group </label> <s:select cssClass="SelectBoxStyles form-control"
														id="minorityGroup" name="account.minorityGroup"
														value="%{account.minorityGroup}" headerKey="-1"
														headerValue="Please Select"
														list="#@java.util.LinkedHashMap@{'SAI':'Subcontinent Asian Indian','APA':'Asian Pacific Americans','BA':'Black Americans','HA':'Hispanic Americans','NA':'Native Americans','O':'Other'}"
														tabindex="19" />

												</span>
											</div>



											<%--<div class="col-sm-3">
													<span> <label class="labelStyle2">Staffing
															Mode </label> <s:select cssClass="SelectBoxStyles form-control"
															id="acc_staffingMode" name="account.staffingMode"
															value="%{account.staffingMode}" headerKey=""
															headerValue="Please Select"
															list="#@java.util.LinkedHashMap@{'Permanent':'Permanent','Contract':'Contract'}"
															tabindex="19" />

													</span>  


												
											</div> --%>



											<div class="row">
												<div class="col-sm-6" id="vspecial" style="display: none">

													<label class="labelStyle2">Vendor Specialization </label>

													<div class="" style="margin-top: 5px">
														<s:checkboxlist cssClass="checkbox-inline"
															labelposition="inline" label="Vendor Specialization"
															list="#@java.util.LinkedHashMap@{'IT':'IT','Engineering':'Engineering','Operations':'Operations','Sales':'Sales'}"
															name="account.venSpecialization" />

													</div>
												</div>
											</div>

										</div>
										<div class="row">
											<div class="col-sm-12">

												<label style="color: #56a5ec;" class="labelStyle2">
													<br>
													<p id="vnotes" style="display: none">Vendor Notes</p>

													<p id="cnotes" style="display: none">Customer Notes</p>
													<p id="desc">Description</p>
												</label>
												<s:textarea cssClass="form-control" id="description"
													type="text" name="account.description"
													placeholder="Enter Notes here" maxlength="200"
													value="%{account.description}" tabindex="20"
													onkeyup="ResponseCheckCharacters(this)" />
												<span id="ResponsecharNum" class="charNum"></span> </span>
											</div>
										</div>
										<div class="col-sm-12 ">
											<!--<div class="col-lg-6"></div>-->
											<div class="col-sm-2 pull-right">
												<%--s:reset type="button" cssClass="cssbutton_emps field-margin" key="reset" value="Clear"/--%>
												<input type="button" id="clearButton"
													style="margin: 5px 0px;"
													class="add_searchButton form-control fa fa" key="reset"
													value="&#xf12d;Clear" onclick="clearform();" tabindex="21" />
											</div>
											<div class="col-sm-2 pull-right">
												<input id="cancelButton" type="button"
													style="margin: 5px 0px;"
													class="add_searchButton form-control fa fa"
													onclick="accountSearchRedirecton();" value="&#xf12d;Cancel"
													tabindex="22" />
											</div>
											<div class="col-sm-2 pull-right">
												<s:submit type="button" cssStyle="margin:5px 0px;"
													onclick="return validateForm1();"
													cssClass="add_searchButton form-control" value=""
													tabindex="23" id="addaccountsave">
													<i class="fa fa-floppy-o"></i>&nbsp;Save</s:submit>
											</div>
										</div>
										<div class="row">
											<p id="errorMessage" align="center" class="accDetailsError">
												<s:property value="resultMessage" />
											</p>
										</div>
									</s:form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
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
	<script type="text/JavaScript"
		src="<s:url value="/includes/js/jquery.scrollUp.min.js"/>"></script>
	<script type="text/JavaScript"
		src="<s:url value="/includes/js/general/placeholders.min.js"/>"></script>

</body>
</html>

<%-- 
Document : login
Created on : Feb 3, 2015, 4:04:37 PM
Author : Nagireddy  

home

--%>

<%@ page contentType="text/html; charset=UTF-8"
	errorPage="../exception/403.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ page import="java.util.List" isErrorPage="true"%>
<%@ page import="com.mss.msp.util.ApplicationConstants"%>


<!DOCTYPE html>
<html>
<head>

<style>

/* start of desktop styles */
@media screen and (max-width: 767px) {
	/* start of medium tablet styles */
}

@media screen and (max-width: 479px) { /* start of phone styles */
}

.tabs {
	left: 50%;
	-webkit-transform: translateX(-50%);
	transform: translateX(-50%);
	position: relative;
	background: white;
	padding: 50px;
	padding-bottom: 80px;
	width: 100%;
	box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px
		rgba(0, 0, 0, 0.22);
	border-radius: 5px;
	min-width: 240px;
}

.tabs input[name="tab-control"] {
	display: none;
}

.tabs .content section h2, .tabs ul li label {
	font-family: "Montserrat";
	font-weight: bold;
	font-size: 18px;
	color: #428BFF;
}

.tabs ul {
	list-style-type: none;
	padding-left: 0;
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-orient: horizontal;
	-webkit-box-direction: normal;
	-ms-flex-direction: row;
	flex-direction: row;
	margin-bottom: 10px;
	-webkit-box-pack: justify;
	-ms-flex-pack: justify;
	justify-content: space-between;
	-webkit-box-align: end;
	-ms-flex-align: end;
	align-items: flex-end;
	-ms-flex-wrap: wrap;
	flex-wrap: wrap;
}

.tabs ul li {
	box-sizing: border-box;
	-webkit-box-flex: 1;
	-ms-flex: 1;
	flex: 1;
	width: 25%;
	padding: 0 10px;
	text-align: center;
}

.tabs ul li label {
	-webkit-transition: all 0.3s ease-in-out;
	transition: all 0.3s ease-in-out;
	color: #929daf;
	padding: 5px auto;
	overflow: hidden;
	text-overflow: ellipsis;
	display: block;
	cursor: pointer;
	-webkit-transition: all 0.2s ease-in-out;
	transition: all 0.2s ease-in-out;
	white-space: nowrap;
	-webkit-touch-callout: none;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

.tabs ul li label br {
	display: none;
}

.tabs ul li label svg {
	fill: #929daf;
	height: 1.2em;
	vertical-align: bottom;
	margin-right: 0.2em;
	-webkit-transition: all 0.2s ease-in-out;
	transition: all 0.2s ease-in-out;
}

.tabs ul li label:hover, .tabs ul li label:focus, .tabs ul li label:active
	{
	outline: 0;
	color: #bec5cf;
}

.tabs ul li label:hover svg, .tabs ul li label:focus svg, .tabs ul li label:active svg
	{
	fill: #bec5cf;
}

.tabs .slider {
	position: relative;
	width: 34%;
	-webkit-transition: all 0.33s cubic-bezier(0.38, 0.8, 0.32, 1.07);
	transition: all 0.33s cubic-bezier(0.38, 0.8, 0.32, 1.07);
}

.tabs .slider .indicator {
	background: #093fa3 none repeat scroll 0 0;
	border-radius: 1px;
	height: 4px;
	margin: 0 auto;
	max-width: 100%;
	position: relative;
	width: 94px;
}

.tabs .content {
	margin-top: 30px;
}

.tabs .content section {
	display: none;
	-webkit-animation-name: content;
	animation-name: content;
	-webkit-animation-direction: normal;
	animation-direction: normal;
	-webkit-animation-duration: 0.3s;
	animation-duration: 0.3s;
	-webkit-animation-timing-function: ease-in-out;
	animation-timing-function: ease-in-out;
	-webkit-animation-iteration-count: 1;
	animation-iteration-count: 1;
	line-height: 1.4;
}

.tabs .content section h2 {
	color: #428BFF;
	display: none;
}

.tabs .content section h2::after {
	content: "";
	position: relative;
	display: block;
	width: 30px;
	height: 3px;
	background: #428BFF;
	margin-top: 5px;
	left: 1px;
}

.tabs input[name="tab-control"]:nth-of-type(1):checked ~ ul>li:nth-child(1)>label
	{
	cursor: default;
	color: #428BFF;
}

.tabs input[name="tab-control"]:nth-of-type(1):checked ~ ul>li:nth-child(1)>label svg
	{
	fill: #428BFF;
}

@media ( max-width : 600px) {
	.tabs input[name="tab-control"]:nth-of-type(1):checked ~ ul>li:nth-child(1)>label
		{
		background: rgba(0, 0, 0, 0.08);
	}
}

.tabs input[name="tab-control"]:nth-of-type(1):checked ~ .slider {
	-webkit-transform: translateX(0%);
	transform: translateX(0%);
}

.tabs input[name="tab-control"]:nth-of-type(1):checked ~ .content>section:nth-child(1)
	{
	display: block;
}

.tabs input[name="tab-control"]:nth-of-type(2):checked ~ ul>li:nth-child(2)>label
	{
	cursor: default;
	color: #428BFF;
}

.tabs input[name="tab-control"]:nth-of-type(2):checked ~ ul>li:nth-child(2)>label svg
	{
	fill: #428BFF;
}

@media ( max-width : 600px) {
	.tabs input[name="tab-control"]:nth-of-type(2):checked ~ ul>li:nth-child(2)>label
		{
		background: rgba(0, 0, 0, 0.08);
	}
}

.tabs input[name="tab-control"]:nth-of-type(2):checked ~ .slider {
	-webkit-transform: translateX(100%);
	transform: translateX(100%);
}

.tabs input[name="tab-control"]:nth-of-type(2):checked ~ .content>section:nth-child(2)
	{
	display: block;
}

.tabs input[name="tab-control"]:nth-of-type(3):checked ~ ul>li:nth-child(3)>label
	{
	cursor: default;
	color: #428BFF;
}

.tabs input[name="tab-control"]:nth-of-type(3):checked ~ ul>li:nth-child(3)>label svg
	{
	fill: #428BFF;
}

@media ( max-width : 600px) {
	.tabs input[name="tab-control"]:nth-of-type(3):checked ~ ul>li:nth-child(3)>label
		{
		background: rgba(0, 0, 0, 0.08);
	}
}

.tabs input[name="tab-control"]:nth-of-type(3):checked ~ .slider {
	-webkit-transform: translateX(200%);
	transform: translateX(200%);
}

.tabs input[name="tab-control"]:nth-of-type(3):checked ~ .content>section:nth-child(3)
	{
	display: block;
}

.tabs input[name="tab-control"]:nth-of-type(4):checked ~ ul>li:nth-child(4)>label
	{
	cursor: default;
	color: #428BFF;
}

.tabs input[name="tab-control"]:nth-of-type(4):checked ~ ul>li:nth-child(4)>label svg
	{
	fill: #428BFF;
}

@media ( max-width : 600px) {
	.tabs input[name="tab-control"]:nth-of-type(4):checked ~ ul>li:nth-child(4)>label
		{
		background: rgba(0, 0, 0, 0.08);
	}
}

.tabs input[name="tab-control"]:nth-of-type(4):checked ~ .slider {
	-webkit-transform: translateX(300%);
	transform: translateX(300%);
}

.tabs input[name="tab-control"]:nth-of-type(4):checked ~ .content>section:nth-child(4)
	{
	display: block;
}

@
-webkit-keyframes content {from { opacity:0;
	-webkit-transform: translateY(5%);
	transform: translateY(5%);
}

to {
	opacity: 1;
	-webkit-transform: translateY(0%);
	transform: translateY(0%);
}

}
@
keyframes content {from { opacity:0;
	-webkit-transform: translateY(5%);
	transform: translateY(5%);
}

to {
	opacity: 1;
	-webkit-transform: translateY(0%);
	transform: translateY(0%);
}

}
@media ( max-width : 1000px) {
	.tabs ul li label {
		white-space: initial;
	}
	.tabs ul li label br {
		display: initial;
	}
	.tabs ul li label svg {
		height: 1.5em;
	}
}

@media ( max-width : 600px) {
	.tabs ul li label {
		padding: 5px;
		border-radius: 5px;
	}
	.tabs ul li label span {
		display: none;
	}
	.tabs .slider {
		display: none;
	}
	.tabs .content {
		margin-top: 20px;
	}
	.tabs .content section h2 {
		display: block;
	}
}

.sb_login input {
	width: 100% !important;
	margin: 3px 0;
}
</style>
<style>
.logCredential .capchaBgImage {
	width: 89% !important;
	float: left;
}

.frgt_pwd font {
	text-align: right !important;
}

.capchaRefreshImage {
	background-size: auto;
	left: 10px;
	margin: 2px 3px !important;
	position: relative;
	top: 4px;
}

.capchaRefreshImage i {
	position: relative;
	right: 5px;
}

#Form_login .modal-content {
	background-color: #fff !important;
}

.thumbnail a>i, .thumbnail>i {
	display: block;
	max-width: 100%;
	height: auto;
	font-size: 49px;
	color: #3478c6;
	margin: 30px 33%;
}

h4 {
	font-weight: 600;
}

#Form_login {
	border-radius: 3px;
	margin-top: 76px !important;
}

p {
	font-size: 12px;
	margin-top: 5px;
}

.price {
	font-size: 30px;
	margin: 0 auto;
	color: #333;
}

.thumbnail {
	opacity: 0.80;
	-webkit-transition: all 0.5s;
	transition: all 0.5s;
}

.thumbnail:hover {
	opacity: 1.00;
	box-shadow: 0px 0px 10px #4bc6ff;
}

.line {
	margin-bottom: 5px;
}

@media screen and (max-width: 770px) {
	.right {
		float: left;
		width: 100%;
	}
}

span.thumbnail {
	border: 1px solid #3478c6 !important;
	border-radius: 0px !important;
	-webkit-box-shadow: 0px 0px 14px 0px rgba(0, 0, 0, 0.16);
	-moz-box-shadow: 0px 0px 14px 0px rgba(0, 0, 0, 0.16);
	box-shadow: 0px 0px 14px 0px rgba(0, 0, 0, 0.16);
	padding: 10px;
}

.thumbnail h4 {
	margin-bottom: 11px;
	text-align: center;
}

button {
	margin-top: 6px;
}

.login_layout img {
	height: 56px;
	width: 60px;
}

.right {
	float: right;
	border-bottom: 2px solid #0a5971;
}

.btn-info {
	color: #fff;
	background-color: #19b4e2;
	border-color: #19b4e2;
	font-size: 13px;
	font-weight: 600;
}

.login_modal {
	width: 30%;
	margin: auto;
}

.modal-dialog {
	width: 30%;
}

.thumbnail p {
	text-align: center !important;
}

.col-head p {
	font-size: 14px !important;
	padding: 0 14px !important;
	text-align: center !important;
}

.inactive {
	visibility: hidden;
}

.active {
	background-color: #F7F7F9;
}

.col-list .col-head {
	color: white;
	border-bottom: thick solid rgba(0, 0, 0, 0.2);
	border-radius: 5px 5px 0 0;
	margin-top: 45px;
}

.col-list .col-head p {
	color: white;
}

.col-list .col-head i {
	color: white;
	font-size: 3em;
	padding: 15px;
	border: thick solid white;
	border-radius: 50%;
	margin-top: -45px;
	background-color: #3076C9;
}

.col-list .col-head h2 {
	margin-top: 7px;
	margin-bottom: 5px;
	font-size: 2em;
	font-weight: 700;
}

.col-list .t1 .col-head {
	background-color: #3076C9;
}

.col-list .t2 .col-head {
	background-color: #3076C9;
}

.col-list .t3 .col-head {
	background-color: #3076C9;
}

.col-list .t1 li {
	border-bottom: 1px solid rgba(255, 183, 72, .4);
}

.col-list .t2 li {
	border-bottom: 1px solid rgba(22, 202, 200, .4);
}

.col-list .t3 li {
	border-bottom: 1px solid rgba(248, 113, 82, .4)
}

.col-list .t1 li:last-child, .col-list .t2 li:last-child, .col-list .t3 li:last-child
	{
	border-bottom: 0;
}

.col-list li p {
	font-size: 1.2em;
	padding: 7px;
	margin: 0;
}

.col-list li:hover {
	background-color: #F7F7F9;
}

.option span {
	color: rgba(162, 213, 0, 1);
	margin-left: 7px;
	margin-right: 7px;
}

.captcha_login {
	transform: scale(0.67);
	-webkit-transform: scale(0.67);
	transform-origin: 0 0;
	-webkit-transform-origin: 0 0;
}

@media screen and (max-width:455px) {
	.captcha_login {
		transform: scale(0.57);
		-webkit-transform: scale(0.57);
		transform-origin: 0 0;
		-webkit-transform-origin: 0 0;
	}
}

@media screen and (max-width:388px) {
	.captcha_login {
		transform: scale(0.43);
		-webkit-transform: scale(0.43);
		transform-origin: 0 0;
		-webkit-transform-origin: 0 0;
	}
}

@media screen and (width:500px) {
	.captcha_login {
		transform: scale(0.91);
		-webkit-transform: scale(0.91);
		transform-origin: 0 0;
		-webkit-transform-origin: 0 0;
	}
}

@media screen and (min-width:768px) {
	.login_wrapper {
		width: 70% !important;
	}
	.captcha_login {
		transform: scale(1.03);
		-webkit-transform: scale(1.03);
		transform-origin: 0 0;
		-webkit-transform-origin: 0 0;
	}
	#wrapper {
		margin-top: 20px;
	}
}

@media screen and (min-width:800px) {
	.captcha_login {
		transform: scale(1.01);
		-webkit-transform: scale(1.01);
		transform-origin: 0 0;
		-webkit-transform-origin: 0 0;
	}
}

@media screen and (min-width:980px) {
	.captcha_login {
		transform: scale(1.25);
		-webkit-transform: scale(1.25);
		transform-origin: 0 0;
		-webkit-transform-origin: 0 0;
	}
	#wrapper {
		margin-top: 30px;
	}
}

@media screen and (min-width:1024px) {
	.captcha_login {
		text-align: center;
		transform: scale(1.33);
		-webkit-transform: scale(1.33);
		transform-origin: 0 0;
		-webkit-transform-origin: 0 0;
	}
	#wrapper {
		margin-top: 40px;
	}
}

@media screen and (min-width:1280px) {
	.captcha_login {
		transform: scale(1.13);
		-webkit-transform: scale(1.13);
		transform-origin: 0 0;
		-webkit-transform-origin: 0 0;
	}
	#wrapper {
		margin-top: 30px;
	}
}

@media screen and (min-width:1920px) {
	.captcha_login {
		transform: scale(1.77);
		-webkit-transform: scale(1.77);
		transform-origin: 0 0;
		-webkit-transform-origin: 0 0;
	}
	#wrapper {
		margin-top: 60px;
	}
}
</style>


<!-- new styles -->

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ServicesBay :: Home Page</title>
<!--[if IE]>
<link rel="stylesheet" type="text/css" href="<s:url value="/includes/css/ie_support.css"/>">
<![endif]-->
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/bootstrap.min.css"/>">
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/font-awesome.min.css"/>">
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/main.css"/>">
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/responsive.css"/>">
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/home/flexslider.css"/>">
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/animate.css"/>">

<!-- end of new styles -->
<!-- start of js -->
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/home/home.css"/>">
<script type="text/JavaScript"
	src="<s:url value="/includes/js/jquery.js"/>"></script>
<script type="text/javascript"
	src="<s:url value="/includes/js/general/jquery-1.8.2.min.js"/>"></script>
<script type="text/javascript"
	src="<s:url value="/includes/js/general/popupoverlay.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/Ajax/GeneralAjax.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/Ajax/AppConstants.js"/>"></script>
<script type="text/javascript"
	src="<s:url value="/includes/js/home/jquery.cycle.all.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/bootstrap.min.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/homeslider/js/jssor.slider.min.js"/>"></script>

<!-- end of js -->


<!-- end of js -->


<style>

/* jssor slider arrow navigator skin 07 css */
/*
.jssora07l (normal)
.jssora07r (normal)
.jssora07l:hover (normal mouseover)
.jssora07r:hover (normal mouseover)
.jssora07l.jssora07ldn (mousedown)
.jssora07r.jssora07rdn (mousedown)
*/
.jssora07l, .jssora07r {
	display: block;
	position: absolute;
	/* size of arrow element */
	width: 50px;
	height: 50px;
	cursor: pointer;
	background:
		url('${pageContext.request.contextPath}/includes/js/homeslider/img/a07.png')
		no-repeat;
	overflow: hidden;
}

.logCredential button {
	background-size: auto !important;
}

.jssora07l {
	background-position: -5px -35px;
}

.jssora07r {
	background-position: -65px -35px;
}

.jssora07l:hover {
	background-position: -125px -35px;
}

.jssora07r:hover {
	background-position: -185px -35px;
}

.jssora07l.jssora07ldn {
	background-position: -245px -35px;
}

.jssora07r.jssora07rdn {
	background-position: -305px -35px;
}
/* jssor slider thumbnail navigator skin 04 css */
/*.jssort04 .p (normal).jssort04 .p:hover (normal mouseover).jssort04 .pav (active).jssort04 .pav:hover (active mouseover).jssort04 .pdn (mousedown)*/
.jssort04 .p {
	position: absolute;
	top: 0;
	left: 0;
	width: 62px;
	height: 32px;
}

.jssort04 .t {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	border: none;
}

.jssort04 .w, .jssort04 .pav:hover .w {
	position: absolute;
	width: 60px;
	height: 30px;
	border: #0099FF 1px solid;
	box-sizing: content-box;
}

.jssort04 .pdn .w, .jssort04 .pav .w {
	border-style: dashed;
}

.jssort04 .c {
	position: absolute;
	top: 0;
	left: 0;
	width: 62px;
	height: 32px;
	background-color: #000;
	filter: alpha(opacity = 45);
	opacity: .45;
	transition: opacity .6s;
	-moz-transition: opacity .6s;
	-webkit-transition: opacity .6s;
	-o-transition: opacity .6s;
}

.jssort04 .p:hover .c, .jssort04 .pav .c {
	filter: alpha(opacity = 0);
	opacity: 0;
}

.jssort04 .p:hover .c {
	transition: none;
	-moz-transition: none;
	-webkit-transition: none;
	-o-transition: none;
}

* html .jssort04 .w {
	width /**/: 62px;
	height /**/: 32px;
}

@media only screen and (max-width: 800px) {
	/* For mobile phones: */
	.modal-body {
		padding: 20px !important;
	}
	.logCredential input {
		width: 100% !important;
		margin: 4px 0;
	}
	.tabs {
		padding: 35px;
	}
}

@media only screen and (max-width: 370px) {
	.LoginButton {
		width: 100%;
		padding-top: 5px;
	}
	.btn {
		width: 100%;
	}
}

.viewMoreAnchor {
	cursor: pointer;
}
</style>
<script>
	jssor_1_slider_init = function() {

		var jssor_1_options = {
			$AutoPlay : true,
			$SlideDuration : 3000,
			$ArrowNavigatorOptions : {
				$Class : $JssorArrowNavigator$
			},
			$ThumbnailNavigatorOptions : {
				$Class : $JssorThumbnailNavigator$,
				$Cols : 15,
				$SpacingX : 3,
				$SpacingY : 3,
				$Align : 455
			}
		};

		var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);

		//responsive code begin
		//you can remove responsive code if you don't want the slider scales while window resizing
		function ScaleSlider() {
			var refSize = jssor_1_slider.$Elmt.parentNode.clientWidth;
			if (refSize) {
				refSize = Math.min(refSize, 1200);
				jssor_1_slider.$ScaleWidth(refSize);
			} else {
				window.setTimeout(ScaleSlider, 30);
			}
		}
		ScaleSlider();
		$Jssor$.$AddEvent(window, "load", ScaleSlider);
		$Jssor$.$AddEvent(window, "resize", ScaleSlider);
		$Jssor$.$AddEvent(window, "orientationchange", ScaleSlider);
		//responsive code end
	};
</script>
<script>
	function disableBack() {
		window.location.hash = "no-back-button";
		window.location.hash = "Again-No-back-button";//again because google chrome don't insert first hash into history
		window.onhashchange = function() {
			window.location.hash = "";
		}
	}
</script>

<script>
	var response;

	var vendorRecaptcha;
	var customerRecaptcha;
	var consultantRecaptcha;
	var vendorRecaptchaValue;
	var CVForgotPasswordReCaptcha;
	var conForgotPasswordReCaptcha;
	var customerRecaptchaValue;
	var consultantRecaptchaValue;
	var CVForgotPasswordReCaptchaValue;
	var conForgotPasswordReCaptchaValue;
    var csrOrAdminReCaptcha;
    var csrOrAdminReCaptchaValue;
    
	var myCallBack = function() {
		//Render the recaptcha1 on the element with ID "recaptcha1"
		vendorRecaptcha = grecaptcha.render('vendorRecaptcha', {
			'sitekey' : '6LfmzR8UAAAAAJhXhE8Qii1X1kwYz4Oq2nRjj0bI', //Replace this with your Site key
			'theme' : 'light',
			'callback' : correctCaptcha_vendor,
			'expired-callback' : venExpCallback
		});

		//Render the recaptcha2 on the element with ID "recaptcha2"
		customerRecaptcha = grecaptcha.render('customerRecaptcha', {
			'sitekey' : '6LfmzR8UAAAAAJhXhE8Qii1X1kwYz4Oq2nRjj0bI', //Replace this with your Site key
			'theme' : 'light',
			'callback' : correctCaptcha_customer,
			'expired-callback' : custExpCallback
		});
		consultantRecaptcha = grecaptcha.render('consultantRecaptcha', {
			'sitekey' : '6LfmzR8UAAAAAJhXhE8Qii1X1kwYz4Oq2nRjj0bI', //Replace this with your Site key
			'theme' : 'light',
			'callback' : correctCaptcha_consultant,
			'expired-callback' : conExpCallback
		});
		CVForgotPasswordReCaptcha = grecaptcha.render(
				'CVForgotPasswordReCaptcha', {
					'sitekey' : '6LfmzR8UAAAAAJhXhE8Qii1X1kwYz4Oq2nRjj0bI', //Replace this with your Site key
					'theme' : 'light',
					'callback' : correctCaptcha_CVForgotPassword,
					'expired-callback' : CVForgotExpCallback
				});
		conForgotPasswordReCaptcha = grecaptcha.render(
				'conForgotPasswordReCaptcha', {
					'sitekey' : '6LfmzR8UAAAAAJhXhE8Qii1X1kwYz4Oq2nRjj0bI', //Replace this with your Site key
					'theme' : 'light',
					'callback' : correctCaptcha_conForgotPassword,
					'expired-callback' : conForgotExpCallback
				});
		csrOrAdminReCaptcha = grecaptcha.render('csrOrAdminReCaptcha', {
			'sitekey' : '6LfmzR8UAAAAAJhXhE8Qii1X1kwYz4Oq2nRjj0bI', //Replace this with your Site key
			'theme' : 'light',
			'callback' : correctCaptcha_csrOrAdmin,
			'expired-callback' : csrOrAdminExpCallback
		});
	};
	function venExpCallback() {
		vendorRecaptchaValue = "";
		grecaptcha.reset("vendorRecaptcha");
	}
	function custExpCallback() {
		customerRecaptchaValue = "";
		grecaptcha.reset("customerRecaptcha");
	}
	function conExpCallback() {
		consultantRecaptchaValue = "";
		grecaptcha.reset("consultantRecaptcha");
	}

	function CVForgotExpCallback() {
		CVForgotPasswordReCaptchaValue = "";
		grecaptcha.reset("CVForgotPasswordReCaptcha");
	}
	function conForgotExpCallback() {
		conForgotPasswordReCaptchaValue
		grecaptcha.reset("conForgotPasswordReCaptcha");
	}
	function csrOrAdminExpCallback() {
		csrOrAdminReCaptchaValue
		grecaptcha.reset("csrOrAdminReCaptcha");
	}


	var correctCaptcha_vendor = function(response) {
		vendorRecaptchaValue = response;
	};
	var correctCaptcha_customer = function(response) {
		customerRecaptchaValue = response;
	};
	var correctCaptcha_consultant = function(response) {
		consultantRecaptchaValue = response;
	};
	var correctCaptcha_CVForgotPassword = function(response) {
		CVForgotPasswordReCaptchaValue = response;
	};
	var correctCaptcha_conForgotPassword = function(response) {
		conForgotPasswordReCaptchaValue = response;
	};
	var correctCaptcha_csrOrAdmin = function(response) {
		csrOrAdminReCaptchaValue = response;
	};
	function customerRecaptchaValidation() {
		var captchaValue = null;
		var res = false;

		captchaValue = customerRecaptchaValue;
		res = captchaValidation(captchaValue);
		if (res === false) {

			$("#customerReCaptchaSpan").html(
					"<font color=red><br>Invalid captcha..</font>");
			setTimeout(function() {
				$("#customerReCaptchaSpan").children().remove();
			}, 3000);

		}
		return res;

	}
	function vendorRecaptchaValidation() {
		var captchaValue = null;
		var res = false;

		captchaValue = vendorRecaptchaValue;
		res = captchaValidation(captchaValue);
		if (res === false) {

			$("#vendorReCaptchaSpan").html(
					"<font color=red><br>Invalid captcha..</font>");
			setTimeout(function() {
				$("#vendorReCaptchaSpan").children().remove();
			}, 3000);

		}
		return res;

	}

	function consultantRecaptchaValidation() {
		var res = false;
		var conCaptchaValue = null;
		conCaptchaValue = consultantRecaptchaValue;
		res = captchaValidation(conCaptchaValue);

		if (res === false) {
			$("#consultantRecaptchaSpan").html(
					"<font color=red><br>Invalid captcha..</font>");
			setTimeout(function() {
				$("#consultantRecaptchaSpan").children().remove();
			}, 3000);

		}
		return res;

	}
	function conForgotPasswordRecaptchaValidation() {
		var res = false;
		var CaptchaValue = null;
		CaptchaValue = conForgotPasswordReCaptchaValue;
		res = captchaValidation(CaptchaValue);

		if (res === false) {
			$("#conForgotPasswordRecaptchaSpan").html(
					"<font color=red><br>Invalid captcha..</font>");
			setTimeout(function() {
				$("#conForgotPasswordRecaptchaSpan").children().remove();
			}, 3000);

		}
		return res;
	}

	function custVenForgotPasswordRecaptchaValidation() {
		var res = false;
		var CaptchaValue = null;
		CaptchaValue = CVForgotPasswordReCaptchaValue;
		res = captchaValidation(CaptchaValue);

		if (res === false) {
			/* $("#custVenForgotPasswordRecaptchaSpan").html(
					"<font color=red><br>Invalid captcha..</font>");
			setTimeout(function() {
				$("#custVenForgotPasswordRecaptchaSpan").children().remove();
			}, 3000);
			 */
		}
		return res;

	}
	
	function csrOrAdminRecaptchaValidation() {
		var captchaValue = null;
		var res = false;

		captchaValue = csrOrAdminRecaptchaValue;
		res = captchaValidation(captchaValue);
		if (res === false) {

			$("#csrOrAdminReCaptchaSpan").html(
					"<font color=red><br>Invalid captcha..</font>");
			setTimeout(function() {
				$("#csrOrAdminReCaptchaSpan").children().remove();
			}, 3000);

		}
		return res;

	}
	
	$(document).ready(function() {
		 
	$(function() {
	    $('.item').matchHeight();
	});
	});
</script>


</head>
<body oncontextmenu="return false" onload="disableBack();">

	<div id="">
		<header id="header">
			<!--header-->
			<div class="header_top" id="header_top">
				<!--header_top-->
				<div class="container">
					<s:include value="/includes/template/header.jsp" />
				</div>
			</div>
			<!--/header_top-->

		</header>
		<!--/header-->
		<div id="main">
			<section id="generalForm">
				<!--form-->
				<div id="login_home">
					<div class="container" style="width: 93%">
						<div class="row">
							<div id="jssor_1"
								style="position:relative;margin:0 auto;top:0px;left:0px;width:970px;height:400px;overflow:hidden;visibility:hidden;background:url('${pageContext.request.contextPath}/includes/js/homeslider/img/main_bg.jpg') 50% 50% no-repeat;">
								<!-- Loading Screen -->
								<div data-u="loading"
									style="position: absolute; top: 0px; left: 0px;">
									<div
										style="filter: alpha(opacity = 70); opacity: 0.7; position: absolute; display: block; top: 0px; left: 0px; width: 100%; height: 100%;"></div>
									<div
										style="position:absolute;display:block;background:url('${pageContext.request.contextPath}/img/loading.gif') no-repeat center center;top:0px;left:0px;width:100%;height:100%;"></div>
								</div>
								<div data-u="slides"
									style="cursor: default; position: relative; top: 0px; left: 0px; width: 980px; height: 400px; overflow: hidden;">
									<div data-p="172.50" style="display: none;">
										<img
											src="<%=request.getContextPath()%>/includes/js/homeslider/img/accountslide1.png"
											style="margin-left: 4%; margin-top: 3%" /> <img
											data-u="thumb"
											src="<%=request.getContextPath()%>/includes/js/homeslider/img/slide1thumb1.png" />
									</div>
									<div data-p="172.50" style="display: none;">
										<img
											src="<%=request.getContextPath()%>/includes/js/homeslider/img/slides_source_2_1.png" />
										<img data-u="thumb"
											src="<%=request.getContextPath()%>/includes/js/homeslider/img/slide2thumb1.png" />
									</div>
									<%-- <div data-p="172.50" style="display: none;">


<img src="<%=request.getContextPath()%>/includes/js/homeslider/img/TT.gif" style="margin-left:10%;margin-top:7%"/>
<img src="<%=request.getContextPath()%>/includes/js/homeslider/img/text.png" style="margin-left: 5%;margin-top:3%"/> 
<img data-u="thumb" src="<%=request.getContextPath()%>/includes/js/homeslider/img/slide-Copy.png" />
</div> --%>
									<div data-p="172.50" style="display: none;">
										<img
											src="<%=request.getContextPath()%>/includes/js/homeslider/img/customerView1.png" />
										<img data-u="thumb"
											src="<%=request.getContextPath()%>/includes/js/homeslider/img/slide4_thumb.png" />
									</div>
									<div data-p="172.50" style="display: none;">
										<img
											src="<%=request.getContextPath()%>/includes/js/homeslider/img/vendorView1.png" />
										<img data-u="thumb"
											src="<%=request.getContextPath()%>/includes/js/homeslider/img/slide5_thumb.png" />
									</div>

								</div>
								<!-- Thumbnail Navigator -->
								<div data-u="thumbnavigator" class="jssort04"
									style="position: absolute; left: 0px; bottom: 0px; width: 980px; height: 60px;"
									data-autocenter="1">
									<!-- Thumbnail Item Skin Begin -->
									<div data-u="slides" style="cursor: default;">
										<div data-u="prototype" class="p">
											<div class="w">
												<div data-u="thumbnailtemplate" class="t"></div>
											</div>
											<div class="c"></div>
										</div>
									</div>
									<!-- Thumbnail Item Skin End -->
								</div>
								<!-- Arrow Navigator -->
								<span data-u="arrowleft" class="jssora07l"
									style="top: 0px; left: 8px; width: 50px; height: 50px;"
									data-autocenter="2"></span> <span data-u="arrowright"
									class="jssora07r"
									style="top: 0px; right: 8px; width: 50px; height: 50px;"
									data-autocenter="2"></span>

							</div>
							<script>
								jssor_1_slider_init();
							</script>
							<div id="slide" style="display: none;">
								<div id="forgetoverlay">
									<div
										style="width: available; border-top-left-radius: 12px; border-top-right-radius: 12px; background-color: rgb(68, 145, 223); background-color: rgb(68, 145, 223);">
										<table>
											<tr>
												<td style="width: 100%" align="left" colspan="2"><h4
														style="font-family: Alike Angular">
														<font color="white"
															style="font-weight: bold; font-size: 22px;">&nbsp;&nbsp;Forgot
															your password </font>
													</h4></td>
											</tr>
											<span class="pull-right"><h5>
													<a class="slide_close" href=""><button type="button"
															class="close" data-dismiss="modal" aria-label="Close"
															style="margin: 0px 15px;">
															<i class="fa fa-times"></i>
														</button></a>
												</h5></span>

										</table>
									</div>
									<hr style="margin: 0px;">
									<div
										style="font-family: Alike Angular; margin-top: 10px; margin-left: 10px; margin-right: 10px;">

										<p>Enter the Email address of your account to reset your
											password</p>
										<span id="CVFPLoading"
											style="color: red; width: auto; display: none">Loading...</span>
										<span id="CVFPresultMessage" style="width: auto"></span>
										<center>
											<s:form id="forgotPassword" name="forgotPassword">
												<div class="logCredential">
													<i class="fa fa-envelope"></i> <input type="email"
														class="frgt_pwd" pattern="[^@]+@[^@]+\.[a-zA-Z]{2,6}"
														placeholder="Valid Email Address" id="CVforgotEmailId"
														name="forgotEnailId" required="required" />
												</div>
												<div id="CVForgotPasswordReCaptcha"></div>
												<span id="custVenForgotPasswordRecaptchaSpan"></span>
&nbsp;<input style="margin: 4px" type="button" class="passwordButton"
													value="Reset Password" name="FPass" id="FPass"
													onclick="return custVenForgotPassword('CVforgotEmailId','CVFPresultMessage','CVFPLoading');" />

											</s:form>
										</center>
										<br> <br>
									</div>
								</div>
							</div>

							<%-- consultant forgot password overlay Start --%>
							<div id="consultantSlide" style="display: none;">
								<div id="forgetoverlay">
									<div
										style="width: available; border-top-left-radius: 12px; border-top-right-radius: 12px; background-color: rgb(68, 145, 223); background-color: rgb(68, 145, 223);">
										<table>
											<tr>
												<td style="width: 100%" align="left" colspan="2"><h4
														style="font-family: Alike Angular">
														<font color="white"
															style="font-weight: bold; font-size: 22px;">&nbsp;&nbsp;Forgot
															your password </font>
													</h4></td>
											</tr>
											<span class="pull-right"><h5>
													<a class="consultantSlide_close" href=""><button
															type="button" class="close" data-dismiss="modal"
															aria-label="Close" style="margin: 0px 15px;">
															<i class="fa fa-times"></i>
														</button></a>
												</h5></span>

										</table>
									</div>
									<hr style="margin: 0px;">
									<div
										style="font-family: Alike Angular; margin-top: 10px; margin-left: 10px; margin-right: 10px;">

										<p>Enter the Email address of your account to reset your
											password</p>
										<span id="conFPLoading"
											style="color: red; width: auto; display: none">Loading....</span>
										<span id="conFPResultMessage" style="width: auto"></span>
										<center>
											<s:form id="forgotPassword" name="forgotPassword">
												<div class="logCredential">
													<i class="fa fa-envelope"></i> <input type="email"
														class="frgt_pwd" pattern="[^@]+@[^@]+\.[a-zA-Z]{2,6}"
														placeholder="Valid Email Address" id="conforgotEmailId"
														name="conforgotEmailId" required="required" />
												</div>
												<div id="conForgotPasswordReCaptcha"></div>
												<div>
													<span id="conForgotPasswordReCaptchaSpan"></span>
												</div>
&nbsp;<input style="margin: 4px" type="button" class="passwordButton"
													value="Reset Password" name="consultantFPass"
													id="consultantFPass"
													onclick="return conForgotPassword('conforgotEmailId','conFPResultMessage','conFPLoading');" />

											</s:form>
										</center>
										<br> <br>
									</div>
								</div>
							</div>
							<%-- consultant forgot password overlay End --%>

							<!-- Start Special Centered Box -->
							<div class="col-sm-4 col-sm-offset-1" id="col-sm-4">
								<div class="tabs">

									<input type="radio" id="tab1" name="tab-control" checked>
									<input type="radio" id="tab2" name="tab-control"> <input
										type="radio" id="tab3" name="tab-control">
									 <input
										type="radio" id="tab4" name="tab-control">

									<ul>
										<li title="Customer Login"><label for="tab1"
											role="button"><i class="fa fa-user"
												aria-hidden="true"></i><br> <span>Customer</span></label></li>
												
										<li title="CSR / Admin Login"><label for="tab2" role="button">
												<i class="fa fa-user" aria-hidden="true"></i><br> <span>CSR/Admin</span>
										</label></li>
										
										<li title="Vendor Login"><label for="tab3" role="button">
												<i class="fa fa-user" aria-hidden="true"></i><br> <span>Vendor</span>
										</label></li>


										<li title="Consultant Login"><label for="tab4"
											role="button"> <i class="fa fa-user"
												aria-hidden="true"></i><br> <span>Consultant</span>
										</label></li>
									</ul>

									<div class="slider">
										<div class="indicator"></div>
									</div>
									<div class="content">
										<section>
											<h2>Customer Login</h2>
											<div class="customer_block"></div>
										</section>
										<section>
											<h2>CSR / Admin Login</h2>
											<div class="csrOrAdmin_block"></div>
										</section>
										<section>
											<h2>Vendor Login</h2>
											<div class="vendor_block"></div>
										</section>
										<section>
											<h2>Consultant Login</h2>
											<div id="consultant_block"></div>
										</section>

									</div>
								</div>
								<!--/login form-->
							</div>
							<!-- Start Special Centered Box -->
							<div class="login-form modal fade" id="myLoginSelection"
								tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
								<div class="modal-dialog login_wrapper" id="Form_login"
									role="document">
									<div class="modal-content">
										<div class="modal-header "
											style="background-color: rgb(68, 145, 223); background-color: rgb(68, 145, 223); border-top-right-radius: 0px; border-top-left-radius: 0px;">
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<i class="fa fa-times"></i>
											</button>
											<h4 class="modal-title" id="myModalLabel"
												style="color: white">Login to your account</h4>
										</div>
										<div class="modal-body">

											<script type="text/javascript">
												$('#myLogin').modal('show');
											</script>

											<%-- <s:form action="/general/loginCheck.action" method="post"
name="userLoginForm" id="userLoginForm">
<div class="logCredential">
<i class="fa fa-envelope"></i> <input type="email"
placeholder="Email" class="frgt_pwd" name="emailId"
id="emailId" pattern="[^@]+@[^@]+\.[a-zA-Z]{2,6}" required
data-error-message="LoginId is required!" tabindex="1" />
</div>

<div class="logCredential">
<i class="fa fa-key"></i> <input type="password"
placeholder="Password" class="frgt_pwd" name='password'
pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}"
id="password"
title="Must be at least 6 characters long, and contain at least one number, one uppercase and one lowercase letter"
required data-type="Password" tabindex="2" />
</div>

<p id="wrapper" class="frgt_pwd">
<a class="slide_open" href="" id="closeLogin"
data-dismiss="modal" data-toggle="modal"
data-target="#forgotPwd"><font class="fgtPwd">Forgot
password?</font></a>
</p>
<div class="LoginButton">
<button type="submit">LogIn</button>
</div>
</s:form> --%>
											<div class="row">

												<div class="col-sm-12">







													<div class="col-sm-3" style="text-align: center">
														<span class="thumbnail animated bounceIn login_layout">

															<img
															src="<s:url value="/includes/images/sb_customer.png"/>">
															<h4>Customer</h4>
															<p class="item">Login to your Customer account to Post Jobs,
																Manage Job Applications, Projects, Timesheets, Invoices, Consultant Screening and Onboarding.</p>
															<hr class="line">
															<div class="row">

																<div class="col-md-12" data-dismiss="modal" id="cus_login"
																	aria-label="Close">
																	<button class="btn-lg col-md-12 btn-primary"
																		style="font-size: 16px;" data-toggle="modal"
																		data-target="#myLogin">Login</button>
																</div>

															</div>
														</span>
													</div>
													<div class="col-sm-3" style="text-align: center">
														<span class="thumbnail animated bounceIn login_layout">

															<img src="<s:url value="/includes/images/sb_csr.png"/>">
															<h4>CSR / Admin</h4>

															<p class="item">Login to manage Customers, Vendors, Requirements, Profile Verifications and Approvals.</p>
															<hr class="line">
															<div class="row">

																<div class="col-md-12" data-dismiss="modal" id="csr_login"
																	aria-label="Close">
																	<button class="btn-lg col-md-12 btn-primary"
																		style="font-size: 16px;" data-toggle="modal"
																		data-target="#csrOrAdminLogin">Login</button>
																</div>

															</div>
														</span>
													</div>
													<div class="col-sm-3" style="text-align: center">
														<span class="thumbnail animated bounceIn login_layout">

															<img
															src="<s:url value="/includes/images/sb_vendor.png"/>">
															<h4>Vendor</h4>

															<p class="item">Login to your Vendor account to View Jobs, Submit
																Candidates, Manage Onboarding  Process and Generate Invoices.</p>
															<hr class="line">
															<div class="row">

																<div class="col-md-12" data-dismiss="modal"
																	aria-label="Close">
																	<button class="btn-lg col-md-12 btn-primary"
																		style="font-size: 16px;" data-toggle="modal"
																		data-target="#vendorLogin">Login</button>
																</div>

															</div>
														</span>
													</div>



													<div class="col-sm-3 " style="text-align: center">
														<span class="thumbnail animated bounceIn login_layout">
															<img
															src="<s:url value="/includes/images/sb_consultant.png"/>">
															<h4>Consultant</h4>

															<p class="item">
																Login to Submit your Profile, Required Documents, Attend Online Exams and Check Profile Status<br>
																<br>
															</p>
															<hr class="line">
															<div class="row">

																<div class="col-md-12" data-dismiss="modal"
																	aria-label="Close">
																	<button class="btn-lg col-md-12 btn-primary "
																		style="font-size: 16px;" data-toggle="modal"
																		data-target="#consultantLogin">Login</button>
																</div>

															</div>
														</span>
													</div>

													<!-- END PRODUCTS -->
												</div>
											</div>
											<!-------container----->


										</div>
									</div>
								</div>
							</div>


							<div class="login-form modal fade" id="myLogin" tabindex="-1"
								role="dialog" aria-labelledby="myModalLabel">
								<div class="login_modal" id="Form_login" role="document">
									<div class="modal-content"
										style="background: rgba(0, 0, 0, 0) linear-gradient(135deg, rgba(235, 240, 246, 1) 0%, rgba(208, 230, 244, 1) 0%, rgba(208, 230, 244, 1) 100%, rgba(208, 230, 244, 1) 100%, rgba(208, 230, 244, 1) 100%, rgba(208, 230, 244, 1) 100%) repeat scroll 0 0">
										<div class="modal-header "
											style="background-color: rgb(68, 145, 223); background-color: rgb(68, 145, 223); border-top-right-radius: 0px; border-top-left-radius: 0px;">
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<i class="fa fa-times"></i>
											</button>
											<h4 class="modal-title customerLogin" id="myModalLabel"
												style="color: white">Customer Login
												</h4>
											<!-- <h4 class="modal-title AdminLogin" id="myModalLabel"
												style="color: white">CSR / Admin Login</h4>  -->
										</div>
										<div class="modal-body customer_form">
											<%
												if (request.getAttribute("customerErrorMessage") != null) {
											%>
											<script type="text/javascript">
												//$('#myLogin').modal('show');
											</script>
											<script type="text/javascript">
												if ($(window).width() > 641) {
													$('#myLogin').modal('show');
												} else {
													$('#tab1').prop('checked',
															true);
													$('#tab2').prop('checked',
															false);
													$('#tab3').prop('checked',
															false);
													$('#tab4').prop('checked',
															false);

												}
											</script>
											<%
												out.println(request.getAttribute("customerErrorMessage"));
											%>
											<%
												}
											%>
											<div class="">
												<s:form action="/general/loginCheck.action" method="post"
													name="userLoginForm" id="userLoginForm"
													> <%-- onsubmit="return customerRecaptchaValidation();" --%>
													<s:hidden name="customerOrVenFlag" id="customerOrVenFlag"
														value="1" />
													<div class="logCredential">
														<i class="fa fa-envelope"></i> <input type="email"
															placeholder="Email" class="frgt_pwd" name="emailId"
															id="emailId" pattern="[^@]+@[^@]+\.[a-zA-Z]{2,6}"
															required data-error-message="LoginId is required!"
															tabindex="1" />
													</div>

													<div class="logCredential">
														<i class="fa fa-key"></i> <input type="password"
															placeholder="Password" class="frgt_pwd" name='password'
															pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}"
															id="password"
															title="Must be at least 6 characters long, and contain at least one number, one uppercase and one lowercase letter"
															required data-type="Password" tabindex="2" />
													</div>

													<div>

														<div id="customerRecaptcha" class="captcha_login"></div>



													</div>
													<span id="customerReCaptchaSpan"></span>
											</div>
											<div class="row">
												<p id="wrapper" class="frgt_pwd col-sm-12">
													<a class="slide_open pull-right" href="" id="closeLogin"
														data-dismiss="modal" data-toggle="modal"
														data-target="#forgotPwd"><font class="fgtPwd"
														style="text-align: right">Forgot password?</font></a>
												</p>
											</div>
											<br>
											<div class="row" style="margin: 0px 5px">
												<div class="LoginButton pull-left">
													<button type="submit" class="btn btn-primary">LogIn</button>
												</div>
												<div class="LoginButton pull-right reg_btn">
													<a
														href="<%=request.getContextPath()%>/general/register.action?home=No&regFlag=ac"
														class="btn btn-primary">Register</a>
												</div>
											</div>
											</s:form>

											<!-------container----->
										</div>

									</div>
								</div>
							</div>







						</div>

						<!-- registration -->
						<div class="login-form modal fade" id="myLogin1" tabindex="-1"
							role="dialog" aria-labelledby="myModalLabel">
							<div class="modal-dialog" id="Form_login1" role="document">
								<div class="modal-content">
									<div class="modal-header "
										style="background-color: rgb(68, 145, 223); background-color: rgb(68, 145, 223); border-top-right-radius: 0px; border-top-left-radius: 0px;">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<i class="fa fa-times"></i>
										</button>
										<h4 class="modal-title" id="myModalLabel" style="color: white">Registration</h4>
									</div>
									<div class="modal-body">

										<div class=" ">
											<div class="row col-list">

												<div class="col-md-4 t2 ">
													<div class=" " style="text-align: center">
														<a class="thumbnail animated bounceIn login_layout"  id="headerRegisterCustLink"
														href="<%=request.getContextPath()%>/general/register.action?home=No&regFlag=ac">

															<img
															src="<s:url value="/includes/images/sb_customer.png"/>">
															<h4>Customer</h4>
															 
														 
															<div class="row">

																 
																	<p>Register as Customer</p>
																 

															</div>
														</a>
													</div>
													 
												</div>
											 
												<div class="col-md-4 t3 ">
													<div class=" " style="text-align: center">
														<a id="headerRegisterLink" class="thumbnail animated bounceIn login_layout"
														href="<%=request.getContextPath()%>/general/register.action?home=No&regFlag=vc">

															<img
															src="<s:url value="/includes/images/sb_vendor.png"/>">
															<h4>Vendor</h4>
															 
														 
															<div class="row">

																 
																	<p>Register as Vendor</p>
																 

															</div>
														</a>
													</div>
													 
												</div>
												<div class="col-md-4 t3 ">
													<div class=" " style="text-align: center">
														<a id="headerRegisterLink" class="thumbnail animated bounceIn login_layout"
														href="<%=request.getContextPath()%>/general/consultantregister.action?home=No">

															<img
															src="<s:url value="/includes/images/sb_consultant.png"/>">
															<h4>Consultant</h4>
															 
														 
															<div class="row">

																 
																	<p>Register as Consultant</p>
																 

															</div>
														</a>
													</div>
													 
												</div>

											 
											</div>
											 

										</div>




									</div>
								</div>
							</div>
						</div>
						<%-- Registration Overlay End --%>
						
						<%--  CSR / Admin Login Modal Start--%>
						<div class="login-form modal fade" id="csrOrAdminLogin" tabindex="-1"
							role="dialog" aria-labelledby="myModalLabel">
							<div class="login_modal" id="Form_login" role="document">
								<div class="modal-content"
									style="background: rgba(0, 0, 0, 0) linear-gradient(135deg, rgba(235, 240, 246, 1) 0%, rgba(208, 230, 244, 1) 0%, rgba(208, 230, 244, 1) 100%, rgba(208, 230, 244, 1) 100%, rgba(208, 230, 244, 1) 100%, rgba(208, 230, 244, 1) 100%) repeat scroll 0 0">
									<div class="modal-header "
										style="background-color: rgb(68, 145, 223); background-color: rgb(68, 145, 223); border-top-right-radius: 0px; border-top-left-radius: 0px;">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<i class="fa fa-times"></i>
										</button>
										<h4 class="modal-title" id="csrOrAdminModalLabel"
											style="color: white">CSR / Admin Login</h4>
									</div>
									<div class="modal-body csrOrAdmin_form">
										<%
											if (request.getAttribute("csrOrAdminErrorMessage") != null) {
										%>
										<script type="text/javascript">
											if ($(window).width() > 641) {
												$('#csrOrAdminLogin').modal('show');
											} else {
												$('#tab1').prop('checked',
														false);
												$('#tab3').prop('checked',
														false);
												$('#tab4').prop('checked',
														false);
												$('#tab2')
														.prop('checked', true);

											}
										</script>
										<%
											out.println(request.getAttribute("csrOrAdminErrorMessage"));
										%>
										<%
											}
										%>
										<div class="">
											<s:form action="/general/loginCheck.action" method="post"
												name="userLoginForm" id="userLoginForm"
												> <%-- onsubmit="return csrOrAdminRecaptchaValidation();" --%>
												<s:hidden name="customerOrVenFlag" id="customerOrVenFlag"
													value="0" />
												<div class="logCredential">
													<i class="fa fa-envelope"></i> <input type="email"
														placeholder="Email" class="frgt_pwd" name="emailId"
														id="emailId" pattern="[^@]+@[^@]+\.[a-zA-Z]{2,6}" required
														data-error-message="LoginId is required!" tabindex="1" />
												</div>

												<div class="logCredential">
													<i class="fa fa-key"></i> <input type="password"
														placeholder="Password" class="frgt_pwd" name='password'
														pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}"
														id="password"
														title="Must be at least 6 characters long, and contain at least one number, one uppercase and one lowercase letter"
														required data-type="Password" tabindex="2" />
												</div>

												<div id="csrOrAdminReCaptcha" class="captcha_login"></div>
												<!-- style="margin: 0 auto;display: table" -->

												<span id="csrOrAdminReCaptchaSpan"></span>




												<div class="row">
													<p id="wrapper" class="frgt_pwd col-sm-12">
														<a class="slide_open pull-right" href="" id="closeLogin"
															data-dismiss="modal" data-toggle="modal"
															data-target="#forgotPwd"><font class="fgtPwd"
															style="text-align: right">Forgot password?</font></a>
													</p>
												</div>
												<br>
												<div class="row" style="margin: 0px 5px">
													<div class="LoginButton pull-left">
														<button type="submit" class="btn btn-primary">LogIn</button>
													</div>
													
												</div>
											</s:form>
										</div>
									</div>

									<!-------container----->


								</div>
							</div>
						</div>
						<%-- CSR / Admin Login Modal End--%>
						
						<%-- Vendor Login Modal Start--%>
						<div class="login-form modal fade" id="vendorLogin" tabindex="-1"
							role="dialog" aria-labelledby="myModalLabel">
							<div class="login_modal" id="Form_login" role="document">
								<div class="modal-content"
									style="background: rgba(0, 0, 0, 0) linear-gradient(135deg, rgba(235, 240, 246, 1) 0%, rgba(208, 230, 244, 1) 0%, rgba(208, 230, 244, 1) 100%, rgba(208, 230, 244, 1) 100%, rgba(208, 230, 244, 1) 100%, rgba(208, 230, 244, 1) 100%) repeat scroll 0 0">
									<div class="modal-header "
										style="background-color: rgb(68, 145, 223); background-color: rgb(68, 145, 223); border-top-right-radius: 0px; border-top-left-radius: 0px;">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<i class="fa fa-times"></i>
										</button>
										<h4 class="modal-title" id="vendorModalLabel"
											style="color: white">Vendor Login</h4>
									</div>
									<div class="modal-body vendor_form">
										<%
											if (request.getAttribute("vendorErrorMessage") != null) {
										%>
										<script type="text/javascript">
											if ($(window).width() > 641) {
												$('#vendorLogin').modal('show');
											} else {
												$('#tab1').prop('checked',
														false);
												$('#tab2').prop('checked',
														false);
												$('#tab4').prop('checked',
														false);
												$('#tab3')
														.prop('checked', true);

											}
										</script>
										<%
											out.println(request.getAttribute("vendorErrorMessage"));
										%>
										<%
											}
										%>
										<div class="">
											<s:form action="/general/loginCheck.action" method="post"
												name="userLoginForm" id="userLoginForm"
												> <%-- onsubmit="return vendorRecaptchaValidation();" --%>
												<s:hidden name="customerOrVenFlag" id="customerOrVenFlag"
													value="5" />
												<div class="logCredential">
													<i class="fa fa-envelope"></i> <input type="email"
														placeholder="Email" class="frgt_pwd" name="emailId"
														id="emailId" pattern="[^@]+@[^@]+\.[a-zA-Z]{2,6}" required
														data-error-message="LoginId is required!" tabindex="1" />
												</div>

												<div class="logCredential">
													<i class="fa fa-key"></i> <input type="password"
														placeholder="Password" class="frgt_pwd" name='password'
														pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}"
														id="password"
														title="Must be at least 6 characters long, and contain at least one number, one uppercase and one lowercase letter"
														required data-type="Password" tabindex="2" />
												</div>

												<div id="vendorRecaptcha" class="captcha_login"></div>
												<!-- style="margin: 0 auto;display: table" -->

												<span id="vendorReCaptchaSpan"></span>




												<div class="row">
													<p id="wrapper" class="frgt_pwd col-sm-12">
														<a class="slide_open pull-right" href="" id="closeLogin"
															data-dismiss="modal" data-toggle="modal"
															data-target="#forgotPwd"><font class="fgtPwd"
															style="text-align: right">Forgot password?</font></a>
													</p>
												</div>
												<br>
												<div class="row" style="margin: 0px 5px">
													<div class="LoginButton pull-left">
														<button type="submit" class="btn btn-primary">LogIn</button>
													</div>
													<div class="LoginButton pull-right reg_btn">
														<a
															href="<%=request.getContextPath()%>/general/register.action?home=No&regFlag=vc"
															class="btn btn-primary">Register</a>
													</div>
												</div>
											</s:form>
										</div>
									</div>

									<!-------container----->


								</div>
							</div>
						</div>
						<%-- Vendor Login Modal End--%>

						<%-- consultant Login overlay Start --%>
						<div class="login-form modal fade" id="consultantLogin"
							tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
							<div class="login_modal" id="Form_login" role="document">
								<div class="modal-content"
									style="background: rgba(0, 0, 0, 0) linear-gradient(135deg, rgba(235, 240, 246, 1) 0%, rgba(208, 230, 244, 1) 0%, rgba(208, 230, 244, 1) 100%, rgba(208, 230, 244, 1) 100%, rgba(208, 230, 244, 1) 100%, rgba(208, 230, 244, 1) 100%) repeat scroll 0 0">
									<div class="modal-header "
										style="background-color: rgb(68, 145, 223); background-color: rgb(68, 145, 223); border-top-right-radius: 0px; border-top-left-radius: 0px;">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<i class="fa fa-times"></i>
										</button>
										<h4 class="modal-title" id="myModalLabel" style="color: white">Consultant
											Login</h4>
									</div>
									<div class="modal-body consultant_form"
										style="overflow: hidden">
										<%
											if (request.getAttribute("consultantErrorMessage") != null) {
										%>
										<script type="text/javascript">
											if ($(window).width() > 640) {
												$('#consultantLogin').modal(
														'show');
											} else {
												$('#tab1').prop('checked',
														false);
												$('#tab2').prop('checked',
														false);
												$('#tab3').prop('checked',
														false);
												$('#tab4')
														.prop('checked', true);
											}
										</script>
										<%
											out.println(request.getAttribute("consultantErrorMessage"));
										%>
										<%
											}
										%>
										<div class="">
											<s:form action="/general/consultantLoginCheck.action"
												method="post" name="userLoginForm" id="userLoginForm"
												>  <%-- onsubmit="return consultantRecaptchaValidation();" --%>
												<div class="logCredential">
													<i class="fa fa-envelope"></i> <input type="email"
														placeholder="Email" class="frgt_pwd" name="emailId"
														id="emailId" pattern="[^@]+@[^@]+\.[a-zA-Z]{2,6}" required
														data-error-message="LoginId is required!" tabindex="1" />
												</div>

												<div class="logCredential">
													<i class="fa fa-key"></i> <input type="password"
														placeholder="Password" class="frgt_pwd" name='password'
														pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}"
														id="password"
														title="Must be at least 6 characters long, and contain at least one number, one uppercase and one lowercase letter"
														required data-type="Password" tabindex="2" />
												</div>

												<div id="consultantRecaptcha" class="captcha_login"></div>
												<!-- style="margin: 0 auto;display: table" -->

												<span id="consultantRecaptchaSpan"></span>

												<%-- <div class="logCredential">
<input type="text" name="txtCaptcha1" readonly="readonly"
id="txtCaptcha1" class="capchaBgImage"
style="text-align: center; border: none; font-weight: bold; font-family: Modern" />
<button type="button" class="capchaRefreshImage"
style="width: 30px; height: 35px; border: none"
onclick="DrawCaptcha1();">
<i class="fa fa-refresh" aria-hidden="true"></i>
</button>
</div>

<div class="logCredential">
<input type="text" name="txtCaptchaInput1"
id="txtCaptchaInput1" class="frgt_pwd"
placeholder="Enter captcha Here" required="required"
onchange="ValidCaptcha1();" /> <span
id="captchaCheckSpan1"></span>

</div> --%>
										</div>



										<div class="row">
											<p id="wrapper" class="frgt_pwd col-sm-12">
												<a class="consultantSlide_open pull-right" href=""
													id="closeLogin" data-dismiss="modal" data-toggle="modal"
													data-target="#forgotPwd"><font class="fgtPwd"
													style="text-align: right">Forgot password?</font></a>
											</p>
										</div>
										<br>

										<div class="row" style="margin: 0px 5px">
											<div class="LoginButton pull-left">
												<button type="submit" class="btn btn-primary">LogIn</button>
											</div>
											<div class="LoginButton pull-right reg_btn">
												<a
													href="<%=request.getContextPath()%>/general/consultantregister.action?home=No"
													class="btn btn-primary">Register</a>
											</div>
											</s:form>
											<!-- <p id="wrapper" class="frgt_pwd" style="text-align: right">
											<a class="consultantSlide_open" href="" id="closeLogin"
												data-dismiss="modal" data-toggle="modal"
												data-target="#forgotPwd"><font class="fgtPwd">Forgot
													password?</font></a>
										</p>
										</div>
										<div class="LoginButton">
											<button type="submit" class="btn btn-primary">LogIn</button>
										</div> -->


										</div>
									</div>
								</div>
								<%-- consultant Login overlay End --%>


							</div>


						</div>
			</section>
		</div>
	</div>



	<div class="panel-body">
		<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog"
			tabindex="-1" id="Home" class="modal fade" style="display: none;">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button aria-hidden="true" data-dismiss="modal" class="close"
							type="button">×</button>
						<h4 id="myModalLabel" class="modal-title">Account Management</h4>

					</div>
					<div class="col-sm-12 popup-align">
						<div class="col-sm-5">
							<img src="<s:url value="/includes/images/home/acc_1.jpg"/>"
								height="100px" width="190px">
						</div>
						<p>Which provides a virtual workspace to facilitate effective
							communication between team members. It helps you to share
							information and work jointly on projects and efficiently use all
							available resources.</p>
					</div>
					<div class="modal-body">


						<br> <br> <b>Features:</b> <br> <i
							class="fa fa-chevron-circle-right"></i>&nbsp;Adding Account in
						one click. <br> <i class="fa fa-chevron-circle-right"></i>&nbsp;Manage
						Users for a customer / vendor. <br> <i
							class="fa fa-chevron-circle-right"></i>&nbsp;Hierarchy
						Maintenance. <br> <i class="fa fa-chevron-circle-right"></i>&nbsp;Handling
						accounts by a CSR(Customer Service Representative) to the
						respective accounts. <br> <i
							class="fa fa-chevron-circle-right"></i>&nbsp;Management of
						Accounts(Customer/Vendor) for CSR.

					</div>

				</div>
			</div>
		</div>
	</div>

	<div class="panel-body">
		<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog"
			tabindex="-1" id="projectManager" class="modal fade"
			style="display: none;">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button aria-hidden="true" data-dismiss="modal" class="close"
							type="button">×</button>
						<h4 id="myModalLabel" class="modal-title">Project Management</h4>
					</div>
					<div class="col-sm-12 popup-align">
						<div class="col-sm-5">
							<img src="<s:url value="/includes/images/home/project2.jpg"/>"
								height="100px" width="190px">
						</div>
						<p>Which provides a virtual workspace to facilitate effective
							communication between team members. It helps you to share
							information and work jointly on projects and efficiently use all
							available resources.</p>

					</div>
					<div class="modal-body">
						<br> <br> <b>Features:</b> <br> <i
							class="fa fa-chevron-circle-right"></i>&nbsp;Management of
						Resources. <br> <i class="fa fa-chevron-circle-right"></i>&nbsp;Assigning
						projects to respective person. <br> <i
							class="fa fa-chevron-circle-right"></i>&nbsp;Hierarchy
						Maintenance. <br> <i class="fa fa-chevron-circle-right"></i>&nbsp;Assigning
						of tasks based on the project. <br> <i
							class="fa fa-chevron-circle-right"></i>&nbsp;Handling tasks.

					</div>

				</div>
			</div>
		</div>

	</div>

	<div class="panel-body">
		<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog"
			tabindex="-1" id="budgetManagement" class="modal fade"
			style="display: none;">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button aria-hidden="true" data-dismiss="modal" class="close"
							type="button">×</button>
						<h4 id="myModalLabel" class="modal-title">Budget Management</h4>
					</div>
					<div class="col-sm-12 popup-align">
						<div class="col-sm-5">
							<img
								src="<s:url value="/includes/images/home/budget_management12.jpg"/>"
								height="100px" width="190px">
						</div>
						<p>A budget is a quantitative expression of a plan for a
							defined period of time. It may include planned cost of
							expenditure towards project.</p>

					</div>
					<div class="modal-body">
						<br> <br> <b>Features:</b> <br> <i
							class="fa fa-chevron-circle-right"></i>&nbsp;Cost Planning. <br>
						<i class="fa fa-chevron-circle-right"></i>&nbsp;Request Budget. <br>
						<i class="fa fa-chevron-circle-right"></i>&nbsp;Approve Budget. <br>
						<i class="fa fa-chevron-circle-right"></i>&nbsp;Allocate Budget.


					</div>

				</div>
			</div>
		</div>
	</div>

	<div class="panel-body">
		<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog"
			tabindex="-1" id="timeSheetsModal" class="modal fade"
			style="display: none;">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button aria-hidden="true" data-dismiss="modal" class="close"
							type="button">×</button>
						<h4 id="myModalLabel" class="modal-title">Timesheet and
							Invoice Management</h4>
					</div>
					<div class="col-sm-12 popup-align">
						<div class="col-sm-5">
							<img src="<s:url value="/includes/images/home/clock123.jpg"/>"
								height="100px" width="190px">
						</div>
						<p>Amount of time spent for each project by a person and it
							helps in Project Time Tracking.</p>

					</div>
					<div class="modal-body">
						<br> <br> <b>Features:</b> <br> <i
							class="fa fa-chevron-circle-right"></i>&nbsp;Ability to track
						times. <br> <i class="fa fa-chevron-circle-right"></i>&nbsp;Get
						Approvals of Timesheet(Approved/Rejected). <br> <i
							class="fa fa-chevron-circle-right"></i>&nbsp;Calculate employee
						expenses by total billable hours. <br> <i
							class="fa fa-chevron-circle-right"></i>&nbsp;Holiday Tracking. <br>
						<i class="fa fa-chevron-circle-right"></i>&nbsp;Vacation Hours
						Tracking. <br> <i class="fa fa-chevron-circle-right"></i>&nbsp;Project
						Hours Tracking.



					</div>

				</div>
			</div>
		</div>
	</div>

	<div class="panel-body">
		<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog"
			tabindex="-1" id="ResourceModal" class="modal fade"
			style="display: none;">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button aria-hidden="true" data-dismiss="modal" class="close"
							type="button">×</button>
						<h4 id="myModalLabel" class="modal-title">Recruitment and
							Staffing Management</h4>
					</div>
					<div class="col-sm-12 popup-align">
						<div class="col-sm-5">
							<img src="<s:url value="/includes/images/home/recruit2_.png"/>"
								height="100px" width="190px">
						</div>
						<p>To Handle the Requirement and post the job to the
							associated vendors in an organization and selecting Right person
							to the Right Job will satisfy the client requirement.</p>

					</div>
					<div class="modal-body">
						<br> <br> <b>Features:</b> <br> <i
							class="fa fa-chevron-circle-right"></i>&nbsp;Adding Requirement
						and releasing it to the vendors. <br> <i
							class="fa fa-chevron-circle-right"></i>&nbsp;Publishing the
						requirement to vendors. <br> <i
							class="fa fa-chevron-circle-right"></i>&nbsp;Manage the
						requirement for the level of vendors in the vendor pool. <br>
						<i class="fa fa-chevron-circle-right"></i>&nbsp;Fit the
						appropriate consultant to the requirement. <br> <i
							class="fa fa-chevron-circle-right"></i>&nbsp;Conducting of
						technical review to the consultant. <br> <i
							class="fa fa-chevron-circle-right"></i>&nbsp;Screening the
						consultant in multiple levels and interview follow-up. <br> <i
							class="fa fa-chevron-circle-right"></i>&nbsp;Selection of
						candidates. <br> <i class="fa fa-chevron-circle-right"></i>&nbsp;Migration
						of candidates from vendor to customer by (Statement of Work/Finder
						Fee) .

						</p>
					</div>

				</div>
			</div>
		</div>
	</div>

	<div class="panel-body">
		<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog"
			tabindex="-1" id="MDO_Modal" class="modal fade"
			style="display: none;">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button aria-hidden="true" data-dismiss="modal" class="close"
							type="button">×</button>
						<h4 id="myModalLabel" class="modal-title">Multi device
							operability</h4>
					</div>
					<div class="col-sm-12 popup-align">
						<div class="col-sm-5">
							<img
								src="<s:url value="/includes/images/home/responsive 1.png"/>"
								height="100px" width="190px">
						</div>
						<p>Provide an optimal view & interaction experience-easy &
							secure navigation.Includes many features defined below..</p>
					</div>
					<div class="modal-body">

						<br> <br> <b>Features:</b> <br> <i
							class="fa fa-chevron-circle-right"></i>&nbsp;Portal is a cross
						browser application support. <br> <i
							class="fa fa-chevron-circle-right"></i>&nbsp;Accessible in
						multiple devices. <br> <i class="fa fa-chevron-circle-right"></i>&nbsp;User
						friendly application.
						</p>
					</div>

				</div>
			</div>
		</div>
	</div>












	<div class="marginTasks" style="margin-bottom: 30px">
		<div id="menus" class="container">
			<div class="row">
				<div class="col-sm-6 col-md-4 col-sx-6 contentwidth">

					<div id="account_home" data-target="#Home" data-toggle="modal"
						title="Account Management"
						class=" panel_home panel hometextalignment"></div>
					<div class="htextalign">
						<b id="align">Account Management</b>
						<div class="h-body text-center">
							<p id="accountalign">Tool which provides a virtual workspace
								to facilitate effective communication between team members. It
								helps you to share the..</p>

							<a class="popup-with-zoom-anim viewMoreAnchor"
								data-target="#Home" data-toggle="modal"> View more.. </a>

						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-4 col-sx-6 contentwidth">
					<div id="project_home" data-target="#projectManager"
						data-toggle="modal" title="Project Management"
						class=" panel_home panel hometextalignment"></div>
					<div class="htextalign">
						<b id="align1">Project & Task Management</b>
						<div class="h-body text-center">
							<p id="accountalign">Tool which provides a virtual workspace
								to facilitate effective communication between team members. It
								helps you to share the..</P>

							<a class="popup-with-zoom-anim viewMoreAnchor"
								data-target="#projectManager" data-toggle="modal"> View
								more.. </a>

						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-4 col-sx-6 contentwidth">
					<div id="budget_home" data-target="#budgetManagement"
						data-toggle="modal" title="Budget Management"
						class="panel_home panel hometextalignment"></div>
					<div class="htextalign">
						<b id="align">Budget Management</b>
						<div class="h-body text-center">
							<p id="accountalign">Budget is quantitative expression of a
								plan for a defined period of time. It may include planned cost
								of expenditure towards the..</p>

							<a class="popup-with-zoom-anim viewMoreAnchor"
								data-target="#budgetManagement" data-toggle="modal"> View
								more.. </a>

						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-4 col-sx-6 contentwidth">
					<div id="timesheet_home" data-target="#timeSheetsModal"
						data-toggle="modal" title="Timesheet Management"
						class=" panel_home panel hometextalignment"></div>
					<div class="htextalign">
						<b id="align1">Timesheet & Invoice Management</b>
						<div class="h-body text-center">
							<p id="accountalign">Amount of time spent for the project by
								a person and also helps in the Project Time Tracking. It
								includes some of the features..</p>

							<a class="popup-with-zoom-anim viewMoreAnchor"
								data-target="#timeSheetsModal" data-toggle="modal"> View
								more.. </a>

						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-4 col-sx-6 contentwidth">
					<div id="rfm_home" data-target="#ResourceModal" data-toggle="modal"
						title="Resource Filtering and Management"
						class=" panel_home panel hometextalignment"></div>
					<div class="htextalign">
						<b id="align1">Recruitment & Staffing Management </b>
						<div class="h-body text-center">
							<p id="accountalign1">To handle the Requirements and posting
								job to the associated vendors in an organization and selecting
								Right person to the Right Job ..</p>

							<a class="popup-with-zoom-anim viewMoreAnchor"
								data-target="#ResourceModal" data-toggle="modal"> View
								more.. </a>

						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-4 col-sx-6 contentwidth ">
					<div id="mdo_home" data-target="#MDO_Modal" data-toggle="modal"
						title="Multi device operability"
						class="panel_home panel hometextalignment"></div>
					<div class="htextalign">
						<b id="align">Multi Device Operability</b>
						<div class="h-body text-center">
							<p id="accountalign">Provide an optimal view & interaction
								experience easy & secure navigation.Includes many features
								defined below..</p>

							<a class="popup-with-zoom-anim viewMoreAnchor"
								data-target="#MDO_Modal" data-toggle="modal"> View more.. </a>

						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/form-->
	</div>

	<footer id="footer">
		<!--Footer-->

		<div class="footer-bottom" id="footer_bottom">
			<div class="container">
				<s:include value="/includes/template/footer.jsp" />
			</div>
		</div>

	</footer>
	<!--/Footer-->

	<script>
		$(document).ready(function() {
			
			$(function() {
			 $("#cus_login").click(function() {
			 // alert('clicked cus_login!'); 
			  $('.AdminLogin').hide();
			  $('.customerLogin').show();
			 
			 });
			 
			 $("#csr_login").click(function() {
				 // alert('clicked csr_login!'); 
				  $('.customerLogin').hide();
				  $('.AdminLogin').show();
				 
				 });
			 });

			if ($(window).width() < 1169) {

				if ($(window).width() < 800) {
					$('.login_modal').css("width", "46%");

				}

				else {
					$('.login_modal').css("width", "43%");
				}

			}

			if ($(window).width() < 641) {
				$('.reg_btn').css("display", "block");
				$(".consultant_form").clone().prependTo("#consultant_block");
				$(".vendor_form").clone().prependTo(".vendor_block");
				$(".customer_form").clone().prependTo(".customer_block");
				$(".csrOrAdmin_form").clone().prependTo(".csrOrAdmin_block");
			} else {
				$('.reg_btn').css("display", "none");
				// $("div").removeClass('captcha_login');
			}

			$('#slide').popup({
				focusdelay : 400,
				outline : true,
				vertical : 'top'
			});
			$('#consultantSlide').popup({
				focusdelay : 400,
				outline : true,
				vertical : 'top'
			});
			/*$(function() {
			 $("#FPass").click(function() {
			 // alert('clicked!');
			 forgotPassword();
			 });
			 });*/

			/*$(function() {
			 $("#consultantFPass").click(function() {
			 // alert('clicked!'); cus_login
			 forgotPassword();
			 });
			 });*/

			$(".slide_close").click(function() {
				// alert('clicked!');
				document.getElementById('resultMessage').innerHTML = "";
			});
			$(".consultantSlide_close").click(function() {
				// alert('clicked!');
				document.getElementById('resultMessage').innerHTML = "";
			});
		});
	</script>
	<script type="text/JavaScript"
	src="<s:url value="/includes/js/general/matchheight.js"/>"></script>
	<script type="text/JavaScript"
		src="<s:url value="/includes/js/general/placeholders.min.js"/>"></script>
	<script type="text/JavaScript"
		src="<s:url value="/includes/js/home/jquery.flexslider.js"/>"></script>
	<script type="text/JavaScript"
		src="<s:url value="/includes/js/home/custom.js"/>"></script>
	<script type="text/JavaScript"
		src="<s:url value="/includes/js/jquery.scrollUp.min.js"/>"></script>
	<script
		src="https://www.google.com/recaptcha/api.js?onload=myCallBack&render=explicit"
		async defer></script>
	<link rel="stylesheet" type="text/css"
		href="<s:url value="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>">
</body>
</html>
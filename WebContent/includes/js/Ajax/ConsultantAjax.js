// Add by Aklakh to validate the email Id
function ConsultEmailValidation() {

	var status = document.getElementById("consult_email").value;

	re = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	// /[^@]+@[^@]+\.[a-zA-Z]{2,}/;
	if (status == '') {
		$("addCnsltError").html(
				" <font color=#FF4D4D>Email field is Required.</font>.");

		$("#consult_email").css("border", "1px solid red");
	} else if (!re.test(status)) {
		document.getElementById("consult_email").value = "";
		$("addCnsltError").html(
				" <font color=#FF4D4D>Please enter valid Email Id.</font>.");
		$("#consult_email").css("border", "1px solid red");
	} else {

		$("addCnsltError").html("");
		$("#consult_email").css("border", "1px solid green");
		CnsltEmailValidate();
	}
}

function CnsltEmailValidate() {
	// alert("in Ajax call ");
	var consultantId = document.getElementById("consult_email").value;
	var url = CONTENXT_PATH
			+ '/recruitment/consultant/consultantEmailVerify.action?consultantId='
			+ consultantId;
	// alert(url);
	var req = initRequest(url);
	req.onreadystatechange = function() {
		if (req.readyState == 4) {
			if (req.status == 200) {
				// alert(req.responseText);
				// alert("2");
				resultEmail(req.responseText);

			} else {

			}
		}
	};

	req.open("GET", url, "true");
	req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	req.send(null);
}

function resultEmail(response) {
	if (response == "success") {
		$("addCnsltError").html(
				"  <font color='green'>Email Id is available !</font>");
		$("#consult_email").css("border", "1px solid green");
		return true;
	} else {
		$("addCnsltError").html(
				" <font color=#B20000>Email Id is already exist !</font>");
		$("#consult_email").css("border", "1px solid red");
		consult_email.value = '';
		return false;
	}
}

function initRequest(url) {
	if (window.XMLHttpRequest) {
		return new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		isIE = true;
		return new ActiveXObject("Microsoft.XMLHTTP");
	}
}

// Add by Aklakh for date picker
var cnsltDate, cnsltDOB;
function doOnLoadcnslt() {
	cnsltDate = new dhtmlXCalendarObject([ "consult_add_date" ]);
	cnsltDate.setSkin('omega');
	cnsltDate.setDateFormat("%m-%d-%Y");
	cnsltDate.hideTime();
	var today = new Date();
	cnsltDate.setSensitiveRange(today, null);
	cnsltDOB = new dhtmlXCalendarObject([ "consult_dob" ]);
	cnsltDOB.setSkin('omega');
	cnsltDOB.setDateFormat("%m-%d-%Y");
	cnsltDOB.hideTime();
}

function enterDateRestrict(id) {

	$(id).val(" ");

	// alert("Please select from the Calender !");
	return false;
}

// function to get the state of in addConsultant page add by Aklakh
function ConsultantStateChange() {
	// alert("Consultant ajax");
	var id = document.getElementById('consult_pcountry').value;
	if (id == -1) {
		$("addCnsltError")
				.html(
						" <font color=#FF4D4D>Preffered country field is Required</font>.");
		$("#consult_pcountry").css("border", "1px solid red");
	} else {
		$("#consult_pcountry").css("border", "1px solid green");
		$("addCnsltError").html("");
	}
	var url = CONTENXT_PATH + '/recruitment/consultant/getState.action?id='
			+ id;
	var req = initRequest(url);
	req.onreadystatechange = function() {
		if (req.readyState == 4 && req.status == 200) {
			ConsultantStateChanging(req.responseText);

		}
	};
	req.open("GET", url, "true");
	req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	req.send(null);
}
// function to set the state of in addConsultant page add by Aklakh
function ConsultantStateChanging(data) {
	// alert(data);
	var topicId = document.getElementById("consult_preferredState");
	var flag = data.split("FLAG");
	var addList = flag[0].split("^");
	var $select = $('#consult_preferredState');
	$select.find('option').remove();
	for (var i = 0; i < addList.length - 1; i++) {
		var Values = addList[i].split("#");
		{
			$('<option>').val(Values[0]).text(Values[1]).appendTo($select);
		}
	}
}

// function to get the state of permanent address in addConsultant page add by
// Aklakh
function PermanentStateChange() {
	// alert("Consultant ajax");
	var id = document.getElementById('consult_Country').value;
	if (id == "") {
		// alert("hi");
		$("addCnsltError").html(
				" <font color=#FF4D4D>country field is Required</font>.");
		$("#consult_Country").css("border", "1px solid red");
	} else {
		// alert("hello");
		// $("#consult_Country").css("border", "1px solid green");
		$("addCnsltError").html("");
	}
	var url = CONTENXT_PATH + '/recruitment/consultant/getState.action?id='
			+ id;
	var req = initRequest(url);
	req.onreadystatechange = function() {
		if (req.readyState == 4 && req.status == 200) {
			// alert(req.responseText)
			PermanentState(req.responseText);
		}
	};
	req.open("GET", url, "true");
	req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	req.send(null);
}
function StateChange() {
	// alert("Consultant ajax");
	var id = document.getElementById('consult_Country').value;
	// if(id==""){
	// //alert("hi");
	// $("addCnsltError").html(" <b><font color=#FF4D4D>country field is
	// Required</font></b>.");
	// $("#consult_Country").css("border", "1px solid red");
	// }
	// else{
	// //alert("hello");
	// $("#consult_Country").css("border", "1px solid green");
	// $("addCnsltError").html("");
	// }
	var url = CONTENXT_PATH + '/recruitment/consultant/getState.action?id='
			+ id;
	var req = initRequest(url);
	req.onreadystatechange = function() {
		if (req.readyState == 4 && req.status == 200) {
			// alert(req.responseText)
			PermanentState(req.responseText);
		}
	};
	req.open("GET", url, "true");
	req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	req.send(null);
}
// function to set the state of permanent address in addConsultant page add by
// Aklakh
function PermanentState(data) {
	// alert(data);
	var topicId = document.getElementById("consult_State");
	var flag = data.split("FLAG");
	var addList = flag[0].split("^");
	var $select = $('#consult_State');
	$select.find('option').remove();
	$('<option>').val(-1).text("Select state").appendTo($select);
	for (var i = 0; i < addList.length - 1; i++) {
		var Values = addList[i].split("#");
		{

			$('<option>').val(Values[0]).text(Values[1]).appendTo($select);
		}
	}
	// var consultState=$("#consultState").val();
	// $("#consult_State").val(consultState);
}
// function to get the state of current address in addConsultant page add by
// Aklakh
function CurrentStateChange() {
	// alert("Consultant ajax");
	var id = document.getElementById('consult_CCountry').value;
	if (id == "") {
		// alert("hi");
		$("addCnsltError").html(
				"<font color=#FF4D4D>country field is Required</font>.");
		$("#consult_CCountry").css("border", "1px solid red");
	} else {
		// alert("hello");
		// $("#consult_CCountry").css("border", "1px solid green");
		$("addCnsltError").html("");
	}
	// alert(id);
	var url = CONTENXT_PATH + '/recruitment/consultant/getState.action?id='
			+ id;
	// alert(url);
	var req = initRequest(url);
	req.onreadystatechange = function() {
		if (req.readyState == 4 && req.status == 200) {
			// alert(req.responseText);

			CurrentState(req.responseText);
		}
	};
	req.open("GET", url, "true");
	req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	req.send(null);
}
// function to set the state of current address in addConsultant page add by
// Aklakh
function CurrentState(data) {
	// alert(data);
	var topicId = document.getElementById("consult_CState");
	var flag = data.split("FLAG");
	var addList = flag[0].split("^");
	var $select = $('#consult_CState');
	$select.find('option').remove();
	$('<option>').val(-1).text("Select state").appendTo($select);
	for (var i = 0; i < addList.length - 1; i++) {
		var Values = addList[i].split("#");
		{

			$('<option>').val(Values[0]).text(Values[1]).appendTo($select);
		}
	}
}

/*function skillValidation() {
	alert("in Skill Validation");
	var pskills = $("#consult_otherSkills").val();
	var sskills = $("#consult_otherSecSkills").val();
	var plist = $("#primaryHidden").val();
	var slist = $("#secondaryHidden").val();

	alert(plist);
	alert(slist);
	alert(pskills);
	alert(sskills);

	var p_array = pskills.split(',');

	for (var i = 0; i < p_array.length; i++) {*/

	// p_array[i] = p_array[i].replace(/^\s*/, "").replace(/\s*$/, "");

		/*p_array[i] = p_array[i].trim();

		alert(p_array[i]);
	}

	var s_array = sskills.split(',');

	for (var m = 0; m < s_array.length; m++) {*/

		// p_array[i] = p_array[i].replace(/^\s*/, "").replace(/\s*$/, "");

		/*s_array[m] = s_array[m].trim();

		alert(s_array[m]);
	}

	var combineList = plist.concat(slist);

	var array_keys = new Array();
	var array_values = new Array();
	for ( var key in combineList) {
		array_keys.push(key);
		array_values.push(combineList[key]);
	}

	alert(array_keys);
	alert(array_values);

	// $.merge(plist,slist);

	for (var j = 0; j < array_values.length; j++) {

		for (var k = 0; k < p_array.length; k++) {

			if (array_values[j].toUpperCase == p_array[k].toUpperCase) {
				alert("Skill already existed in Primary Skills List")
			}

		}

	}

	for (var n = 0; n < array_values.length; j++) {

		for (var p = 0; p < s_array.length; k++) {

			if (array_values[n].toUpperCase == s_array[p].toUpperCase) {
				alert("Skill already existed in Secondary Skills List")
			}

		}

	}
}*/

/* function for add consultant validation , by aklakh */
function addConsultantValidate() {
	var FileUploadPath = document.getElementById('file').value;

	// To check if user upload any file

	var val_consult_email = $("#consult_email").val();

	var val_consult_fstname = $("#consult_fstname").val();
	var val_consult_lstname = $("#consult_lstname").val();

	var val_consult_dob = $("#consult_dob").val();

	var val_consult_mobileNo = $("#consult_mobileNo").val();

	var val_consult_Address = $("#consult_Address").val();
	var val_consult_City = $("#consult_City").val();
	var val_consult_Country = $("#consult_Country").val();
	var val_consult_State = $("#consult_State").val();

	var val_consult_CAddress = $("#consult_CAddress").val();
	var val_consult_CCity = $("#consult_CCity").val();
	var val_consult_CCountry = $("#consult_CCountry").val();
	var val_consult_CState = $("#consult_CState").val();

	var val_consult_industry = $("#consult_industry").val();

	var val_consult_wcountry = $("#consult_wcountry").val();
	var val_consult_organization = $("#consult_organization").val();
	var val_consult_experience = $("#consult_experience").val();
	var val_consult_preferredState = $("#consult_preferredState").val();
	var val_consult_jobTitle = $("#consult_jobTitle").val();
	var skill = $("#consult_skill").val();
	var sal = document.getElementById("consult_salary").value;
	

	var consultDOB = val_consult_dob.split('-');
	var consultDOBDate = new Date(consultDOB[2], consultDOB[0] - 1,
			consultDOB[1]);
	var todayDate = new Date();
	var dobYeardiff = (todayDate - consultDOBDate) / (86400000 * 360);

	var relocation = document.getElementById("consult_relocation").value;
	var preferCountry = document.getElementById("consult_pcountry").value;
	var preferState = document.getElementById("consult_preferredState").value;
	var preferRegion = document.getElementById("consult_preferredRegion").value;
	var userCatArry = [];
	var skillCategoryArry = [];
	$("#skillCategoryValue :selected").each(function() {
		skillCategoryArry.push($(this).val());
	});
	var primaryCategoryArry = [];
	$("#primarySkillValue :selected").each(function() {
		primaryCategoryArry.push($(this).val());
	});
	document.getElementById("primaryValues").value = primaryCategoryArry;

	var available = document.getElementById("consult_available").value;

	pat = /[^\s]+[a-zA-Z ]*[^\s]+/;
	// alert("available"+val_consult_email)
	if (val_consult_email == "" || val_consult_email == null) {
		$("addCnsltError").html(
				" <font color= #FF4D4D>Email field is Required</font>");
		$('html,body').scrollTop(0);
		$("#val_consult_email").css("border", "1px solid red");
		$("#consult_email").css("border", "1px solid red");
		return false;
	}
	if (available == 'Y') {

		var consult_add_date = document.getElementById("consult_add_date").value;

		if (consult_add_date == "") {

			$("addCnsltError")
					.html(
							" <font color= #FF4D4D>Please select the available date</font>.");

			$("#consult_add_date").css("border", "1px solid red");

			return false;
		}

	}
	if (val_consult_fstname == "" || val_consult_fstname == null) {
		$("addCnsltError").html(
				" <font color=#FF4D4D>First name field is Required</font>");
		$('html,body').scrollTop(0);
		$("#val_consult_fstname").css("border", "1px solid red");
		$("#consult_fstname").css("border", "1px solid red");
		return false;
	}
	if (!pat.test(val_consult_fstname)) {
		$("addCnsltError").html(
				" <font color=#FF4D4D>Must be valid Name</font>");
		$('html,body').scrollTop(0);
		$("#val_consult_fstname").css("border", "1px solid red");
		$("#consult_fstname").css("border", "1px solid red");
		return false;
	}
	if (val_consult_lstname == "" || val_consult_lstname == null) {
		$("addCnsltError").html(
				" <font color=#FF4D4D>Last name field is Required</font>");
		$('html,body').scrollTop(0);
		$("#val_consult_lstname").css("border", "1px solid red");
		$("#consult_lstname").css("border", "1px solid red");
		return false;
	}
	if (!pat.test(val_consult_lstname)) {
		$("addCnsltError").html(
				" <font color=#FF4D4D>Must be valid last name</font>");
		$('html,body').scrollTop(0);
		$("#val_consult_lstname").css("border", "1px solid red");
		$("#consult_lstname").css("border", "1px solid red");
		return false;
	}

	if (val_consult_dob == "" || val_consult_dob == null) {
		$("addCnsltError").html(
				" <font color=#FF4D4D>DOB field is Required</font>");
		$('html,body').scrollTop(0);
		$("#val_consult_dob").css("border", "1px solid red");
		$("#consult_dob").css("border", "1px solid red");
		return false;
	}
	if (dobYeardiff < 20) {
		$("addCnsltError")
				.html(
						" <font color=#FF4D4D>Consultant must be atleast 20 years old.</font>");
		$('html,body').scrollTop(0);
		$("#val_consult_dob").css("border", "1px solid red");
		$("#consult_dob").css("border", "1px solid red");
		return false;
	}

	if (val_consult_mobileNo == "" || val_consult_mobileNo == null) {
		$("addCnsltError").html(
				" <font color=#FF4D4D>Mobile number field is Required</font>");
		$('html,body').scrollTop(0);
		$("#val_consult_mobileNo").css("border", "1px solid red");
		$("#consult_mobileNo").css("border", "1px solid red");
		return false;
	}

	if (val_consult_City == "" || val_consult_City == null) {
		$("addCnsltError")
				.html(
						" <font color=#FF4D4D>Permanent address city field is Required</font>");
		$('html,body').scrollTop(0);
		$("#val_consult_City").css("border", "1px solid red");
		$("#consult_City").css("border", "1px solid red");
		return false;
	}
	if (!pat.test(val_consult_City)) {
		$("addCnsltError")
				.html(
						" <font color=#FF4D4D>Must be valid city name in permanent address</font>");
		$('html,body').scrollTop(0);
		$("#val_consult_City").css("border", "1px solid red");
		$("#consult_City").css("border", "1px solid red");
		return false;
	}
	if (val_consult_Country == -1) {
		$("addCnsltError")
				.html(
						" <font color=#FF4D4D>Permanent address country field is Required</font>");
		$('html,body').scrollTop(0);
		$("#val_consult_Country").css("border", "1px solid red");
		$("#consult_Country").css("border", "1px solid red");
		return false;
	}
	if (val_consult_State == -1) {
		$("addCnsltError")
				.html(
						" <font color=#FF4D4D>Permanent address state field is Required</font>");
		$('html,body').scrollTop(0);
		$("#val_consult_State").css("border", "1px solid red");
		$("#consult_State").css("border", "1px solid red");
		return false;
	}

	if (val_consult_CCity == "" || val_consult_CCity == null) {
		$("addCnsltError").html(
				" <font color=#FF4D4D>Current city field is Required</font>");
		$('html,body').scrollTop(0);
		$("#val_consult_CCity").css("border", "1px solid red");
		$("#consult_CCity").css("border", "1px solid red");
		return false;
	}
	if (!pat.test(val_consult_CCity)) {
		$("addCnsltError")
				.html(
						" <font color=#FF4D4D>Must be valid city name in current address</font>");
		$('html,body').scrollTop(0);
		$("#val_consult_CCity").css("border", "1px solid red");
		$("#consult_CCity").css("border", "1px solid red");
		return false;
	}
	if (val_consult_CCountry == -1) {
		$("addCnsltError")
				.html(
						" <font color=#FF4D4D>Current address country field is Required</font>");
		$('html,body').scrollTop(0);
		$("#val_consult_CCountry").css("border", "1px solid red");
		$("#consult_CCountry").css("border", "1px solid red");
		return false;
	}
	if (val_consult_CState == -1) {
		$("addCnsltError")
				.html(
						" <font color=#FF4D4D>Current address state field is Required</font>");
		$('html,body').scrollTop(0);
		$("#val_consult_CState").css("border", "1px solid red");
		$("#consult_CState").css("border", "1px solid red");
		return false;
	}

	if (primaryCategoryArry == "" || primaryCategoryArry == null) {
		$("addCnsltError").html(
				" <font color='red'> Primary Skill field is required</font>");
		$('html,body').scrollTop(0);
		$("#primarySkillValue").css("border", "1px solid red");
		return false;
	} else {
		$("addCnsltError").html("");
		$("#primarySkillValue").css("border", "1px solid #ccc");
	}
	
	if (skillCategoryArry == "") {

		$("addCnsltError").html(
				" <font color='red'> Secondary Skill field is required</font>");
		$('html,body').scrollTop(0);
		$("#skillCategoryValue").css("border", "1px solid red");
		return false;
	} else {
		$("addCnsltError").html("");
		$("#skillCategoryValue").css("border", "1px solid #ccc");
	}
	

	if (val_consult_jobTitle == "" || val_consult_jobTitle == null) {
		$("addCnsltError").html(
				" <font color=#FF4D4D>Job title field is Required</font>");
		$('html,body').scrollTop(0);
		$("#val_consult_jobTitle").css("border", "1px solid red");
		$("#consult_jobTitle").css("border", "1px solid red");
		return false;
	}
	if (val_consult_experience == "" || val_consult_experience == null) {
		$("addCnsltError").html(
				" <font color=#FF4D4D>Experience field is Required</font>");
		$('html,body').scrollTop(0);
		$("#val_consult_experience").css("border", "1px solid red");
		$("#consult_experience").css("border", "1px solid red");
		return false;
	}

	if (val_consult_wcountry == "" || val_consult_wcountry == null) {
		$("addCnsltError")
				.html(
						" <font color=#FF4D4D>Working country field is Required</font>");
		$('html,body').scrollTop(0);
		$("#val_consult_wcountry").css("border", "1px solid red");
		$("#consult_wcountry").css("border", "1px solid red");
		return false;
	}
	doSkillValidate();

	doSecSkillValidate();

	if($('#other').is(':visible'))
	{
		//alert("visible");
		var pAddList = $("#consult_otherSkills").val();
		if(pAddList== '' || pAddList == null || pAddList == ' '){
			$("#primaryErrMsg").html("<font color='red'>Other Skills is Required</font> ");
			$("#consult_otherSkills").css("border", "1px solid red");
			return false;
		}
	}
	if($('#secondary').is(':visible'))
		{
		var sAddList =$("#consult_otherSecSkills").val();
		if(sAddList== '' || sAddList == null || sAddList == ' '){
			$("#secErrMsg").html("<font color='red'>Other Skills is Required</font> ");
			$("#consult_otherSecSkills").css("border", "1px solid red");
			return false;
		}
		}



	if (relocation == 'Yes') {

		if (preferCountry == "-1") {
			$("addCnsltError").html(
					" <font color='red'>Prefer Country is Required</font>");
			$("#consult_pcountry").css("border", "1px solid red");
			return false;
		} else {
			$("addCnsltError").html("");
			$("#consult_pcountry").css("border", "1px solid #ccc");

		}
		if (preferRegion == "-1") {
			$("addCnsltError").html(
					" <font color='red'>Prefer Region is Required</font>");
			$("#consult_preferredRegion").css("border", "1px solid red");
			return false;
		} else {
			$("addCnsltError").html("");
			$("#consult_preferredRegion").css("border", "1px solid #ccc");
		}
		if ($("#consult_preferredState :selected").length == 0) {

			$("addCnsltError").html(
					" <font color= #FF4D4D>Please select prefer state</font>");
			// $("#consult_preferredState").val(" <b><font color=
			// #FF4D4D>Preferred State should not be selected more than
			// 5</font></b>.");
			$("#consult_preferredState").css("border", "1px solid red");

			return false;
		} else {
			$("addCnsltError").html("");
			$("#consult_preferredState").css("border", "1px solid #ccc");

		}
	}

	if ($("#consult_preferredState :selected").length > 5) {

		$("addCnsltError")
				.html(
						" <font color= #FF4D4D>Preferred State should not be selected more than 5</font>");
		// $("#consult_preferredState").val(" <b><font color= #FF4D4D>Preferred
		// State should not be selected more than 5</font></b>.");
		$("#consult_preferredState").css("border", "1px solid red");

		return false;
	} else {
		$("#consult_preferredState :selected").each(function() {
			userCatArry.push($(this).val());
		});
		$("#PrefstateValues").val(userCatArry);
	}
	
	if (sal == "" || sal == null) {
		$("addCnsltError").html(
				" <font color=#FF4D4D>Salary field is Required</font>.");
		$("#consult_salary").css("border", "1px solid red");
		return false;
	} 
	/*
	 * if (val_consult_industry == "" || val_consult_industry == null) {
	 * $("addCnsltError").html( " <font color=#FF4D4D>Industry field is Required</font>");
	 * $('html,body').scrollTop(0); $("#val_consult_industry").css("border",
	 * "1px solid red"); $("#consult_industry").css("border", "1px solid red");
	 * return false; }
	 */
	if (FileUploadPath == '') {

		$("addCnsltError").html(
				" <font color='red'>Please upload a file</font>");
		$('html,body').scrollTop(0);
		return false;
	} else {
		var Extension = FileUploadPath.substring(
				FileUploadPath.lastIndexOf('.') + 1).toLowerCase();

		if (Extension == "pdf" || Extension == "doc" || Extension == "docx") {
			$("addCnsltError").html(" ");
			$("#fileSpanId").css("color", "");

		} else {
			$("addCnsltError")
					.html(
							" <font color='red'> Allows only doc, docx or pdf type.</font>");
			$('html,body').scrollTop(0);
			$("#fileSpanId").css("color", "red");
			return false;
		}
	}

	$("addCnsltError").html("");
	$("#consult_email").css("border", "1px solid #ccc");
	$("#val_consult_email").css("border", "1px solid #3BB9FF");
	$("#consult_add_date").css("border", "1px solid #3BB9FF");
	$("#consult_available").css("border", "1px solid #3BB9FF");
	$("#consult_fstname").css("border", "1px solid #3BB9FF");
	$("#consult_lstname").css("border", "1px solid #3BB9FF");
	$("#consult_dob").css("border", "1px solid #ccc");
	$("#consult_mobileNo").css("border", "1px solid #3BB9FF");
	$("#consult_lcountry").css("border", "1px solid #3BB9FF");
	$("#consult_Address").css("border", "1px solid #3BB9FF");
	$("#consult_City").css("border", "1px solid #3BB9FF");
	$("#consult_Country").css("border", "1px solid #3BB9FF");
	$("#consult_State").css("border", "1px solid #3BB9FF");
	// $("#consult_Zip").css("border", "1px solid #3BB9FF");
	// $("#consult_Phone").css("border", "1px solid #3BB9FF");
	$("#consult_CAddress").css("border", "1px solid #3BB9FF");
	$("#consult_CCity").css("border", "1px solid #3BB9FF");
	$("#consult_CCountry").css("border", "1px solid #3BB9FF");
	$("#consult_CState").css("border", "1px solid #3BB9FF");
	// $("#consult_CZip").css("border", "1px solid #3BB9FF");
	// $("#consult_CPhone").css("border", "1px solid #3BB9FF");
	$("#consult_industry").css("border", "1px solid #3BB9FF");
	// $("#consult_salary").css("border", "1px solid #3BB9FF");
	$("#consult_wcountry").css("border", "1px solid #3BB9FF");
	// $("#consult_organization").css("border", "1px solid #3BB9FF");
	$("#consult_experience").css("border", "1px solid #3BB9FF");
	// $("#consult_preferredState").css("border", "1px solid #3BB9FF");
	$("#consult_jobTitle").css("border", "1px solid #3BB9FF");
	$("#consult_workPhone").css("border", "1px solid #3BB9FF");
	$("#consult_skill").css("border", "1px solid #3BB9FF");

	submmition();

	return true;
}
function submmition() {
	var skillCategoryArry = [];
	$("#skillCategoryValue :selected").each(function() {
		skillCategoryArry.push($(this).val());
	});
	// alert(skillCategoryArry);
	document.getElementById("skillValues").value = skillCategoryArry;
	var v = document.getElementById("skillValues").value;

	// alert(v);
	// alert(skillCategoryArry);
	// document.getElementById("consultantForm").submit();
}

// function to copy the permanent address into current address add by Aklakh
function FillAddress() {
	if (document.getElementById("addconsult_checkAddress").checked == true) {
		document.getElementById("consult_CAddress").value = document
				.getElementById("consult_Address").value;
		document.getElementById("consult_CAddress").disabled = true;
		document.getElementById("consult_CAddress2").value = document
				.getElementById("consult_Address2").value;
		document.getElementById("consult_CAddress2").disabled = true;
		document.getElementById("consult_CCity").value = document
				.getElementById("consult_City").value;
		$("#consult_CCity").css("border", "1px solid #CCCCCC");
		document.getElementById("consult_CCity").disabled = true;
		document.getElementById("consult_CCountry").value = document
				.getElementById("consult_Country").value;
		document.getElementById("consult_CCountry").disabled = true;
		var $options = $("#consult_State > option").clone();
		$('#consult_CState').append($options);
		document.getElementById("consult_CState").value = document
				.getElementById("consult_State").value;
		$("#consult_CState").css("border", "1px solid #CCCCCC");
		document.getElementById("consult_CState").disabled = true;
		document.getElementById("consult_CZip").value = document
				.getElementById("consult_Zip").value;
		document.getElementById("consult_CZip").disabled = true;
		document.getElementById("consult_CPhone").value = document
				.getElementById("consult_Phone").value;
		document.getElementById("consult_CPhone").disabled = true;
	}
	if (document.getElementById("addconsult_checkAddress").checked == false) {
		document.getElementById("consult_CAddress").disabled = false;
		document.getElementById("consult_CAddress").value = '';
		document.getElementById("consult_CAddress2").disabled = false;
		document.getElementById("consult_CAddress2").value = '';
		document.getElementById("consult_CCity").disabled = false;
		document.getElementById("consult_CCity").value = '';
		document.getElementById("consult_CCountry").disabled = false;
		document.getElementById("consult_CCountry").value = '3';
		document.getElementById("consult_CState").disabled = false;
		document.getElementById("consult_CState").value = '-1';
		document.getElementById("consult_CZip").disabled = false;
		document.getElementById("consult_CZip").value = '';
		document.getElementById("consult_CPhone").disabled = false;
		document.getElementById("consult_CPhone").value = '';

	}
}
// To clear the form add by Aklakh
function clearForm() {
	$("#skillCategoryValue").selectivity('clear');
	$("#consult_preferredState").selectivity('clear');
	$("#consult_pcountry").hide();
	$("#consult_preferredRegion").hide();
	$(".pref_country").hide();
	$("#consult_preferredState").hide();
	$(".pref_state").hide();
	$(".pref_region_div").hide();
	$("#PrefstateValues").val('');
	$("addCnsltError").html("");

	$("addCnsltError").html("");
	consult_email.value = '';
	consult_fstname.value = '';
	// consult_gender1.value='';
	consult_homePhone.value = '';
	consult_add_date.value = '';
	consult_midname.value = '';
	consult_dob.value = '';
	consult_mobileNo.value = '';
	consult_available.value = '';
	consult_lstname.value = '';
	consult_homePhone.value = '';
	// consult_mStatus.value='';
	consult_lcountry.value = '';
	consult_alterEmail.value = '';
	consult_ssnNo.value = '';
	consult_Address.value = '';
	consult_Address2.value = '';
	consult_City.value = '';
	consult_Country.value = '';
	consult_State.value = '';
	consult_Zip.value = '';
	consult_Phone.value = '';
	consult_CAddress.value = '';
	consult_CAddress2.value = '';
	consult_CCity.value = '';
	consult_CCountry.value = '';
	consult_CState.value = '';
	consult_CZip.value = '';
	consult_CPhone.value = '';
	consult_jobTitle.value = '';
	consult_industry.value = '';
	consult_organization.value = '';
	consult_salary.value = '';
	consult_experience.value = '';
	consult_workPhone.value = '';
	consult_referredBy.value = '';
	consult_wcountry.value = '';
	consult_pcountry.value = '';
	consult_preferredRegion.value = '';
	consult_preferredState.value = '';
	consult_comments.value = '';
	consult_education.value = '';
	$("#description_feedback").html("");
	$("#comments_feedback").html("");
	$("#consult_email").css("border", "1px solid #3BB9FF");
	$("#val_consult_email").css("border", "1px solid #3BB9FF");
	$("#consult_add_date").css("border", "1px solid #3BB9FF");
	$("#consult_available").css("border", "1px solid #3BB9FF");
	$("#consult_fstname").css("border", "1px solid #3BB9FF");
	$("#consult_lstname").css("border", "1px solid #3BB9FF");
	$("#consult_dob").css("border", "1px solid #3BB9FF");
	$("#consult_homePhone").css("border", "1px solid #3BB9FF");
	$("#consult_mobileNo").css("border", "1px solid #3BB9FF");
	$("#consult_lcountry").css("border", "1px solid #3BB9FF");
	$("#consult_alterEmail").css("border", "1px solid #3BB9FF");
	$("#consult_ssnNo").css("border", "1px solid #3BB9FF");
	$("#consult_Address").css("border", "1px solid #3BB9FF");
	$("#consult_Address2").css("border", "1px solid #3BB9FF");
	$("#consult_City").css("border", "1px solid #3BB9FF");
	$("#consult_Country").css("border", "1px solid #3BB9FF");
	$("#consult_State").css("border", "1px solid #3BB9FF");
	$("#consult_Zip").css("border", "1px solid #3BB9FF");
	$("#consult_Phone").css("border", "1px solid #3BB9FF");
	$("#consult_CAddress").css("border", "1px solid #3BB9FF");
	$("#consult_CAddress2").css("border", "1px solid #3BB9FF");
	$("#consult_CCity").css("border", "1px solid #3BB9FF");
	$("#consult_CCountry").css("border", "1px solid #3BB9FF");
	$("#consult_CState").css("border", "1px solid #3BB9FF");
	$("#consult_CZip").css("border", "1px solid #3BB9FF");
	$("#consult_CPhone").css("border", "1px solid #3BB9FF");
	$("#consult_industry").css("border", "1px solid #3BB9FF");
	$("#consult_salary").css("border", "1px solid #3BB9FF");
	$("#consult_wcountry").css("border", "1px solid #3BB9FF");
	$("#consult_organization").css("border", "1px solid #3BB9FF");
	$("#consult_experience").css("border", "1px solid #3BB9FF");
	$("#consult_preferredState").css("border", "1px solid #3BB9FF");
	$("#consult_referredBy").css("border", "1px solid #3BB9FF");
	$("#consult_jobTitle").css("border", "1px solid #3BB9FF");
	$("#consult_workPhone").css("border", "1px solid #3BB9FF");
	$("#consult_pcountry").css("border", "1px solid #3BB9FF");
	$("#consult_preferredRegion").css("border", "1px solid #3BB9FF");
}

// To check the character length of description text area add by Aklakh
function checkCharactersDescription(id) {
	$("#description_feedback").show();
	$(id)
			.keyup(
					function() {
						el = $(this);
						if (el.val().length >= 200) {
							el.val(el.val().substr(0, 200));
						} else {
							$("#description_feedback").css("color", "green");
							$("#description_feedback").text(
									200 - el.val().length
											+ ' Characters remaining . ');
						}
						if (el.val().length == 200) {
							$("#description_feedback").css("color", "red");
							$("#description_feedback")
									.text(
											' Cannot enter  more than 200 Characters .');
						}

					})
	$("#description_feedback").fadeOut(4000);
	return false;
}
// To check the character length of comments text area add by Aklakh
function checkCharactersComments(id) {
	$("#comments_feedback").show();
	$(id)
			.keyup(
					function() {
						el = $(this);
						if (el.val().length >= 200) {
							el.val(el.val().substr(0, 200));
						} else {
							$("#comments_feedback").css("color", "green");
							$("#comments_feedback").text(
									200 - el.val().length
											+ ' Characters remaining . ');
						}
						if (el.val().length == 200) {
							$("#comments_feedback").css("color", "red");
							$("#comments_feedback")
									.text(
											' Cannot enter  more than 200 Characters .');
						}

					})
	$("#comments_feedback").fadeOut(4000);
	return false;
}

// created by triveni

var consultCalender, consultdob, consultconfidential;
function consultdoOnLoad() {

	// alert("hii");docdatepickerfrom","docdatepicker
	consultCalender = new dhtmlXCalendarObject([ "consult_favail" ]);
	// alert("hii1");
	consultCalender.setSkin('omega');
	// alert("hii2");
	// myCalendar.setDateFormat("%m/%d/%Y %H:%i");
	consultCalender.setDateFormat("%m-%d-%Y");

	var today = new Date();
	consultCalender.setSensitiveRange(today, null);
	consultdob = new dhtmlXCalendarObject([ "consult_dob" ]);
	// alert("hii1");
	consultdob.setSkin('omega');
	// alert("hii2");
	// myCalendar.setDateFormat("%m/%d/%Y %H:%i");
	consultdob.setDateFormat("%m-%d-%Y");

	consultconfidential = new dhtmlXCalendarObject([ "consult_passport" ]);
	// alert("hii1");
	consultconfidential.setSkin('omega');
	// alert("hii2");
	// myCalendar.setDateFormat("%m/%d/%Y %H:%i");
	consultconfidential.setDateFormat("%m/%d/%Y");

}
function consult_enterDateRepository() {
	document.getElementById('consult_favail').value = "";
	// document.getElementById('end_date').value = "";
	document.getElementById('consult_dob').value = "";
	// document.getElementById('end_date').value = "";
	document.getElementById('consult_passport').value = "";
	// document.getElementById('end_date').value = "";
	alert("Please select from the Calender !");
	return false;
}
/* consultant details validations */

function consultvalid_email(email, flag) {
	css1 = email.id;
	email = email.value;
	console.log(css1);
	console.log(email);
	console.log(flag);
	// var email = document.getElementById("consult_email").value;
	// re = /^[^@]+@[^@]+\.[a-zA-Z]{2,}$/;
	re = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	if (email == "") {
		if (flag == "mandatory") {
			$("email_error")
					.html(" <font color='red'>Email is Required</font>");
			$("#" + css1 + "").css("border", "1px solid red");
		} else {
			$("email_error").html(" ");
		}

	} else if (!re.test(email)) {

		$("email_error").html(" <font color='red'>must be valid Email</font>");
		$("#" + css1 + "").css("border", "1px solid red");
	} else {

		$("email_error").html(" ");
		$("#" + css1 + "").css("border", "1px solid green");
	}

}

function consultvalid_fname() {
	$("successMessage").html(" ");
	var fstname = document.getElementById("consult_fstname").value;

	if (fstname == "" || fstname == null) {

		$("consult_error").html(
				" <font color='red'>First name field is Required</font>");
		$("#consult_fstname").css("border", "1px solid red");
	} else {
		$("consult_error").html(" ");
		$("#consult_fstname").css("border", "1px solid green");
	}
}

function consultvalid_lstname() {
	$("successMessage").html(" ");
	var lstname = document.getElementById("consult_lstname").value;

	if (lstname == "" || lstname == null) {

		$("consult_error").html(
				" <font color='red'>last name is required</font>");
		$("#consult_lstname").css("border", "1px solid red");
	} else {
		$("consult_error").html(" ");
		$("#consult_lstname").css("border", "1px solid green");
	}
}

function consultvalid_industry() {
	$("successMessage").html(" ");
	var consult_industry = $('#consult_industry').val();

	if (consult_industry == -1) {
		$("consult_error").html(
				" <font color='red'>Industry field is required</font>");
		$("#consult_industry").css("border", "1px solid red");
	} else {
		$("consult_error").html(" ");
		$("#consult_industry").css("border", "1px solid green");
	}
}

function consultvalid_avail() {
	var consult_available = $('#consult_available').val();
	if (consult_available == -1) {
		// $("consult_error").html(" <b><font color='red'>Available field is
		// required</font></b>");
		// $("#consult_available").css("border", "1px solid red");
	} else {
		$("consult_error").html(" ");
		$("#consult_available").css("border", "1px solid green");
	}

}

function consultvalid_wcountry() {
	$("successMessage").html(" ");
	var consult_wcountry = $('#consult_wcountry').val();
	if (consult_wcountry == "" || consult_wcountry == null) {
		$("consult_error").html(
				" <font color='red'>WorkingCountry field is required</font>");
		$("#consult_wcountry").css("border", "1px solid red");
	} else {
		$("consult_error").html(" ");
		$("#consult_wcountry").css("border", "1px solid green");

	}

}

function consultvalid_organization() {
	var consult_organization = $('#consult_organization').val();
	if (consult_organization == -1) {
		$("consult_error").html(
				" <font color='red'>Organisation field is required</font>");
		$("#consult_organization").css("border", "1px solid red");
	} else {
		$("consult_error").html(" ");
		$("#consult_organization").css("border", "1px solid green");
	}
}

function consultvalid_experience() {
	$("successMessage").html(" ");
	var consult_experience = $('#consult_experience').val();
	if (consult_experience == -1) {
		$("consult_error").html(
				" <font color='red'>Experiance field is required</font>");
		$("#consult_experience").css("border", "1px solid red");
	} else {
		$("consult_error").html(" ");
		$("#consult_experience").css("border", "1px solid green");
	}

}

function consultvalid_preferredState() {
	var consult_preferredState = $('#consult_preferredState').val();
	if (consult_preferredState == -1) {
		$("consult_error").html(
				"<font color='red'>PreferredState field is required</font>");
		$("#consult_preferredState").css("border", "1px solid red");
	} else {
		$("consult_error").html(" ");
		$("#consult_preferredState").css("border", "1px solid green");
	}
}
function consultvalid_jobTitle() {
	$("successMessage").html(" ");
	var consult_jobTitle = $('#consult_jobTitle').val();
	if (consult_jobTitle == "" || consult_jobTitle == null) {
		$("consult_error").html(
				" <font color='red'>Job Title field is required</font>");
		$("#consult_jobTitle").css("border", "1px solid red");
	} else {
		$("consult_error").html(" ");
		$("#consult_jobTitle").css("border", "1px solid green");

	}
}

function consultvalid_Salary() {
	var consult_salary = $('#consult_salary').val();
	if (consult_salary == "" || consult_salary == null) {
		$("consult_error").html(
				" <font color='red'>Rate/Salary field is required</font>");
		$("#consult_salary").css("border", "1px solid red");
	} else {
		$("consult_error").html(" ");
		$("#consult_salary").css("border", "1px solid green");

	}
}

function doSkillValidate(){
	var pAddList = $("#consult_otherSkills").val();
	if(pAddList== '' || pAddList == null || pAddList == ' '){
		$("#primaryErrMsg").html("<font color='red'>Other Skills is Required</font> ");
		$("#consult_otherSkills").css("border", "1px solid red");
		return false;
	}
	else{
	var plist = $("#primaryHidden").val();
	var slist = $("#secondaryHidden").val();
	
	var primaryList=  plist.replace(/[{()}]/g, '');
	var secondaryList=  slist.replace(/[{()}]/g, '');

	var combineList = new Object();
	 combineList = primaryList.concat(","+secondaryList);

	var v= combineList;
	//alert(v);
	
		//var skillValue=  v.replace(/[{()}]/g, '');
		
		 var flagList=v.split("FLAG");
		var totalSkills=flagList[0].split(",");
      //alert(totalSkills);
		
		var primaryTemp = [];
		var pTemp = [];
		var q=0;
		 var l=0;

		 var primaryOther=pAddList.split(",");
		
			for (var m = 0; m < primaryOther.length; m++) {

				primaryOther[m] = primaryOther[m].trim();

			}
		 
		// alert(primaryOther);
		 
		 
		 for (var p = 0; p < primaryOther.length; p++) {
	 
		 for (var i = 0; i < totalSkills.length; i++){ 
		        var Values=totalSkills[i].split("=");
		     
		             //alert("Values[]--->"+Values[1]+"primaryOther[0]---->"+primaryOther[p]);
		            if (Values[1].toUpperCase() == primaryOther[p].toUpperCase()) {
		           // alert(" "+Values[1]+ "--->Already Existed Please select from Primary Skills List");
		            var index = primaryOther.indexOf(primaryOther[p]);
		            primaryTemp[l]=primaryOther[p];
	            	l++;
		                ctr=1;
		                break ;
		            }
		            else{
		            	pTemp[q]=primaryOther[p];
		            	q++;
		            }
		        ctr=0;
		    }
		      
		    }
		 //alert(pTemp);
		 primaryOther = primaryOther.filter(function(x) { return primaryTemp.indexOf(x) < 0 });
		   document.getElementById("consult_otherSkills").value=primaryOther;
		   if(primaryTemp.length!=0 ){
		   document.getElementById("primaryErrMsg").innerHTML="<font color='Green'> "+primaryTemp+" </font><font color='red'> Skills Already Existed!!! Please select From Skills List<font>"; //" "+primaryTemp+
		   return false;
		   }
		   else if(pTemp.length>0&& primaryTemp.length==0){
			   $("#primaryErrMsg").html(" ");
				$("#consult_otherSkills").css("border", "1px solid #ccc");
		   }
	}
		 
}
function doSecSkillValidate(){
	var sAddList = $("#consult_otherSecSkills").val();
	if(sAddList== '' || sAddList == null || sAddList == ' '){
		$("#secErrMsg").html("<font color='red'>Other Skills is Required</font> ");
		$("#consult_otherSecSkills").css("border", "1px solid red");
		return false;
	}
	else{
	var plist = $("#primaryHidden").val();
	var slist = $("#secondaryHidden").val();
	
	var primaryList=  plist.replace(/[{()}]/g, '');
	var secondaryList=  slist.replace(/[{()}]/g, '');

	var combineList = new Object();
	 combineList = primaryList.concat(","+secondaryList);

	var v= combineList;
	//alert(v);
	
		//var skillValue=  v.replace(/[{()}]/g, '');
		
		 var flagList=v.split("FLAG");
		var totalSkills=flagList[0].split(",");
      //alert(totalSkills);
		
		var secTemp = [];
		var sTemp = [];
		var q=0;
		 var k=0;
		    var secondaryOther=sAddList.split(",");
		    for (var m = 0; m < secondaryOther.length; m++) {

		    	secondaryOther[m] = secondaryOther[m].trim();

			}
		 
		    for (var p = 0; p < secondaryOther.length; p++) {
		    	
		    for (var i = 0; i < totalSkills.length; i++){ 
		        var Values=totalSkills[i].split("=");
		      
		            // alert("Values[0]--->"+Values[1]+"secondaryOther[0]---->"+secondaryOther[p]);
		            
		            if (Values[1].toUpperCase() == secondaryOther[p].toUpperCase()) {
		            //alert(""+Values[1]+" ------> Already Existed Please select from Secondary Skills List");
		            var index = secondaryOther.indexOf(secondaryOther[p]);
		         
		            	secTemp[k]=secondaryOther[p];
		            	k++;
		            
		                ctr=1;
		                break ;
		            }
		            else{
		            	sTemp[q]=secondaryOther[p];
		            	q++;
		            }
		        ctr=0;
		    }
		    }
		    
			   secondaryOther = secondaryOther.filter(function(x) { return secTemp.indexOf(x) < 0 });
		   document.getElementById("consult_otherSecSkills").value=secondaryOther;
		   if(secTemp.length!=0){
			   document.getElementById("secErrMsg").innerHTML="<font color='Green'> "+secTemp+"</font><font color='red'> Skills Already Existed!!! Please select From Skills List<font>";
		   return false;
		   }
		   else if(sTemp.length>0&& secTemp.length==0){
			   $("#secErrMsg").html(" ");
				$("#consult_otherSecSkills").css("border", "1px solid #ccc");
		   }
	}
		 
}
function ConsultDetails_valid() {
	// alert("ConsultDetails_valid");
	var skillCategoryArry = [];
	$("#skillCategoryValue :selected").each(function() {
		skillCategoryArry.push($(this).val());
	});
	document.getElementById("skillValues").value = skillCategoryArry;

	var primaryCategoryArry = [];
	$("#primarySkillValue :selected").each(function() {
		primaryCategoryArry.push($(this).val());
	});
	document.getElementById("primaryValues").value = primaryCategoryArry;

	var pref_statesArray = [];
	$("#consult_preferredState :selected").each(function() {
		pref_statesArray.push($(this).val());
	});
	document.getElementById("PrefstateValues").value = pref_statesArray;

	$("successMessage").html(" ");
	var email = document.getElementById("consult_email").value;
	var consult_industry = $('#consult_industry').val();
	var dob = document.getElementById("consult_dob").value;
	var mblno = document.getElementById("consult_mobileNo").value;
	var city = document.getElementById("consult_City").value;
	var state = document.getElementById("consult_State").value;
	var country = document.getElementById("consult_Country").value;
	var ccity = document.getElementById("consult_CCity").value;
	var cstate = document.getElementById("consult_CState").value;
	var ccountry = document.getElementById("consult_CCountry").value;
	var workingCountry = document.getElementById("consult_wcountry").value;
	// var skill=document.getElementById("consult_skill").value;

	// var consult_favail=$('#consult_favail').val();
	// var consult_available=$('#consult_available').val();
	var consult_organization = $('#consult_organization').val();
	var consult_experience = $('#consult_experience').val();
	// var consult_preferredState=$('#consult_preferredState').val();
	var consult_jobTitle = $('#consult_jobTitle').val();
	// var consult_salary=$('#consult_salary').val();
	// var consult_wcountry=$('#consult_wcountry').val();
	var available = document.getElementById("consult_available").value;
	var dobDate = dob.split('-');
	var dobChangedDate = new Date(dobDate[2], dobDate[0] - 1, dobDate[1]);
	var todayDate = new Date();
	var dobYeardifference = (todayDate - dobChangedDate) / (86400000 * 360);

	var lstname = document.getElementById("consult_lstname").value;
	var fstname = document.getElementById("consult_fstname").value;
	//var identityProof = document.getElementById("consultantIdProof").value;
	//var downloadDiv = document.getElementById("proofdownloadDiv").style.display;
	//var file = document.getElementById("file").value;
	var relocation = document.getElementById("consult_relocation").value;
	var preferCountry = document.getElementById("consult_preferredCountry").value;
	var preferState = document.getElementById("consult_preferredState").value;
	var userCatArry = [];
	if (available == 'Y') {
		// alert("available-->"+available);
		var consult_favail = document.getElementById("consult_favail").value;

		if (consult_favail == " ") {
			// alert(consult_favail);
			$("consult_error")
					.html(
							"<font color='red'>Please select the available date</font>");
			$("#consult_favail").css("border", "1px solid red");

			return false;
		}
	}
	if (primaryCategoryArry == "" || primaryCategoryArry == null) {
		$("consult_error").html(
				" <font color='red'> Primary Skill is required</font>");
		$('html,body').scrollTop(0);
		$("#primarySkillValue").css("border", "1px solid red");
		return false;
	} else {
		$("consult_error").html("");
		$("#primarySkillValue").css("border", "1px solid #ccc");
	}
	if (skillCategoryArry == ""){ 
		$("consult_error").html(" <font color='red'>Secondary Skill is Required</font>");
		$("#skillCategoryValue").css("border", "1px solid red");
		return false;
	} else {
		$("consult_error").html(" ");
		$("#skillCategoryValue").css("border", "1px solid #ccc");
	}

	if ($("#consult_preferredState :selected").length > 5) {

		$("consult_error")
				.html(
						" <font color= #FF4D4D>Preferred State should not be selected more than 5</font>.");
		// $("#consult_preferredState").val(" <b><font color= #FF4D4D>Preferred
		// State should not be selected more than 5</font></b>.");
		$("#consult_preferredState").css("border", "1px solid red");

		return false;
	} else {

		$("#consult_preferredState").css("border", "1px solid #ccc");

		$("#consult_preferredState :selected").each(function() {
			userCatArry.push($(this).val());
		});
		$("#PrefstateValues").val(userCatArry);

	}
	re = /^[^@]+@[^@]+\.[a-zA-Z]{2,}$/;
	if (email == "") {
		$("consult_error").html(" <font color='red'>Email is Required</font>");
		$("#consult_email").css("border", "1px solid red");
		return false;
	} else {
		$("consult_error").html(" ");
		$("#consult_email").css("border", "1px solid #ccc");
	}

	if (fstname == '' || fstname == null || fstname == ' ') {

		$("consult_error").html(
				" <font color='red'>First name is Required</font>");
		$("#consult_fstname").css("border", "1px solid red");
		return false;
	} else {
		$("consult_error").html("");
		$("#consult_fstname").css("border", "1px solid #ccc");
	}

	if (lstname == '' || lstname == null || lstname == ' ') {
		// alert("di")
		$("consult_error").html(
				"<font color='red'>Last name is Required</font>");
		$("#consult_lstname").css("border", "1px solid red");
		return false;
	} else {
		$("consult_error").html("");
		$("#consult_lstname").css("border", "1px solid #ccc");
	}
	if (dob == '' || dob == ' ') {
		$("consult_error").html(" <font color='red'>Dob is Required</font>");
		$("#consult_dob").css("border", "1px solid red");
		return false;
	} else if (dobYeardifference < 20) {
		$("consult_error")
				.html(
						" <font color= #FF4D4D>Consultant must be atleast 20 years old.</font>.");
		$("#consult_dob").css("border", "1px solid red");
		return false;
	} else {
		$("consult_error").html(" ");
		$("#consult_dob").css("border", "1px solid #ccc");
	}
	if (mblno == "" || mblno == " ") {
		$("consult_error").html(
				" <font color='red'>Mobile No is Required</font>");
		$("#consult_mobileNo").css("border", "1px solid red");
		return false;
	} else {
		$("consult_error").html(" ");
		$("#consult_moblileNo").css("border", "1px solid #ccc");
	}

	/*if (identityProof != '0') {
		if (identityProof == 'VS') {
			var visaType = document.getElementById("consultantVisa").value

			if (visaType == "0") {
				$("consult_error").html(
						"<font color='red'>Visa Type  Required</font>");
				$("#consultantVisa").css("border", "1px solid red");
				return false;
			} else {
				$("consult_error").html("");
				$("#consultantVisa").css("border", "1px solid #ccc");
			}

			if (downloadDiv != "block") {
				$("consult_error").html(
						"<font color='red'>Please upload the File</font>");
				$("#idProofUpload").css("border", "1px solid red");
				return false;
			} else {
				$("consult_error").html("");
				$("#idProofUpload").css("border", "1px solid #FOFOFO");
			}

		} else {
			if (downloadDiv != "block") {
				$("consult_error").html(
						"<font color='red'>Please upload the File</font>");
				$("#idProofUpload").css("border", "1px solid red");
				return false;
			} else {
				$("consult_error").html("");
				$("#idProofUpload").css("border", "1px solid #FOFOFO");
			}
		}
	}*/
	if (city == " " || city == "") {
		$("consult_error").html("<font color='red'>City is Required</font>");
		$("#consult_City").css("border", "1px solid red");
		return false;
	} else {
		$("consult_error").html(" ");
		$("#consult_City").css("border", "1px solid #ccc");
	}
	if (country == "") {
		$("consult_error")
				.html(" <font color='red'>Country is Required</font>");
		$("#consult_Country").css("border", "1px solid red");
		return false;
	} else {
		$("consult_error").html(" ");
		$("#consult_Country").css("border", "1px solid #ccc");
	}
	if (state == "") {
		$("consult_error").html("<font color='red'>State is Required</font>");
		$("#consult_State").css("border", "1px solid red");
		return false;
	} else {
		$("consult_error").html(" ");
		$("#consult_State").css("border", "1px solid #ccc");
	}
	if (ccity == ' ' || ccity == '') {
		$("consult_error").html("<font color='red'>City is Required</font>");
		$("#consult_CCity").css("border", "1px solid red");
		return false;
	} else {
		$("consult_error").html(" ");
		$("#consult_CCity").css("border", "1px solid #ccc");
	}

	if (ccountry == "") {
		$("consult_error")
				.html(" <font color='red'>Country is Required</font>");
		$("#consult_CCountry").css("border", "1px solid red");
		return false;
	} else {
		$("consult_error").html(" ");
		$("#consult_CCountry").css("border", "1px solid #ccc");
	}
	if (cstate == "") {
		$("consult_error").html("<font color='red'>State is Required</font>");
		$("#consult_CState").css("border", "1px solid red");
		return false;
	} else {
		$("consult_error").html(" ");
		$("#consult_CState").css("border", "1px solid #ccc");
	}

	if (consult_jobTitle == "" || consult_jobTitle == null
			|| consult_jobTitle == " ") {
		$("consult_error").html(
				" <font color='red'>Job Title is Required</font>");
		$("#consult_jobTitle").css("border", "1px solid red");
		return false;
	} else {
		$("consult_error").html("");
		$("#consult_jobTitle").css("border", "1px solid #ccc");

	}

	if (consult_experience == "") {
		$("consult_error").html(
				"<font color='red'>Experience field is Required</font>");
		$("#consult_experience").css("border", "1px solid red");
		return false;
	} else {
		$("consult_error").html("");
		$("#consult_experience").css("border", "1px solid #ccc");
	}
	if (workingCountry == " " || workingCountry == null || workingCountry == "") {
		$("consult_error").html(
				" <font color='red'>Working Country is Required</font>");
		$("#consult_wcountry").css("border", "1px solid red");
		return false;
	} else {
		$("consult_error").html("");
		$("#consult_wcountry").css("border", "1px solid #ccc");

	}

	if (consult_industry == "") {
		$("consult_error")
				.html("<font color='red'>Industry is Required</font>");
		$("#consult_industry").css("border", "1px solid red");
		return false;
	} else {
		$("consult_error").html("");
		$("#consult_industry").css("border", "1px solid #ccc");
	}

	if (relocation == 'Yes') {

		if (preferCountry == "-1") {
			$("consult_error").html(
					"<font color='red'>Preferred Country is Required</font>");
			$("#consult_preferredCountry").css("border", "1px solid red");
			return false;
		} else {
			$("consult_error").html("");
			$("#consult_preferredCountry").css("border", "1px solid #ccc");

		}
		if ($("#consult_preferredState :selected").length == 0) {

			$("consult_error").html(
					" <font color= #FF4D4D>Please select Preferred State</font>.");
			// $("#consult_preferredState").val(" <b><font color=
			// #FF4D4D>Preferred State should not be selected more than
			// 5</font></b>.");
			$("#consult_preferredState").css("border", "1px solid red");

			return false;
		} else {
			$("consult_error").html("");
			$("#consult_preferredState").css("border", "1px solid #ccc");

		}
	}

	// if(consult_favail=="" || consult_favail==null){
	// $("#consult_favail").css("border", "1px solid red");
	// }
	// else{
	// $("#consult_favail").css("border", "1px solid green");
	// }
	// if(consult_available==-1){
	// $("#consult_available").css("border", "1px solid red");
	// }
	// else{
	// $("#consult_available").css("border", "1px solid green");
	// }
	// if(consult_organization==-1){
	// $("#consult_organization").css("border", "1px solid red");
	// }
	// else{
	// $("#consult_organization").css("border", "1px solid green");
	// }

	// if(consult_preferredState==-1){
	// $("#consult_preferredState").css("border", "1px solid red");
	// }
	// else{
	// $("#consult_preferredState").css("border", "1px solid green");
	// }

	// if(consult_salary=="" || consult_salary==null){
	// $("#consult_salary").css("border", "1px solid red");
	// }
	// else{
	// $("#consult_salary").css("border", "1px solid green");
	//    
	// }
	//   
	
 doSkillValidate();

doSecSkillValidate();

if($('#other').is(':visible'))
{
	//alert("visible");
	var pAddList = $("#consult_otherSkills").val();
	if(pAddList== '' || pAddList == null || pAddList == ' '){
		$("#primaryErrMsg").html("<font color='red'>Other Skills is Required</font> ");
		$("#consult_otherSkills").css("border", "1px solid red");
		return false;
	}
}
if($('#secondary').is(':visible'))
	{
	var sAddList =$("#consult_otherSecSkills").val();
	if(sAddList== '' || sAddList == null || sAddList == ' '){
		$("#secErrMsg").html("<font color='red'>Other Skills is Required</font> ");
		$("#consult_otherSecSkills").css("border", "1px solid red");
		return false;
	}
	}


}


/* consultant confidential info */

function consult_panValidation() {

	// alert("pan")
	var pancard = document.getElementById("consult_pan").value;

	pattern = /^[A-Za-z]{5}[0-9]{4}[A-Za-z]{1}$|^\d{3}-\d{2}-\d{4}$/;

	if (pancard == "" || pancard == null) {
		$("securityinfo")
				.html("<font color='red'>field is required<br></font>");
		$("#consult_pan").css("border", "1px solid red");

	}

	else if (!pattern.test(pancard)) {
		// alert("hii")
		$("securityinfo")
				.html(
						" <font color='red'>must be valid pancard number<br>Example:ABCde1234F/123-12-1234</font>");
		$("#consult_pan").css("border", "1px solid red");

	}

	else {
		$("#consult_pan").css("border", "1px solid green");
		$("securityinfo").html("");

	}

}

function consult_nameValidation() {

	// alert("12")
	var Name = document.getElementById("consult_panname").value;
	pattern = /^[A-Za-z ]+$/;

	if (Name == "" || Name == null) {
		$("securityinfo").html(" <font color='red'>field is required</font>");
		$("#consult_panname").css("border", "1px solid red");
	} else if (!pattern.test(Name)) {
		$("securityinfo").html(
				"<font color='red'>must be valid name<br>Example:John</font>");
		$("#consult_panname").css("border", "1px solid red");
	} else {
		$("#consult_panname").css("border", "1px solid green");
		$("securityinfo").html("");
	}
}

function consult_banknameValidation() {

	// alert("12")
	var Bank = document.getElementById("consult_bank").value;
	pattern = /^[A-Za-z ]+$/;
	if (Bank == "" || Bank == null) {
		$("securityinfo").html(" <font color='red'>field is required</font>");
		$("#consult_bank").css("border", "1px solid red");
	} else if (!pattern.test(Bank)) {
		$("securityinfo")
				.html(
						" <font color='red'>must be valid bank name<br>Example:SBI</font>");
		$("#consult_bank").css("border", "1px solid red");
	} else {
		$("#consult_bank").css("border", "1px solid green");
		$("securityinfo").html("");
	}
}

function consult_banAccknumValidation() {

	// alert("12")
	var Banknumber = document.getElementById("consult_banknum").value;
	// pattern = /^[A-Za-z]{2}[0-9]{16}$/;
	pattern = /^[a-zA-Z0-9](?=[\w.]{10,20}$)\w*\.?\w*$/i;
	if (Banknumber == "" || Banknumber == null) {
		$("securityinfo").html(" <font color='red'>field is required</font>");
		$("#consult_banknum").css("border", "1px solid red");
	} else if (!pattern.test(Banknumber)) {
		$("securityinfo")
				.html(
						" <font color='red'>must be valid Bank Account Number<br>Example:A1234d567891234567</font>");
		$("#consult_banknum").css("border", "1px solid red");
	} else {
		$("#consult_banknum").css("border", "1px solid green");
		$("securityinfo").html("");
	}
}

function consult_holdnameValidation() {

	// alert("12")
	var Holdername = document.getElementById("consult_hname").value;
	pattern = /^[A-Za-z ]+$/;
	if (Holdername == "" || Holdername == null) {
		$("securityinfo").html(" <font color='red'>field is required</font>");
		$("#consult_hname").css("border", "1px solid red");
	} else if (!pattern.test(Holdername)) {
		$("securityinfo")
				.html(
						" <font color='red'>must be valid Account Holder Name<br>Example:John</font>");
		$("#consult_hname").css("border", "1px solid red");
	} else {
		$("#consult_hname").css("border", "1px solid green");
		$("securityinfo").html("");
	}
}

function consult_ifscValidation() {

	// alert("12")
	var IFSC = document.getElementById("consult_ifsc").value;
	pattern = /^[A-Za-z]{4}[0-9]{7}$/;
	if (IFSC == "" || IFSC == null) {
		$("securityinfo").html(" <font color='red'>field is required</font>");
		$("#consult_ifsc").css("border", "1px solid red");
	} else if (!pattern.test(IFSC)) {
		$("securityinfo")
				.html(
						" <font color='red'>must be valid IFSC number<br>Example:ABcd0123456</font>");
		$("#consult_ifsc").css("border", "1px solid red");
	} else {
		$("#consult_ifsc").css("border", "1px solid green");
		$("securityinfo").html("");
	}
}

function consult_uanValidation() {

	// alert("12")
	var UAN = document.getElementById("consult_uan").value;
	pattern = /^[0-9]+$/;
	if (UAN == "" || UAN == null) {
		$("securityinfo").html(" <font color='red'>field is required</font>");
		$("#consult_uan").css("border", "1px solid red");
	} else if (!pattern.test(UAN)) {
		$("securityinfo")
				.html(
						" <font color='red'>must be valid UAN number<br>Example:123456</font>");
		$("#consult_uan").css("border", "1px solid red");
	} else {
		$("#consult_uan").css("border", "1px solid green");
		$("securityinfo").html("");
	}
}

function consult_pfValidation() {

	// alert("12")
	var PF = document.getElementById("consult_pf").value;
	pattern = /^[A-Za-z]{2}-[0-9]{5}-[0-9]{7}$/;
	if (PF == "" || PF == null) {
		$("securityinfo").html(" <font color='red'>field is required</font>");
		$("#consult_pf").css("border", "1px solid red");
	} else if (!pattern.test(PF)) {
		$("securityinfo")
				.html(
						" <font color='red'>must be valid PF number<br>Example:Ab-12345-1234567</font>");
		$("#consult_pf").css("border", "1px solid red");
	} else {
		$("#consult_pf").css("border", "1px solid green");
		$("securityinfo").html("");
	}
}

function consult_passportnumValidation() {

	// alert("12")
	var PASS = document.getElementById("consult_pass").value;
	// pattern = /^[A-Za-z]{1}[0-9]{7}$/;
	pattern = /^[a-zA-Z0-9](?=[\w.]{7,16}$)\w*\.?\w*$/i;
	if (PASS == "" || PASS == null) {
		$("securityinfo").html(" <font color='red'>field is required</font>");
		$("#consult_pass").css("border", "1px solid red");
	} else if (!pattern.test(PASS)) {
		$("securityinfo")
				.html(
						" <font color='red'>must be valid passport number<br>Example:A12a3455</font>");
		$("#consult_pass").css("border", "1px solid red");
	} else {
		$("#consult_pass").css("border", "1px solid green");
		$("securityinfo").html("");
	}
}

function ConsultantEditStateChange() {
	// alert("Consultant ajax");
	document.getElementById("consult_State").disabled = false;
	var id = document.getElementById('consult_Country').value;

	// alert(id);
	var url = CONTENXT_PATH + '/recruitment/consultant/getState.action?id='
			+ id;
	// alert(url);
	var req = initRequest(url);
	req.onreadystatechange = function() {
		if (req.readyState == 4 && req.status == 200) {
			// alert(req.responseText);

			ConsultantState(req.responseText);
		}
	};
	req.open("GET", url, "true");
	req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	req.send(null);
}
function ConsultantState(data) {
	// alert(data);
	var topicId = document.getElementById("consult_State");
	var flag = data.split("FLAG");
	var addList = flag[0].split("^");
	var $select = $('#consult_State');
	$select.find('option').remove();
	for (var i = 0; i < addList.length - 1; i++) {
		var Values = addList[i].split("#");
		{

			$('<option>').val(Values[0]).text(Values[1]).appendTo($select);
		}
	}
}

function ConsultantCurrentStateChange() {
	// alert("Consultant ajax");
	document.getElementById("consult_CState").disabled = false;
	var id = document.getElementById('consult_CCountry').value;

	// alert(id);
	var url = CONTENXT_PATH + '/recruitment/consultant/getState.action?id='
			+ id;
	// alert(url);
	var req = initRequest(url);
	req.onreadystatechange = function() {
		if (req.readyState == 4 && req.status == 200) {
			// alert(req.responseText);

			ConsultantCurrentState(req.responseText);
		}
	};
	req.open("GET", url, "true");
	req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	req.send(null);
}
function ConsultantCurrentState(data) {
	// alert(data);
	var topicId = document.getElementById("consult_CState");
	var flag = data.split("FLAG");
	var addList = flag[0].split("^");
	var $select = $('#consult_CState');
	$select.find('option').remove();
	for (var i = 0; i < addList.length - 1; i++) {
		var Values = addList[i].split("#");
		{

			$('<option>').val(Values[0]).text(Values[1]).appendTo($select);
		}
	}
}

// function for change the prefrred state in edit consultant page
function ConsultantEditPreferredStateChange() {
	// alert("Consultant ajax");
	document.getElementById("consult_preferredState").disabled = false;
	var id = document.getElementById('consult_preferredCountry').value;

	// alert(id);
	var url = CONTENXT_PATH + '/recruitment/consultant/getState.action?id='
			+ id;
	// alert(url);
	var req = initRequest(url);
	req.onreadystatechange = function() {
		if (req.readyState == 4 && req.status == 200) {
			// alert(req.responseText);

			preferredState(req.responseText);
		}
	};
	req.open("GET", url, "true");
	req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	req.send(null);
}
function preferredState(data) {
	// alert(data);
	var topicId = document.getElementById("consult_preferredState");
	var flag = data.split("FLAG");
	var addList = flag[0].split("^");
	var $select = $('#consult_preferredState');
	$select.find('option').remove();
	for (var i = 0; i < addList.length - 1; i++) {
		var Values = addList[i].split("#");
		{

			$('<option>').val(Values[0]).text(Values[1]).appendTo($select);
		}
	}
}

function sameAsAddress() {
	// alert(consult_checkAddress.checked);
	if (document.getElementById("consult_checkAddress").checked == true) {
		document.getElementById("consult_CAddress").value = document
				.getElementById("consult_Address").value;
		document.getElementById("consult_CAddress").disabled = true;
		document.getElementById("consult_CAddress2").value = document
				.getElementById("consult_Address2").value;
		document.getElementById("consult_CAddress2").disabled = true;
		document.getElementById("consult_CCity").value = document
				.getElementById("consult_City").value;
		document.getElementById("consult_CCity").disabled = true;
		document.getElementById("consult_CCountry").value = document
				.getElementById("consult_Country").value;
		document.getElementById("consult_CCountry").disabled = true;

		var $options = $("#consult_State > option").clone();
		$('#consult_CState').append($options);
		document.getElementById("consult_CState").value = document
				.getElementById("consult_State").value;
		document.getElementById("consult_CState").disabled = true;
		document.getElementById("consult_CZip").value = document
				.getElementById("consult_Zip").value;
		document.getElementById("consult_CZip").disabled = true;
		document.getElementById("consult_CPhone").value = document
				.getElementById("consult_Phone").value;
		document.getElementById("consult_CPhone").disabled = true;

	}

	if (document.getElementById("consult_checkAddress").checked == false) {
		document.getElementById("consult_CAddress").disabled = false;

		document.getElementById("consult_CAddress2").disabled = false;

		document.getElementById("consult_CCity").disabled = false;
		document.getElementById("consult_CCountry").disabled = false;

		document.getElementById("consult_CState").disabled = false;

		document.getElementById("consult_CZip").disabled = false;

		document.getElementById("consult_CPhone").disabled = false;

	}

}
function defaultClick() {
	// document.getElementById("consult_State").disabled = true;
	// document.getElementById("consult_preferredState").disabled = true;
	if (document.getElementById("consult_checkAddress").checked == true) {
		document.getElementById("consult_CAddress").disabled = true;
		document.getElementById("consult_CAddress2").disabled = true;
		document.getElementById("consult_CCity").disabled = true;
		document.getElementById("consult_CCountry").disabled = true;
		// consult_CState.value=consult_State.value;
		// alert("hai i'm der")
		document.getElementById("consult_CState").disabled = true;
		document.getElementById("consult_CZip").disabled = true;
		document.getElementById("consult_CPhone").disabled = true;

	} else {
		// document.getElementById("consult_CState").disabled = true;
		document.getElementById("consult_CAddress").disabled = false;
		document.getElementById("consult_CAddress2").disabled = false;
		document.getElementById("consult_CCity").disabled = false;
		document.getElementById("consult_CCountry").disabled = false;
		document.getElementById("consult_CState").disabled = false;
		document.getElementById("consult_CZip").disabled = false;
		document.getElementById("consult_CPhone").disabled = false;
	}
	// document.getElementById("consult_CState").disabled = true;

}

function doOtherSkill() {
	// alert("doOtherSkill");
	$("#primarySkillValue :selected").each(function() {
		// alert($(this).text());
		if ((($(this).text()).toUpperCase()) === "OTHERS") {
			document.getElementById("other").style.display = "block";
			return false;
		} else {
			 //$("#consult_otherSkills").val(""); 
			document.getElementById("other").style.display = "none";
   		 //document.getElementById("other").value = "";

			
		}

	});
}

function doOtherSecondrySkill() {
	// alert("doOtherSecondarySkill");
	$("#skillCategoryValue :selected").each(function() {
		// alert($(this).text());
		if ((($(this).text()).toUpperCase()) === "OTHERS") {
			document.getElementById("secondary").style.display = "block";
			return false;
		} else {
			// alert("empty secondary skill "); 
			//$("#consult_otherSecSkills").val(""); 
			document.getElementById("secondary").style.display = "none";
	   		

			
		}

	});
}

/* All function for add consultant validation , by Jitendra */
function fnamevalidate() {
	var fname = document.getElementById("consult_fstname").value;
	re = /^[A-Za-z ]+$/;

	if (fname == "" || fname == null) {
		$("addCnsltError").html(
				" <font color=#FF4D4D>First name field is Required</font>.");
		$("#consult_fstname").css("border", "1px solid red");
		return false;
	}
	if (!re.test(fname)) {
		$("addCnsltError").html(
				" <font color=#FF4D4D>Must be valid Name <br> Ex.John</font>.");
		$("#consult_fstname").css("border", "1px solid red");
		return false;
	} else {
		$("#consult_fstname").css("border", "1px solid #3BB9FF");
		$("addCnsltError").html("");
		return true;
	}
}

function lnamevalidate() {
	var lname = document.getElementById("consult_lstname").value;
	re = /^[A-Za-z ]+$/;
	if (lname == "" || lname == null) {
		$("addCnsltError").html(
				" <font color=#FF4D4D>Last name field is Required</font>.");
		$("#consult_lstname").css("border", "1px solid red");
		return false;
	}
	if (!re.test(lname)) {
		$("addCnsltError").html(
				" <font color=#FF4D4D>Must be valid Name <br>Ex.John</font>.");
		$("#consult_lstname").css("border", "1px solid red");
		return false;
	} else {
		$("#consult_lstname").css("border", "1px solid #3BB9FF");
		$("addCnsltError").html("");
		return true;
	}
}

function mobValidation() {

	var mobnumber = document.getElementById("consult_mobileNo").value;
	// alert(mobnumber);
	var mlen = mobnumber.length;
	// alert("hi"+mlen);
	if (mlen < 14) {
		$("addCnsltError").html(
				" <font color=#FF4D4D>Mobile field is Required</font>.");

		$("#consult_mobileNo").css("border", "1px solid red");
		// alert("1");
		return false;
	} else if (mlen < 14) {
		$("addCnsltError").html(
				" <font color=#FF4D4D>Field is must be valid</font>.");
		$("#consult_mobileNo").css("border", "1px solid red");
		// alert("2");
		return false;
	}

	else {
		$("#consult_mobileNo").css("border", "1px solid #3BB9FF");
		$("addCnsltError").html("");
		$("consult_error").html(" ");
		// alert("3");
		return true;
	}

}

function consult_addressValidation() {
	var address = document.getElementById("consult_Address").value;
	if (address == "" || address == null) {
		$("addCnsltError").html(
				" <font color=#FF4D4D>Address field is Required</font>.");
		$("#consult_Address").css("border", "1px solid red");
		return false;
	} else {
		$("#consult_Address").css("border", "1px solid #3BB9FF");
		$("addCnsltError").html("");
		return true;
	}
}

function pcityValidation() {
	var pcity = document.getElementById("consult_City").value;
	if (pcity == "" || pcity == null) {
		$("addCnsltError").html(
				" <font color=#FF4D4D>City field is Required</font>.");
		$("#consult_City").css("border", "1px solid red");
		$("consult_error").html(
				" <font color=#FF4D4D>City field is Required</font>.");
		return false;
	} else {
		$("#consult_City").css("border", "1px solid #3BB9FF");
		$("addCnsltError").html("");
		$("consult_error").html("");
		return true;
	}
}

function pZipValidation() {
	var zip = document.getElementById("consult_Zip").value;
	if (zip == "" || status == zip) {
		$("addCnsltError").html(
				" <font color=#FF4D4D>Zip field is Required</font>.");
		// $("#consult_Zip").css("border", "1px solid red");
		return false;
	} else {
		$("#consult_Zip").css("border", "1px solid #3BB9FF");
		$("addCnsltError").html("");
		return true;
	}
}

/*
 * function availableValidation() {
 * 
 * var conavailable = document.getElementById("consult_available").value;
 * 
 * if (conavailable == "Y") {
 * 
 * document.getElementById("consult_add_date").disabled = false;
 * document.getElementById("consult_add_date_div").className += " required"; }
 * else { document.getElementById("consult_add_date").disabled = true;
 * document.getElementById("consult_add_date_div").classList.remove("required");
 * $("#consult_add_date").css("border", "1px solid lightgray"); } }
 */
function availableValidation() {

	var conavailable = document.getElementById("consult_available").value;

	if (conavailable == "Y") {

		document.getElementById("consult_favail").disabled = false;
		document.getElementById("consult_add_date_div").className += " required";
	} else {
		document.getElementById("consult_favail").disabled = true;
		document.getElementById("consult_add_date_div").classList
				.remove("required");
		$("#consult_favail").css("border", "1px solid lightgray");
	}

}

function loadConsultantAvaliable() {

	var conavailable = document.getElementById("consult_available").value;
	if (conavailable == "Y") {

		var txt = document.getElementById("consult_favail1").value;

		document.getElementById("consult_favail").value = document
				.getElementById("consult_favail1").value;
		document.getElementById("consult_favail").disabled = false;
		document.getElementById("consult_add_date_div").className += " required";
	} else {
		document.getElementById("consult_favail").disabled = true;
		document.getElementById("consult_add_date_div").classList
		.remove("required");
		document.getElementById("consult_favail").value = "";
	}

}

function lcountryValidation() {
	var lcountry = document.getElementById("consult_lcountry").value;
	if (lcountry == "" || lcountry == null) {
		$("addCnsltError")
				.html(
						" <font color=#FF4D4D>Living country field is Required</font>.");
		$("#consult_lcountry").css("border", "1px solid red");
		return false;
	} else {
		$("#consult_lcountry").css("border", "1px solid #3BB9FF");
		$("addCnsltError").html("");
		return true;
	}
}
function jobtitleValidate() {
	$("successMessage").html(" ");
	var jtitle = document.getElementById("consult_jobTitle").value;
	if (jtitle == "" || jtitle == null) {
		$("addCnsltError").html(
				" <font color=#FF4D4D>Job Title field is Required</font>.");
		$("consult_error").html(
				" <font color=#FF4D4D>Job Title field is Required</font>.");
		$("#consult_jobTitle").css("border", "1px solid red");
		return false;
	} else {
		$("#consult_jobTitle").css("border", "1px solid #3BB9FF");
		$("addCnsltError").html("");
		$("consult_error").html("");
		return true;
	}
}

function expValidate() {
	$("successMessage").html(" ");
	var exp = document.getElementById("consult_experience").value;
	if (exp == "" || exp == null) {
		$("addCnsltError").html(
				" <font color=#FF4D4D>Experience field is Required</font>.");
		$("consult_error").html(
				" <font color=#FF4D4D>Experience field is Required</font>.");
		$("#consult_experience").css("border", "1px solid red");
		return false;
	} else {
		$("#consult_experience").css("border", "1px solid #3BB9FF");
		$("addCnsltError").html("");
		$("consult_error").html("");
		return true;
	}
}

function workingCountryValidate() {
	$("successMessage").html("");
	var working = document.getElementById("consult_wcountry").value;
	if (working == "" || working == null) {
		$("addCnsltError")
				.html(
						" <font color=#FF4D4D>Working Country field is Required</font>.");
		$("consult_error")
				.html(
						" <font color=#FF4D4D>Working Country field is Required</font>.");
		$("#consult_wcountry").css("border", "1px solid red");
		return false;
	} else {
		$("#consult_wcountry").css("border", "1px solid #3BB9FF");
		$("addCnsltError").html("");
		$("consult_error").html("");
		return true;
	}
}

function industryValidate() {
	$("successMessage").html("");
	var industry = document.getElementById("consult_industry").value;
	if (industry == "" || industry == null) {
		$("addCnsltError").html(
				" <font color=#FF4D4D>Industry field is Required</font>.");
		$("consult_error").html(
				" <font color=#FF4D4D>Industry field is Required</font>.");
		$("#consult_industry").css("border", "1px solid red");
		return false;
	} else {
		$("#consult_industry").css("border", "1px solid #3BB9FF");
		$("addCnsltError").html("");
		$("consult_error").html("");
		return true;
	}
}

function orgValidate() {
	var org = document.getElementById("consult_organization").value;
	if (org == "" || org == null) {
		$("addCnsltError").html(
				" <font color=#FF4D4D>Organization field is Required</font>.");
		$("#consult_organization").css("border", "1px solid red");
		return false;
	} else {
		$("#consult_organization").css("border", "1px solid #3BB9FF");
		$("addCnsltError").html("");
		return true;
	}
}

function pCAddressValidation() {
	var caddress = document.getElementById("consult_CAddress").value;
	if (caddress == "" || caddress == null) {
		$("addCnsltError").html(
				" <font color=#FF4D4D>Address field is Required</font>.");
		// $("#consult_CAddress").css("border", "1px solid red");
		return false;
	} else {
		$("#consult_CAddress").css("border", "1px solid #3BB9FF");
		$("addCnsltError").html("");
		return true;
	}
}

function pCCityValidation() {
	var ccity = document.getElementById("consult_CCity").value;
	if (ccity == "" || ccity == null) {
		$("addCnsltError").html(
				" <font color=#FF4D4D>City field is Required</font>.");
		$("consult_error").html(
				" <font color=#FF4D4D>City field is Required</font>.");
		$("#consult_CCity").css("border", "1px solid red");
		return false;
	} else {
		$("#consult_CCity").css("border", "1px solid #3BB9FF");
		$("addCnsltError").html("");
		$("consult_error").html("");
		return true;
	}
}

function pCZipValidation() {
	var czip = document.getElementById("consult_CZip").value;
	if (czip == "" || status == czip) {
		$("addCnsltError").html(
				" <font color=#FF4D4D>Zip field is Required</font>.");
		// $("#consult_CZip").css("border", "1px solid red");
		return false;
	} else {
		$("#consult_CZip").css("border", "1px solid #3BB9FF");
		$("addCnsltError").html("");
		return true;
	}
}

function pPhoneValidation() {
	var mobnumber = document.getElementById("consult_Phone").value;
	// alert(mobnumber);
	var mlen = mobnumber.length;
	// alert("hi"+mlen);
	if (mlen < 14) {
		$("addCnsltError").html(
				" <font color=#FF4D4D>Phone field is Required</font>.");
		$("#consult_Phone").css("border", "1px solid red");
		// alert("1");
		return false;
	} else if (mlen < 14) {
		$("addCnsltError").html(
				" <font color=#FF4D4D>Field is must be valid</font>.");
		$("#consult_Phone").css("border", "1px solid red");
		// alert("2");
		return false;
	}

	else {
		$("#consult_Phone").css("border", "1px solid #3BB9FF");
		$("addCnsltError").html("");
		// alert("3");
		return true;
	}

}

function pCPhoneValidation() {
	var mobnumber = document.getElementById("consult_CPhone").value;
	// alert(mobnumber);
	var mlen = mobnumber.length;
	// alert("hi"+mlen);
	if (mlen < 14) {
		$("addCnsltError").html(
				" <font color=#FF4D4D>Phone field is Required</font>.");
		$("#consult_CPhone").css("border", "1px solid red");
		// alert("1");
		return false;
	} else if (mlen < 14) {
		$("addCnsltError").html(
				" <font color=#FF4D4D>Field must be valid</font>.");
		$("#consult_CPhone").css("border", "1px solid red");
		// alert("2");
		return false;
	}

	else {
		$("#consult_CPhone").css("border", "1px solid #3BB9FF");
		$("addCnsltError").html("");
		// alert("3");
		return true;
	}

}

function wphoneValidate() {
	var mobnumber = document.getElementById("consult_workPhone").value;
	// alert(mobnumber);
	var mlen = mobnumber.length;
	// alert("hi"+mlen);
	if (mlen < 14) {
		$("addCnsltError").html(
				" <font color=#FF4D4D>work Phone field is Required</font>.");
		$("#consult_workPhone").css("border", "1px solid red");
		// alert("1");
		return false;
	} else if (mlen < 14) {
		$("addCnsltError").html(
				" <font color=#FF4D4D>Field  must be valid</font>.");
		$("#consult_workPhone").css("border", "1px solid red");
		// alert("2");
		return false;
	}

	else {
		$("#consult_workPhone").css("border", "1px solid #3BB9FF");
		$("addCnsltError").html("");
		// alert("3");
		return true;
	}

}

function preState() {
	var org = document.getElementById("consult_preferredState").value;
	$("#consult_preferredState").css("border", "1px solid #3BB9FF");
	$("addCnsltError").html("");
	return true;
}

function salValidate() {
	var sal = document.getElementById("consult_salary").value;
	if (sal == "" || sal == null) {
		$("addCnsltError").html(
				" <font color=#FF4D4D>Salary field is Required</font>.");
		$("#consult_salary").css("border", "1px solid red");
		return false;
	} else {
		$("#consult_salary").css("border", "1px solid #3BB9FF");
		$("addCnsltError").html("");
		return true;
	}
}

function availableValidate() {
	var avail = document.getElementById("consult_add_date").value;
	if (avail == 1) {
		$("addCnsltError").html(
				" <font color= #FF4D4D>Available field is Required</font>.");
		$("#consult_add_date").css("border", "1px solid red");

		return false;
	} else {
		$("#consult_add_date").css("border", "1px solid #3BB9FF");
		$("addCnsltError").html("");
		return true;
	}
}

function dobValidate() {
	var dob = document.getElementById("consult_dob").value;
	// alert("hi");
	// alert(dob.length);
	if (dob == 1) {
		$("addCnsltError").html(
				" <font color= #FF4D4D>DOB field is Required</font>.");
		$("#consult_dob").css("border", "1px solid red");

		return false;
	} else {
		$("#consult_dob").css("border", "1px solid #3BB9FF");
		$("addCnsltError").html("");
		return true;
	}
}

function showAttachmentDetails(consult_id) {

	//alert("in Ajax call ");
	$("#loadingConsultantResumes").show();

	var url = '../consultant/getConsultantAttachments.action?consult_id='
			+ consult_id;
	//alert(url);
	var req = initRequest(url);
	

	req.onreadystatechange = function() {
		if (req.readyState == 4) {
			if (req.status == 200) {
				$("#loadingConsultantResumes").hide();
				// alert("in response");
				populateAttachmentTable(req.responseText);

			}
		}
	};
	req.open("GET", url, "true");
	req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	req.send(null);
}

function populateAttachmentTable(response) {
	// alert(response);
	var attachmentList = response.split("^");

	var table = document.getElementById("consult-attach_pagenav");
	for (var i = table.rows.length - 1; i > 0; i--) {
		// alert("in response table"+i);

		table.deleteRow(i);
	}

	// alert("in response table"+attachmentList.length);

	for (var i = 0; i < attachmentList.length - 1; i++) {

		// alert("in response table"+attachmentList.length);

		var Values = attachmentList[i].split("|");
		{
			var attach_row = $("<tr/>");
			$("#consult-attach_pagenav").append(attach_row); // this will
			// append tr
			// element to
			// table... keep
			// its reference
			// for a while
			// since we will
			// add cels into
			// it
			attach_row.append($('<td>' + Values[0] + "</td>"));
			attach_row.append($("<td>" + Values[6] + "</td>"));

			if (Values[1] == 'CV') {
				attach_row.append($("<td>Resume</td>"));
			} else if (Values[1] == 'VS') {
				attach_row.append($("<td>Visa</td>"));
			} else if (Values[1] == 'PP') {
				attach_row.append($("<td>Passport</td>"));
			} else if (Values[1] == 'DL') {
				attach_row.append($("<td>Driving License</td>"));
			} else if (Values[1] == 'OT') {
				attach_row.append($("<td>Other</td>"));
			} else if (Values[1] == 'CSA') {
				attach_row.append($("<td>CSA</td>"));
			}
			;

			// attach_row.append($('<td>' + Values[1] + "</td>"));
			// attach_row.append($("<td>" + Values[2] + "</td>"));
			attach_row.append($("<td>" + Values[3] + "</td>"));
			attach_row
					.append($("<td><figcaption><button type='button' id='id' value="
							+ Values[4]
							+ " onclick=downloadCons_attachment("
							+ Values[4]
							+ ")><i class='fa fa-download' ></i></button></figcaption></td>"));
			attach_row.append($("<td>" + Values[5] + "</td>"));
		}
	}

	$('#consult-attach_pagenav').tablePaginate({
		navigateType : 'navigator'
	}, recordPage);
	cpager.init();

}
function downloadCons_attachment(acc_attachment_id)
{
   
    $.ajax({
        url:CONTENXT_PATH + "/recruitment/consultant/checkResumeExistOrNot.action?acc_attachment_id="+acc_attachment_id,//
        context: document.body,
        success: function(responseText) {
        	
        	if(responseText=='Existed')
        		 window.location = '../consultant/consultDownloadAttachment.action?acc_attachment_id='+acc_attachment_id;
        	else
        		alert("File not found");
        	
        	
                 
        }, 
        error: function(e){
            // document.getElementById("loadingMessage").style.display = 'none';
            alert("error-->"+e);
        }
    });
    
    
}
function doConsultAttachmentDownload(acc_attachment_id) {

	$("#resume").html("");
	var consult_id = $("#consult_id").val();
	var consultFlag = $("#consultFlag").val();
	var consultantFlag = $("#consultantFlag").val();
	// alert(consultFlag);
	if (consultFlag == 'customer') {

		window.location = '../consultant/downloadConsultantAttachedDocument.action?acc_attachment_id='
				+ acc_attachment_id
				+ '&consult_id='
				+ consult_id
				+ '&consultFlag='
				+ consultFlag
				+ '&consultantFlag='
				+ consultantFlag;

	} else {
		window.location = '../consultant/downloadConsultantAttachment.action?acc_attachment_id='
				+ acc_attachment_id
				+ '&consult_id='
				+ consult_id
				+ '&consultFlag='
				+ consultFlag
				+ '&consultantFlag='
				+ consultantFlag;
	}
	// window.location =
	// '../consultant/downloadConsultantAttachment.action?acc_attachment_id='+acc_attachment_id+'&consult_id='+consult_id+'&consultFlag='+consultFlag;
}
function consultAttachmentDownload() {

	$("#resume").html("");
	var acc_attachment_id = $("#acc_attachment_id").val();
	var consult_id = $("#consult_id").val();
	var consultFlag = $("#consultFlag").val();
	var requirementId = $("#requirementId").val();
	var jdId = $("#jdId").val();
	var accountSearchID = $("#accountSearchID").val();
	var techReviewFlag = $("#techReviewFlag").val();
	var customerFlag = $("#customerFlag").val();
	var vendor = $("#vendor").val();
	var consult_salary = $("#consultantExpected").val();
	var vendorcomments = $("#vendorcomments").val();
	// alert("requirementId-->"+requirementId+"jdId-->"+jdId+"accountSearchID-->"+accountSearchID);
	// alert(consult_salary);
	if (consultFlag == 'customer') {
		if (customerFlag == 'customer') {
			window.location = '../consultant/downloadConsultantAttachedDocument.action?acc_attachment_id='
					+ acc_attachment_id
					+ '&consult_id='
					+ consult_id
					+ '&consultFlag='
					+ consultFlag
					+ '&requirementId='
					+ requirementId
					+ '&accountSearchID='
					+ accountSearchID
					+ '&jdId='
					+ jdId
					+ '&techReviewFlag='
					+ techReviewFlag
					+ '&consult_salary='
					+ consult_salary
					+ '&vendorcomments='
					+ vendorcomments;
		} else {
			window.location = '../consultant/downloadConsultantAttachedDocument.action?acc_attachment_id='
					+ acc_attachment_id
					+ '&consult_id='
					+ consult_id
					+ '&consultFlag='
					+ consultFlag
					+ '&requirementId='
					+ requirementId
					+ '&accountSearchID='
					+ accountSearchID
					+ '&jdId='
					+ jdId
					+ '&techReviewFlag='
					+ techReviewFlag
					+ '&vendor='
					+ vendor
					+ '&consult_salary='
					+ consult_salary
					+ '&vendorcomments=' + vendorcomments;
		}
	} else {
		window.location = '../consultant/downloadConsultantAttachment.action?acc_attachment_id='
				+ acc_attachment_id
				+ '&consult_id='
				+ consult_id
				+ '&consultFlag='
				+ consultFlag
				+ '&requirementId='
				+ requirementId
				+ '&accountSearchID='
				+ accountSearchID
				+ '&jdId='
				+ jdId
				+ '&techReviewFlag='
				+ techReviewFlag
				+ '&consult_salary='
				+ consult_salary
				+ '&vendorcomments='
				+ vendorcomments;
	}
}
$(document).ready(function() {

	$('#addAttach_popup').popup();
});
// Add By Aklakh
function saveConsultantLoginDetails(id) {
	// alert(id);
	var url = CONTENXT_PATH
			+ '/recruitment/consultant/consultantLoginDetails.action?consult_id='
			+ id;
	// alert(url)
	var req = initRequest(url);
	req.onreadystatechange = function() {
		if (req.readyState == 4) {
			if (req.status == 200) {
				document.getElementById("responseMessage").innerHTML = req.responseText;
			} else {
				// alert("Error occured");
			}
		}
	};
	req.open("GET", url, "true");
	req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	req.send(null);
	return false;
}
function cheadingMessage(message) {
	// alert(message.id);
	if (message.id == "c_details") {
		document.getElementById("headingmessage").innerHTML = "Consultant Details";
		document.getElementById('Consultant').className = 'tab-pane fade in active ';
		document.getElementById('consultantLi').className = 'tab-pane fade in ';
	}
	if (message.id == "c_skill") {
		document.getElementById("headingmessage").innerHTML = "Skill Information";
	}
	if (message.id == "c_security") {
		document.getElementById("headingmessage").innerHTML = "Confidential Information";
	}
	if (message.id == "c_activities") {
		document.getElementById("headingmessage").innerHTML = "Activities";
	}
	if (message.id == "c_attach") {
		document.getElementById("headingmessage").innerHTML = "Attachments";
	}
	if (message.id == "c_personal") {
		document.getElementById("headingmessage").innerHTML = "Personal Details";
	}
	if (message.id == "c_notes") {
		document.getElementById("headingmessage").innerHTML = "Notes";
	}
	if (message.id == "c_tech-review") {
		document.getElementById("headingmessage").innerHTML = "Tech Review";
	}
}

function removedCheckedAddress() {

	if (document.getElementById("consult_checkAddress").checked == true) {
		document.getElementById("consult_checkAddress").checked = false;
		document.getElementById("consult_CAddress").disabled = false;
		document.getElementById("consult_CAddress2").disabled = false;
		document.getElementById("consult_CCity").disabled = false;
		document.getElementById("consult_CCountry").disabled = false;
		document.getElementById("consult_CState").disabled = false;
		document.getElementById("consult_CZip").disabled = false;
		document.getElementById("consult_CPhone").disabled = false;
	}
}
function disableCurrentAddress() {
	if (document.getElementById("addconsult_checkAddress").checked == true) {
		document.getElementById("addconsult_checkAddress").checked = false;
		document.getElementById("consult_CAddress").disabled = false;
		document.getElementById("consult_CAddress2").disabled = false;
		document.getElementById("consult_CCity").disabled = false;
		document.getElementById("consult_CCountry").disabled = false;
		document.getElementById("consult_CState").disabled = false;
		document.getElementById("consult_CZip").disabled = false;
		document.getElementById("consult_CPhone").disabled = false;
		document.getElementById("consult_CAddress").value = '';
		document.getElementById("consult_CAddress2").value = '';
		document.getElementById("consult_CCity").value = '';
		document.getElementById("consult_CCountry").value = '';
		document.getElementById("consult_CState").value = '';
		document.getElementById("consult_CZip").value = '';

	}
}

function consultValidAlterEmail() {

	var email = document.getElementById("consult_alterEmail").value;
	re = /^[^@]+@[^@]+\.[a-zA-Z]{2,}$/;
	re = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	if (email == "") {
		$("addCnsltError").html("");
		$("consult_error").html("");
		$("#consult_alterEmail").css("border", "");
	} else if (!re.test(email)) {

		$("addCnsltError").html(
				" <font color='red'>Please enter valid Email</font>");
		$("consult_error").html(
				" <font color='red'>Please enter valid Email</font>");
		$("#consult_alterEmail").css("border", "1px solid red");
	} else {
		$("consult_error").html("");
		$("addCnsltError").html("");
		$("#consult_alterEmail").css("border", "1px solid green");
	}

}
// Add by Aklakh

function consultantSkillSetOverlay(response) {
	document.getElementById("consultantSkillSetDetails").value = response;
	var specialBox = document.getElementById("consultantSkillSetBox");
	if (specialBox.style.display == "block") {
		specialBox.style.display = "none";

	} else {
		specialBox.style.display = "block";
	}
	$('#consultantSkillOverlay_popup').popup();
}
function consultantSkillOverlayClose() {
	var specialBox = document.getElementById('consultantSkillSetBox');
	if (specialBox.style.display == "block") {
		specialBox.style.display = "none";
	} else {
		specialBox.style.display = "block";
	}
	// Initialize the plugin
	$('#consultantSkillOverlay_popup').popup();
}
function resumeValidation() {
	var FileUploadPath = document.getElementById('file').value;
//alert("file upload");
	// To check if user upload any file
	if (FileUploadPath == '') {

		$("#addCnsltError").html(
				" <font color='red'>Please upload a file</font>");
		return false;
	} else {
		var Extension = FileUploadPath.substring(
				FileUploadPath.lastIndexOf('.') + 1).toLowerCase();
		//alert(Extension);

		if (Extension == "pdf" || Extension == "doc" || Extension == "docx") {
			$("#addCnsltError").html(" ");
			return true;
		} else {
			document.getElementById('file').value = '';
			$("#addCnsltError")
					.html(
							" <font color='red'> Allows only doc,docx type or pdf.</font>");
			return false;
		}
	}
}

function editResumeValidation() {
	var FileUploadPath = document.getElementById('consultAttachment').value;

	// To check if user upload any file
	if (FileUploadPath == '') {

		$("#message").html(" <font color='red'>Please upload a file</font>");
		return false;
	} else {
		var Extension = FileUploadPath.substring(
				FileUploadPath.lastIndexOf('.') + 1).toLowerCase();

		if (Extension == "pdf" || Extension == "doc" || Extension == "docx") {
			$("#message").html(" ");
			return true;
		} else {
			$("#message")
					.html(
							"<font color='red'> Allows only doc ,docx or pdf type.</font>");
			return false;
		}
	}
}
function doResumeDownlaod(acc_attachment_id) {
	// alert("hello")
	window.location = "recruitment/consultantLogin/doResumeDownload.action?acc_attachment_id="
			+ acc_attachment_id;

}
// for skill validation
function skillValidation() {

	// alert("12")
	var consult_skill = document.getElementById("consult_skill").value;

	if (consult_skill == "" || consult_skill == null) {
		$("addCnsltError").html(
				" <font color='red'>Skills field is required</font>");
		$("consult_error").html(
				"<font color='red'>Skills field is required</font>");
		$("#consult_skill").css("border", "1px solid red");
	}

	else {
		$("#consult_skill").css("border", "1px solid green");
		$("addCnsltError").html("");
		$("consult_error").html("");

	}
}

function StateChangeValidation() {
	// alert("Consultant ajax");

	var consult_State = document.getElementById('consult_State').value;
	if (consult_State == "") {
		// alert("hi");
		$("pstate_error")
				.html(
						" <font color=#FF4D4D>Permanent state field is Required</font>.");
		$("#consult_State").css("border", "1px solid red");
	} else {
		// alert("hello");
		$("#consult_State").css("border", "1px solid green");
		$("pstate_error").html("");
	}

}
function CurrentStateChangeValidation() {
	// alert("Consultant ajax");

	var consult_State = document.getElementById('consult_CState').value;
	if (consult_State == "") {
		// alert("hi");
		$("addCnsltError").html(
				" <font color=#FF4D4D>Current state field is Required</font>.");
		$("consult_error").html(
				" <font color=#FF4D4D>Current state field is Required</font>.");
		$("#consult_CState").css("border", "1px solid red");

	} else {
		// alert("hello");
		$("#consult_CState").css("border", "1px solid green");
		$("addCnsltError").html("");
		$("consult_error").html("");
	}

}
// To check the character length of skills text area add by Aklakh
function checkCharactersSkills(id) {
	$(id)
			.keyup(
					function() {
						el = $(this);
						if (el.val().length >= 100) {
							el.val(el.val().substr(0, 100));
						} else {
							$("#skills_feedback").text(
									100 - el.val().length
											+ ' Characters remaining . ');
						}
						if (el.val().length == 100) {
							$("#skills_feedback")
									.text(
											' Cannot enter  more than 100 Characters .');
						}

					})
	return false;
}
function consultantDateRepository(id) {
	$(id).val(" ");
	return false;
}

// function to get the state of in addConsultant page add by Kamesh
function AddConsultantStateChange() {
	// alert("Consultant ajax");
	var id = document.getElementById('consult_pcountry').value;
	var regionId = document.getElementById('consult_preferredRegion').value;
	if (id == -1) {
		$("addCnsltError")
				.html(
						" <font color=#FF4D4D>Preffered country field is Required</font>.");
		$("#consult_pcountry").css("border", "1px solid red");
	} else {

		$("#consult_pcountry").css("border", "1px solid green");
		$("addCnsltError").html("");
	}
	if (id == 3) {
		$("#consult_preferredRegion").show();
		$(".pref_region").show();

	} else {
		$("#consult_preferredRegion").hide();
		$(".pref_region").hide();
		$("#consult_preferredRegion").val('-1');
	}

	if (regionId == -1) {
		$("addCnsltError")
				.html(
						" <font color=#FF4D4D>Preffered Region field is Required</font>.");
		$("#consult_preferredRegion").css("border", "1px solid red");
	} else {
		$("#consult_preferredRegion").css("border", "1px solid green");
		$("addCnsltError").html("");
	}
	if ($("div").is("#consult_preferredState")) {
		$("#consult_preferredState").remove();
		$(".pref_state")
				.after(
						'<select id="consult_preferredState" class=" " onchange="preState()" onclick="" multiple="multiple" tabindex="10" name="consult_preferredState "><option value="-1">Select preferred state</option></select>');
	}
	var url = CONTENXT_PATH
			+ '/recruitment/consultant/getStateBasedOnRegion.action?id=' + id
			+ '&regionId=' + regionId;
	var req = initRequest(url);
	req.onreadystatechange = function() {
		if (req.readyState == 4 && req.status == 200) {
			AddConsultantStateChanging(req.responseText);
			document.getElementById("consult_preferredState").disabled = false;
		}
	};
	req.open("GET", url, "true");
	req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	req.send(null);
}

// function to set the state of in addConsultant page add by
function AddConsultantStateChanging(data) {
	// alert(data);
	var topicId = document.getElementById("consult_preferredState");
	var flag = data.split("FLAG");
	var addList = flag[0].split("^");
	var $select = $('#consult_preferredState');
	$select.find('option').remove();
	for (var i = 0; i < addList.length - 1; i++) {
		var Values = addList[i].split("#");
		{
			$('<option>').val(Values[0]).text(Values[1]).appendTo($select);
		}
	}

	$('#consult_preferredState').selectivity({
		multiple : true,
		placeholder : 'Type to search States'

	});
	$("#consult_preferredState").show();
	$(".pref_state").show();

}

// function for change the prefrred state in edit consultant page
function AddConsultantEditPreferredStateChange() {
	// alert("Consultant ajax");
	document.getElementById("consult_preferredState").disabled = false;
	var id = document.getElementById('consult_preferredCountry').value;
	var regionId = document.getElementById('consult_preferredRegion').value
	if ($("div").is("#consult_preferredState")) {
		$("#consult_preferredState").remove();
		$(".pref_state")
				.after(
						'<select id="consult_preferredState" class=" " onchange="preState()" onclick="" multiple="multiple" tabindex="10" name="consult_preferredState "><option value="-1">Select preferred state</option></select>');
	}
	// alert(id);
	var url = CONTENXT_PATH
			+ '/recruitment/consultant/getStateBasedOnRegion.action?id=' + id
			+ '&regionId=' + regionId;
	// alert(url);
	var req = initRequest(url);
	req.onreadystatechange = function() {
		if (req.readyState == 4 && req.status == 200) {
			// alert(req.responseText);

			AddpreferredState(req.responseText);
		}
	};
	req.open("GET", url, "true");
	req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	req.send(null);
}
function AddpreferredState(data) {
	// alert(data);
	var topicId = document.getElementById("consult_preferredState");
	var flag = data.split("FLAG");
	var addList = flag[0].split("^");
	var $select = $('#consult_preferredState');
	$select.find('option').remove();
	for (var i = 0; i < addList.length - 1; i++) {
		var Values = addList[i].split("#");
		{

			$('<option>').val(Values[0]).text(Values[1]).appendTo($select);
		}
	}
	$('#consult_preferredState').selectivity({
		multiple : true,
		placeholder : 'Type to search Categories'

	});
	$("#consult_preferredState").show();
	$(".pref_state").show();
}

function getEmpRecruitment() {

	// alert(requirementId)
	var url;

	var v_empName = (document).getElementById('enameForRecruitment').value;
	// var v_empName=id.value;
	// alert("---"+id.valueOf());
	if (v_empName == "") {
		clearTable();
	} else {

		// alert("Empname->"+v_empName+"--len-->"+v_empName.length);

		if (v_empName.length >= 1) {
			// if(interview=="I"){
			// url=CONTENXT_PATH+"/getEmployeeDetails.action?empName="+v_empName+'&techReview=TR&requirementId='+requirementId;
			// alert(url)
			// }
			// else{

			url = CONTENXT_PATH + "/getEmpRecruitment.action?empName="
					+ v_empName;
			// alert(url)
			// }
			// alert("url-->"+url);
			var req = initRequest(url);
			req.onreadystatechange = function() {
				if (req.readyState == 4) {
					if (req.status == 200) {
						// alert(v_empName)
						parseEmpForRecruitment(req.responseXML);
					} else if (req.status == 204) {
						clearTable();
					}
				}
			};
			req.open("GET", url, true);
			req.send(null);
		}
	}
}

function parseEmpForRecruitment(responseXML) {
	// alert("hii");
	clearTable();
	// alert("hii");
	var consultants = responseXML.getElementsByTagName("EMPLOYEES")[0];
	// alert(consultants.childNodes.length);
	if (consultants.childNodes.length > 0) {
		completeTable.setAttribute("bordercolor", "black");
		completeTable.setAttribute("border", "0");
	} else {
		clearTable();
	}
	// alert("Hello"+consultants.childNodes.length)

	// alert("Hello")

	var consultant = consultants.childNodes[0];
	var chk = consultant.getElementsByTagName("VALID")[0];
	isExist = chk.childNodes[0].nodeValue;
	if (chk.childNodes[0].nodeValue == "true") {
		var validationMessage = document.getElementById("validationMessage");
		validationMessage.innerHTML = "";
		document.getElementById("menu-popup").style.display = "block";
		for (loop = 0; loop < consultants.childNodes.length; loop++) {
			var consultant = consultants.childNodes[loop];
			var loginId = consultant.getElementsByTagName("EMPID")[0];
			var empName = consultant.getElementsByTagName("NAME")[0];
			// alert(empName.childNodes[0].nodeValue)
			// alert(loginId.childNodes[0].nodeValue)
			// alert("alert alert")
			appendEmpForRecruitment(empName.childNodes[0].nodeValue,
					loginId.childNodes[0].nodeValue);
		}
		var position;
		position = findPosition(document.getElementById("enameForRecruitment"));

		// var position =
		// findPosition(document.getElementById("assignedToUID"));
		posi = position.split(",");
		document.getElementById("menu-popup").style.left = posi[0] + "px";
		document.getElementById("menu-popup").style.top = (parseInt(posi[1]) + 20)
				+ "px";
		document.getElementById("menu-popup").style.display = "block";
	}
	if (chk.childNodes[0].nodeValue == "false") {
		// var validationMessage=document.getElementById("validationMessage");
		// validationMessage.innerHTML = "<font color=red> Employee doesn't
		// Exists </font>";
		$('#validationMessage').html(
				" <font color='red'>Employee doesn't Exists</font>");
		$('#validationMessage').show().delay(2000).fadeOut();
		document.getElementById("enameForRecruitment").value = "";
		// document.getElementById('validationMessage').innerHTML = "<font
		// color=red> Employee doesn't Exists!</font>";
	}
	if (consultants.childNodes.length < 10) {
		// autorow1.style.overflowY = "hidden";
		autorow.style.overflowY = "hidden";
	} else {
		// autorow1.style.overflowY = "scroll";
		autorow.style.overflowY = "scroll";
	}
}

function appendEmpForRecruitment(empName, loginId) {
	// alert("deaswwwasfd")

	var row;
	var nameCell;
	if (!isIE) {
		row = completeTable.insertRow(completeTable.rows.length);
		nameCell = row.insertCell(0);
	} else {
		row = document.createElement("tr");
		nameCell = document.createElement("td");
		row.appendChild(nameCell);
		completeTable.appendChild(row);
	}
	row.className = "popupRow";
	nameCell.setAttribute("bgcolor", "#fff");
	var linkElement = document.createElement("a");
	linkElement.className = "popupItem";

	linkElement.setAttribute("href", "javascript:setEmpRecruitment('" + empName
			+ "','" + loginId + "')");
	linkElement.appendChild(document.createTextNode(empName));
	linkElement["onclick"] = new Function("hideScrollBar()");
	nameCell.appendChild(linkElement);
}

function setEmpRecruitment(empName, loginId) {
	clearTable();
	// alert("in set_cust");
	document.getElementById("enameForRecruitment").value = empName;
	document.getElementById("enameIdForRecruitment").value = loginId;
	// alert(document.getElementById("enameIdForRecruitment").value)
}

function clearTable() {
	// alert("clearTable")
	if (completeTable) {
		completeTable.setAttribute("bordercolor", "white");
		completeTable.setAttribute("border", "0");
		completeTable.style.visible = false;
		var validationMessage = document.getElementById("validationMessage");
		validationMessage.innerHTML = " ";
		for (loop = completeTable.childNodes.length - 1; loop >= 0; loop--) {
			completeTable.removeChild(completeTable.childNodes[loop]);
		}
	}
}

function jumper() {

	$.scrollUp({
		scrollName : 'scrollUp', // Element ID
		scrollDistance : 300, // Distance from top/bottom before showing
		// element (px)
		scrollFrom : 'top', // 'top' or 'bottom'
		scrollSpeed : 300, // Speed back to top (ms)
		easingType : 'linear', // Scroll to top easing (see
		// http://easings.net/)
		animation : 'fade', // Fade, slide, none
		animationSpeed : 200, // Animation in speed (ms)
		scrollTrigger : false, // Set a custom triggering element. Can be an
		// HTML string or jQuery object
		// scrollTarget: false, // Set a custom target element for scrolling to
		// the top
		scrollText : '<i class="fa fa-angle-up"></i>', // Text for element, can
		// contain HTML
		scrollTitle : false, // Set a custom <a> title if required.
		scrollImg : false, // Set true to use image
		activeOverlay : false, // Set CSS color to display scrollUp active
		// point, e.g '#00FFFF'
		zIndex : 2147483647
	// Z-Index for the overlay
	});
};

function conDetailsCustomer() {
	// alert("hello")
	var e = document.getElementById("consultantAvailable");
	var strUser = e.options[e.selectedIndex].text;
	// alert(strUser)
	document.getElementById("consultantAvailableCustomer").innerHTML = strUser;
	if (document.getElementById("addressFlag").value != "emp") {
		// alert(document.getElementById("consultantlCountry").value)
		if (document.getElementById("consultantlCountry").value == "0") {
			document.getElementById("consultantLivingCountry").innerHTML = "--";
		} else {
			var e1 = document.getElementById("consultantlCountry");
			var strUser1 = e1.options[e1.selectedIndex].text;
			// alert(strUser1)
			document.getElementById("consultantLivingCountry").innerHTML = strUser1;
		}
	}

	var e3 = document.getElementById("consultantState");
	var strUser3 = e3.options[e3.selectedIndex].text;
	// alert(strUser)
	document.getElementById("cosultantCountryState").innerHTML = strUser3;
	var e4 = document.getElementById("cosultantCCountry");
	var strUser4 = e4.options[e4.selectedIndex].text;
	// alert(strUser)
	document.getElementById("cosultantCCountryCustomer").innerHTML = strUser4;
	var e5 = document.getElementById("cosultantCState");
	var strUser5 = e5.options[e5.selectedIndex].text;
	// alert(strUser)
	document.getElementById("cosultantCStateCustomer").innerHTML = strUser5;

	var e2 = document.getElementById("consultantCountry2");
	var strUser2 = e2.options[e2.selectedIndex].text;
	// alert(strUser2)
	document.getElementById("cosultantCountryCustomer").innerHTML = strUser2;
}

function consultantVisaValidation() {
	var FileUploadPath = document.getElementById('visaAttachment').value;

	// To check if user upload any file
	if (FileUploadPath == '') {

		$("addCnsltError").html(
				" <font color='red'>Please upload a file</font>");
		return false;
	} else {
		var Extension = FileUploadPath.substring(
				FileUploadPath.lastIndexOf('.') + 1).toLowerCase();

		if (Extension == "pdf" || Extension == "doc" || Extension == "docx") {
			$("addCnsltError").html(" ");
			return true;
		} else {
			$("addCnsltError")
					.html(
							" <font color='red'> Allows only doc,docx type or pdf.</font>");
			return false;
		}
	}
}
function openDialogforVisaAttachment() {

	document.getElementById('file').value = "";
	$("#message").html("");
	var specialBox = document.getElementById('visaAttachOverlay');
	if (specialBox.style.display == "block") {
		specialBox.style.display = "none";
	} else {
		specialBox.style.display = "block";
	}
	// Initialize the plugin
	$('#consultVisaAttachment_popup').popup();

}

function visaAttachOverlayClose() {

	// alert(document.getElementById('file').value)
	var specialBox = document.getElementById('visaAttachOverlay');
	if (specialBox.style.display == "block") {
		specialBox.style.display = "none";
	} else {
		specialBox.style.display = "block";
	}
	// Initialize the plugin
	$('#consultVisaAttachment_popup').popup();
	// getConsultantList();
}
function teAttachemntUpload() {

	var consultantId = $('#consultantId').val();

	// alert(consultantId);
	var filePath = document.getElementById('file').value;

	// if(imagePath == null || (imagePath =="")){
	// document.getElementById('message').innerHTML = "<font color=red>please
	// upload file</font>"
	// return false;
	// }

	// document.getElementById("load").style.display = 'block';
	if (filePath != "") {
		$
				.ajaxFileUpload({
					url : 'visaAttachemntUpload.action?consultantId='
							+ consultantId, //
					secureuri : false, // false
					fileElementId : 'file', // id <input type="file" id="file"
					// name="file" />
					dataType : 'json', // json
					success : function(data, status) {

						var displaymessage = "<font color=red>Please try again later</font>";

						if (data.indexOf("uploaded") > 0) {
							displaymessage = "<font color=green>Attachment uploaded Successfully.</font>";
							document.getElementById('proofdownloadDiv').style.display = "block";
							document.getElementById('proofuploadDiv').style.display = "none";
							document.getElementById('consultantIdProofAttach').value = "consultantIdProofAttach";
						}
						if (data.indexOf("Notvalid") > 0) {

							displaymessage = "<font color=red>Not a valid file!,Please check the file and try again.</font>";
						}
						if (data.indexOf("Error") > 0) {

							displaymessage = "<font color=red>Internal Error!, Please try again later.</font>"
						}

						// document.getElementById("load").style.display =
						// 'none';
						document.getElementById('message').innerHTML = displaymessage;// "<font
						// color=green>File
						// uploaded
						// successfully</font>";

					},
					error : function(e) {

						// document.getElementById("load").style.display =
						// 'none';
						document.getElementById('message').innerHTML = "<font color=red>Please try again later</font>";

					}
				});
	} else {
		document.getElementById('message').innerHTML = "<font color=red>Please Browse file</font>";
	}

	// }
	return false;
}

function onloadIdProofDetails() {

	var consultantIdProof = document.getElementById('consultantIdProof').value;

	if (consultantIdProof == "VS") {
		document.getElementById('visaSelectDiv').style.display = "block";
	} else {
		document.getElementById('visaSelectDiv').style.display = "none";
	}
	var consultantIdProofAttach = document
			.getElementById('consultantIdProofAttach').value;
	// alert(consultantIdProofAttach);
	if (consultantIdProofAttach != null && consultantIdProofAttach != "") {
		document.getElementById('proofdownloadDiv').style.display = "block";
	} else {
		if (consultantIdProof == "0") {
			document.getElementById('proofuploadDiv').style.display = "none";
			document.getElementById('proofdownloadDiv').style.display = "none";
		}

	}

}

function getVisaDetails() {
	var consultantId = document.getElementById('consultantId').value;
	// alert(consultantId+"-->consultantId")

	var consultantIdProof = document.getElementById('consultantIdProof').value;

	if (consultantIdProof == "VS") {
		document.getElementById('visaSelectDiv').style.display = "block";
	} else {
		document.getElementById('visaSelectDiv').style.display = "none";
	}
	var consultantIdProofAttach = document
			.getElementById('consultantIdProofAttach').value;
	// alert(consultantIdProofAttach);
	if (consultantIdProofAttach == null || consultantIdProofAttach == "") {
		document.getElementById('proofuploadDiv').style.display = "block";
	}

	if (consultantIdProof == "0") {
		document.getElementById('proofuploadDiv').style.display = "none";
		document.getElementById('proofdownloadDiv').style.display = "none";
	}

	var consultantIdProofhidden = document
			.getElementById('consultantIdProofhidden').value;
	// alert(consultantIdProofhidden);
	if (consultantIdProofAttach != null && consultantIdProofAttach != "") {
		swal(
				{
					title : "You will lose Current ID Proof. Do you want to continue..",
					// text: "Tranfering csr",
					textSize : "170px",
					type : "warning",
					showCancelButton : true,
					confirmButtonColor : "#3498db",
					// cancelButtonColor: "#56a5ec",
					cancelButtonText : "No",
					confirmButtonText : "Yes",
					closeOnConfirm : false,
					closeOnCancel : false

				},
				function(isConfirm) {
					if (isConfirm) {
						var url = 'removeConsultantAttachement.action?consultantId='
								+ consultantId;
						var req = initRequest(url);
						// alert(url);
						req.onreadystatechange = function() {
							if (req.readyState == 4) {
								if (req.status == 200) {
									// alert(req.responseText);
									if (req.responseText == "1") {
										document
												.getElementById('proofuploadDiv').style.display = "none";
										document
												.getElementById('proofdownloadDiv').style.display = "none";
										// document.getElementById('consultantIdProofhidden').value="0";
										document
												.getElementById('consultantIdProof').value = "0";
										document
												.getElementById('visaSelectDiv').style.display = "none";
										document
												.getElementById('consultantIdProofAttach').value = "";
									}
									// document.getElementById("outputMessage").innerHTML=req.responseText;
									swal("Deleted!",
											"Deleted Successfully....",
											"success");
								} else {
									swal("Sorry Not Deleted",
											"Deletion not done ", "error");
								}
							}
						};
						req.open("GET", url, "true");
						req.setRequestHeader("Content-Type",
								"application/x-www-form-urlencoded");
						req.send(null);

					} else {

						swal("Cancelled", "Deleted cancelled ", "error");
						document.getElementById('consultantIdProof').value = consultantIdProofhidden;
						document.getElementById('proofdownloadDiv').style.display = "block";
						if (consultantIdProofhidden == "VS") {
							document.getElementById('visaSelectDiv').style.display = "block";
						} else {
							document.getElementById('visaSelectDiv').style.display = "none";
						}
					}
				});
	}

}

function removeConsultantAttachement() {
	var consultantId = document.getElementById('consultantId').value;
	// alert(consultantId);
	swal(
			{
				title : "You will lose Current ID Proof. Do you want to continue..",
				// text: "Tranfering csr",
				textSize : "170px",
				type : "warning",
				showCancelButton : true,
				confirmButtonColor : "#3498db",
				// cancelButtonColor: "#56a5ec",
				cancelButtonText : "No",
				confirmButtonText : "Yes",
				closeOnConfirm : false,
				closeOnCancel : false

			},
			function(isConfirm) {
				if (isConfirm) {
					var url = 'removeConsultantAttachement.action?consultantId='
							+ consultantId;
					var req = initRequest(url);
					// alert(url);
					req.onreadystatechange = function() {
						if (req.readyState == 4) {
							if (req.status == 200) {
								// alert(req.responseText);
								if (req.responseText == "1") {
									document.getElementById('proofuploadDiv').style.display = "none";
									document.getElementById('proofdownloadDiv').style.display = "none";
									document
											.getElementById('consultantIdProofhidden').value = "0";
									document
											.getElementById('consultantIdProof').value = "0";
									document.getElementById('visaSelectDiv').style.display = "none";
									document
											.getElementById('consultantIdProofAttach').value = "";
								}
								// document.getElementById("outputMessage").innerHTML=req.responseText;
								swal("Deleted!", "Deleted Successfully....",
										"success");
							} else {
								swal("Sorry Not Deleted", "Deletion not done ",
										"error");
							}
						}
					};
					req.open("GET", url, "true");
					req.setRequestHeader("Content-Type",
							"application/x-www-form-urlencoded");
					req.send(null);
				} else {
					swal("Cancelled", "Deleted cancelled ", "error");
				}

			});
}
function displayHide_downloadButtons() {
	var val = document.getElementById("rec_exits").value;
	if (val == "no") {
		$("#downloading_grid").css('display', 'none');
	} else {
		$("#downloading_grid").css('display', '');
	}
}

function idProofFileValidation() {
	document.getElementById('message').innerHTML = '';
	var fullPath = document.getElementById('file').value;

	// alert(fullPath);

	var size = document.getElementById('file').files[0].size;
	var extension = fullPath.substring(fullPath.lastIndexOf('.') + 1);

	if (extension == "pdf" || extension == "doc" || extension == "docx"
			|| extension == "gif" || extension == "jpeg" || extension == "jpg"
			|| extension == "png") {
		var size = document.getElementById('file').files[0].size;

		if (fullPath.length > 50) {
			document.getElementById('file').value = '';
			document.getElementById('message').innerHTML = "<font color=red>File name length must be less than 50 characters!</font>"
			// showAlertModal("File size must be less than 2 MB");
			return (false);
		} else {
			if (parseInt(size) < 2097152) {

			} else {
				document.getElementById('file').value = '';
				document.getElementById('message').innerHTML = "<font color=red>File size must be less than 2 MB.</font>"
				// showAlertModal("File size must be less than 2 MB");
				return (false);
			}
		}
	} else {

		document.getElementById('file').value = "";
		document.getElementById('message').innerHTML = "<font color=red>Invalid file extension!Please select pdf or doc or docx or gif or jpg or png or jpeg file.</font>"
		return false;
	}
}
function downloadPDFConsultantList() {
	var gridDownload = document.getElementById('gridDownload').value;
	var url = "../../recruitment/consultant/downloadResults.action?pdfHeaderName=Consultant List&gridDownload="
			+ gridDownload + "&gridDownloadFlag=Con";
	// alert(url);
	window.location = url;
}

function CommentsCheckCharacters(id) {

	$(id)
			.keyup(
					function() {
						el = $(this);
						if (el.val().length >= 500) {
							el.val(el.val().substr(0, 500));
						} else {
							$("#commentscharNum").text(
									500 - el.val().length
											+ ' Characters remaining . ');
						}
						if (el.val().length == 500) {
							$("#commentscharNum")
									.text(
											' Cannot enter  more than 500 Characters .');
						}

					})
	return false;
};

function resumeAddValidation() {
	document.getElementById('message').innerHTML = '';
	var fullPath = document.getElementById('consultAttachment').value;

	// alert(fullPath);

	var size = document.getElementById('consultAttachment').files[0].size;
	var extension = fullPath.substring(fullPath.lastIndexOf('.') + 1);
	var leafname = fullPath.split('\\').pop().split('/').pop();
	if (extension == "pdf" || extension == "doc" || extension == "docx") {
		var size = document.getElementById('consultAttachment').files[0].size;

		if (leafname.length > 30) {
			document.getElementById('consultAttachment').value = '';
			document.getElementById('message').innerHTML = "<font color=red>File name length must be less than 30 characters!</font>"
			// showAlertModal("File size must be less than 2 MB");
			return (false);
		} else {
			if (parseInt(size) < 2097152) {

			} else {
				document.getElementById('consultAttachment').value = '';
				document.getElementById('message').innerHTML = "<font color=red>File size must be less than 2 MB.</font>"
				// showAlertModal("File size must be less than 2 MB");
				return (false);
			}
		}
	} else {

		document.getElementById('consultAttachment').value = "";
		document.getElementById('message').innerHTML = "<font color=red>Invalid file extension!Please select pdf or doc or docx  file.</font>"
		return false;
	}
}

function AddConsultantSkillChange() {

	var priSkillId = document.getElementById('primarySkillValue').value;
	// var skillId= document.getElementById('skillCategoryValue').value;
	// alert("priSkillId----->"+priSkillId)

	if ($("div").is("#skillCategoryValue")) {
		$("#skillCategoryValue").remove();
		$(".skills")
				.after(
						'<select id="skillCategoryValue" class=" "  onclick="" multiple="multiple" tabindex="10" name="skillCategoryValue "><option value="-1">Select Skills</option></select>');
	}
	var url = CONTENXT_PATH
			+ '/recruitment/consultant/getSkillsBasedOnPrimarySkill.action?priSkillId='
			+ priSkillId;
	// alert("url--->"+url)
	var req = initRequest(url);
	req.onreadystatechange = function() {
		if (req.readyState == 4 && req.status == 200) {
			AddConsultantSkillsChanging(req.responseText);
			// document.getElementById("skillCategoryValue").disabled = false;
		}
	};
	req.open("GET", url, "true");
	req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	req.send(null);
}

function AddConsultantSkillsChanging(data) {
	// alert("response---->"+data);
	// var topicId = document.getElementById("skillCategoryValue");
	var flag = data.split("FLAG");
	var addList = flag[0].split("^");
	var $select = $('#skillCategoryValue');
	$select.find('option').remove();
	for (var i = 0; i < addList.length - 1; i++) {
		var Values = addList[i].split("#");
		{
			$('<option>').val(Values[0]).text(Values[1]).appendTo($select);
		}
	}

	$('#skillCategoryValue').selectivity({
		multiple : true,
		placeholder : 'Type to Search Skills'

	});
	$("#skillCategoryValue").show();
	$(".skills").show();
}

var conLoginRecaptcha;
var conRegRecaptcha;
var conFPassReCaptcha;
var conLoginRecaptchaValue;
var conRegRecaptchaValue;
var conFPassReCaptchaValue;

var conCaptchaCallBack = function() {
	// Render the recaptcha1 on the element with ID "recaptcha1"
	conRegRecaptcha = grecaptcha.render('conRegRecaptcha', {
		'sitekey' : '6LfmzR8UAAAAAJhXhE8Qii1X1kwYz4Oq2nRjj0bI', // Replace this
																// with your
																// Site key
		'theme' : 'light',
		'callback' : correctCaptcha_consultantReg
	});
	conLoginRecaptcha = grecaptcha.render('conLoginRecaptcha', {
		'sitekey' : '6LfmzR8UAAAAAJhXhE8Qii1X1kwYz4Oq2nRjj0bI', // Replace this
																// with your
																// Site key
		'theme' : 'light',
		'callback' : correctCaptcha_consultantLogin
	});
	conFPassReCaptcha = grecaptcha.render('conFPassReCaptcha', {
		'sitekey' : '6LfmzR8UAAAAAJhXhE8Qii1X1kwYz4Oq2nRjj0bI', // Replace this
																// with your
																// Site key
		'theme' : 'light',
		'callback' : correctCaptcha_conFPass
	});

};

var correctCaptcha_consultantReg = function(response) {
	conRegRecaptchaValue = response;
};
var correctCaptcha_consultantLogin = function(response) {
	conLoginRecaptchaValue = response;
};

var correctCaptcha_conFPass = function(response) {
	conFPassReCaptchaValue = response;
};
function conLoginRecaptchaValidation() {
	var response = false;
	var captchaValue = null;
	captchaValue = conLoginRecaptchaValue;
	response = captchaValidation(captchaValue);

	if (response === false) {
		$("#conLoginRecaptchaSpan").html(
				"<font color=red><br>Invalid captcha..</font>");
		setTimeout(function() {
			$("#conLoginRecaptchaSpan").children().remove();
		}, 3000);

	}
	return response;

}
function conRegRecaptchaValidation() {
	//alert("captcha validation");
	var response = false;
	var captchaValue = null;
	captchaValue = conRegRecaptchaValue;
	response = captchaValidation(captchaValue);

	if (response === false) {
		$("#conRegRecaptchaSpan").html(
				"<font color=red><br>Invalid captcha..</font>");
		setTimeout(function() {
			$("#conRegRecaptchaSpan").children().remove();
		}, 3000);

	}
	return response;

}
function conFPassRecaptchaValidation() {
	var response = false;
	var captchaValue = null;
	captchaValue = conFPassReCaptchaValue;
	response = captchaValidation(captchaValue);

	if (response === false) {
		$("#conFPassRecaptchaSpan").html(
				"<font color=red><br>Invalid captcha..</font>");
		setTimeout(function() {
			$("#conFPassRecaptchaSpan").children().remove();
		}, 3000);

	}
	return response;

}

function consultantValidation() {

	// alert("hello");

	/*
	 * var selectedSkillsArry = []; $("#skillCategoryValue
	 * :selected").each(function() { selectedSkillsArry.push($(this).val()); });
	 * 
	 * document.getElementById('consultantSecondarySkills').value=selectedSkillsArry;
	 */
	var consultantFirstName = $("#consultantFirstName").val();
	var consultantLastName = $("#consultantLastName").val();
	var consultantEmail = $("#consultantEmail").val();
	var consultantMobile = $("#consultantMobile").val();
	/*
	 * var consult_dob = $("#consult_dob").val(); var title = $("#title").val();
	 */
	var consultantExperience = $("#consultantExperience").val();
	var consultantWorkingCountry = $("#consultantWorkingCountry").val();
	/*
	 * var consultantIndustry = $("#consultantIndustry").val(); var
	 * primarySkillValue = $("#primarySkillValue").val(); var consultantSkills =
	 * $("#consultantSecondarySkills").val();
	 */// alert("consultantSkills--in
	// consultantValidation()->"+consultantSkills)
	var FileUploadPath = $("#file").val();
	// var captcha=$("#txtCaptchaInput").val();

	/*
	 * var consultantPerAddress1 = $("#consultantPerAddress1").val(); var
	 * consultantPerCity = $("#consultantPerCity").val(); var
	 * consultantPerCountry = $("#consultantPerCountry").val(); var
	 * consultantPerState = $("#consultantPerState").val(); var
	 * consultantCurAddress1 = $("#consultantCurAddress1").val(); var
	 * consultantCurCity = $("#consultantCurCity").val(); var
	 * consultantCurCountry = $("#consultantCurCountry").val(); var
	 * consultantCurState = $("#consultantCurState").val();
	 */
	if (consultantFirstName == "") {

		$("#consultantFirstNamespan").html(
				"<font color='red'>Enter First Name</font>");
		$("#consultantFirstName").css("border", "1px solid red");
		return false;
	}

	if (consultantLastName == "") {

		$("#consultantLastNamespan").html(
				"<font color='red'>Enter Last Name</font>");
		$("#consultantLastName").css("border", "1px solid red");
		return false;
	}

	if (consultantEmail == "") {

		$("#consultantEmailspan").html(
				"<font color='red'>Enter Email Id</font>");
		$("#consultantEmail").css("border", "1px solid red");
		return false;
	}

	if (consultantMobile == "") {

		$("#consultantMobilespan").html(
				"<font color='red'>Enter Mobile Number</font>");
		$("#consultantMobile").css("border", "1px solid red");
		return false;
	}
	//
	if (FileUploadPath == "") {

		$("#addCnsltError").html(
				"<font color='red'>Please Upload Resume</font>");
		$("#file").css("border", "1px solid red");
		return false;
	}
	 else {
			var Extension = FileUploadPath.substring(
					FileUploadPath.lastIndexOf('.') + 1).toLowerCase();
			//alert(Extension);

			if (Extension == "pdf" || Extension == "doc" || Extension == "docx") {
				$("#addCnsltError").html(" ");
				return true;
			} else {
				document.getElementById('file').value = '';
				$("#addCnsltError")
						.html(
								" <font color='red'> Allows only doc,docx type or pdf.</font>");
				return false;
			}
	 }
	/*
	 * var result = false; result = captchaValidation(); if (result === false) {
	 * $("#captchaSpan").html("<font color=red><br>Invalid captcha..</font>");
	 * setTimeout(function() { $("#captchaSpan").children().remove(); }, 3000);
	 * return false; }
	 */
	var response;
	response = conRegRecaptchaValidation();
	if (response === true)
		return true;
	else
		return false;

}

function clearErrorMsg(consultRegForm) {
	// alert("error clear")

	if (consultRegForm.id == "consultantFirstName") {
		$("#consultantFirstNamespan").html("");
		$("#consultantFirstName").css("border", "1px solid #ddd");
	}
	if (consultRegForm.id == "consultantLastName") {
		$("#consultantLastName").css("border", "1px solid #ddd");
		$("#consultantLastNamespan").html("");
	}
	if (consultRegForm.id == "consultantEmail") {
		$("#consultantEmail").css("border", "1px solid #ddd");
		$("#consultantEmailspan").html("");
	}
	if (consultRegForm.id == "consultantMobile") {
		$("#consultantMobile").css("border", "1px solid #ddd");
		$("#consultantMobilespan").html("");
	}
	/*
	 * if (consultRegForm.id == "consult_dob") { $("#consult_dob").css("border",
	 * "1px solid #ddd"); $("#consult_dobspan").html(""); } if
	 * (consultRegForm.id == "title") { $("#title").css("border", "1px solid
	 * #ddd"); $("#titlespan").html(""); }
	 */
	if (consultRegForm.id == "consultantExperience") {
		$("#consultantExperience").css("border", "1px solid #ddd");
		$("#consultantExperiencespan").html("");
	}
	if (consultRegForm.id == "consultantWorkingCountry") {
		$("#consultantWorkingCountry").css("border", "1px solid #ddd");
		$("#consultantWorkingCountryspan").html("");
	}
	/*
	 * if (consultRegForm.id == "consultantIndustry") {
	 * $("#consultantIndustry").css("border", "1px solid #ddd");
	 * $("#consultantIndustryspan").html(""); } if (consultRegForm.id ==
	 * "primarySkillValue") { $("#primarySkillValue").css("border", "1px solid
	 * #ddd"); $("#primarySkillValuespan").html(""); } if (consultRegForm.id ==
	 * "skillCategoryValue") { $("#consultantSkills").css("border", "1px solid
	 * #ddd"); $("#consultantSkillsspan").html(""); }
	 */
	if (consultRegForm.id == "file") {
		$("#file").css("border", "1px solid #ddd");
		$("#addCnsltError").html("");
	}
	if (consultRegForm.id == "txtCaptchaInput") {
		$("#file").css("border", "1px solid #ddd");
		$("#captchaCheckSpan").html("");
	}

	/*
	 * if (consultRegForm.id == "consultantPerAddress1") {
	 * $("#consultantPerAddress1").css("border", "1px solid #ddd");
	 * $("#consultantPerAddress1span").html(""); } if (consultRegForm.id ==
	 * "consultantPerCity") { $("#consultantPerCity").css("border", "1px solid
	 * #ddd"); $("#consultantPerCityspan").html(""); } if (consultRegForm.id ==
	 * "consultantPerCountry") { $("#consultantPerCountry").css("border", "1px
	 * solid #ddd"); $("#consultantPerCountryspan").html(""); } if
	 * (consultRegForm.id == "consultantPerState") {
	 * $("#consultantPerState").css("border", "1px solid #ddd");
	 * $("#consultantPerStatespan").html(""); } if (consultRegForm.id ==
	 * "consultantCurAddress1") { $("#consultantCurAddress1").css("border", "1px
	 * solid #ddd"); $("#consultantCurAddress1span").html(""); } if
	 * (consultRegForm.id == "consultantCurCity") {
	 * $("#consultantCurCity").css("border", "1px solid #ddd");
	 * $("#consultantCurCityspan").html(""); } if (consultRegForm.id ==
	 * "consultantCurCountry") { $("#consultantCurCountry").css("border", "1px
	 * solid #ddd"); $("#consultantCurCountryspan").html(""); } if
	 * (consultRegForm.id == "consultantCurState") {
	 * $("#consultantCurState").css("border", "1px solid #ddd");
	 * $("#consultantCurStatespan").html(""); }
	 */
}

function openDialogforUploadProfileImage() {

	// alert("Open overlay")
	// document.getElementById('file').value = "";
	// $("#message").html("");
	var specialBox = document.getElementById('profileImageAttachOverlay');
	if (specialBox.style.display == "block") {
		specialBox.style.display = "none";
	} else {
		specialBox.style.display = "block";
	}
	// Initialize the plugin
	$('#consultUploadProfileImage_popup').popup();

}
function profileImageOverlayClose() {

	// alert(document.getElementById('file').value)
	$("imageErrorMsg").html("");
	var specialBox = document.getElementById("profileImageAttachOverlay");
	if (specialBox.style.display == "block") {
		specialBox.style.display = "none";
	} else {
		specialBox.style.display = "block";
	}
	// Initialize the plugin
	$('#consultUploadProfileImage_popup').popup();
	// getConsultantList();
}

function openDialogforResumeAttachment() {

	// document.getElementById('file').value = "";
	// $("#message").html("");
	var specialBox = document.getElementById('resumeAttachOverlay');
	if (specialBox.style.display == "block") {
		specialBox.style.display = "none";
	} else {
		specialBox.style.display = "block";
	}
	// Initialize the plugin
	$('#consultResumeAttachment_popup').popup();

}
function resumeAttachOverlayClose() {

	// alert(document.getElementById('file').value)
	var specialBox = document.getElementById("resumeAttachOverlay");
	if (specialBox.style.display == "block") {
		specialBox.style.display = "none";
	} else {
		specialBox.style.display = "block";
	}
	// Initialize the plugin
	$('#consultResumeAttachment_popup').popup();
	// getConsultantList();
}

function ValidateImageUpload() {

	var file = $("#imageupdate").val();

	if (file == '') {
		$("imageErrorMsg").html(
				"<font color='red'>Please Upload an image</font>");
		return false;
	}

	if (file != '') {
		var size = document.getElementById('imageupdate').files[0].size;
		var leafname = file.split('\\').pop().split('/').pop();
		var extension = file.substring(file.lastIndexOf('.') + 1);
		if (extension == "jpg" || extension == "png" || extension == "gif") {
			var size = document.getElementById('imageupdate').files[0].size;
			if (leafname.length > 30) {
				document.getElementById('imageupdate').value = '';
				$("imageErrorMsg")
						.html(
								"<font color='red'>File name length must be less than 30 characters!</font>");
				// document.getElementById('InsertContactInfo').innerHTML =
				// "<font color=red>File name length must be less than 30
				// characters!</font>"
				// showAlertModal("File size must be less than 2 MB");
				return false;
			} else {
				if (parseInt(size) < 2097152) {
					$("imageErrorMsg").html("");
				} else {
					document.getElementById('imageupdate').value = '';
					$("imageErrorMsg")
							.html(
									"<font color='red'>File size must be less than 2 MB</font>");
					// document.getElementById('InsertContactInfo').innerHTML =
					// "<font color=red>File size must be less than 2 MB</font>"
					// showAlertModal("File size must be less than 2 MB");
					return false;
				}
			}
		} else {
			document.getElementById('imageupdate').value = "";
			// document.getElementById('InsertContactInfo').innerHTML = "<font
			// color=red>Invalid file extension!Please select pdf or doc or docx
			// or gif or jpg or png or jpeg file.</font>"
			$("imageErrorMsg")
					.html(
							"<font color='red'>Invalid file extension!<br> Please select gif or jpg or png file</font>");
			// $("#InsertContactInfo").html(" <font color=red>Invalid file
			// extension! Please select gif or jpg or png file</font>");
			return false;
		}
	}
	$("#imageErrorMsg").html("");
	return true;
}

function ConsultantCurrentWorkingStateChange(wcountry, state) {
	// alert("Consultant ajax");
	// document.getElementById("wcountry").disabled = false;
	// var id = wcountry.value;

	// alert(id);
	var url = CONTENXT_PATH + '/recruitment/consultant/getState.action?id='
			+ wcountry.value;
	// alert(url);
	var req = initRequest(url);
	req.onreadystatechange = function() {
		if (req.readyState == 4 && req.status == 200) {
			// alert(req.responseText);

			CurrentWorkingStateChangeValidation(req.responseText, state);
		}
	};
	req.open("GET", url, "true");
	req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	req.send(null);
}
function CurrentWorkingStateChangeValidation(data, state) {
	// alert(state.id);
	// var topicId = document.getElementById("consult_wstate");

	var flag = data.split("FLAG");
	var addList = flag[0].split("^");

	var $select = $('#' + state.id + '');
	$select.find('option').remove();
	for (var i = 0; i < addList.length - 1; i++) {
		var Values = addList[i].split("#");
		{

			$('<option>').val(Values[0]).text(Values[1]).appendTo($select);
		}
	}
}

function consultAttachmentValidation() {

	$("#message").show();
	var attachment_title = $("#attachment_title").val();
	var attachment_type = $("#attachment_type").val();
	// alert(attachment_title);
	// alert(attachment_type);
	if (attachment_title == "") {
		$("#message").html("<font color='red'>Enter The Title</font>");
		$("#message").fadeOut(6000);
		// $("#attachment_title").css('border','1px solid red');
		return false;
	}
	if (attachment_type == "" || attachment_type == "0") {
		$("#message").html(
				"<font color='red'>Select The Attachment Type</font>");
		$("#message").fadeOut(6000);
		// $("#attachment_type").css('border','1px solid red');
		return false;
	}

}

// Added by Bhanu P Patnana
// Single function for all text input fields required validation
function requiredTextValidation(text, err_msg, msg) {
	css = text.id;
	value = text.value;
	// msg = text.placeholder;
	console.log(value);
	console.log(css);
	console.log(err_msg);
	console.log(msg);
	if (value == "" || value == null) {
		$(err_msg).html(
				" <font color=#FF4D4D> " + msg + " field is Required</font>.");
		$("#" + css + "").css("border", "1px solid red");
		return false;

	} else {
		$(err_msg).html("");
		$("#" + css + "").css("border", "1px solid #3BB9FF");
		return true;
	}

}

function requiredSelectValidation(select, err_msg, msg) {
	// alert("Select validation");
	css = select.id;
	value = select.value;
	console.log(css + " " + value);
	if (value == "") {
		// alert("hi");
		$(err_msg).html(
				" <font color=#FF4D4D> " + msg + " field is Required</font>.");
		$("#" + css + "").css("border", "1px solid red");
		return false;
	} else {
		// alert("hello");
		$(err_msg).html("");
		$("#" + css + "").css("border", "1px solid #3BB9FF");
		return true;
	}

}
function GetPStatesOfConsultantByPCountry(countryId, regionId, stateId,
		spanErrorId) {

	var countryValue = $("#" + countryId).val();

	if (countryValue == -1) {
		$(spanErrorId)
				.html(
						" <font color=#FF4D4D>Preffered country field is Required</font>.");
		$("#" + countryId).css("border", "1px solid red");
		$(".pref_region_div").css("display", "none");
		// $("#"+regionId).hide();
		// $(".pref_region").hide();
		$(".pref_state_div").hide();
	} else {
		if (countryValue != 3)
			$(".pref_state_div").show();

		$("#" + countryId).css("border", "1px solid green");
		$(spanErrorId).html("");

	}
	if (countryValue == 3) {

		$("#" + regionId).val("-1");
		$(".pref_state_div").hide();

		$(".pref_region_div").css("display", "block");
		$("#" + regionId).show();
		$(".pref_region").show();

	} else {
		if (countryValue != -1)
			$(".pref_state_div").show();
		$("#" + regionId).val("-1");
		// $("#"+regionId).hide();
		// $(".pref_region").hide();
		$(".pref_region_div").css("display", "none");
		// $(".pref_region_div").hide();
	}

	var regionValue = $("#" + regionId).val();

	if (countryValue == 3) {
		if (regionValue == -1) {
			$(spanErrorId)
					.html(
							" <font color=#FF4D4D>Preffered Region field is Required</font>.");
			$("#" + regionId).css("border", "1px solid red");
		} else {
			$("#" + regionId).css("border", "1px solid green");
			$(spanErrorId).html("");
		}

	}
	if ($("div").is("#" + stateId)) {
		$("#" + stateId).remove();
		$(".pref_state")
				.after(
						'<select id="consult_preferredState" class=" " onchange="preState()" onclick="" multiple="multiple" tabindex="10" name="consult_preferredState "><option value="-1">Select preferred state</option></select>');
	}

	if (countryValue != 3 && regionValue == -1 && countryValue != -1) {
		var url = CONTENXT_PATH
				+ '/recruitment/consultant/getStateBasedOnRegion.action?id='
				+ countryValue + '&regionId=' + regionValue;

		var req = initRequest(url);
		req.onreadystatechange = function() {
			if (req.readyState == 4 && req.status == 200) {
				AddConsultantStateChanging(req.responseText);
				document.getElementById(stateId).disabled = false;
			}
		};
		req.open("GET", url, "true");
		req.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		req.send(null);
	}
}
function GetPStatesOfConsultantByPCountryAndPRegion(countryId, regionId,
		stateId, spanErrorId) {
	var regionValue = $("#" + regionId).val();
	var countryValue = $("#" + countryId).val();
	// $("#"+regionId).show();
	// $(".pref_region").show();
	$(".pref_region_div").css("{display: 'block'}");
	if (regionValue == -1) {
		$(spanErrorId)
				.html(
						" <font color=#FF4D4D>Preffered Region field is Required</font>.");
		$("#" + regionId).css("border", "1px solid red");
	}
	if (regionValue != -1) {
		$("#" + regionId).css("border", "1px solid green");
		$(spanErrorId).html("");
		$(".pref_state_div").hide();
	}
	if (countryValue == 3 && regionValue != -1)
		$(".pref_state_div").show();
	else
		$(".pref_state_div").hide();
	if ($("div").is("#" + stateId)) {
		$("#" + stateId).remove();
		$(".pref_state")
				.after(
						'<select id="consult_preferredState" class=" " onchange="preState()" onclick="" multiple="multiple" tabindex="10" name="consult_preferredState "><option value="-1">Select preferred state</option></select>');
	}

	if (regionValue != -1 && countryValue == 3) {

		var url = CONTENXT_PATH
				+ '/recruitment/consultant/getStateBasedOnRegion.action?id='
				+ countryValue + '&regionId=' + regionValue;

		var req = initRequest(url);
		req.onreadystatechange = function() {
			if (req.readyState == 4 && req.status == 200) {
				AddConsultantStateChanging(req.responseText);
				document.getElementById(stateId).disabled = false;
			}
		};
		req.open("GET", url, "true");
		req.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		req.send(null);

	}
}

function loadConsultRelocation() {

	var relocation = document.getElementById("consult_relocation").value;

	var p_country = document.getElementById("consult_preferredCountry").value;
	var p_region = document.getElementById("consult_preferredRegion").value;
	if (relocation == 'No' || relocation == -1) {
		$("#consult_preferredCountry").hide();
		$(".pref_country").hide();
		$("#consult_preferredState").hide();
		$(".pref_state").hide();
		$("#consult_preferredRegion").hide();
		$(".pref_region").hide();
	} else if (relocation == 'Yes') {
		if (p_country == 3) {
			$("#consult_preferredRegion").show();
			$(".pref_region").show();
			$("#consult_preferredState").show();
			$(".pref_state").show();
			if (p_region == -1)
				$(".pref_state_div").css("display", "none");
		} else if (p_country != -1) {
			$(".pref_region_div").css("display", "none");
			$("#consult_preferredState").show();
			$(".pref_state").show();

		} else if (p_country == -1) {
			$(".pref_region_div").css("display", "none");
			$(".pref_state_div").css("display", "none");
		}

	}

}
function addConsultantAvailableValidation() {

	var conavailable = document.getElementById("consult_available").value;

	if (conavailable == "Y") {

		document.getElementById("consult_add_date").disabled = false;
		document.getElementById("consult_add_date_div").className += " required";
	} else {
		document.getElementById("consult_add_date").disabled = true;
		document.getElementById("consult_add_date_div").classList
				.remove("required");
		$("#consult_add_date").css("border", "1px solid lightgray");
	}

}


function updateCSRStatus()
{
	  var consult_id = $("#consultidhidden").val();
	    var requirementId = $("#requirementIdhiddeen").val();
	    var csrstatus = $("#csrstatus").val();
	    var csrcomments = $("#csrComments").val();
	    if(csrstatus=='-1'){
	    	document.getElementById('resultMessage').innerHTML = "<font color=red>Please Select CSR Status</font>";//"<font color=green>File uploaded successfully</font>";
	    return false;
	    }
// alert('doUpdateCSRStatusforConsultant.action?requirementId=' + requirementId + '&consult_id=' + consult_id+'&status='+csrstatus+"&comments="+escape(csrcomments));

    
    
    $.ajax({
        url:'doUpdateCSRStatusforConsultant.action?requirementId=' + requirementId + '&consult_id=' + consult_id+'&status='+csrstatus+"&comments="+escape(csrcomments),
        context: document.body,
        success: function(responseText) {
            // displaymessage = responseText;
        	  
       
            document.getElementById('resultMessage').innerHTML = "<font color=green>"+responseText+"</font>";//"<font color=green>File uploaded successfully</font>";
        // document.getElementById('fileType').value = "";
        },
        error: function(e){
       
            document.getElementById('resultMessage').innerHTML = "<font color=red>Please try again later</font>";
 
            
        }
    });
    
   
    
    
    
    
    return false;
}


/*
 * Description : Consultant Backgroung Verification data
 * Date : 06/19/2017
 * 
 */

function showBackGroundAttachmentDetails(consult_id) {
//alert("consult_id-->"+consult_id);
	 $.ajax({
         
         // url:'editJobposting.action?jobId='+jobId,//
         //url:'addJobposting.action?jobtitle='+jobtitle+'&jobtagline='+jobtagline+'&jobposition='+jobposition+'&jobqulification='+jobqulification+'&jobshifits='+jobshifits+"&location="+location+"&jobcountry="+jobcountry+"&jobstatus="+jobstatus+"&jobdescription="+jobdescription+"&jobtechnical="+jobtechnical+"&jobshiftskills="+jobshiftskills,
      //   url:'addEventposting.action?eventTitle='+escape(eventtitle)+'&eventType='+eventType+"&eventStatus="+eventStatus+"&startDate="+selectDateFrom+"&endDate="+selectDateTo+"&timeZone="+timeZone+"&eventLocation="+escape(eventLocation)+"&transportation="+escape(transportation)+"&eventDescription="+escape(eventDescription)+"&startTime="+event_time_from+"&endTime="+event_time_to+"&midDayFrom="+midday_from+"&midDayTo="+midday_to+"&eventBoldtitle="+escape(eventBoldtitle)+"&eventRegluarTitle="+escape(eventRegluarTitle)+"&eventRegistrationLink="+escape(eventRegistrationLink)+"&contactUsEmail="+escape(contactUsEmail)+"&conferenceUrl="+escape(conferenceUrl)+"&primaryTrack="+primaryTrack+"&secondaryTrack="+secondaryTrack+"&eventDepartment="+eventDepartment+"&eventAfterVideoUrl="+escape(eventAfterVideoUrl),
		 url:'../consultant/getConsultantBackgroundAttachments.action?consult_id='+ consult_id,
				
          context: document.body,
          success: function(responseText) {
             // displaymessage = responseText;
        	  populateBackgroundAttachmentTable(responseText);
         
         // document.getElementById("load").style.display = 'none';
         // document.getElementById('resultMessage').innerHTML = responseText;//"<font color=green>File uploaded successfully</font>";
      // document.getElementById('fileType').value = "";
      },
      error: function(e){
         //showRow("addTr");
         // document.getElementById("load").style.display = 'none';
        //  document.getElementById('resultMessage').innerHTML = "<font color=red>Please try again later</font>";
   
              
      }
  });
}

function populateBackgroundAttachmentTable(response) {
	//alert("response-->"+response)
	var mainJson = JSON.parse(response);
	
	var mainJsonLength = Object.keys(mainJson).length; 
	
	if(mainJsonLength>0){
	//	$("#colnsultant_div").show();
		
		 var table = document.getElementById("consult_background_attacment_table");
	    for(var i = table.rows.length - 1; i > 0; i--)
	    {
	        table.deleteRow(i);
	    }
	   // if(mainJson["isGetting"]){
	    var count = Object.keys(mainJson).length;
	    for (var key in mainJson) {
	    	if (mainJson.hasOwnProperty(key)) {
	    		 var val = mainJson[key];
	    		  var row = $("<tr />")
	             
	              $("#consult_background_attacment_table").append(row); //this will append tr element to table... keep its reference for a while since we will add cels into it
	           //   row.append($('<td><a href=../recruitment/consultant/getConsultantDetails.action?consult_id='+Values[0]+ '&consultFlag='+vendor+ ">" + Values[1] + "</a></td>"));
	              row.append($("<td>" + val["attachment_name"] + "</td>"));
	              row.append($("<td>" + val["attachment_title"] + "</td>"));
	              if(val["object_type"]=='EV')
	              row.append($("<td>Employee Verification</td>"));
	              else if(val["object_type"]=='CD')
	            	  row.append($("<td>Consent and Disclosure</td>"));
	              else
	              row.append($("<td>None</td>"));
	              
	              row.append($("<td>" + val["opp_created_date"] + "</td>"));
	              row
					.append($("<td><figcaption><button type='button' id='id' value="
							+ val["acc_attachment_id"]
							+ " onclick=doConsultAttachmentDownload("
							+ val["acc_attachment_id"]
							+ ")><i class='fa fa-download' ></i></button></figcaption></td>"));
	              
	              row.append($("<td><figcaption><button type='button' id='id' value="
							+ val["acc_attachment_id"]
							+ " onclick=uplaodBackgroundScannedCopyUpload("
							+ val["object_id"]+","
							+  val["req_id"]+")><i class='fa fa-upload' ></i></button></figcaption></td>"));
	              
	              row.append($("<td>" + val["status"] + "</td>"));
	              
	    		
	    	}
	    }
	  
		
	   // }
	}
	
	


	$('#consult_background_attacment_table').tablePaginate({
		navigateType : 'navigator'
	}, recordPage);
	cpager.init();

}


function backgroundAttachmentValidation() {
	$("#backgroundAttachmentmessage").html("");
	var FileUploadPath = document.getElementById('consultBackgroundAttachment').value;

	// To check if user upload any file
	if (FileUploadPath == '') {

		$("#backgroundAttachmentmessage").html(" <font color='red'>Please upload a file</font>");
		return false;
	}else if ($("#backgroundAttachmentType").val() == '0') {

		$("#backgroundAttachmentmessage").html(" <font color='red'>Please select Attachment Type</font>");
		return false;
	} else if ($("#backgroundAttachmentTitle").val().trim() == '') {

		$("#backgroundAttachmentmessage").html(" <font color='red'>Please enter Attachment Title</font>");
		return false;
	} else {
		var Extension = FileUploadPath.substring(
				FileUploadPath.lastIndexOf('.') + 1).toLowerCase();

		if (Extension == "doc" || Extension == "docx") {
			$("#backgroundAttachmentmessage").html(" ");
			return true;
		} else {
			$("#backgroundAttachmentmessage")
					.html(
							"<font color='red'> Allows only doc or docx extension.</font>");
			return false;
		}
	}
}



function backgroundAddValidation() {
	document.getElementById('backgroundAttachmentmessage').innerHTML = '';
	var fullPath = document.getElementById('consultBackgroundAttachment').value;

	// alert(fullPath);

	var size = document.getElementById('consultBackgroundAttachment').files[0].size;
	var extension = fullPath.substring(fullPath.lastIndexOf('.') + 1);
	var leafname = fullPath.split('\\').pop().split('/').pop();
	if (extension == "doc" || extension == "docx") {
		var size = document.getElementById('consultBackgroundAttachment').files[0].size;

		if (leafname.length > 30) {
			document.getElementById('consultBackgroundAttachment').value = '';
			document.getElementById('backgroundAttachmentmessage').innerHTML = "<font color=red>File name length must be less than 30 characters!</font>"
			// showAlertModal("File size must be less than 2 MB");
			return (false);
		} else {
			if (parseInt(size) < 2097152) {

			} else {
				document.getElementById('consultBackgroundAttachment').value = '';
				document.getElementById('backgroundAttachmentmessage').innerHTML = "<font color=red>File size must be less than 2 MB.</font>"
				// showAlertModal("File size must be less than 2 MB");
				return (false);
			}
		}
	} else {

		document.getElementById('consultBackgroundAttachment').value = "";
		document.getElementById('backgroundAttachmentmessage').innerHTML = "<font color=red>Invalid file extension!Please select doc or docx  file.</font>"
		return false;
	}
}


function uplaodBackgroundScannedCopyUpload(consultantId,requirementId){
	alert("consultantId-->"+consultantId);
	alert("requirementId-->"+requirementId);
	$("#backgroundAttachmentmessage").html("");
	$("#current_consult_id").val(consultantId);
	$("#current_requirementId").val(requirementId);
	$("#backgroundAttachmentUploadBtn").click();
	
}



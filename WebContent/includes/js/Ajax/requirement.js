function closeRecruiterOverlay()
{
    var specialBox = document.getElementById("recruiterBox");
    if(specialBox.style.display == "block"){       
        specialBox.style.display = "none";         
        

    } else {
        specialBox.style.display = "block";      
        

    }
    // Initialize the plugin

    $('#recruiterOverlay_popup').popup(      
        );    
    return false;    
}
function showOverlayRecruiter(id){
    // alert(id)
    var url='getRecruiterOverlay.action?id='+id;
    
    var req=initRequest(url);
    req.onreadystatechange = function() {
        if (req.readyState == 4 && req.status == 200) {
            // alert("result is::")
            // setVendorStates(req.responseText);
            setRecruiterOverlay(req.responseText)
        } 
    // alert(req.readyState +" and "+req.status)

    };
    req.open("GET",url,"true");
    req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req.send(null);   
   
    var specialBox = document.getElementById("recruiterBox");
    if(specialBox.style.display == "block"){       
        specialBox.style.display = "none";         
        

    } else {
        specialBox.style.display = "block";      
        

    }
    // Initialize the plugin

    $('#recruiterOverlay_popup').popup(      
        );    
    return false;
}
function setRecruiterOverlay(response){
    var Values=response.split("|");
    document.getElementById("recruiterNameOverlay").value=Values[0];
    document.getElementById("recruiterEmailIdOverlay").value=Values[1];
    document.getElementById("recruiterPhoneOverlay").value=Values[2];

}

// praveen
function getSearchRequirementsList(element)
{
	var pgNo=document.getElementById("pgNo").value;
	// alert("PGNO-->"+pgNo);
    var pGflag=element;
    if(pGflag=='1'){
        pgNo='1';  
    }
    initSessionTimer();
    // alert("viewAccountID-->"+$("#viewAccountID").val());
    var jobTitle=$("#jobTitle").val();
    var requirementSkill=$("#requirementSkill").val();
    var requirementStatus=$("#requirementStatus").val();
    var reqStart=$("#reqStart").val();
    var reqEnd=$("#reqEnd").val();
    var accountFlag=$("#accountFlag").val();
    var vendor=$("#vendor").val();
    var jdId=$("#jdId").val();
    var reqCategoryValue=$("#reqCategoryValue").val();
    var reqCreatedBy=$("#reqCreatedBy").val();
    var requirementValidation =document.getElementById("requirementValidation");
    var customerName = $("#customerName").val();
    var recordPage=document.getElementById("paginationOption").value;
    if(customerName==undefined){
        customerName="";
    }
    // alert(reqCreatedBy)
    if(reqCategoryValue==undefined)
    {
        reqCategoryValue=-1;
    }
    // alert(reqCreatedBy)
    if(reqStart!="")
    {
        if (reqEnd=="")
        {
            // alert("Please select End date")
            $("#requirementValidation").html("<font color='red'>Please select End Date</font>");
            $("#reqEnd").css('border','1px solid red');
            return false;
        }
    }
        
    if(reqEnd!="")
    {
        if (reqStart=="")
        {
            $("#requirementValidation").html("<font color='red'>Please select Start Date</font>");
            $("#reqStart").css('border','1px solid red');
            // alert("Please select Start date")
             
            return false;
        }
    }
    if(reqStart!= '' && reqEnd!= '' )
    {
        var splitReqStartDate = reqStart.split('-');
        var reqAddStartDate = new Date(splitReqStartDate[2], splitReqStartDate[0]-1 , splitReqStartDate[1]); // Y M
																												// D
        var splitReqEndDate = reqEnd.split('-');
        var reqAddtargetDate = new Date(splitReqEndDate[2], splitReqEndDate[0]-1, splitReqEndDate[1]); // Y M
																										// D
        var reqStartDate = Date.parse(reqAddStartDate);
        var reqTargetDate= Date.parse(reqAddtargetDate);
        var  difference=(reqTargetDate - reqStartDate) / (86400000 * 7);
        if(difference<=0)
        {
             
       
            $(requirementValidation).html(" <font color='red'>Start date Must be less than End date</font>");

            $(requirementValidation).show().delay(4000).fadeOut();

            return false;
        }
    
    }
    var skillCategoryArry = [];    
    $("#skillCategoryValue :selected").each(function(){
        skillCategoryArry.push($(this).text()); 
    });

    var url='getSearchRequirementsList.action?jdId='+ jdId +'&jobTitle='+jobTitle+
    '&skillCategoryArry='+skillCategoryArry+
    '&requirementStatus='+requirementStatus+
    '&reqCategoryValue='+reqCategoryValue+
    '&reqStart='+reqStart+'&reqEnd='+reqEnd+'&accountFlag='+accountFlag+'&vendor='+vendor+
    '&reqCreatedBy='+reqCreatedBy+'&customerName='+customerName+'&pgFlag='+pGflag+'&pgNo='+pgNo+'&recordPage='+recordPage;
    // alert(url);
    
    var req=initRequest(url);
    req.onreadystatechange = function() {
        document.getElementById('loadingRequirements').style.display = 'block';
        if (req.readyState == 4 && req.status == 200) {
            $('#loadingRequirements').hide();
            // alert("response"+req.responseText);
            populateReqTableReq(req.responseText,element);
            
        } 
    };
    req.open("GET",url,"true");
    req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req.send(null);
        
    return false;
}
function removeEndDateErrorMsg()
{

    // alert("hello jagan")
    $("#requirementValidation").html("");
    $("#reqEnd").css('border','1px solid #ccc');
    $("#reqStart").css('border','1px solid #ccc');
   
    return false;
}

function populateReqTableReq(response,flag){
    // alert(response);
    $(".page_option").css('display', 'block');
    var dataArray = response.split("###");
    // alert(dataArray[1]);
    var reqList=dataArray[0].split("^");
    var accountFlag=$("#accountFlag").val();
    var vendor=$("#vendor").val();
    var orgid=$("#orgid").val();
    var role=$("#sessionPRole").val();
    // alert(role)
    var table = document.getElementById("reqTableInRecruiter");
    var customer="customer";
    var recordPage=document.getElementById("paginationOption").value;
    for(var i = table.rows.length - 1; i > 0; i--)
    {
        table.deleteRow(i);
    }
    
    if(flag=='1'){
        // alert(dataArray[1])
          document.getElementById("pgNo").value=1;
          document.getElementById("totalRecords").value=dataArray[1];
      }
    var res;
    // if(vendor=='yes')
    // {
    // var res = "Job Id" + "|" + "Jog Title" + "|" + "Customer" + "|" + "Skills
	// Set" + "|" + "Posted Date" +"|" + "Status" + "^"; // for grid download
    // }
    // else
    // {
    // var res = "Job Id" + "|" + "Jog Title" + "|" + "Positions" + "|" +
	// "Skills Set" + "|" + "Posted Date" + "|" + "Status" + "|" + "No of
	// Submissions" + "^"; // for grid download
    // }
    if(response.length>0){
        for(var i=0;i<reqList.length-1;i++){     
       
            var Values=reqList[i].split("|");
            {  
                                                         
                var reqRow = $("<tr />")
                $("#reqTableInRecruiter").append(reqRow); // this will append
															// tr element to
															// table... keep its
															// reference for a
															// while since we
															// will add cels
															// into it
                // if(vendor=='yes')
                // {
                res=Values[19];
                // res+(Values[12] +"|"+ Values[1]+"|"+ Values[9]+"|"+
				// Values[10]+"|"+Values[18]+"|"+ Values[4]+"^");
                // }
                // else
                // {
                // res=Values[19];
                // res+(Values[12]+"|"+ Values[1]+"|"+ Values[2]+"|"+
				// Values[10]+"|"+Values[18]+ "|"+
				// Values[4]+"|"+Values[17]+"^");
                // }
                if(vendor=='yes'){
                    reqRow.append($('<td><a href="../../Requirements/requirementedit.action?jdId='+ Values[12] +'&accountSearchID='+orgid+'&requirementId='+Values[0]+'&accountFlag='+accountFlag+'&vendor=yes" > ' + Values[12] + "</td>"));
                    reqRow.append($("<td>" +Values[1] + "</td>"));
                    reqRow.append("<td>"+Values[9]+"</td>");
                }
                else{
                    reqRow.append($('<td><a href="../../Requirements/requirementedit.action?jdId='+ Values[12] +'&customerFlag='+customer+'&accountSearchID='+orgid+'&requirementId='+Values[0]+'&accountFlag='+accountFlag+'" > ' + Values[12] + "</td>"));
                    reqRow.append($("<td>" +Values[1] + "</td>"));     
                }
                if(role==13){
                    reqRow.append($("<td>" + Values[13] + "</td>"));
                }
                if(vendor!='yes'){
                    reqRow.append($("<td>" + Values[2] + "</td>"));
                }
                if(Values[10]=='null'||Values[10]==""){
                    Values[10]="";
                    // reqRow.append($('<td><a href="#"
					// class="recSkillOverlay_popup_open"
					// onclick="showSkillDetails('+Values[0]+');">'+Values[10].substr(0,10)+"</td>"));
                    reqRow.append($('<td><a href="#" class="recSkillOverlay_popup_open" onclick="reqSkillOverlay(\''+Values[10]+'\');">'+Values[10].substr(0,10)+"</td>"));
                }else{
                    // reqRow.append($('<td><a href="#"
					// class="recSkillOverlay_popup_open"
					// onclick="showSkillDetails('+Values[0]+');">'+Values[10].substr(0,10)+"...</td>"));
                    reqRow.append($('<td><a href="#" class="recSkillOverlay_popup_open" onclick="reqSkillOverlay(\''+Values[10]+'\');">'+Values[10].substr(0,10)+"...</td>"));
                }
                // if(Values[11]=='null'||Values[11]==""){
                // Values[11]="";
                // reqRow.append($('<td><a href="#"
				// class="preSkillOverlay_popup_open"
				// onclick="showPreferedSkillDetails('+Values[0]+');"
				// >'+Values[11].substr(0,10)+"</td>"));
                // }else{
                // reqRow.append($('<td><a href="#"
				// class="preSkillOverlay_popup_open"
				// onclick="showPreferedSkillDetails('+Values[0]+');"
				// >'+Values[11].substr(0,10)+"...</td>"));
                // }
                // // reqRow.append($('<td><a href="#"
				// class="recSkillOverlay_popup_open"
				// onclick="showReqSkillOverlay('+Values[0]+');"
				// >Click'+"</td>"));
                // reqRow.append($('<td><a href="#"
				// class="preSkillOverlay_popup_open"
				// onclick="showPreReqSkillOverlay('+Values[0]+');"
				// >Click'+"</td>"));
                /*
				 * if(vendor!='yes'){
				 * 
				 * reqRow.append($('<td><a href=""
				 * class="recruiterOverlay_popup_open"
				 * onclick="showOverlayRecruiter('+Values[5]+');" >'+Values[7]+"</td>"));
				 * reqRow.append($('<td><a href=""
				 * class="recruiterOverlay_popup_open"
				 * onclick="showOverlayRecruiter('+Values[6]+');" >'+Values[8]+"</td>")); }
				 */
                reqRow.append($("<td>" +Values[18] + "</td>")); // job posting
																// date (Created
																// date in
																// req_ven_rel)
                reqRow.append($("<td>" + Values[4] + "</td>"));
                if(vendor!='yes'){
                    reqRow.append($("<td>" +Values[17] + "</td>"));
                    // if(Values[4]=='Closed'){
                    // reqRow.append($('<td><center><a href="#" >'+"<img
					// src='../../includes/images/release.png' height='20'
					// width='20' style='opacity:0.3' ></center></td>"));
                    // }
                    // else if(Values[4]=='Released'){
                    // reqRow.append($('<td><center><a href="#" >'+"<img
					// src='../../includes/images/release.png' height='20'
					// width='20' style='opacity:0.3' ></center></td>"));
                    // }
                    if(Values[4]=='Opened')
                    {
                        if(role==3 || role==13){
                            reqRow.append($('<td><center><a href="#" class="releaseVendorOverlay_popup_open" onclick="selectVendorsOverlay('+Values[0]+','+orgid+',\''+Values[14]+ '\');">'+"<i class='fa fa-arrow-circle-o-right fa-size'></i></center></td>"));
                        }
                        else
                        {
                            reqRow.append($('<td><center><a href="#" >'+"<i class='fa fa-arrow-circle-o-right fa-size' style='opacity: 0.3' ></i></center></td>"));       
                        }
                    }else{
                        reqRow.append($('<td><center><a href="#" >'+"<i class='fa fa-arrow-circle-o-right fa-size' style='opacity: 0.3' ></i></center></td>"));
                    }
                }
                if(vendor=='yes'){
                    if(Values[4]=='Closed'||Values[4]=='Released'){
                        reqRow.append($('<td><center>'+"<i class='fa fa-user-plus fa-size' style='opacity:0.3'></i></center></td>"));      
                    }else{
                        reqRow.append($('<td><center><a href="../../recruitment/consultant/doAddConsultantForReq.action?requirementId='+Values[0]+'&jdId='+Values[12]+'&jobTitle='+Values[1]+'&targetRate='+Values[15]+'&maxRate='+Values[16]+'&orgid='+orgid+'&reqSkillSet='+Values[10]+'">'+"<i class='fa fa-user-plus fa-size'></i></center></td>"));      
                    }
                }
                if(role==3){
                    reqRow.append($('<td><center><a href="<%=request.getContextPath()%>/../../../Requirements/doCopyRequirement.action?customerFlag='+customer+'&accountSearchID='+orgid+'&requirementId='+Values[0]+'">'+"<i class='fa fa-files-o fa-size' ></i></center></td>"));      
                }                
            }
        }
        document.getElementById("gridDownload").value=res;
        document.getElementById("downloading_grid").style.display="";
    }
    else{
        var row = $("<tr />")
        $("#reqTableInRecruiter").append(row);
        row.append($('<td colspan="11"><font style="color: red;font-size: 15px;">No Records to display</font></td>'));
        document.getElementById("downloading_grid").style.display="none";
        $(".page_option").css('display', 'none');
    }
    
    $('#reqTableInRecruiter').tablesPaginate({
        navigateType:'navigator'
    },recordPage,reqTableInRecruiter);
    // pag.init();
   
}

/*
 * function getReqReleaseVendorsForCsr(requirementId,orgId,taxTerm){
 * window.location=
 * "../acc/getReqReleaseVendors.action?requirementId="+requirementId+'&orgId='+orgId+'&taxTerm='+taxTerm; }
 */


function doOnLoadReqList() {
                
                
    myCalendar = new dhtmlXCalendarObject(["reqStart","reqEnd"]);
    // alert("hii1");
    myCalendar.setSkin('omega');
    // alert("hii2");
    // myCalendar.setDateFormat("%m/%d/%Y %H:%i");
    myCalendar.setDateFormat("%m-%d-%Y");
    myCalendar.hideTime();
    document.getElementById("loadingRequirements").style.display="none";
}
function doOnLoadDateList() {
    
    
    myCalendar = new dhtmlXCalendarObject(["submittedFrom","submittedEnd"]);
    // alert("hii1");
    myCalendar.setSkin('omega');
    // alert("hii2");
    // myCalendar.setDateFormat("%m/%d/%Y %H:%i");
    myCalendar.setDateFormat("%m-%d-%Y");
    myCalendar.hideTime();
    document.getElementById("loadingConsultant").style.display="none";
}

function selectVendorsOverlayClose(){
// document.getElementById('releaseVendorDiv').innerHTML = '';
    var specialBox = document.getElementById("releaseVendorBox"); 
    if(specialBox.style.display == "block"){       
        specialBox.style.display = "none";         
    } else {
        specialBox.style.display = "block";      
    }
    $('#releaseVendorOverlay_popup').popup();
}
function selectVendorsOverlay(requirementId,orgId,taxTerm){ 
    document.getElementById("vendorReleaseButton").style.display = "block";
// document.getElementById('releaseVendorDiv').innerHTML = '';
    var specialBox = document.getElementById("releaseVendorBox"); 
    if(specialBox.style.display == "block"){       
        specialBox.style.display = "none";         
    } else {
        specialBox.style.display = "block";      
    }
    $('#releaseVendorOverlay_popup').popup(); 
    var url='./recruitment/consultant/getVendorsBasedOnReqCategory.action?requirementId='+requirementId+'&orgId='+orgId+'&taxTerm='+taxTerm;
   var req=initRequest(url);
    req.onreadystatechange = function() {
        if (req.readyState == 4) {
            if (req.status == 200) {
                document.getElementById("requirementId").value = requirementId;
                document.getElementById("orgId").value = orgId;
                document.getElementById("taxTerm").value = taxTerm;
                populateReleaseVendorsOverlay(req.responseText);
            } 
        }
    };
    req.open("GET",url,"true");
    req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req.send(null);
    return false;
}
function populateReleaseVendorsOverlay(data){
    var vendorsIdString='';
    var flag=data.split("FLAG");
    var addList=flag[0].split("^^");
    // for(var i=0;i<addList.length-1;i++){
    // var Values=addList[i].split("||");
    // var option = document.createElement('li');
    // var checkbox = document.createElement('input');
    // checkbox.type = "checkbox";
    // checkbox.name = "vendor"+Values[0];
    // checkbox.value = 0;
    // checkbox.id = "vendor"+Values[0];
    // var label = document.createElement('label')
    // label.htmlFor = "vendor"+Values[0];
    // // label.appendChild(option);
    // label.appendChild(checkbox);
    // label.appendChild(document.createTextNode(Values[1]));
    // document.getElementById("releaseVendorDiv").appendChild(option);
    // document.getElementById("releaseVendorDiv").appendChild(label);
    // vendorsIdString += Values[0]+"^^";
    // // document.getElementById('releaseVendorDiv').innerHTML = "<br/>";
    // }
    // document.getElementById("vendorsIdString").value = vendorsIdString;
    // alert("ji"+document.getElementById("releaseVendorDiv").value)
    var table = document.getElementById("releaseReqTable");
    for (var i = table.rows.length - 1; i > 0; i--)
    {
        table.deleteRow(i);
    }
    var row = $("<tr/>")
    $("#releaseReqTable").append(row); // this will append tr element to
										// table... keep its reference for a
										// while since we will add cels into it
// if(taxTerm=='CO')
// row.append($("<th>").append("Tier1 Vendors List"));
// else if(taxTerm='PE')
// row.append($("<th>").append("HeadHunters Vendors List"));
    if (flag.length > 0) {
    	
        for (var i = 0; i < addList.length-1; i++) {
            var Values = addList[i].split("||");
            // var option = document.createElement('li');
          var  checkbox = document.createElement('input');
            checkbox.type = "checkbox";
            checkbox.name = "vendor"+Values[0];
            checkbox.value = 0;
            checkbox.id = "vendor"+Values[0];
           var label = document.createElement('label')
            label.htmlFor = "vendor"+Values[0];
            // label.appendChild(option);
            label.appendChild(checkbox);
            label.appendChild("  "+document.createTextNode(Values[1]));
            vendorsIdString += Values[0]+"^^";
            var row = $("<tr/>")
            $("#releaseReqTable").append(row); // this will append tr element
												// to table... keep its
												// reference for a while since
												// we will add cels into it
            row.append($("<td>").append(label));
        // row.append($("<td>" + Values[1] +
		// "</td>"));///alert("oooooooooooooooo"+$(label))
        }
    }
    else {
        var row = $("<tr />")
        $("#releaseReqTable").append(row);
        row.append($('<td colspan="5"><font style="color: red;font-size: 15px;">No Records to display</font></td>'))
    }
    document.getElementById("vendorsIdString").value = vendorsIdString;
    $('#releaseReqTable').tablePaginate({
        navigateType: 'navigator'
    }, recordPage);
    pag.init();
    pag.showPageNav('pager', 'pageNavPosition');
    pag.showPage(1);
}
function onClickHandler(res){
	
	var check =res.checked;// alert(check)
	if (check ==true){
		 var vendorsIdString = document.getElementById("vendorsIdString").value;
		 var vendorIds=vendorsIdString.split("^^");
		    var vendorOrgIds='';
		    for(var i =0;i<vendorIds.length-1;i++){
		    	document.getElementById("vendor"+vendorIds[i]).checked=false;
		        $("#vendor"+vendorIds[i]).attr("disabled", true);
		    }
	}
	else{
		 var vendorsIdString = document.getElementById("vendorsIdString").value;
		 var vendorIds=vendorsIdString.split("^^");
		    var vendorOrgIds='';
		    for(var i =0;i<vendorIds.length-1;i++){
		        $("#vendor"+vendorIds[i]).attr("disabled", false);
		    }
	}
}
function reqSkillOverlay(response){
    document.getElementById("reqSkillDetails").value=response;
    var specialBox = document.getElementById("reqskillBox");
    if(specialBox.style.display == "block"){       
        specialBox.style.display = "none";         
    } else {
        specialBox.style.display = "block";      
    }
    // Initialize the plugin
    $('#recSkillOverlay_popup').popup(      
        ); 
}
function preSkillOverlay(response){
    // alert(response)
    document.getElementById("preSkillDetails").value=response;
    var specialBox = document.getElementById("preskillBox");
    if(specialBox.style.display == "block"){       
        specialBox.style.display = "none";         
        

    } else {
        specialBox.style.display = "block";      
        

    }
    // Initialize the plugin

    $('#preSkillOverlay_popup').popup(      
        ); 
          
}
function associationOverlay() {
   
    var specialBox = document.getElementById("vendorAssocitaionOverlay");

    if(specialBox.style.display == "block"){       
        specialBox.style.display = "none";         
    } else {
        specialBox.style.display = "block";      
    }
    // Initialize the plugin
    $('#vendorAsso_popup').popup(      
        );
    $("saveVendorAssociation").html("");
    document.getElementById("tireType").value="-1";
    document.getElementById("accessTime").value="";
    document.getElementById("vendorNames").value="";
    return false;
}
function associationEditOverlayclose(){
    var specialBox = document.getElementById("vendorAssocitaionEditOverlay");
    
    if(specialBox.style.display == "block"){       
        specialBox.style.display = "none";         
    } else {
        specialBox.style.display = "block";      
    }
    $('#vendorAssoEdit_popup').popup();
}



function associationEditOverlay(id) {
    // alert(id)
   
    var specialBox = document.getElementById("vendorAssocitaionEditOverlay");
    
    if(specialBox.style.display == "block"){       
        specialBox.style.display = "none";         
    } else {
        specialBox.style.display = "block";      
    }
    $('#vendorAssoEdit_popup').popup();
    document.getElementById("vendorId").value=id;
    var url=CONTENXT_PATH+'/vendor/editVendorAssociation.action?vendorId='+id;
    var req=initRequest(url);
    req.onreadystatechange = function() {
        if (req.readyState == 4) {
            if (req.status == 200) {
                // alert(req.responseText);
                populateVendorOverlay(req.responseText,id);
            } 
            
        }
    };
    req.open("GET",url,"true");
    req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req.send(null);
    
    // Initialize the plugin
   
    return false;
}

function populateVendorOverlay(response,id)
{
    document.getElementById("vendorId").value=id; 
    // alert(document.getElementById("vendorId").value);
    var add=response.split("^");
    for(var i=0;i<add.length-1;i++){        
        var Values=add[i].split("|");
        {  
            // alert(Values[0]);
                
            document.getElementById("tireTypeEdit").value=Values[0];
            // document.getElementById("vendorNamesEdit").value=Values[1];
            document.getElementById("statusEdit").value=Values[2];
            getVendorNames(Values[0])  
        }
    }
}
function getVendorNames(tireId)
{
    // alert("Consultant ajax");
    var id=document.getElementById('tireTypeEdit').value;
    
    var url=CONTENXT_PATH+'/vendor/getVendorNames.action?tireId='+tireId;
    var req=initRequest(url);
    req.onreadystatechange = function() {
        if (req.readyState == 4 && req.status == 200) {
            PopulateVenderName(req.responseText);
        } 
    };
    req.open("GET",url,"true");
    req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req.send(null);
}
// function to set the state of permanent address in addConsultant page add by
// Aklakh
function PopulateVenderName(data){
    // alert(data);
    var topicId = document.getElementById("vendorNamesEdit");
    var flag=data.split("FLAG");
    var addList=flag[0].split("^");
    var $select = $('#vendorNamesEdit');
    $select.find('option').remove();   
    for(var i=0;i<addList.length-1;i++){        
        var Values=addList[i].split("#");
        {  
            
            $('<option>').val(Values[0]).text(Values[1]).appendTo($select); 
        }
    }
}
// created by Aklakh
function updateVendorAssociation(){
    
    var vendorId=document.getElementById("vendorId").value;
    // alert(vendorId);
    var tireTypeId=$("#tireTypeEdit").val();
    var statusEdit=$("#statusEdit").val();
    var url=CONTENXT_PATH+'/vendor/updateVendorDetails.action?vendorId='+ vendorId +'&statusEdit='+ statusEdit;
    var req=initRequest(url);
    req.onreadystatechange = function() {
        if (req.readyState == 4){
           
            if(req.status == 200) {
                // location.reload(true);
                // $("EditSkillOverlayResult").html(" <b><font
				// color='Green'>Skill record successfully
				// Updated.</font></b>");
                // alert("record updated successfully");
                getVendorAssociationDetails();
               
            }
        }
        else{
        }
            
        
    };
    req.open("GET",url,"true");
    req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req.send(null);
   
}




function changeState()
{
    var country=$("#vendorCountry").val();
    var url='getStatesForCountry.action?countryId='+country;
    var req=initRequest(url);
    req.onreadystatechange = function() {
        if (req.readyState == 4 && req.status == 200) {
            setVendorStates(req.responseText);
        } 
    
    };
    req.open("GET",url,"true");
    req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req.send(null);
}
function setVendorStates(states)
{
    var vendorState = document.getElementById("vendorState");
    var stateSet=states.split("^");
    var $select = $('#vendorState');
    $select.find('option').remove();   
    for(var i=0;i<stateSet.length-1;i++){        
        var Values=stateSet[i].split("#");
        {
            $('<option>').val(Values[0]).text(Values[1]).appendTo($select); 
        }
    }
}


function updateVendorDetails()
{
    var vendorName=$("#vendorName").val();
    var vendorURL=$("#vendorURL").val();
    var vendorStatus=$("#vendorStatus").val();
    var vendorAddress1=$("#vendorAddress1").val();
    var vendorAddress2=$("#vendorAddress2").val();
    var vendorCity=$("#vendorCity").val();
    var vendorPhone=$("#vendorPhone").val();
    var vendorFax=$("#vendorFax").val();
    var vendorState=$("#vendorState").val();
    var vendorCountry=$("#vendorCountry").val();
    var vendorZip=$("#vendorZip").val();
    var vendorIndustry=$("#vendorIndustry").val();
    var vendorRegion=$("#vendorRegion").val();
    var vendorTerritory=$("#vendorTerritory").val();
    var vendorType=$("#vendorType").val();
    var vendorDescription=$("#vendorDescription").val();
    var vendorBudget=$("#vendorBudget").val();
    var vendorTaxid=$("#vendorTaxid").val();
    var stockSymbol=$("#stockSymbol").val();
    var vendorRvenue=$("#vendorRvenue").val();
    var empCount=$("#empCount").val();
    var vendorId=$("#vendorId").val();
    
    
    var url='updateVendorDetails.action?vendorName='+vendorName+
    '&vendorURL='+vendorURL+
    '&vendorStatus='+vendorStatus+
    '&vendorAddress1='+vendorAddress1+
    '&vendorAddress2='+vendorAddress2+
    '&vendorCity='+vendorCity+
    '&vendorPhone='+vendorPhone+
    '&vendorFax='+vendorFax+
    '&vendorState='+vendorState+
    '&vendorCountry='+vendorCountry+
    '&vendorZip='+vendorZip+
    '&vendorIndustry='+vendorIndustry+
    '&vendorRegion='+vendorRegion+
    '&vendorTerritory='+vendorTerritory+
    '&vendorType='+vendorType+
    '&vendorDescription='+vendorDescription+
    '&vendorBudget='+vendorBudget+
    '&vendorTaxid='+vendorTaxid+
    '&stockSymbol='+stockSymbol+
    '&vendorRvenue='+vendorRvenue+
    '&empCount='+empCount+
    '&vendorId='+vendorId;
    var req=initRequest(url);
    req.onreadystatechange = function() {
        if (req.readyState == 4 && req.status == 200) {
            $("UpdateVendorInfo").html("<font class='StripForResultMessage' style='font-size:12px' color='green'>Vendor Information updated Successfully.</font><br>");
        } 
   
    };
    req.open("GET",url,"true");
    req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req.send(null);
    
    
    
}
function initRequest(url) {
    if (window.XMLHttpRequest) {
        return new XMLHttpRequest();
    }
    else
    if (window.ActiveXObject) {
        isIE = true;
        return new ActiveXObject("Microsoft.XMLHTTP");
    }    
}



/*
 * To change this template, choose Tools | Templates and open the template in
 * the editor.
 */


function Pager(tableName, itemsPerPage) {
    this.tableName = tableName;
    this.itemsPerPage = itemsPerPage;
    this.currentPage = 1;
    this.pages = 0;
    this.inited = false;
    
    this.showRecords = function(from, to) {        
        var rows = document.getElementById(tableName).rows;
        // i starts from 1 to skip table header row
        for (var i = 1; i < rows.length; i++) {
            if (i < from || i > to)  
                rows[i].style.display = 'none';
            else
                rows[i].style.display = '';
        }
    }
    
    this.showPage = function(pageNumber) {
        if (! this.inited) {
            alert("not inited");
            return;
        }

        var oldPageAnchor = document.getElementById('pg'+this.currentPage);
        oldPageAnchor.className = 'pg-normal';
        
        this.currentPage = pageNumber;
        var newPageAnchor = document.getElementById('pg'+this.currentPage);
        newPageAnchor.className = 'pg-selected';
        
        var from = (pageNumber - 1) * itemsPerPage + 1;
        var to = from + itemsPerPage - 1;
        this.showRecords(from, to);
    }   
    
    this.prev = function() {
        if (this.currentPage > 1)
            this.showPage(this.currentPage - 1);
    }
    
    this.next = function() {
        if (this.currentPage < this.pages) {
            this.showPage(this.currentPage + 1);
        }
    }                        
    
    this.init = function() {
        var rows = document.getElementById(tableName).rows;
        var records = (rows.length -1); 
        this.pages = Math.ceil(records / itemsPerPage);
        this.inited = true;
    }

    this.showPageNav = function(pagerName, positionId) {
        if (! this.inited) {
            alert("not inited");
            return;
        }
        var element = document.getElementById(positionId);                                                                                  
        var pagerHtml = '<span onclick="' + pagerName + '.prev();" class="pg-normal" "> <font align="bottom" class="jumpbar"> Page: <i class="fa fa-chevron-circle-left"></i> </font></span> ';
        for (var page = 1; page <= this.pages; page++) 
            pagerHtml += '<span id="pg' + page + '" class="pg-normal" onclick="' + pagerName + '.showPage(' + page + ');" "><font color="black" face="verdana">' + page + '</font></span> ';
        pagerHtml += '<span onclick="'+pagerName+'.next();" class="pg-normal"><font align="bottom" class="jumpbar"><i class="fa fa-chevron-circle-right"></i></font></span>';            
        
        // pagerHtml='<span style="margin-right:40vw;>'+pagerHtml+'</span>';
        element.innerHTML =pagerHtml ;
    }
}


// DBGrid.js file start



function doNavigate(pstrWhere, pintTot)
{
    var strTmp;
    var intPg; 
  
    strTmp = document.frmDBGrid.txtCurr.value;
    intPg = parseInt(strTmp);
    if (isNaN(intPg)) intPg = 1; 
    if ((pstrWhere == 'F' || pstrWhere == 'P') && intPg == 1)
    {
        alert("You are already viewing first page!");
        return;
    }
    else if ((pstrWhere == 'N' || pstrWhere == 'L') && intPg == pintTot)
    {
        alert("You are already viewing last page!");
        return;
    }
    if (pstrWhere == 'F')
        intPg = 1;
    else if (pstrWhere == 'P')
        intPg = intPg - 1;
    else if (pstrWhere == 'N')
        intPg = intPg +1;
    else if (pstrWhere == 'L')
        intPg = pintTot; 
    if (intPg < 1) intPg = 1;
    if (intPg > pintTot) intPg = pintTot;
    document.frmDBGrid.txtCurr.value = intPg;
    document.frmDBGrid.submit();
}
function doSort(pstrFld, pstrOrd)
{
    document.frmDBGrid.txtSortCol.value = pstrFld;
    document.frmDBGrid.txtSortAsc.value = pstrOrd;
    document.frmDBGrid.submit();
}

function goToPage(element) {
    document.frmDBGrid.txtCurr.value = element.options[element.selectedIndex].value;
    document.frmDBGrid.submit();
}
function goToMyPage(element) {
    if (element == null || element.value == null 
        || element.value == ''){
        return;
    }
    document.frmDBGrid.txtCurr.value = element.value;
    document.frmDBGrid.submit();
}

// responsive_tables.js start


$(document).ready(function() {
    var switched = false;
    var updateTables = function() {
        if (($(window).width() < 1025) && !switched ){
            switched = true;
            $("table.responsive").each(function(i, element) {
                splitTable($(element));
            });
            return true;
        }
        else if (switched && ($(window).width() > 1025)) {
            switched = false;
            $("table.responsive").each(function(i, element) {
                unsplitTable($(element));
            });
        }
    };
   
    $(window).load(updateTables);
    $(window).on("redraw",function(){
        switched=false;
        updateTables();
    }); // An event to listen for
    $(window).on("resize", updateTables);
   
	
    function splitTable(original)
    {
        original.wrap("<div class='table-wrapper' />");
		
        var copy = original.clone();
        copy.find("td:not(:first-child), th:not(:first-child)").css("display", "none");
        copy.removeClass("responsive");
		
        original.closest(".table-wrapper").append(copy);
        copy.wrap("<div class='pinned' />");
        original.wrap("<div class='scrollable' />");

        setCellHeights(original, copy);
    }
	
    function unsplitTable(original) {
        original.closest(".table-wrapper").find(".pinned").remove();
        original.unwrap();
        original.unwrap();
    }

    function setCellHeights(original, copy) {
        var tr = original.find('tr'),
        tr_copy = copy.find('tr'),
        heights = [];

        tr.each(function (index) {
            var self = $(this),
            tx = self.find('th, td');

            tx.each(function () {
                var height = $(this).outerHeight(true);
                heights[index] = heights[index] || 0;
                if (height > heights[index]) heights[index] = height;
            });

        });

        tr_copy.each(function (index) {
            $(this).height(heights[index]);
        });
    }

});
// Added By manikanta for vendor contact

function showVendorContacts()
{
    var orgId= document.getElementById("vendorSearchId").value;
    var url='../vendor/getVendorContacts.action?orgId='+orgId;
    var req=initRequest(url);
    req.onreadystatechange = function() {
        if (req.readyState == 4) {
            if (req.status == 200) {
                
                populateVendorContactTable(req.responseText);
                
            } 
            else
            {
            // alert("Error occured");
            }
        }
    };
    req.open("GET",url,"true");
    req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req.send(null);
}

function populateVendorContactTable(response){
    if(response!=""){
        var eduList=response.split("^");
   
        var table = document.getElementById("contactPageNav");
        for(var i = table.rows.length - 1; i > 0; i--)
        {
            table.deleteRow(i);
        }
        for(var i=0;i<eduList.length-1;i++){   
       
            var Values=eduList[i].split("|");
            {  
         
         
                var row = $("<tr />")
                $("#contactPageNav").append(row); // this will append tr
													// element to table... keep
													// its reference for a while
													// since we will add cels
													// into it
                // row.append($('<td><a href="" class="eduEdit_popup_open "
				// onclick=" showEditEduOverlayDetails('+Values[0]+');" > ' +
				// Values[1] + "</td>"));
                // row.append($("<td>" + Values[0] + "</td>"));
                row.append($("<td>" + Values[1] + "</td>"));
                row.append($("<td>" + Values[2] + "</td>"));
                row.append($("<td>" + Values[3] + "</td>"));
                row.append($("<td>" + Values[4] + "</td>"));
                row.append($('<td><a href="#" onclick="saveVendorContactDetails('+Values[0]+')">'  + "CLICK" + "</td>"));
            // row.append($("<td>" + Values[4] + "</td>"));
            // row.append($("<td>" + Values[7] + "</td>"));
            // onclick="saveContactDetails(' + Values[0] +');" > '
            }
        }
  
        pager.init(); 
        pager.showPageNav('pager', 'contactPageNavPosition'); 
        pager.showPage(1);
    }
    else {
       
    }
     
}

function saveVendorContactDetails(usrid)
{
    // var orgId= document.getElementById("accountsearchid").value;
    var url='../vendor/saveVendorContacts.action?vendorUserId='+usrid;
    var req=initRequest(url);
    req.onreadystatechange = function() {
        if (req.readyState == 4) {
            if (req.status == 200) {
                
                document.getElementById("outputMessage").innerHTML=req.responseText;
                
            } 
            else
            {
            // alert("Error occured");
            }
        }
    };
    req.open("GET",url,"true");
    req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req.send(null);

    return false;
}

function getContactSearchResults(){
    var firstName=$("#firstNameContacts").val();
    var lastName=$("#lastNameContacts").val();
    var email=$("#emailContacts").val();
    var status=$("#statusContacts").val();
    var phone=$("#phoneContacts").val();
    
    var orgId= document.getElementById("vendorSearchId").value;
    var url='../vendor/getVendorContactSearchResults.action?orgId='+orgId +'&vendorFirstName='+firstName +'&vendorLastName='+lastName +'&vendorEmail='+email +'&vendorStatus='+status+ '&vendorPhone='+ phone ;
    var req=initRequest(url);
    req.onreadystatechange = function() {
        if (req.readyState == 4) {
            if (req.status == 200) {
                populateContactTable(req.responseText);
               
            // $("securityinfo").html(" <b><font color='green'>Confidential
			// information Saved Successfully</font></b>");
            } 
            else
            {
               
            }
        }
    };
    req.open("GET",url,"true");
    req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req.send(null);
}

function getVendorsNames()
{
    var tireType=document.getElementById("tireType").value;
    if(tireType=="DF")
      
        return false;
    var url='getVendorsListByTireType.action?tireType='+tireType;

    var req=initRequest(url);
    req.onreadystatechange = function() {
        if (req.readyState == 4 && req.status == 200) {
            populateVendorsNames(req.responseText);
        } 
    };
    req.open("GET",url,"true");
    req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req.send(null);
    
}
function populateVendorsNames(response)
{
 
    var vendorState = document.getElementById("vendorNames");
    var stateSet=response.split("^");
    var $select = $('#vendorNames');
    $select.find('option').remove();   
    for(var i=0;i<stateSet.length-1;i++){        
        var Values=stateSet[i].split("|");
        {
            $('<option>').val(Values[0]).text(Values[1]).appendTo($select); 
        }
    }
}

function saveVendorAssociation(){
    var tireType=document.getElementById("tireType").value;
    
    var vendorList = [];    
    $("#vendorNames :selected").each(function(){
        vendorList.push($(this).val()); 
    });
    // vendorList="10004";
    var accessTime=document.getElementById("accessTime").value;
    // var req_id=document.getElementById("req_id").value;
    var req_id=document.getElementById("req_id").value;
   
    // var
	// url='SaveVendorsAssociationDetals.action?tireType='+tireType+'&vendorList='+vendorList+'&accessTime='+accessTime+'req_id='+req_id;
    var url='SaveVendorsAssociationDetals.action?vendorList='+vendorList+'&accessTime='+accessTime+'&req_id='+req_id;
    var req=initRequest(url);
    req.onreadystatechange = function() {
        if (req.readyState == 4 && req.status == 200) {
            $("saveVendorAssociation").html(" <font color='green'>Vendor Association Saved Successfully</font>");
            getVendorAssociationDetails()
        } 
    };
    req.open("GET",url,"true");
    req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req.send(null);
    
    return false;
}


// BY RK
function getRequirementDetails()
{
    var accountSearchID=$("#accountSearchID").val();
    var url='searchRequirement.action?accountSearchID='+accountSearchID;
    
    var req=initRequest(url);
    req.onreadystatechange = function() {
        if (req.readyState == 4 && req.status == 200) {
            populateReqTable(req.responseText);
        } 
    
    };
    req.open("GET",url,"true");
    req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req.send(null);
    
    
}

function populateReqTable(response){
    var reqList=response.split("^");
    
    var accountSearchID=$("#accountSearchID").val();
    var name =  document.getElementById("account_name").value;
  
    var table = document.getElementById("reqTable");
    for(var i = table.rows.length - 1; i > 0; i--)
    {
        table.deleteRow(i);
    }
    for(var i=0;i<reqList.length-1;i++){     
       
        var Values=reqList[i].split("|");
        {  
                                                         
            var reqRow = $("<tr />")
            $("#reqTable").append(reqRow); // this will append tr element to
											// table... keep its reference for a
											// while since we will add cels into
											// it
            // reqRow.append($('<td><a
			// href="../Requirements/requirementedit.action?accountSearchID='+
			// accountSearchID
			// +'&accountFlag=Account&requirementId='+Values[0]+'" > ' +
			// Values[1] + "</td>"));
            reqRow.append($('<td><a href="../Requirements/requirementedit.action?account_name='+name+'&accountSearchID='+accountSearchID+'&accountFlag=Account&requirementId='+Values[0]+'" > ' + Values[1] + "</td>"));

            reqRow.append($("<td>" + Values[2] + "</td>"));
            if(Values[5]=='null'||Values[5]==""){
                Values[5]="";
                reqRow.append($('<td><a href="" class="recSkillOverlay_popup_open" onclick=" showSkillDetails('+Values[0]+');" >'+Values[5].substr(0,10)+"</td>"));
            }
            else{
                reqRow.append($('<td><a href="" class="recSkillOverlay_popup_open" onclick=" showSkillDetails('+Values[0]+');" >'+Values[5].substr(0,10)+"..</td>"));
            }
            if(Values[6]=='null'||Values[6]==""){
                Values[6]="";
                reqRow.append($('<td><a href="" class="preSkillOverlay_popup_open" onclick=" showPreferedSkillDetails('+Values[0]+');" >'+Values[6].substr(0,10)+"</td>"));
            }
            else{
                reqRow.append($('<td><a href="" class="preSkillOverlay_popup_open" onclick=" showPreferedSkillDetails('+Values[0]+');" >'+Values[6].substr(0,10)+"..</td>"));
            }
            reqRow.append($("<td>" + Values[3] + "</td>"));
            reqRow.append($("<td>" + Values[4] + "</td>"));
            reqRow.append($('<td><a href="#" class="addConsultant_popup_open" onclick=" storeReqIdinOverlay('+Values[0]+');" >'+"Click</td>"));      

                  
        }
    }

   
    pager.init();     
    pager.showPageNav('pager', 'reqpageNavPosition'); 
    pager.showPage(1);
}


function showSkillDetails(sid){
   
    var url='../../acc/getSkillDetaisls.action?requirementId='+sid;
    var req=initRequest(url);
    req.onreadystatechange = function() {
        if (req.readyState == 4) {
            if (req.status == 200) {
                document.getElementById("reqSkillDetails").value=req.responseText;
            } 
            
        }
    };
    req.open("GET",url,"true");
    req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req.send(null);
    var specialBox = document.getElementById("reqskillBox");
    if(specialBox.style.display == "block"){       
        specialBox.style.display = "none";         
        

    } else {
        specialBox.style.display = "block";      
        

    }
    // Initialize the plugin

    $('#recSkillOverlay_popup').popup(   
        );
    return false;
}

function showPreferedSkillDetails(sid){
   
    var url='../../acc/getPreferedSkillDetails.action?requirementId='+sid;
    var req=initRequest(url);
    req.onreadystatechange = function() {
        if (req.readyState == 4) {
            if (req.status == 200) {
                document.getElementById("preSkillDetails").value=req.responseText;
            } 
            
        }
    };
    req.open("GET",url,"true");
    req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req.send(null);
    var specialBox = document.getElementById("preskillBox");
    if(specialBox.style.display == "block"){       
        specialBox.style.display = "none";         
        

    } else {
        specialBox.style.display = "block";      
        

    }
    // Initialize the plugin

    $('#preSkillOverlay_popup').popup(      
        );
    return false;
}
$(document).ready(function(){
    
   
    $('#skillShow_popup').popup(); 
});

function getReqDetailsBySearch()
{
    var requirementId=$("#requirementId").val();
    var jobTitle=$("#jobTitle").val();
    var requirementSkill=$("#requirementSkill").val();
    var requirementStatus=$("#requirementStatus").val();
    var reqStart=$("#reqStart").val();
    var reqEnd=$("#reqEnd").val();
    var accountSearchID=$("#accountSearchID").val();
    var url='getReqDetailsBySearch.action?requirementId='+requirementId+'&jobTitle='+jobTitle+'&requirementSkill='+requirementSkill+'&requirementStatus='+requirementStatus+'&reqStart='+reqStart+'&reqEnd='+reqEnd+'&accountSearchID='+accountSearchID;
   
    var req=initRequest(url);
    req.onreadystatechange = function() {
       
        if (req.readyState == 4 && req.status == 200) {
            populateReqTable(req.responseText);
        } 
    };
    req.open("GET",url,"true");
    req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req.send(null);
        
    return false;
}

// BY RK

function getEmpMailPhone(val)
{
    var url='getEmailPhoneDetails.action?userId='+val;
    var req=initRequest(url);
    req.onreadystatechange = function() {
        if (req.readyState == 4) {
            if (req.status == 200) {
                var details=req.responseText.split("|");
                document.getElementById("email").value=details[0];
                document.getElementById("contactNo").value=details[1];

            } 
            
        }
    };
    req.open("GET",url,"true");
    req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req.send(null);
    
    
    
}
$(document).ready(function(){
    
   
    $('#emailPhoneShow_popup').popup(); 
});

function Vendorheading(message)
{
    if(message.id=="vendordetails"){
   
        document.getElementById("headingmessage").innerHTML="Vendor Details";
    }

    if(message.id=="vendorSoftware"){
        document.getElementById("headingmessage").innerHTML="Vendor Softwares";
    }
    if(message.id=="vendorTeam"){
        document.getElementById("headingmessage").innerHTML="Assign Team";
    }
    if(message.id=="vendorContacts"){
        document.getElementById("headingmessage").innerHTML="Contacts";
        showContacts();
    }
   
}

function getVendorAssociationDetails()
{
    var RequirementId=document.getElementById("RequirementId").value;
    var url='Requirements/getVendorAssociationDetails.action?RequirementId='+RequirementId;
    var req=initRequest(url);
    req.onreadystatechange = function() {
        if (req.readyState == 4 && req.status == 200) {
            
            vendorAssociationGridDisplay(req.responseText);
           
        // setPrimaryAssigned(req.responseText);
        } 
    };
    req.open("GET",url,"true");
    req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req.send(null);
    
    return false;
}
function vendorAssociationGridDisplay(response){
    
    if(response!=null)
        var eduList=response.split("^");
   
    var table = document.getElementById("vendorAssociationResults");
    for(var i = table.rows.length - 1; i > 0; i--)
    {
        table.deleteRow(i);
    }

    for(var i=0;i<eduList.length-1;i++){   
       
        var Values=eduList[i].split("|");
        {  
         
         
            var row = $("<tr />")
          
            $("#vendorAssociationResults").append(row); // this will append tr
														// element to table...
														// keep its reference
														// for a while since we
														// will add cels into it
            row.append($('<td><a href="" class="vendorAssoEdit_popup_open" onclick="associationEditOverlay('+Values[0]+');" > ' + Values[1] + "</td>"));
            row.append($("<td>" + Values[2] + "</td>"));
            row.append($("<td>" + Values[3] + "</td>"));
            row.append($("<td>" + Values[5] + "</td>"));
            row.append($("<td>" + Values[6] + "</td>"))
            row.append($("<td>" + Values[4] + "</td>"));
        // row.append($("<td>" + Values[4] + "</td>"));
        // row.append($("<td>" + Values[4] + "</td>"));
        // row.append($('<td><a href="#"
		// onclick="saveVendorContactDetails('+Values[0]+')">' + "CLICK" +
		// "</td>"));
        // row.append($("<td>" + Values[4] + "</td>"));
        // row.append($("<td>" + Values[7] + "</td>"));
        // onclick="saveContactDetails(' + Values[0] +');" > '
        }
    }
  
    pager.init(); 
    pager.showPageNav('pager', 'contactPageNavPosition'); 
    pager.showPage(1);
    els
    {
        $("#vendorAssociationResults").append(row); // this will append tr
													// element to table... keep
													// its reference for a while
													// since we will add cels
													// into it
        row.append($("<td>" + "No Records Display" + "</td>"));
    }
}
 
function searchVendorAssociationDetails()
{
    var tireType=document.getElementById("tireType").value;
    // alert(tireType)
    var status=document.getElementById("status").value;
    var RequirementId=$('#RequirementId').val();
    // alert(status)
    var url='Requirements/searchVendorAssociationDetails.action?tireType='+tireType+'&status='+status+'&RequirementId='+RequirementId;
    var req=initRequest(url);
    req.onreadystatechange = function() {
        if (req.readyState == 4 && req.status == 200) {
            
            vendorAssociationGridDisplay(req.responseText);
           
        // setPrimaryAssigned(req.responseText);
        } 
    };
    req.open("GET",url,"true");
    req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req.send(null);
    
    return false;
}

// for add con functions by rk start
function storeReqIdinOverlay(reqId){
    // alert(reqId)
    // e1
    $("e1").html("");
    document.getElementById("proofType").value="N";
    document.getElementById("ppno").value=" ";
    document.getElementById("pan").value=" ";
    document.getElementById("ratePerHour").value=" ";
    document.getElementById("conEmail").value=" ";
    document.getElementById("panId").style.display = 'none';
    document.getElementById("ppId").style.display = 'none';
    document.getElementById("reqId").value=reqId;
    var specialBox = document.getElementById("addVendorConsultantOverlay");
    
    if(specialBox.style.display == "block"){       
        specialBox.style.display = "none";         
        

    } else {
        specialBox.style.display = "block";      
        

    }
    // Initialize the plugin

    $('#addVendorConsultant_popup').popup(      
        ); 
}

function getEmailExistance(){
    // alert("HI im in email existance")
    var id=document.getElementById('skillListValue').value;
    var topicId=document.getElementById('skillListValue');
    if($("div").is("#skillListValue"))
    {
        $("#skillListValue").remove();
        $(".skilllist").after('<select id="skillListValue" class="selectivity-result-item "   onclick="" multiple="multiple" tabindex="10" name="skillListValue "><option value="-1">Select skill</option></select>');
    }
    $("#actionMessage").html(""); 
    var conEmail=$("#conEmail").val();
    var reqId=$("#reqId").val();
    var resourceType=$("#resourceType").val();
    var contactType=$("#contactType").val();
    if(conEmail.replace(/\s/g, '')=="" )
    {
        $("e1").html(" <font color='red'>Please Enter email</font>");
        $("e1").css("margin-left", "30px");
        $("#skillField").css('display', 'none'); 

        return false;  
    }
    // alert(conEmail+" and...........> "+reqId)
    // alert(resourceType)
    if(EmailValidation1(conEmail)){
        var url='../../recruitment/consultant/getConsultanceExistance.action?conEmail='+conEmail+'&resourceType='+resourceType+'&reqId='+reqId+'&contactType='+contactType;
        // alert(url);
        var req=initRequest(url);
        req.onreadystatechange = function() {
            // alert("success")
            if (req.readyState == 4 && req.status == 200) {
              
                var resultMsg=req.responseText;
                if(resultMsg!=""){
                    var Values=resultMsg.split("#");
                    if(Values[2]!=""){
                        document.getElementById("ssnNo").value=Values[2];
                        document.getElementById("ssnNo").readOnly = true; 
                    }
                    else{
                        document.getElementById("ssnNo").readOnly = false;
                        document.getElementById("ssnNo").value ="";
                    }
                    // alert(Values[0])
                    // alert(Values[1])
                    if(Values[0]==3){
                        $("e1").html("");
                        $("e1").html(" <font color='red'>Already consultant exists.</font>");
                        $("e1").css("margin-left", "30px");
                        document.getElementById("conEmail").value="";
                        // $("#IsEmployee").css('visibility', 'hidden');
                        $("#skillField").css('display', 'none');
                    }
                    if(Values[0]==2){
                        $("e1").html("");
                        $("e1").html(" <font color='green'>Email is valid.</font>");
                        $("e1").css("margin-left", "30px");
                        $("#skillField").css('display', 'block');
                    }
                    if(Values[0]==1){
                        // alert("sorry email doesnt exist")
                        $("e1").html("");
                        $("e1").html(" <font color='red'>Sorry email doesn't exist.</font>");
                        $("e1").css("margin-left", "30px");
                        document.getElementById("conEmail").value="";
                        $("#skillField").css('display', 'none');
                    // $("#IsEmployee").css('visibility', 'hidden');
                    }
                    document.getElementById("resourceType").value=Values[1];
                    var val=  Values[3].replace(/[\[\]']+/g,'');
                    // resourceVendorType();
                    setSkillForVendorEmployee(val,id);
                } else{
                    $("e1").html("");
                    $("e1").html("<font color='red'>Sorry email doesn't exist.</font>");
                    $("e1").css("margin-left", "30px");
                    document.getElementById("conEmail").value="";
                    document.getElementById("resourceType").value="Val";
                    $("#skillField").css('display', 'none');
                // $("#IsEmployee").css('visibility', 'hidden');
                // resourceVendorType();
                }
            }
        };
        req.open("GET",url,"true");
        req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
        req.send(null);
    }else{
        $("e1").html("");
        $("e1").html("<font color='red'>Sorry email not valid.</font>");
        $("e1").css("margin-left", "30px");
        $("#skillField").css('display', 'none');
    // $("#IsEmployee").css('visibility', 'hidden');
    }
    return false;
}

function EmailValidation1(email){
   
    var status=email;
   
    re=/[^@]+@[^@]+\.[a-zA-Z]{2,}/;
    if(!re.test(status))
    {
        return false;
    }
    else
    {
        return true
    }
}
function checkRecordInReqConRel(conId,reqId){
    // alert(conId+" |||||||||| "+reqId)
    var url='Requirements/checkRecordInReqConRel.action?conId='+conId+'&reqId='+reqId;
    // alert(url);
    var req=initRequest(url);
    req.onreadystatechange = function() {
        if (req.readyState == 4 && req.status == 200) {
            if(req.responseText!="0"){
                var vals=req.responseText.split("|");
                // alert(vals[0]+" and "+vals[1]+" and "+vals[2]);
            
                if(vals[0]=="PN"){
                    document.getElementById("pan").value=vals[1];
                    document.getElementById("proofType").value=vals[0];
                    setPPorPAN("PN");
                }
                if(vals[0]=="PP"){
                    document.getElementById("ppno").value=vals[1];
                    document.getElementById("proofType").value=vals[0];
                    setPPorPAN("PP");
                } 
            }
            else{
                $("e1").html(" <font color='red'>You dont have any proof add any one</font>");
            }
            
        } 
    };
    req.open("GET",url,"true");
    req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req.send(null);
    
    return false;
}
function addconsultantValidation(){
    var fullPath = document.getElementById('file').value;
  
    // alert(fullPath);
    var skillCatArry = [];    
    $("#skillListValue :selected").each(function(){
        skillCatArry.push($(this).val()); 
    });
    document.getElementById("propsedSkills").value=skillCatArry;
    $("#actionMessage").html(""); 
    // alert("called submit function here")
    // var resourceType=$("#resourceType").val();
    var conEmail=$("#conEmail").val();
    // var proofType=$("#proofType").val();//1=passport 2=pan
    var ratePerHour=$("#ratePerHour").val();
    // var ppno=$("#ppno").val();
    // var pan=$("#pan").val();
    // var reqId=$("#reqId").val();
    var file=$("#file").val();
    // var isHidden = $('#IsEmployee').is(':hidden');
    var isHidden=$('#IsEmployee').css('visibility') == 'hidden';
    // alert(isHidden);
    // alert(conEmail);
    // alert(ratePerHour);
    // alert(file);
    emailpattern=/[^@]+@[^@]+\.[a-zA-Z]{2,}/;
    ratepattern = /^[0-9]+$/;
    var requirementMaxRate=document.getElementById("requirementMaxRate").value;
    
    // alert("type:"+proofType+" passport:"+ppno+" pan:"+pan+" reqId:"+reqId)
    if(conEmail=="")
    {
        // alert("no email");
        $("e1").html(" <font color='red'>Email Should not be empty</font>");
        $("e1").css("margin-left", "30px");
        return false;
    }
    if(ratePerHour=="")
    {
        // alert("no ratePerHour");
        $("e1").html(" <font color='red'>Please Enter Rate/Hr </font>");
        $("e1").css("margin-left", "30px");
        return false;
    }
    if(skillCatArry==""){
       
        $("e1").html(" <font color='red'>Please select Skill</font>");
        $("e1").css("margin-left", "30px");
        // $("#skillListValue").css("border", "1px solid red");
        // $("e1").show().delay(4000).fadeOut();
        return false;
    } else{
        $("e1").html("");
        $("#skillListValue").css("border", "1px solid green");
    }
    if(!emailpattern.test(conEmail))
    {
        // alert("no email");
        $("e1").html(" <font color='red'>Email Must be Valid</font>");
        $("e1").css("margin-left", "30px");
        return false;
    }
    if(!ratepattern.test(ratePerHour))
    {
        // alert("no ratePerHour");
        $("e1").html(" <font color='red'>Rate/Hr Must be valid</font>");
        $("e1").css("margin-left", "30px");
        return false;
    }
    if(file=="" && isHidden==false)
    {
        // alert("no ratePerHour");
        $("e1").html(" <font color='red'>Please upload the attachment</font>");
        $("e1").css("margin-left", "30px");
        return false;
    }
    if(ratePerHour>requirementMaxRate)
	{
	document.getElementById("requirementMaxRate").value="";
	$("e1").html("<font color=red>Please enter Rate/Hr less than Maximum Rate</font>");
	return false;
	}

    if(file!='' && isHidden==false)
    { 
        // 
        // document.getElementById('message').innerHTML = '';
        var fullPath = document.getElementById('file').value;
  
        // alert(fullPath);
        var size = document.getElementById('file').files[0].size;
        var extension = fullPath.substring(fullPath.lastIndexOf('.')+1);

        if(extension=="pdf"||extension=="doc"|| extension=="docx"){
            var size = document.getElementById('file').files[0].size;
            // alert(parseInt(size));
            // alert(fullPath.length);
            if(fullPath.length>50){
                // alert(fullPath.length);
                document.getElementById('file').value = '';
                $("e1").html(" <font color=red>File name length must be less than 50 characters!</font>");
                // document.getElementById('message').innerHTML = "<font
				// color=red>File name length must be less than 50
				// characters!</font>"
                // showAlertModal("File size must be less than 2 MB");
                return (false);
            }
            else 
            {
                if(parseInt(size)<2097152) {
                
                  
                }else {
                    document.getElementById('file').value = '';
                    $("e1").html("<font color=red>File size must be less than 2 MB.</font>");
                    // document.getElementById('message').innerHTML = "<font
					// color=red>File size must be less than 2 MB.</font>"
                    // showAlertModal("File size must be less than 2 MB");
                    return (false);
                }
            }
        }
        else 
        {
            document.getElementById('file').value = "";
            $("e1").html("<font color=red>Invalid file extension! Please select pdf or doc or docx file.</font>");
            // document.getElementById('message').innerHTML = "<font
			// color=red>Invalid file extension!Please select pdf or doc or docx
			// or gif or jpg or png or jpeg file.</font>"
            return false;
        }
    }

        
    //  
     
        
    /*
	 * var allowed_extensions = new Array("pdf","doc","docx"); var
	 * file_extension = file.split('.').pop(); // split function will split the
	 * filename by dot(.), and pop function will pop the last element from the
	 * array which will give you the extension as well. If there will be no
	 * extension then it will return the filename.
	 * 
	 * for(var i = 0; i < allowed_extensions.length; i++) {
	 * if(allowed_extensions[i]==file_extension) { return true; // valid file
	 * extension } } $("e1").html(" <b><font color='red'>The file uploaded is
	 * invalid type</font></b>"); $("e1").css("margin-left", "30px"); return
	 * false; }
	 */
    // else
    // {
    // // var
	// url='Requirements/storeProofData.action?proofType='+proofType+'&ppno='+ppno+'&pan='+pan+'&reqId='+reqId+'&conEmail='+conEmail+'&ratePerHour='+ratePerHour;
    // // alert(url);
    // var req=initRequest(url);
    // req.onreadystatechange = function() {
    // if (req.readyState == 4 && req.status == 200) {
    // if(req.responseText=="NotExist"){
    // $("e1").html(" <b><font color='red'>You dont have consultant
	// account</font></b>");
    // }else if(req.responseText=="updatesuccess"){
    // $("e1").html(" <b><font color='green'>Your Identification For Requirement
	// Activated</font></b>");
    // }else if(req.responseText=="lessthanoneEighty"){
    // $("e1").html(" <b><font color='green'>Already your Identification is in
	// Activation</font></b>");
    // }else if(req.responseText=="AddSuccess"){
    // $("e1").html(" <b><font color='green'>Your Identification for Requirement
	// is Added</font></b>");
    // }else{
    // $("e1").html(" <b><font color='green'>Error</font></b>");
    // }
    // }
    // };
    // req.open("GET",url,"true");
    // req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    // req.send(null);
    
    return true;
   
}
function setPPorPAN(proofType){
    // alert("HI im in PAN or PASSPORT")
    // alert(proofType)
    if(proofType=="PN"){
        document.getElementById("panId").style.display= '';
        document.getElementById("ppId").style.display= 'none';
        $("#panId").css('visibility', 'visible');
        $("#ppId").css('visibility', 'hidden');
    }
    if(proofType=="PP"){
        document.getElementById("panId").style.display= 'none';
        document.getElementById("ppId").style.display= '';
     
        $("#ppId").css('visibility', 'visible');
        $("#panId").css('visibility', 'hidden');
    }
    if(proofType=="N"){
        document.getElementById("panId").style.display= 'none';
        document.getElementById("ppId").style.display= 'none';
     
    }
}


$(document).ready(function(){
    
    $('#Contact_popup').popup(); 
});
$(document).ready(function(){
    
    $('#addConsultant_popup').popup(); 
});


// for add con functions end
function getConsultantListBySearch(){
    var RequirementId=$('#RequirementId').val();
    var consult_name=$('#consult_name').val();
    var consult_email=$("#consult_email").val();
    var consult_skill=$('#consult_skill').val();
    var consult_phno=$('#consult_phno').val();
    var accountFlag=$('#accountFlag').val();
    var url='Requirements/getConsultantListBySearch?RequirementId='+RequirementId+'&consult_name='+consult_name+
    '&consult_email='+consult_email+'&consult_skill='+consult_skill+'&consult_phno='+consult_phno;
    var req=initRequest(url);
    req.onreadystatechange = function() {
        if (req.readyState == 4 && req.status == 200) {
            consultantListGridDisplay(req.responseText);
        } 
    };
    req.open("GET",url,"true");
    req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req.send(null);
    
    return false;     
    
}
function getConsultantList(){
 
    var RequirementId=$('#RequirementId').val();
    var url='Requirements/getConsultantList.action?RequirementId='+RequirementId;
  // alert("hi2"+url)
    var req=initRequest(url);
    req.onreadystatechange = function() {
    	
        if (req.readyState == 4 && req.status == 200) {
        	 
            consultantListGridDisplay(req.responseText);
        } 
    };
    req.open("GET",url,"true");
    req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req.send(null);
    
    return false;  
}


function getSubmittedListBySearch(){
    var RequirementId=$('#RequirementId').val();
    var vendorName=$('#vendorName').val();
    var consult_name=$('#consult_name').val();
    var consult_lstname=$('#consult_lstname').val();
    
    var consult_email=$("#consult_email").val();
    var consult_skill=$('#consult_skill').val();
    var consult_phno=$('#consult_phno').val();
    var accountFlag=$('#accountFlag').val();
    var submittedFrom=$('#submittedFrom').val();
    var submittedEnd=$('#submittedEnd').val();
    var consultStatus=$('#consultStatus').val();
    
    if(submittedFrom!=''){
        if(submittedEnd==''){
            $("#submittedEnd").css("border", "1px solid red");
            $('#submissionValidation').html(" <font color='red'>Please Enter Submitted To Date</font>");

            $('#submissionValidation').show().delay(4000).fadeOut();

            return false;
        }
        
    }
    if(submittedEnd!=''){
        if(submittedFrom==''){
            $("#submittedFrom").css("border", "1px solid red");
            $('#submissionValidation').html(" <font color='red'>Please Enter Submitted From Date</font>");

            $('#submissionValidation').show().delay(4000).fadeOut();

            return false;
        }
        
    }
    if(submittedFrom!= '' && submittedEnd!= '' )
    {
        // alert("hello")
        var splitReqStartDate = submittedFrom.split('-');
        var reqAddStartDate = new Date(splitReqStartDate[2], splitReqStartDate[0]-1 , splitReqStartDate[1]); // Y M
																												// D
        var splitReqEndDate = submittedEnd.split('-');
        var reqAddtargetDate = new Date(splitReqEndDate[2], splitReqEndDate[0]-1, splitReqEndDate[1]); // Y M
																										// D
        var reqStartDate = Date.parse(reqAddStartDate);
        var reqTargetDate= Date.parse(reqAddtargetDate);
        var  difference=(reqTargetDate - reqStartDate) / (86400000 * 7);
        if(difference<0)
        {
             
       
            $('#submissionValidation').html(" <font color='red'>From date Must be less than To date</font>");

            $('#submissionValidation').show().delay(4000).fadeOut();

            return false;
        }
    
    }
    
    
    var url='Requirements/getSubmittedSearch?vendorName='+vendorName+'&consult_name='+consult_name+'&consult_lstname='+consult_lstname+
    '&consult_email='+consult_email+'&submittedFrom='+submittedFrom+'&submittedEnd='+submittedEnd+'&consultStatus='+consultStatus;
    var req=initRequest(url);
    req.onreadystatechange = function() {
    	document.getElementById('loadingConsultant').style.display = 'block';
        if (req.readyState == 4 && req.status == 200) {
        	
        	 $('#loadingConsultant').hide();
        	submittedListGridDisplay(req.responseText);
        } 
    };
    req.open("GET",url,"true");
    req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req.send(null);
    
    return false;     
    
}


function getSubmittedList(){ 
	// console.log("ajax call");
	// alert("ajax call");
	
    var RequirementId=$('#RequirementId').val();
    var url='Requirements/getAllSubmittedList.action';
  // alert("hi2"+url)
    var req=initRequest(url);
    req.onreadystatechange = function() {
    	document.getElementById('loadingConsultant').style.display = 'block';
        if (req.readyState == 4 && req.status == 200) {
        	$('#loadingConsultant').hide();
            submittedListGridDisplay(req.responseText);
        } 
    };
    req.open("GET",url,"true");
    req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req.send(null);
    return false;  
}
function submittedListGridDisplay(response) { 
	var pageFlag=$("#pageFlag").val();
    $(".page_option").css('display', 'block');
    $(".pagination").css('display', 'block');
    var typeOfUser = $('#typeOfUser').val();
    // alert(typeOfUser)
    var requirementId = $("#RequirementId").val();
    var accountFlag = $('#accountFlag').val();
    var consultFlag = "customer";
    var vendor = $('#vendor').val();
    var accountSearchID = $('#accountSearchID').val();
    var csrRoleId = $('#csrRoleId').val();
    // alert(csrRoleId);
    
    var jdId = $('#jdId').val()
    var customerFlag = $('#customerFlag').val();
    var RequirementTaxTerm = $("#RequirementTaxTerm").val();
    // alert(RequirementTaxTerm)
    if (response != null)
        var eduList = response.split("^");

    var table = document.getElementById("consultantListTable");
    for (var i = table.rows.length - 1; i > 0; i--)
    {
        table.deleteRow(i);
    }
    var res;
 if (response.length > 0) {
        for (var i = 0; i < eduList.length - 1; i++) {

            var Values = eduList[i].split("|");
            {
 
                var row = $("<tr />")

                res = Values[16];
                $("#consultantListTable").append(row); // this will append tr
														// element to table...
														// keep its reference
														// for a while since we
														// will add cels into it
                row.append($("<td>" + Values[19] + "</td>"));
                row.append($("<td>" + Values[18] + "</td>"));
                var v_comments = Values[15].trim().replace(/ /g, '%20');
              
                   // row.append($('<td><a
					// href=../recruitment/consultant/getConsultantDetails.action?vendor='
					// + vendor + '&consult_id=' + Values[0] + '&consultFlag=' +
					// consultFlag + '&requirementId=' + Values[21] +
					// '&accountSearchID=' + accountSearchID + '&accountFlag=' +
					// accountFlag + '&jdId=' + jdId + '&customerFlag=' +
					// customerFlag + '&consult_salary=' + Values[8] +
					// '&vendorcomments=' + v_comments + ">" + Values[1] +
					// "</a></td>"));
                   // row.append($('<td><a
					// href=../recruitment/consultant/getConsultantDetails.action?vendor='
					// + vendor + '&consult_id=' + Values[0] + '&consultFlag=' +
					// consultFlag + '&requirementId=' + Values[19] +
					// '&accountSearchID=' + accountSearchID + '&accountFlag=' +
					// accountFlag + '&jdId=' + jdId + '&customerFlag=' +
					// customerFlag + '&consult_salary=' + Values[8] +
					// '&vendorcomments=' + v_comments + ">" + Values[1] +
					// "</a></td>"));
                  // row.append($('<td><a
					// href=../recruitment/consultantLogin/getConsultantProfile.action?consult_id='
					// + Values[0] + '&requirementId=' + Values[21] +
					// '&accountFlag=CSR&consultStatus='+Values[5]+">"+Values[1]+"</a></td>"));
                   row.append($('<td><a href=../recruitment/consultantLogin/getConsultantProfile.action?pageFlag='+pageFlag+'&consult_id=' + Values[0] + '&requirementId=' + Values[21] + '&accountFlag='+Values[22]+'&consultStatus='+Values[5]+">"+Values[1]+"</a></td>"));

                // row.append($("<td>" + Values[7] + "</td>"));
                row.append($("<td>" + Values[11] + "</td>")); // postedDate
                // row.append($("<td>" + Values[14] + "</td>"));
               
                    row.append($("<td>" + Values[2] + "</td>"));
               
                /*
				 * if (Values[3] == 'null' || Values[3] == "") { Values[3] = "";
				 * row.append($('<td><a href="#"
				 * class="recSkillOverlay_popup_open" onclick="
				 * showSkillDetailsCustomer(\'' + Values[3] + '\');" >' +
				 * Values[3].substr(0, 10) + "</td>")); } else {
				 * row.append($('<td><a href="#"
				 * class="recSkillOverlay_popup_open" onclick="
				 * showSkillDetailsCustomer(\'' + Values[3] + '\');" >' +
				 * Values[3].substr(0, 10) + "...</td>")); }
				 */
                
                    row.append($("<td>" + Values[4] + "</td>"));
               
               /* row.append("<td>" + Values[17] + "</td>"); */
                if (accountFlag != 'csr')
                {
                    if (Values[5] == 'Withdraw')
                    {
                        var okDisable = "okDisable";
                        row.append($('<td><a href="#" class="conWithdraw_popup_open" onclick="consultantWithdrawnPopup(\'' + okDisable + '\',\'' + Values[12] + '\');">' + Values[5] + '</td>')); // Values[10]
																																																	// withdraw
																																																	// comments.
                    }
                    else
                    {
                        if (vendor == 'yes') {
                            var okDisable = "customercomments";
                            row.append($('<td><a href="#" class="conWithdraw_popup_open" onclick="consultantWithdrawnPopup(\'' + okDisable + '\',\'' + Values[13] + '\');">' + Values[5] + '</td>'));
                            // row.append($("<td>" + Values[5] + "</td>")); //
							// need to put overlay for declanining..
                        }
                        else
                        {
                            if (Values[5] == 'Processing')
                            {
                                // row.append($("<td>" + Values[5] + "</td>"));
                                row.append($('<td><a href="#" class="decline_popup_open" onclick=consultantDeclinePopup(\'' + vendor + '\',' + Values[0] + ',' + Values[21] + ',' + Values[9] + ');>' + Values[5] + '</td>')); // need
																																																								// to
																																																								// put
																																																								// overlay
																																																								// for
																																																								// declanining..
                            }
                            else
                            {
                                var okDisable = "customercomments";
                                row.append($('<td><a href="#" class="conWithdraw_popup_open" onclick="consultantWithdrawnPopup(\'' + okDisable + '\',\'' + Values[13] + '\');">' + Values[5] + '</td>'));
                                // row.append($("<td>" + Values[5] + "</td>"));
                            }

                        }
                    }
                }
                else
                {
                    row.append($('<td>' + Values[5] + '</td>'));
                   
                }
                row.append($('<td><a href="#" class="conWithdraw_popup_open" onclick="uploadBackgroundAttachment('+ Values[0]+','+Values[21]+');">Click to Initiate</td>'));
                row.append($("<td>$" + Values[8] + "/Hr.</td>"));

                row.append($("<td><figcaption><button type='button' value=" + Values[6] + " onclick=doAttachmentDownload(" + Values[6] + ")><i class='fa fa-download ' ></i></button></figcaption></td>"));
               
                if (vendor != 'yes' && accountFlag != 'csr') {
                    row.append($('<td><a href=/sb/Requirements/techReview.action?requirementId=' + Values[21] + '&consult_id=' + Values[0] + '&accountSearchID=' + accountSearchID + '&jdId=' + jdId + '&accountFlag=' + accountFlag + '&techReviewStatus=' + Values[5] + ">Click</td>"));
                }
                if(csrRoleId == 1){
                   	if(Values[20] == "null"){
                    		               
                    		row.append($('<td> -- </td>'));
                    	}
                    	else{
                    		row.append($('<td>' + Values[20] + '</td>'));
                    		
                    	}
                 }

                if (accountFlag != 'csr') {
                    if (typeOfUser == 'AC') {
                        if (RequirementTaxTerm == 'PE' && (Values[5] == 'Selected' || Values[5] == 'Denied')) {
                            row.append($('<td><a href="#" class="SOW_popup_open" onclick=SOWPopup(\'' + Values[0] + '\',\'' + Values[8] + '\');><img src="../includes/images/go.gif" height="20" width="25"></td>'));
                        } else {
                            row.append($('<td><a href="#" ><img style="opacity: 0.4;cursor:default" src="../includes/images/go.gif" height="20" width="25"></td>'));
                        }
                    } else {
                        if (RequirementTaxTerm == 'CO' && (Values[5] == 'Selected' || Values[5] == 'Denied')) {
                            row.append($('<td><a href="#" class="SOW_popup_open" onclick=SOWPopup(\'' + Values[0] + '\',\'' + Values[8] + '\');><img src="../includes/images/go.gif" height="20" width="25"></td>'));
                        } else {
                            row.append($('<td><a href="#" ><img style="opacity: 0.4;cursor:default" src="../includes/images/go.gif" height="20" width="25"></td>'));
                        }
                    }
                }
                
                    if (Values[5] == 'Withdraw' || Values[5] == 'Rejected') {
                        row.append($('<td><a href="#" ><img style="opacity: 0.4;cursor:default" src="../includes/images/removeCons.png" height="20" width="20"></td>'));
                    } else {
                        row.append($('<td><a href="#" class="conWithdraw_popup_open" onclick=consultantWithdrawnPopup(' + Values[0] + ',' + Values[21] + ');><img src="../includes/images/removeCons.png" height="20" width="20"></td>'));
                    }
               
            }
        }
 }
 else
 {
     var row = $("<tr />")
     $("#consultantListTable").append(row);
     row.append($('<td colspan="11"><font style="color: red;font-size: 15px;">No Records to display</font></td>'));
     // document.getElementById("downloading_grid").style.display = "none";
   
 }

 $('#consultantListTable').tablePaginate({
		navigateType : 'navigator'
	}, recordPage);
}
/*
 * function consultantListGridDisplay(response){ var
 * requirementId=$("#RequirementId").val(); var
 * accountFlag=$('#accountFlag').val(); // alert("response"+response);
 * if(response!=null) var eduList=response.split("^");
 * 
 * var table = document.getElementById("consultantListTable"); for(var i =
 * table.rows.length - 1; i > 0; i--) { table.deleteRow(i); }
 * //alert("eduList.length--"+eduList.length); for(var i=0;i<eduList.length-1;i++){
 * var vendor="vendor"; var Values=eduList[i].split("|"); {
 * 
 * 
 * var row = $("<tr />")
 * 
 * $("#consultantListTable").append(row); //this will append tr element to
 * table... keep its reference for a while since we will add cels into it
 * row.append($('<td><a
 * href=../recruitment/consultant/getConsultantDetails.action?consult_id='+Values[0]+
 * '&consultFlag='+vendor+ ">" + Values[1] + "</a></td>")); row.append($("<td>" +
 * Values[2] + "</td>")); row.append($("<td>" + Values[3] + "</td>"));
 * row.append($("<td>" + Values[4] + "</td>")); row.append($("<td>" +
 * Values[5] + "</td>")); row.append($("<td><figcaption><button
 * type='button' value="+ Values[6] +" onclick=doAttachmentDownload("+ Values[6]
 * +")><img src='./../includes/images/download.png' height='20' width='20' ></button></figcaption></td>"));
 * if(accountFlag!='VendorReq'){ row.append($('<td><a
 * href=.././Requirements/techReview.action?requirementId='+requirementId+'&consult_id='+Values[0]+">Click</td>")); } } }
 * 
 * pager.init(); pager.showPageNav('pager', 'contactPageNavPosition');
 * pager.showPage(1); }
 * 
 */


function doAttachmentDownload(acc_attachment_id)
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

function doReleaseRequirement(){
    var count =0;
    var vendorsIdString = document.getElementById("vendorsIdString").value;
    var id =document.getElementById("requirementId").value  ;
    var orgId= document.getElementById("orgId").value ;
    var taxTerm=document.getElementById("taxTerm").value ;
    var vendorIds=vendorsIdString.split("^^");
    var vendorOrgIds='';
    var check1=document.getElementById("allVendors").checked;
	if(check1 ==true){
		vendorOrgIds = "All";
		count = 1;
	}
    for(var i =0;i<vendorIds.length-1;i++){
        var check=document.getElementById("vendor"+vendorIds[i]).checked;
        if(check==true){
            if (count>=1){
                vendorOrgIds += ","+vendorIds[i];
            }else{
                vendorOrgIds += vendorIds[i];
            }
            count = count +1;
        }
    }
    if(count==0){
        $("releaseMessage").html(" <font color='red'>Please select atleast one vendor</font>");
        $("#reqResultMsg").fadeOut(5000);
        return false;
    }
    $("releaseMessage").html("");
    $("reqResultMsg").show();
    var requirementId=id;
    var url='Requirements/doReleaseRequirements.action?requirementId='+requirementId+
    '&orgId='+orgId+'&taxTerm='+taxTerm+'&vendorOrgIds='+vendorOrgIds;
    var req=initRequest(url);
    req.onreadystatechange = function() {
        if (req.readyState == 4 && req.status == 200) {
            if(req.responseText==0){
                $("releaseMessage").html(" <font color='red'>Requirement already Released</font>");
            }
            else{
            	if(vendorOrgIds=="All"){
            		  $("releaseMessage").html(" <font color='green'>Requirement release for all the Associated Vendors.</font>");
            	}
            	
            	else if(taxTerm=='CO'){
                    $("releaseMessage").html(" <font color='green'>Requirement release for Tier1 Vendors</font>");
                }else{
                    $("releaseMessage").html(" <font color='green'>Requirement release for Head Hunters Vendors</font>");
                }
            }
            document.getElementById("vendorReleaseButton").style.display = 'none';
            // getSearchRequirementsList();
            $("#reqResultMsg").fadeOut(5000);
        } 
    };
    req.open("GET",url,"true");
    req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req.send(null);
    return false;     
}


// added by jagan
function showReqSkillOverlay(id)
{
    
    var url='getSkillOverlay.action?id='+id;
    
    var req=initRequest(url);
    req.onreadystatechange = function() {
        if (req.readyState == 4 && req.status == 200) {
            // alert("result is::")
            // setVendorStates(req.responseText);
            setSkillOverlay(req.responseText)
        } 
    // alert(req.readyState +" and "+req.status)

    };
    req.open("GET",url,"true");
    req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req.send(null);   
   
    var specialBox = document.getElementById("reqskillBox");
    if(specialBox.style.display == "block"){       
        specialBox.style.display = "none";         
        

    } else {
        specialBox.style.display = "block";      
        

    }
    // Initialize the plugin

    $('#recSkillOverlay_popup').popup(   
        );
    return false;
}
function setSkillOverlay(response){
    var Values=response.split("|");
    document.getElementById("reqSkillDetails").value=Values[0];
// document.getElementById("recruiterEmailIdOverlay").value=Values[1];
// document.getElementById("recruiterPhoneOverlay").value=Values[2];

}


function showPreReqSkillOverlay(id)
{
    
    var url='getPreSkillOverlay.action?id='+id;
    
    var req=initRequest(url);
    req.onreadystatechange = function() {
        if (req.readyState == 4 && req.status == 200) {
            // alert("result is::")
            // setVendorStates(req.responseText);
            setPreSkillOverlay(req.responseText)
        } 
    // alert(req.readyState +" and "+req.status)

    };
    req.open("GET",url,"true");
    req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req.send(null);   
   
    // document.getElementById("preSkillDetails").value=response;
    var specialBox = document.getElementById("preskillBox");
    if(specialBox.style.display == "block"){       
        specialBox.style.display = "none";         
        

    } else {
        specialBox.style.display = "block";      
        

    }
    // Initialize the plugin

    $('#preSkillOverlay_popup').popup(      
        );
    return false;
}
function setPreSkillOverlay(response){
    var Values=response.split("|");
    document.getElementById("preSkillDetails").value=Values[0];
// document.getElementById("recruiterEmailIdOverlay").value=Values[1];
// document.getElementById("recruiterPhoneOverlay").value=Values[2];

}
function clearConultantAddOverlay()
{
    $("e1").html(" "); 
    
}
function resourceVendorType(){
    var resourceType=document.getElementById("resourceType").value;
    if(resourceType=="VC"){
        $("#IsEmployee").css('visibility', 'visible');   
       
    }else{
        $("#IsEmployee").css('visibility', 'hidden');
    }
}
function ratePerHourValidation(){
    
    $("#actionMessage").html(""); 
    var rate=document.getElementById("ratePerHour").value;
    pattern = /^[0-9]+$/;
    if(rate=="" || rate==null){
        $("e1").html("<font color='red'>Field is required</font>");
        $("e1").css("margin-left", "30px");
        $("#ratePerHour").css("border", "1px solid red");
        return false;
    }
    else if(!pattern.test(rate))
    {
        $("e1").html("<font color='red'>Must be valid number");
        $("e1").css("margin-left", "30px");
        $("#ratePerHour").css("border", "1px solid red");
        document.getElementById("ratePerHour").value="";
        return false;
    }
    else
    {
        $("#ratePerHour").css("border", "1px solid green");
        $("e1").html("");
       
    }
    return true;
}
function dateReqValidation(startDate,endDate,validatemessage)
{
  // alert("helloDatesValidation")
    var splitTaskStartDate = startDate.split('-');
    var taskAddStartDate = new Date(splitTaskStartDate[2], splitTaskStartDate[0]-1 , splitTaskStartDate[1]); // Y M
																												// D
    var splitTaskEndDate = endDate.split('-');
    var taskAddtargetDate = new Date(splitTaskEndDate[2], splitTaskEndDate[0]-1, splitTaskEndDate[1]); // Y M
																										// D
    var taskStartDate = Date.parse(taskAddStartDate);
    var taskTargetDate= Date.parse(taskAddtargetDate);
    var  difference=(taskTargetDate - taskStartDate) / (86400000 * 7);
    if(difference<0)
    {
             
       
        $(validatemessage).html(" <font color='red'>Start date Must be less than End date</font>");
        // $("#startDate").css("border", "1px solid red");
        // $("#endDate").css("border", "1px solid red");
        $(validatemessage).show().delay(4000).fadeOut();
        // $("#startDate").show().delay(5000).fadeOut();
        // $("#endDate").show().delay(5000).fadeOut();
        return false;
    }
    
  
}
function enterDateRepository(id)
{
    $(id).val("");
    return false;
   
}

function setSkillForVendorEmployee(skillId,topicId){
    var ctr=0;
    var skillList=document.getElementById("tempSkillList").value;
   // alert(skillList);
    var skillValue=  skillList.replace(/[{()}]/g, '');
    var flagList=skillValue.split("FLAG")
    var totalSkills=flagList[0].split(",");
    var flag=skillId.split("FLAG");
    var addList=flag[0].split("^");
    var $select = $('#skillListValue');
    $select.find('option').remove();   
    for (var i = 0; i < totalSkills.length; i++){ 
        var Values=totalSkills[i].split("=");
        for(var j=0;j<addList.length-1;j++){  
            var Values1=addList[j].split(",");
            // alert("Values[0]--->"+Values[0]+"Values1[0]---->"+Values1[0]);
            if (Number(Values[0]) == Number(Values1[0])) {
                ctr=1;
                break ;
            }
        }
        if(ctr==1){
            $('<option selected="true">').val(Number(Values[0])).text(Values[1]).appendTo($select); 
        }
        else{
            $('<option>').val(Number(Values[0])).text(Values[1]).appendTo($select);
        }
        ctr=0;
    }
    
   
    $('#skillListValue').selectivity({
            
        multiple: true,
        placeholder: 'Type to search Categories'
                   
    });
    $("#skillListValue").show();
    $("#IsEmployee").show();
    
    
}
function commentsCheckCharacters(id){
    $(id).keyup(function(){
        el = $(this);
        e2 = $(this);
        var count = el.val().length + ((el.val().split('\n').length)*5);
        if(count >= 1000){
            e2.val( e2.val().substr(0, 1000-((el.val().split('\n').length)*5)) );
        } else {
            $("#charNum").text(1000-count+' Characters remaining . ');
        }
        if(count==1000)
        {
            $("#charNum").text(' Cannot enter  more than 1000 Characters .');    
        }
        
    })
    return false;
};
function display_downloadButtons(){
    var val = document.getElementById("rec_exits").value;
    if (val=="no"){
        $("#downloading_grid").css('display', 'none');
    }
    else{
        $("#downloading_grid").css('display', '');
    }
}
function clearConsultantSubmissionFields(){
    $("#conEmail").val("");
    $("#ratePerHour").val("");
    $("#ssnNo").val("");
    $("#file").val("");
    $("#skillField").css('display', 'none');  
}
function downloadPDFRequirementList(){
    var gridDownload=document.getElementById('gridDownload').value;
    var url= "../../recruitment/consultant/downloadResults.action?pdfHeaderName=Requirements List&gridDownload="
    +gridDownload+"&gridDownloadFlag=Req";
    window.location=url;
}
function downloadXLSRequirementList(){
    var gridDownload=document.getElementById('gridDownload').value;
    var url= "../../recruitment/consultant/downloadXlsResults.action?pdfHeaderName=Requirements List&gridDownload="
    +gridDownload+"&gridDownloadFlag=Req";
    window.location=url;
}

function addConReqFileValidation()
{
    // document.getElementByName('e1').innerHTML = '';
    $("e1").html("");
    var fullPath = document.getElementById('file').value;
        
    // alert(fullPath);
            
    var size = document.getElementById('file').files[0].size;
    var extension = fullPath.substring(fullPath.lastIndexOf('.')+1);
    var leafname= fullPath.split('\\').pop().split('/').pop();
    if(extension=="pdf"||extension=="doc"|| extension=="docx" ){
        var size = document.getElementById('file').files[0].size;
                  
        if(leafname.length>30){
            document.getElementById('file').value = '';
            // document.getElementName('e1').innerHTML = "<font color=red>File
			// name length must be less than 30 characters!</font>"
            $("e1").html("<font color=red>File name length must be less than 30 characters!</font>");
            // showAlertModal("File size must be less than 2 MB");
            return false;
        }
        else 
        {
            if(parseInt(size)>2097152) {
                document.getElementById('file').value = '';
                // document.getElementByName('e1').innerHTML = "<font
				// color=red>File size must be less than 2 MB.</font>"
                $("e1").html("<font color=red>File size must be less than 2 MB.</font>");
                // showAlertModal("File size must be less than 2 MB");
                return false;
                  
            }
            else
            {
                return true;        
            }
        }
    }
    else
    {
    
        document.getElementById('file').value = "";
        // document.getElementByName('e1').innerHTML = "<font color=red>Invalid
		// file extension!Please select pdf or doc or docx file.</font>"
        $("e1").html("<font color=red>Invalid file extension!Please select pdf or doc or docx  file.</font>");
        return false;
    } 
    
    
    
   
}

function getUserEmailForRequirement() {
	// alert("csr");
	var userEmail = $("#conEmail").val();
	var resourceType=$("#contactType").val();
	var rno = Math.random();
	// var toCSR=$("#toCSR").val();
	if (userEmail == "") {
		clearTable();
	} else if (userEmail != "") {
		if (userEmail.length >= 3) {
			url = CONTENXT_PATH + "/recruitment/consultant/getUserEmailForRequirement.action?empName="
					+ userEmail +"&resourceType=" + resourceType + "&rno=" + rno;
			// alert(url)
			// }
			// alert("url-->"+url);
			var req = initRequest(url);
			req.onreadystatechange = function() {
				if (req.readyState == 4) {
					if (req.status == 200) {
						// alert(v_empName)
						// alert(req.responseXML);
						 parseUserNameForRequirement(req.responseXML);
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

function clearTable() {
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


function parseUserNameForRequirement(responseXML) {
	// alert("hii");
	clearTable();
	// alert(responseXML);
	// alert(document.getElementById("conEmail").value);
	// alert("hii");
	var consultants = responseXML.getElementsByTagName("EMPLOYEES")[0];
	// alert(consultants.childNodes.length);
	if (consultants.childNodes.length > 0) {
		completeTable.setAttribute("bordercolor", "black");
		completeTable.setAttribute("border", "0");
	} else {
	// alert("In Else");
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
		// var x = document.getElementsByTagName("e1");
	   // x[1].innerHTML="";
		document.getElementById("menu-popup").style.display = "block";
		
		for (loop = 0; loop < consultants.childNodes.length; loop++) {
			var consultant = consultants.childNodes[loop];
			var loginId = consultant.getElementsByTagName("EMPID")[0];
			var empName = consultant.getElementsByTagName("NAME")[0];
			// alert(empName.childNodes[0].nodeValue)
			// alert(loginId.childNodes[0].nodeValue)

			appendUserNameForRequirement(empName.childNodes[0].nodeValue,
					loginId.childNodes[0].nodeValue);
		}
		var position;
		// alert(document.getElementById("conEmail").value);
		position = findPosition1(document.getElementById("conEmail"));

		// var position =
		// findPosition(document.getElementById("assignedToUID"));
		posi = position.split(",");
		document.getElementById("menu-popup").style.left = posi[0] + "px";
		document.getElementById("menu-popup").style.top = (parseInt(posi[1]) + 20)
				+ "px";
		document.getElementById("menu-popup").style.display = "block";
	}
	if (chk.childNodes[0].nodeValue == "false") {
		var validationMessage = document.getElementById("validationMessage");
		 // var x = document.getElementsByTagName("e1");
	     // x[1].innerHTML="<font color=red> User doesn't Exists </font>";
		// validationMessage.innerHTML = "";
		 document.getElementById('validationMessage').innerHTML = "<font color=red> Employee doesn't Exists!</font>";
	}
	if (consultants.childNodes.length < 10) {
		// autorow1.style.overflowY = "hidden";
		autorow.style.overflowY = "hidden";
	} else {
		// autorow1.style.overflowY = "scroll";
		autorow.style.overflowY = "scroll";
	}
}

function findPosition1(oElement) {
	if (typeof (oElement.offsetParent) != undefined) {
		for (var posX = 0, posY = 0; oElement; oElement = oElement.offsetParent) {
			posX += oElement.offsetLeft;
			posY += oElement.offsetTop;
		}
		return posX + "," + posY;
	} else {
		return oElement.x + "," + oElement.y;
	}
}



function appendUserNameForRequirement(empName, loginId) {
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

	linkElement.setAttribute("href", "javascript:setUserNameForRequirement('"
			+ empName + "','" + loginId + "')");
	linkElement.appendChild(document.createTextNode(empName));
	linkElement["onclick"] = new Function("hideScrollBar()");
	nameCell.appendChild(linkElement);
}
function setUserNameForRequirement(empName, loginId) {
	clearTable();
	// alert("in set_cust");
	document.getElementById("conEmail").value = empName;
	document.getElementById("userId").value = loginId;
	// checkIsExitOrNot();
}
function checkRequirementMaxRate()
{
	// alert("in check requirementsmaxrate");
	var requirementMaxRate=document.getElementById("requirementMaxRate").value;
	var ratePerHour=document.getElementById("ratePerHour").value;
	if(ratePerHour>requirementMaxRate)
		{
		document.getElementById("ratePerHour").value="";
		$("e1").html("<font color=red>Please enter Rate/Hr less than Maximum Rate</font>");
		$("#ratePerHour").css("border", "1px solid red");
		return false;
		}
	
}

// added by anand for consultant suggession list

var app = angular.module('myApp', []);
app.controller('myCtrl', function($scope,$http) {
    $scope.conEmail = {};
     $scope.employees={};
    
  // alert("Before method"+$scope.collegueName);
    $scope.getEmployeesList=function(){
        

        
         $scope.employees ={};
     // alert("In method "+$scope.collegueName);
    // $("#coolegueLoginId").val("");
    // $("#coolegueEmail").val("");
     if($scope.conEmail.searchKey.length>2){
    
       // var contextPath =
		// "http://www.miraclesoft.com/HubbleServices/hubbleresources";
       // var contextPath =
		// "http://192.168.1.203:9999/HubbleServices/hubbleresources";
      // var securityToken="YWRtaW46YWRtaW4=";
        // ------
    	
    	 var userEmail = $("#conEmail").val();
    		var resourceType=$("#contactType").val();
    		var rno = Math.random();
    	// alert($scope.conEmail.searchKey);
        url = CONTENXT_PATH + "/recruitment/consultant/getUserEmailForRequirement.action?empName="
		+ userEmail +"&resourceType=" + resourceType + "&rno=" + rno;
        // alert(url)
         $http.post(url, {
        "SearchKey": $scope.conEmail.searchKey
       
       
      }).then(function(response) {
    	// alert("response block");
    	 // alert(response["consultant"])
          $scope.consultants = response.data.consultant;
         // $scope.$apply();
      console.log(JSON.stringify($scope.consultants));
      
        
          // alert("emp suggestionlist authenticated service");
          if (JSON.stringify(response.data.isGetting) == "true") {
             // closeNominateCollegueErrorMsg();
        	  $('.selectivity_block').show();
            $scope.employeeSuggestionListArray = response.data.consultant;
          } else if (JSON.stringify(response.data.isGetting) == "false") {
            // ionicToast.show('No employee found', 'middle', false, 1500);
         // displayCollegueNominationErrorMessage("Employee name not
			// existed!")
          }
        
      })
      .catch(function(Error){
    	   console.log("Error"+Error);
      })
     }
        
        // -----
    
}
    $scope.selectEmploye=function(consultant){
    	$('.selectivity_block').hide();
    	$("#conEmail").val(consultant.Email);
    	
 /*
	 * if(employee.LoginId!=$("#sessionLoginId").val()) { //
	 * alert(employee.Email1); $("#collegueName").val(employee.EmployeeName);
	 * $("#coolegueLoginId").val(employee.LoginId);
	 * $("#coolegueEmail").val(employee.Email1); //
	 * $scope.name=employee.EmployeeName;
	 * 
	 * }else { displayCollegueNominationErrorMessage("You should not nominate
	 * yourself need to nominate other employees"); $("#collegueName").val(""); }
	 */
    $scope.consultants ={};
    }
    
});


function getConsultantListInAddConsultant(){
	 
    var RequirementId=$('#RequirementId').val();
    var url='Requirements/getConsultantList.action?RequirementId='+RequirementId;
  // alert("hi2"+url)
    var req=initRequest(url);
    req.onreadystatechange = function() {
    	
        if (req.readyState == 4 && req.status == 200) {
        	 
        	getConsultantListInAddConsultantGridDisplay(req.responseText);
        } 
    };
    req.open("GET",url,"true");
    req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req.send(null);
    
    return false;  
}
function getConsultantListInAddConsultantGridDisplay(response){ //alert("hi")
    var requirementId=$("#RequirementId").val();
    var accountFlag=$('#accountFlag').val();
    // alert("response"+response);
    if(response!=null)
        var eduList=response.split("^");
   
    var table = document.getElementById("consultantListTable");
    for(var i = table.rows.length - 1; i > 0; i--)
    {
        table.deleteRow(i);
    }

    for(var i=0;i<eduList.length-1;i++){   
        var vendor="vendor";
        var Values=eduList[i].split("|");
        {  
         
         
            var row = $("<tr />")
          
            $("#consultantListTable").append(row); // this will append tr
													// element to table... keep
													// its reference for a while
													// since we will add cels
													// into it
            row.append($('<td><a href=../recruitment/consultant/getConsultantDetails.action?consult_id='+Values[0]+ '&consultFlag='+vendor+ ">" + Values[1] + "</a></td>"));
            row.append($("<td>" + Values[11] + "</td>"));
            row.append($("<td>" + Values[14] + "</td>"));
            row.append($("<td>" + Values[2] + "</td>"));
            
           
            row.append($("<td>" + Values[3] + "</td>"));
            row.append($("<td>" + Values[4] + "</td>"));
            row.append($("<td>" + Values[17] + "</td>"));
            row.append($("<td>" + Values[5] + "</td>"));
            row.append($("<td>$" + Values[8] + "/Hr.</td>"));
            row.append($("<td><figcaption><button type='button' value="+ Values[6] +" onclick=doAttachmentDownload("+ Values[6] +")><img src='../../includes/images/download.png' height='20' width='20' ></button></figcaption></td>"));
            if(accountFlag!='VendorReq'){
                row.append($('<td><a href=.././Requirements/techReview.action?requirementId='+requirementId+'&consult_id='+Values[0]+">Click</td>"));
            }
        }
    }
   
    pager.init(); 
    pager.showPageNav('pager', 'contactPageNavPosition'); 
    pager.showPage(1);
    
}

// addconsultantValidation

function getAvailableConsultantDetailsOnload(){
	
	var skillCatArry = $("#reqSkillSet").val();    
   
	var resourceType=$("#contactType").val();
	$("#selectedContactType").val(resourceType);
	
	  var reqId=$("#reqId").val();
	  
	  
	  
	var userEmail = $("#conEmail").val();
	  var availableFrom = $("#availableFrom").val();
	  var rateFrom = $("#rateFrom").val();
	  var rateTo = $("#rateTo").val();
		deleteTableRows("availableConsultantListTable");
	var rno = Math.random();
	 // var
		// url='Requirements/getAvailableConsultantList.action?RequirementId='+RequirementId;
	var url;
	  url = CONTENXT_PATH + "/recruitment/consultant/getAvailableConsultantList.action?conEmail="
		+ userEmail +"&resourceType=" + resourceType + "&rno=" + rno+"&skillSett="+skillCatArry+"&availableFrom="+availableFrom+"&rateFrom="+rateFrom+"&rateTo="+rateTo+"&requirementId="+reqId;
	  // alert("hi2"+url)
	    var req=initRequest(url);
	    req.onreadystatechange = function() {
	    	
	        if (req.readyState == 4 && req.status == 200) {
	        	 
	        	displayConsultantList(req.responseText);
	        	
	        	
	        } 
	    };
	    req.open("GET",url,"true");
	    req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	    req.send(null);
	    
	    return false;  
}

function getAvailableConsultantDetails(){
	
	var skillCatArry = [];    
    $("#skillListValue :selected").each(function(){
        skillCatArry.push($(this).text()); 
    });
	var resourceType=$("#contactType").val();
	$("#selectedContactType").val(resourceType);
	
	  var reqId=$("#reqId").val();
	
	var userEmail = $("#conEmail").val();
	  var availableFrom = $("#availableFrom").val();
	  var rateFrom = $("#rateFrom").val();
	  var rateTo = $("#rateTo").val();
	var rno = Math.random();
	deleteTableRows("availableConsultantListTable");
	 // var
		// url='Requirements/getAvailableConsultantList.action?RequirementId='+RequirementId;
	var url;
	  url = CONTENXT_PATH + "/recruitment/consultant/getAvailableConsultantList.action?conEmail="
		+ userEmail +"&resourceType=" + resourceType + "&rno=" + rno+"&skillSett="+skillCatArry+"&availableFrom="+availableFrom+"&rateFrom="+rateFrom+"&rateTo="+rateTo+"&requirementId="+reqId;
	 // alert("hi2"+url)
	    var req=initRequest(url);
	    req.onreadystatechange = function() {
	    	
	        if (req.readyState == 4 && req.status == 200) {
	        	 
	        	displayConsultantList(req.responseText);
	        	
	        	
	        } 
	    };
	    req.open("GET",url,"true");
	    req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	    req.send(null);
	    
	    return false;  
}

function deleteTableRows(tableId){
	 var table = document.getElementById(tableId);
	    for(var i = table.rows.length - 1; i > 0; i--)
	    {
	        table.deleteRow(i);
	    }
}

function displayConsultantList(resText){
	var roleFlag= $('#roleFlag').val();
	
	var mainJson = JSON.parse(resText);
	// alert("isGetting-->"+mainJson["isGetting"]); //mkyong
	var consultantJson=mainJson["consultant"];
	// alert("consultantJson-->"+consultantJson)
	
	
	// alert(resText);
	
	
	$("#colnsultant_div").show();
	
	deleteTableRows("availableConsultantListTable");
	
    if(mainJson["isGetting"]){
    var count = Object.keys(consultantJson).length;
    for (var key in consultantJson) {
    	if (consultantJson.hasOwnProperty(key)) {
    		 var val = consultantJson[key];
    		  var row = $("<tr />")
              var empId=val["EMPID"];
    		  var reqId=$("#reqId").val();
              $("#availableConsultantListTable").append(row); // this will
																// append tr
																// element to
																// table... keep
																// its reference
																// for a while
																// since we will
																// add cels into
																// it
           // row.append($('<td><a
			// href=../recruitment/consultant/getConsultantDetails.action?consult_id='+Values[0]+
			// '&consultFlag='+vendor+ ">" + Values[1] + "</a></td>"));
            //  row.append($("<td> <a href='javascript:getConsultantFullDetails("+empId+");' onclick='getConsultantFullDetails("+empId+");' data-toggle='modal' data-target='#consultantOverlay'>"+val["NAME"]+"</a> </td>"));
              row.append($('<td><a href="../../recruitment/consultantLogin/getConsultantProfile.action?consult_id=' + empId + '&accountFlag='+roleFlag +'&consultStatus=">'+val["NAME"]+"</a></td>"));
             
              row.append($("<td>" + val["Email"] + "</td>"));
              row.append($("<td>" + val["Experience"] + "</td>"));
              if (val["SkillSet"] == 'null' || val["SkillSet"] == "") {
            	 
                  row.append($('<td></td>'));
              } else {
                  row.append($('<td><a href="#" class="recSkillOverlay_popup_open" onclick=" showSkillDetailsCustomer(\'' + val["SkillSet"] + '\');" >' + val["SkillSet"].substr(0, 10) + "...</a></td>"));
              }
              row.append($("<td>" + val["AvailableFrom"] + "</td>"));
              row.append($("<td>" + val["Rate"] + "</td>"));
              row.append($("<td><a href='javascript:submitConsulatntProfileToRequirement("+empId+","+reqId+")'>Submit</a></td>"));
    		
    	}
    }
    pagerOption12();
    pager.init(); 
    pager.showPageNav('pager', 'availableConsultantNavPosition'); 
    pager.showPage(1);
	
    }else{
    	  var row = $("<tr />")
    	   $("#availableConsultantListTable").append(row);
    	  row.append($('<td colspan="7"><font style="color: red;font-size: 15px;">No Records to display</font></td>'));
    }
	
    pagerOption12();
	
}





function submitConsulatntProfileToRequirement(consultantId,requirementId) {
	var selectedResourceType=$("#selectedContactType").val();
	
	swal({
		 title: "Do you want to submit profile to this requirement?",
		  
	    // text: "Tranfering csr",
	    textSize:"170px",
	    type: "warning",
	    showCancelButton: true,
	    confirmButtonColor: "#3498db",
	    cancelButtonText: "No",
	    confirmButtonText: "Yes",
	    closeOnConfirm: false,
	    closeOnCancel: true
		},
		function(isConfirm){
			if (isConfirm) {
			 $.ajax({
			        url:CONTENXT_PATH + "/recruitment/consultant/submitProfileToRequirement.action?consultantId="+consultantId+"&requirementId="+requirementId+"&resourceType="+selectedResourceType,//
			        context: document.body,
			        success: function(responseText) {
			        	// alert("responseText-->"+responseText)
			        	getAvailableConsultantDetails();
			        	getConsultantListBySearch();
			        	 swal("Success", "Submitted Successfully  ", "success");
			        	
			       // var json = $.parseJSON(responseText);
			            
			          // alert("Response-->"+json["Response"])
			           // $("#resultMessageForStatus").html(json["Response"]);
			            
			           // displayNomineeDetails(json,nominationState);
			           
			           // document.getElementById("loadingMessage").style.display
						// = 'none';
			                 
			        }, 
			        error: function(e){
			            // document.getElementById("loadingMessage").style.display
						// = 'none';
			            alert("error-->"+e);
			        }
			    });
			}else {
				  swal("Cancelled", " Cancelled ", "error");
			  }
		});
	
	
	 
	 
	// alert(consultantId+"--"+requirementId);
}



/*
 * Author : Teja Kadamanti Date : 06/16/2017 Description: Submitted List grid
 * changes start
 * 
 */

function consultantListGridDisplay(response) { alert("in req")
	
	var roleFlag= $('#roleFlag').val();
    $(".page_option").css('display', 'block');
    var typeOfUser = $('#typeOfUser').val();
    // alert(typeOfUser)
    var requirementId = $("#RequirementId").val();
    var accountFlag = $('#accountFlag').val();
    var consultFlag = "customer";
    var vendor = $('#vendor').val();
    var accountSearchID = $('#accountSearchID').val();
    var jdId = $('#jdId').val()
    var customerFlag = $('#customerFlag').val();
    var RequirementTaxTerm = $("#RequirementTaxTerm").val();
    // alert(RequirementTaxTerm)
    if (response != null)
        var eduList = response.split("^");

    var table = document.getElementById("consultantListTable");
    for (var i = table.rows.length - 1; i > 0; i--)
    {
        table.deleteRow(i);
    }
    var res;
 if (response.length > 0) {
        for (var i = 0; i < eduList.length - 1; i++) {

            var Values = eduList[i].split("|");
            {

                 
                var row = $("<tr />")

                res = Values[16];
    $("#consultantListTable").append(row); // this will append tr element to
											// table... keep its reference for a
											// while since we will add cels into
											// it
              
                var v_comments = Values[15].trim().replace(/ /g, '%20');
              
                   // row.append($('<td><a href=../consultant/getConsultantDetails.action?vendor=' + vendor + '&consult_id=' + Values[0] + '&consultFlag=' + consultFlag + '&requirementId=' + requirementId + '&accountSearchID=' + accountSearchID + '&accountFlag=' + accountFlag + '&jdId=' + jdId + '&customerFlag=' + customerFlag + '&consult_salary=' + Values[8] + '&vendorcomments=' + v_comments + ">" + Values[1] + "</a></td>"));
                row.append($('<td><a href=../../recruitment/consultantLogin/getConsultantProfile.action?consult_id=' + Values[0] + '&requirementId=' + requirementId + '&accountFlag='+roleFlag+'&consultStatus='+Values[5]+">"+Values[1]+"</a></td>"));
               
                // row.append($("<td>" + Values[7] + "</td>"));
                row.append($("<td>" + Values[11] + "</td>")); // postedDate
             // row.append($("<td>" + Values[14] + "</td>")); // ssn
               
                    row.append($("<td>" + Values[2] + "</td>"));
               
                if (Values[3] == 'null' || Values[3] == "") {
                    Values[3] = "";
                    row.append($('<td><a href="#" class="recSkillOverlay_popup_open" onclick=" showSkillDetailsCustomer(\'' + Values[3] + '\');" >' + Values[3].substr(0, 10) + "</td>"));
                } else {
                    row.append($('<td><a href="#" class="recSkillOverlay_popup_open" onclick=" showSkillDetailsCustomer(\'' + Values[3] + '\');" >' + Values[3].substr(0, 10) + "...</td>"));
                }
                
                    row.append($("<td>" + Values[4] + "</td>"));
               
                row.append("<td>" + Values[17] + "</td>");
                if (accountFlag != 'csr')
                {
                    if (Values[5] == 'Withdraw')
                    {
                        var okDisable = "okDisable";
                        row.append($('<td><a href="#" class="conWithdraw_popup_open" onclick="consultantWithdrawnPopup(\'' + okDisable + '\',\'' + Values[12] + '\');">' + Values[5] + '</td>')); // Values[10]
																																																	// withdraw
																																																	// comments.
                    }
                    else
                    {
                        if (vendor == 'yes') {
                            var okDisable = "customercomments";
                            row.append($('<td><a href="#" class="conWithdraw_popup_open" onclick="consultantWithdrawnPopup(\'' + okDisable + '\',\'' + Values[13] + '\');">' + Values[5] + '</td>'));
                            // row.append($("<td>" + Values[5] + "</td>")); //
							// need to put overlay for declanining..
                        }
                        else
                        {
                            if (Values[5] == 'Processing')
                            {
                                // row.append($("<td>" + Values[5] + "</td>"));
                                row.append($('<td><a href="#" class="decline_popup_open" onclick=consultantDeclinePopup(\'' + vendor + '\',' + Values[0] + ',' + requirementId + ',' + Values[9] + ');>' + Values[5] + '</td>')); // need
																																																									// to
																																																									// put
																																																									// overlay
																																																									// for
																																																									// declanining..
                            }
                            else
                            {
                                var okDisable = "customercomments";
                                row.append($('<td><a href="#" class="conWithdraw_popup_open" onclick="consultantWithdrawnPopup(\'' + okDisable + '\',\'' + Values[13] + '\');">' + Values[5] + '</td>'));
                                // row.append($("<td>" + Values[5] + "</td>"));
                            }

                        }
                    }
                }
                else
                {
                    row.append($('<td>' + Values[5] + '</td>'));
                }
                row.append($("<td>$" + Values[8] + "/Hr.</td>"));
                row.append($("<td><figcaption><button type='button' value=" + Values[6] + " onclick=doAttachmentDownload(" + Values[6] + ")><i class='fa fa-download ' ></i></button></figcaption></td>"));
             /*
				 * if (vendor != 'yes' && accountFlag != 'csr') { row.append($('<td><a
				 * href=/sb/Requirements/techReview.action?requirementId=' +
				 * requirementId + '&consult_id=' + Values[0] +
				 * '&accountSearchID=' + accountSearchID + '&jdId=' + jdId +
				 * '&accountFlag=' + accountFlag + '&techReviewStatus=' +
				 * Values[5] + ">Click</td>")); }
				 */
                if (accountFlag != 'csr') {
                    if (typeOfUser == 'AC') {
                        if (RequirementTaxTerm == 'PE' && (Values[5] == 'Selected' || Values[5] == 'Denied')) {
                            row.append($('<td><a href="#" class="SOW_popup_open" onclick=SOWPopup(\'' + Values[0] + '\',\'' + Values[8] + '\');><img src="../includes/images/go.gif" height="20" width="25"></td>'));
                        } else {
                            row.append($('<td><a href="#" ><img style="opacity: 0.4;cursor:default" src="../../includes/images/go.gif" height="20" width="25"></td>'));
                        }
                    } else {
                        if (RequirementTaxTerm == 'CO' && (Values[5] == 'Selected' || Values[5] == 'Denied')) {
                            row.append($('<td><a href="#" class="SOW_popup_open" onclick=SOWPopup(\'' + Values[0] + '\',\'' + Values[8] + '\');><img src="../includes/images/go.gif" height="20" width="25"></td>'));
                        } else {
                            row.append($('<td><a href="#" ><img style="opacity: 0.4;cursor:default" src="../../includes/images/go.gif" height="20" width="25"></td>'));
                        }
                    }
                }
                
                    if (Values[5] == 'Withdraw' || Values[5] == 'Rejected') {
                        row.append($('<td><a href="#" ><img style="opacity: 0.4;cursor:default" src="../../includes/images/removeCons.png" height="20" width="20"></td>'));
                    } else {
                        row.append($('<td><a href="#" class="conWithdraw_popup_open" onclick=consultantWithdrawnPopup(' + Values[0] + ',' + requirementId + ');><img src="../../includes/images/removeCons.png" height="20" width="20"></td>'));
                    }
               
            }
        }
        document.getElementById("gridDownload").value = res;
        document.getElementById("downloading_grid").style.display = "";
    }

    else
    {
        var row = $("<tr />")
        $("#consultantListTable").append(row);
        row.append($('<td colspan="11"><font style="color: red;font-size: 15px;">No Records to display</font></td>'));
        document.getElementById("downloading_grid").style.display = "none";
      
    }

 pagerOptionSL();
    

}

function downloadPDFSubmittedList(){
    var gridDownload=document.getElementById('gridDownload').value;
    var url= "./../consultant/downloadResults.action?pdfHeaderName=Consultant Submitted List&gridDownload="
        +gridDownload+"&gridDownloadFlag=Sub";
   window.location=url;
}
function downloadXLSSubmittedList(){
    var gridDownload=document.getElementById('gridDownload').value;
    var url= "./../consultant/downloadXlsResults.action?pdfHeaderName=Consultant Submitted List&gridDownload="
        +gridDownload+"&gridDownloadFlag=Sub";
   window.location=url;
}




function showSkillDetailsCustomer(sid) {
     document.getElementById("customerSkillDetails").value = sid;
     var specialBox = document.getElementById("consultantSkillSetBox");
    if (specialBox.style.display == "block") {
        specialBox.style.display = "none";


    } else {
        specialBox.style.display = "block";


    }
    // Initialize the plugin

    $('#recSkillOverlay_popup').popup(
            );
    return false;
}

function consultantSkillCloseOverlay() {
    var specialBox = document.getElementById('consultantSkillSetBox');
    if (specialBox.style.display == "block") {
        specialBox.style.display = "none";
    } else {
        specialBox.style.display = "block";
    }
    // Initialize the plugin
    $('#consultantSkillOverlay_popup').popup(
            );
}



function consultantWithdrawnPopup(consultantID, reqID) {

    if (consultantID == "okDisable" || consultantID == "customercomments")
    {

        if (consultantID == "okDisable") {
            // $("#commentsLabel").html("Vendor Comments");
            // document.getElementById("commentsLabel").innerHTML="Vendor
			// Comments";
        }
        if (consultantID == "customercomments") {
            // $("#commentsLabel").html("Comments");
            // document.getElementById("commentsLabel").innerHTML="Comments";
            // alert(consultantID);
        }
        if (reqID == "null") {
            document.getElementById("withdrawComments").value = "";
        }
        else {
            document.getElementById("withdrawComments").value = reqID;
        }
        document.getElementById("withdrawButtonDiv").style.display = "none";
    }
    else
    {
        document.getElementById("withdrawComments").value = "";
        document.getElementById("withdrawButtonDiv").style.display = "block";
        // document.getElementById("commentsLabel").innerHTML="Status Comments";
    }
    var specialBox = document.getElementById('conWithdrawBox');
    if (specialBox.style.display == "block") {
        specialBox.style.display = "none";
    } else {
        specialBox.style.display = "block";
    }
    // Initialize the plugin
    $('#conWithdraw_popup').popup(
            );

    $("#reqwithdrawId").val(reqID);
    $("#conWithdrawId").val(consultantID);
}
function conWithdrawClose(flag) {
    var specialBox = document.getElementById('conWithdrawBox');
    if (specialBox.style.display == "block") {
        specialBox.style.display = "none";
    } else {
        specialBox.style.display = "block";
    }
    // Initialize the plugin
    $('#conWithdraw_popup').popup(
            );
    if (flag == "ok")
    {
        consultantWithdrawn();
    }
// getConsultantList();
}
function consultantWithdrawn()
{
    // alert(consultantID);
    // alert(reqID);
    var reqID = $("#reqwithdrawId").val();
    var consultantID = $("#conWithdrawId").val();
    var withdrawComments = $("#withdrawComments").val();
    if (withdrawComments == "" || withdrawComments == " ") {
        // document.getElementById("conWithRejectValid").innerHTML="<font
		// color='red'>WithdrawComments Are Mandatory</font>";
        // document.getElementById("conWithRejectValid").innerhtml="<font
		// color='red'>WithdrawComments Are Mandatory</font>";
        $("#conWithRejectValid").html("<font color='red'>Withdraw Comments Are Mandatory</font>");
        $("#conWithRejectValid").show().delay(5000).fadeOut();
        return false;
    } else
    {
        swal({
            title: "Do you want Withdraw Candidate for this Requirement",
            // text: "Tranfering csr",
            textSize: "170px",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3498db",
            // cancelButtonColor: "#56a5ec",
            cancelButtonText: "No",
            confirmButtonText: "Yes",
            closeOnConfirm: false,
            closeOnCancel: false

        },
        function(isConfirm) {
            if (isConfirm) {
                // alert(groupingId);
                // alert(id);
                // alert(action_id);
                var url = 'Requirements/doWithdrawConsultant.action?requirementId=' + reqID + '&consultantId=' + consultantID + '&withdrawComments=' + withdrawComments;
                var req = initRequest(url);
                // alert(url);
                req.onreadystatechange = function() {
                    if (req.readyState == 4) {
                        if (req.status == 200) {
                            // document.getElementById("outputMessage").innerHTML=req.responseText;
                            // getActionResorucesSearchResults();
                            getConsultantList();
                            swal("withdraw!", "Withdraw Successfully....", "success");
                            // conWithdrawClose();
                        }
                        else
                        {
                            swal("Sorry Not withdraw", "withdraw not done ", "error");
                            // conWithdrawClose();
                        }
                    }
                };
                req.open("GET", url, "true");
                req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                req.send(null);
            }
            else {

                swal("Cancelled", "withdraw cancelled ", "error");
            }
        });
    }
}



function consultantDeclinePopup(vendor, consultantID, reqID, createdByOrgId) {
    // alert(consultantID);
    // alert(reqID);
    // alert(createdByOrgId)
    if (vendor != 'yes') {
        document.getElementById('declineButtonDiv').style.display = "block";
    }
    else {
        document.getElementById('declineButtonDiv').style.display = "none";
    }


    var specialBox = document.getElementById('declineBox');
    if (specialBox.style.display == "block") {
        specialBox.style.display = "none";
    } else {
        specialBox.style.display = "block";
    }
    // Initialize the plugin
    $('#decline_popup').popup(
            );

    $("#reqRejectId").val(reqID);
    $("#conRejectId").val(consultantID);
    $("#createdByOrgId").val(createdByOrgId);

}
function declineClose()
{

    var specialBox = document.getElementById('declineBox');
    if (specialBox.style.display == "block") {
        specialBox.style.display = "none";
    } else {
        specialBox.style.display = "block";
    }
    // Initialize the plugin
    $('#decline_popup').popup(
            );
}

/*
 * Author : Teja Kadamanti Date : 06/16/2017 Description: Submitted List grid
 * changes end
 * 
 */
function uploadBackgroundAttachment(consultantId,reqId){
	$("#backgroundAttachmentmessage").html("");
	$("#current_consult_id").val(consultantId);
	$("#current_requirementId").val(reqId);
	$("#backgroundAttachmentModalBtn").click();
	
	// alert("In uplaod modal->"+consultantId);
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


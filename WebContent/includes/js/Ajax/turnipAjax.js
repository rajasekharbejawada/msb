/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
google.load('visualization', '1.1', {
    'packages': ['corechart']
});
google.setOnLoadCallback();

function getVendorResourceList(){ 
    $("#vendorResourceChart").css('visibility', 'visible');
    document.getElementById('chartTitle').innerHTML = "<font color=green>Vendor Resources Requirements Yearly Analysis</font>";

    var dashYears=$('#year').val();
    var dashMonths=$('#month').val();
    //alert("HI "+csrCustomers+"  "+dashYears)
    
    var url='../turnip/vendorResourceDetails.action?dashYears='+dashYears+'&dashMonths='+dashMonths;
    var req=initRequest(url);
    req.onreadystatechange = function() {
        if (req.readyState == 4 && req.status == 200) {
            //            alert(req.responseText)
            populateVendorResourceDashboardTable(req.responseText);
        } 
    };
    req.open("GET",url,"true");
    req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req.send(null);
    return false;
}

function populateVendorResourceDashboardTable(response){
    //alert(response)
    //    $(".page_option").css('display', 'block');
    var dashBoardReq=response.split("^");
    //    var table = document.getElementById("vendorResourceDashboardResults");
    var month = new Array();
    
    var vend1 =new Array();
    var vendCount1 =new Array();
    var vend2 =new Array();
    var vendCount2 =new Array();
    var vend3=new Array();
    var vendCount3 =new Array();
    var vend4=new Array();
    var vendCount4 =new Array();
    var vend0=new Array();
    var vendCount0 =new Array();
    var others=new Array();
    var othersCount=new Array();
    var reqRequired = new Array();
    var vendId = new Array();
    var colId1 = new Array();
    var colId2 = new Array();
    var colId3 = new Array();
    var colId4 = new Array();
    var colId0 = new Array();
    var colId5 = new Array();
    //    for(var i = table.rows.length - 1; i > 0; i--)
    //    {
    //        table.deleteRow(i);
    //    }
    if(response.length!=0){
        for(var i=0;i<dashBoardReq.length-1;){
            var otherCount=0;
            var j=0;
            var data =[];
            var vend =[vend0,vend1,vend2,vend3,vend4];
            var vendCount=[vendCount0,vendCount1,vendCount2,vendCount3,vendCount4];
            var colId = [colId0,colId1,colId2,colId3,colId4,colId5];
            data[0]=dashBoardReq[i].split("|");
            {  
                //                var row = $("<tr />")
                //                $("#vendorResourceDashboardResults").append(row); //this will append tr element to table... keep its reference for a while since we will add cels into it
                //                row.append($("<td>" + data[0][0] + "</td>"));
                //                row.append($("<td>" + data[0][1] + "</td>"));
                //                row.append($("<td>" + data[0][2] + "</td>"));
                //                row.append($("<td>" + data[0][3] + "</td>"));
                if(j==0){
                    month.push(data[j][0]);
                    reqRequired.push(data[j][4]);
                //                                    vendId.push(parseInt(data[j][5]));
                //                                    colId[j].push(parseInt(data[j][5]));
                //                    vend[j].push((data[j][1],)); 
                }
                do{
                    if(j<5){
                        var tooltipData = "&nbsp;&nbsp;"+data[j][0]+"&nbsp;:<br/>&nbsp;&nbsp;"+data[j][1]+"&nbsp;:&nbsp;"+data[j][2]+"<br/><font color='green'><b>&nbsp;&nbsp;Resource&nbsp;&nbsp;Req:</b>"+data[j][4]+"&nbsp;&nbsp;</font> ";
                        vend[j].push((tooltipData));
                        vendCount[j].push(parseInt(data[j][2]));
                        vendId.push(parseInt(data[j][5]));
                        colId[j].push(parseInt(data[j][5]));
                    }
                    else{
                        otherCount= otherCount+parseInt(data[j][2]);
                    }    
                    //                    if(j==dashBoardReq.length-1)
                    //                        break;
                    j++;
                    data[j]= dashBoardReq[i+j].split("|");
                //                    if(data[j][3]==undefined){ alert("ues");data[j][3]=0;}
                }while(data[0][3]==data[j][3]);
                if(j==1){
                    vend1.push('');
                    vend2.push('');
                    vend3.push('');
                    vend4.push('');
                    vendCount1.push(parseInt(0));
                    vendCount2.push(parseInt(0));
                    vendCount3.push(parseInt(0));
                    vendCount4.push(parseInt(0));
                    othersCount.push(parseInt(0));
                    others.push('');
                    colId1.push(parseInt(0));
                    colId2.push(parseInt(0));
                    colId3.push(parseInt(0));
                    colId4.push(parseInt(0));
                    colId5.push(parseInt(0));
                }
                else if(j==2){
                    vend2.push('');
                    vend3.push('');
                    vend4.push('');
                    others.push('');
                    vendCount2.push(parseInt(0));
                    vendCount3.push(parseInt(0));
                    vendCount4.push(parseInt(0));
                    othersCount.push(parseInt(0));
                    colId2.push(parseInt(0));
                    colId3.push(parseInt(0));
                    colId4.push(parseInt(0));
                    colId5.push(parseInt(0));
                }
                else if(j==3){
                    vend3.push('');
                    vend4.push('');
                    vendCount3.push(parseInt(0));
                    vendCount4.push(parseInt(0));
                    othersCount.push(parseInt(0));
                    others.push('');
                    colId3.push(parseInt(0));
                    colId4.push(parseInt(0));
                    colId5.push(parseInt(0));
                }
                else if(j==4){
                    vend4.push('');
                    vendCount4.push(parseInt(0));
                    othersCount.push(parseInt(0));
                    others.push('');
                    colId4.push(parseInt(0));
                    colId5.push(parseInt(0));
                } else if(otherCount>0){
                    othersCount.push(parseInt(otherCount));
                    //                    others.push(data[j-1][0]+",Others,"+data[j-1][2]);
                    others.push(data[j-1][0]+",Others,"+otherCount);
                    vendId.push(parseInt(0));
                    colId5.push(parseInt(0));
                }
                i=i+j;
            }   
        } 
        showVendorResourceChart(month,vend[0],vendCount[0],colId[0],vend[1],vendCount[1],colId[1],vend[2],vendCount[2],colId[2],vend[3],vendCount[3],colId[3],vend[4],vendCount[4],colId[4],othersCount,others,colId[5],reqRequired,vendId);
    }
    else{
        $("#vendorResourceChart").css('visibility', 'hidden');
    //        var row = $("<tr />")
    //        $("#vendorResourceDashboardResults").append(row);
    //        row.append($('<td colspan="7"><font style="color: red;font-size: 15px;">No Records to display</font></td>'));
    //        $(".page_option").css('display', 'none');
    }
//    $('#vendorResourceDashboardResults').tablePaginate({
//        navigateType:'navigator'
//    },recordPage);
//    pager.init(); 
}


function showVendorResourceChart(month,vend1,vendCount1,colId0,vend2,vendCount2,colId1,vend3,vendCount3,colId2,vend4,vendCount4,colId3,vend5,vendCount5,colId4,othersCount,others,colId5,reqRequired,vendId)
{
    var randomColor = '#';
    var count=0;
    var result ="";
    for(var k=0;k<vendId.length;k++){ 
        if(k==vendId.length-1){ 
            randomColor='#'+(Math.random()*0xFFFFFF<<0).toString(16);
            result+= k+"|"+vendId[k]+"|"+count+"|"+randomColor+"^";
        }else
        { 
            for(var g=k+1;g<vendId.length-1;g++)
            { 
                if(vendId[k]==vendId[g]){
                    count=count+1;
                    vendId.splice(g, 1);
                    g=g-1;
                }
            }
            for (var p = 0; p < 6; p++ ) {
                randomColor='#'+(Math.random()*0xFFFFFF<<0).toString(16);
            }
            result+= k+"|"+vendId[k]+"|"+count+"|"+randomColor+"^";
            count = 0;
        }
    }
    var colId= [colId0,colId1,colId2,colId3,colId4,colId5];
    var color1 = new Array();
    var color2 = new Array();
    var color3 = new Array();
    var color4 = new Array();
    var color0 = new Array();
    var color5 = new Array();
    var color = [color0,color1,color2,color3,color4,color5];
    for(var l=0;l<6;l++){
        for(var x=0;x< colId0.length;x++){
            var accountList=result.split("^");         
            for(var m=0; m < accountList.length - 1;m++){
                var Values=accountList[m].split("|");
                {
                    if(colId[l][x]==Values[1]){
                        color[l][x]=Values[3];
                    }
                }
            } 
        }
    }
    var c='orange';
    var Combined = new Array();
    Combined[0] = ['Month', vend1,{
        type : 'string',
        role: 'tooltip',
        'p': {
            'html': true
        }
    },{
        type:'string',
        role:'style'
    },
    vend2,{
        type : 'string',
        role: 'tooltip',
        'p': {
            'html': true
        }
    },{
        type:'string',
        role:'style'
    },
    vend3,{
        type : 'string', 
        role: 'tooltip',
        'p': {
            'html': true
        }
    },{
        type:'string',
        role:'style'
    },
    vend4,{
        type : 'string',
        role: 'tooltip',
        'p': {
            'html': true
        }
    },{
        type:'string',
        role:'style'
    },
    vend5,{
        type : 'string',
        role: 'tooltip',
        'p': {
            'html': true
        }
    },{
        type:'string',
        role:'style'
    },
    others,{
        type:'string',
        role:'tooltip',
        'p': {
            'html': true
        }
    },{
        type:'string',
        role:'style'
    }];
    for (var i = 0; i<10; i++){
        Combined[i + 1] = [month[i],vendCount1[i],vend1[i],color0[i],vendCount2[i],
        vend2[i],color1[i],vendCount3[i],vend3[i],color2[i],vendCount4[i],vend4[i],
        color3[i],vendCount5[i],vend5[i],color4[i],othersCount[i],others[i],color5[i]];
    }
    var data = google.visualization.arrayToDataTable(Combined, false);
    var options = {
        tooltip: 
        {
            isHtml: true,
            textStyle:
            {
                color: "Blue",
                bold: true,
                italic: true
            }
        },
        legend: 'none'
    //,isStacked : true
    }
    var chart = new google.visualization.ColumnChart(document.getElementById('vendorResourceChart'));
    // Instantiate and draw our chart, passing in some options.
    chart.draw(data,options);
    $(window).resize(function () {
        chart.draw(data, options);
    });
}
function validationVendorResourceDashboardYear(evt)
{
    var  minRate=document.getElementById("year").value;
    var rate=(minRate.toString()).length;
    var iKeyCode = (evt.which) ? evt.which : evt.keyCode
    if ( iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57) )
    {
        if(rate != 4)
        {
            $("#VendorResourceDashValidation").html(" <font color='red'>enter only numbers</font>");  
            $("#VendorResourceDashValidation").show().delay(4000).fadeOut();
        }
        if(iKeyCode == 8)
        {
            return true;       
        }
        else
        {
            return false;
        }
    }
    else if( rate >= 4)
    {
        if(iKeyCode == 8)    
        {
            return true; 
        }
        else
        {
            return false;       
        }
    }
    else 
    {
        $("#customerDashValidation").html("");
        return true;
    }
}

function getNoofProjectResourcesRequired(){
    $("#projectResource").css('visibility', 'visible');
    document.getElementById('ProjectTitle').innerHTML = "<font color=green>Project Resources Requirements Yearly Analysis</font>";
    var dashYears=$('#year').val();
    var dashMonths=$('#month').val();
    var url='../turnip/projectResourceDetails.action';//?dashYears='+dashYears+'&dashMonths='+dashMonths;
    var req=initRequest(url);
    req.onreadystatechange = function() {
        if (req.readyState == 4 && req.status == 200) {
            populateProjectResourceDashboardTable(req.responseText);
        } 
    };
    req.open("GET",url,"true");
    req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req.send(null);
    return false;
}

function populateProjectResourceDashboardTable(response){
    //    $(".page_option").css('display', 'block');
    var venCount;
    var dashBoardReq=response.split("^");
    var month = new Array();
    var open=new Array();
    var release =new Array();
    var openForResume =new Array();
    var close=new Array();
    var others=new Array();
    if(response.length!=0){
        var total=0;
        for(var i=0;i<dashBoardReq.length-1;i++){   
            var Values=dashBoardReq[i].split("|");
            {  
                month.push(Values[0]);
                open.push((Values[1]));
                release.push(parseInt(Values[2]));
                //                venCount=Values[3].split(",");
                ////                if(Values[3].length!=0){
                //                    for(var j=0;j<Values[3].length-1;j++){
                //                        if(venCount[0]==venCount[j]){
                //                            
                //                        }
                //                    }
                //                }
                openForResume.push(parseInt(Values[3]));
            }
        }
        showProjectResourceChart(month,open,release,openForResume);
    }
    else{
        $("#projectResource").css('visibility', 'hidden');
    }
}

function showProjectResourceChart(month,open,release,openForResume)
{
    var Combined = new Array();
    Combined[0] = [open[0], open[1]];//,open[4],open[0]];
    for (var i = 0; i < 10; i++){
        Combined[i + 1] = [ month[i], release[i]];
    }
    //second parameter is false because first row is headers, not data.
    var data = google.visualization.arrayToDataTable(Combined, false);
    var options = {
        colors: ['#0000FF', '#00FF00', '#FF0000','#00BFFF'],
        legend: 'none'
    }
    var chart = new google.visualization.ColumnChart(document.getElementById('projectResource'));
    // Instantiate and draw our chart, passing in some options.
    chart.draw(data, options);
    $(window).resize(function () {
        chart.draw(data, options);
    });
}
function getClientResourceList(){
    $("#clientResourceChart").css('visibility', 'visible');
    document.getElementById('chartTitle').innerHTML = "<font color=green>Client Resources Requirements Yearly Analysis</font>";

    var dashYears=$('#year').val();
    var dashMonths=$('#month').val();
    //alert("HI "+csrCustomers+"  "+dashYears)
    
    var url='../turnip/clientResourceDetails.action';//?dashYears='+dashYears+'&dashMonths='+dashMonths;
    var req=initRequest(url);
    req.onreadystatechange = function() {
        if (req.readyState == 4 && req.status == 200) {
            //alert(req.responseText)
            populateClientResourceDashboardTable(req.responseText);
        } 
    };
    req.open("GET",url,"true");
    req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req.send(null);
    return false;
}
function populateClientResourceDashboardTable(response){
    //    $(".page_option").css('display', 'block');
    var dashBoardReq=response.split("^");
    //    var table = document.getElementById("clientResourceDashboardResults");
    var accountName = new Array();
    var reqCat1 =new Array();
    var resourceCount1 =new Array();
    var reqCat2 =new Array();
    var resourceCount2 =new Array();
    var reqCat3=new Array();
    var resourceCount3 =new Array();
    var reqCat4=new Array();
    var resourceCount4 =new Array();
    var reqCat0=new Array();
    var resourceCount0 =new Array();
    var othersCount=new Array();
    var colId1 = new Array();
    var colId2 = new Array();
    var colId3 = new Array();
    var colId4 = new Array();
    var colId0 = new Array();
    var colId5 = new Array();
    var others=new Array();
    var reqCategoryName = new Array();
    //    for(var i = table.rows.length - 1; i > 0; i--)
    //    {
    //        table.deleteRow(i);
    //    }
    if(response.length!=0){
        for(var i=0;i<dashBoardReq.length-1;){   
            var otherCount=0;
            var j=0;
            var max=0;
            var data =[];
            var reqCat =[reqCat0,reqCat1,reqCat2,reqCat3,reqCat4];
            var colId = [colId0,colId1,colId2,colId3,colId4,colId5];
            var resourceCount=[resourceCount0,resourceCount1,resourceCount2,resourceCount3,resourceCount4];
            data[0]=dashBoardReq[i].split("|");
            {  
                //alert(Values[0])
                //                var row = $("<tr />")
                //                $("#clientResourceDashboardResults").append(row); //this will append tr element to table... keep its reference for a while since we will add cels into it
                //                row.append($("<td>" + Values[0] + "</td>"));
                //                row.append($("<td>" + Values[1] + "</td>"));
                //                row.append($("<td>" + Values[2] + "</td>"));

                if(j==0){
                    accountName.push(data[j][0]);
                //                                    reqCategoryName.push((data[j][1]));
                //                                    colId[j].push((data[j][1]));
                //                    reqCat[j].push((data[j][1],)); 
                }
                do{
                    if(j<5){
                        reqCat[j].push((data[j][0]+":"+data[j][1]+":"+data[j][2]));
                        resourceCount[j].push(parseInt(data[j][2]));
                        reqCategoryName.push((data[j][1]));
                        colId[j].push((data[j][1]));
                    }
                    else{
                        otherCount= otherCount+parseInt(data[j][2]);
                    }
                    if(data[j][2]>max){
                        max = data[j][2];
                    }
                    j++;
                    data[j]=  dashBoardReq[i+j].split("|");
                }while(data[0][3]==data[j][3]);
                if(j==1){
                    reqCat1.push('');
                    reqCat2.push('');
                    reqCat3.push('');
                    reqCat4.push('');
                    others.push('');
                    resourceCount1.push(parseInt(0));
                    resourceCount2.push(parseInt(0));
                    resourceCount3.push(parseInt(0));
                    resourceCount4.push(parseInt(0));
                    othersCount.push(parseInt(0));
                    colId1.push('');
                    colId2.push('');
                    colId3.push('');
                    colId4.push('');
                    colId5.push('');
                }
                else if(j==2){
                    reqCat2.push('');
                    reqCat3.push('');
                    reqCat4.push('');
                    others.push('');
                    resourceCount2.push(parseInt(0));
                    resourceCount3.push(parseInt(0));
                    resourceCount4.push(parseInt(0));
                    othersCount.push(parseInt(0));
                    colId2.push('');
                    colId3.push('');
                    colId4.push('');
                    colId5.push('');
                }
                else if(j==3){
                    reqCat3.push('');
                    reqCat4.push('');
                    others.push('');
                    resourceCount3.push(parseInt(0));
                    resourceCount4.push(parseInt(0));
                    othersCount.push(parseInt(0));
                    colId3.push('');
                    colId4.push('');
                    colId5.push('');
                }
                else if(j==4){
                    reqCat4.push('');
                    others.push('');
                    resourceCount4.push(parseInt(0));
                    othersCount.push(parseInt(0));
                    colId4.push('');
                    colId5.push('');
                }
                else if(otherCount>0){
                    othersCount.push(parseInt(otherCount));
                    others.push(data[j-1][0]+",Others,"+otherCount);
                    reqCategoryName.push(("others"));
                    colId5.push("others");
                }
                i=i+j;
            }   
        }
        showClientChart(accountName,reqCat[0],resourceCount[0],colId[0],reqCat[1],resourceCount[1],colId[1],reqCat[2],resourceCount[2],colId[2],reqCat[3],resourceCount[3],colId[3],reqCat[4],resourceCount[4],colId[4],othersCount,others,colId[5],max,reqCategoryName);
    
    }
    else{
        $("#clientResourceChart").css('visibility', 'hidden');
    //        var row = $("<tr />")
    //        $("#clientResourceDashboardResults").append(row);
    //        row.append($('<td colspan="7"><font style="color: red;font-size: 15px;">No Records to display</font></td>'));
    //        $(".page_option").css('display', 'none');
    }
//    $('#clientResourceDashboardResults').tablePaginate({
//        navigateType:'navigator'
//    },recordPage);
//    pager.init(); 
   
}

function showClientChart(accountName,reqCat1,resourceCount1,colId0,reqCat2,resourceCount2,colId1,reqCat3,resourceCount3,colId2,reqCat4,resourceCount4,colId3,reqCat5,resourceCount5,colId4,othersCount,others,colId5,max,reqCategoryName)
{
    var randomColor = '#';
    var count=0;
    var result ="";
    var c="";
    for(var k=0;k<reqCategoryName.length;k++){ 
        if(k==reqCategoryName.length-1){ 
            randomColor='#'+(Math.random()*0xFFFFFF<<0).toString(16); 
            result+= k+"|"+reqCategoryName[k]+"|"+count+"|"+randomColor+"^";
        }
        else{ 
            for(var g=k+1;g<reqCategoryName.length-1;g++)
            {
                if(reqCategoryName[k]==reqCategoryName[g]){
                    count=count+1;
                    reqCategoryName.splice(g, 1);
                    g=g-1;
                }
            }
            for (var p = 0; p < 6; p++ ) {
                randomColor='#'+(Math.random()*0xFFFFFF<<0).toString(16);
            }
            result+= k+"|"+reqCategoryName[k]+"|"+count+"|"+randomColor+"^";
            count = 0;
        }
    }
    var colId= [colId0,colId1,colId2,colId3,colId4,colId5];
    var color1 = new Array();
    var color2 = new Array();
    var color3 = new Array();
    var color4 = new Array();
    var color0 = new Array();
    var color5 = new Array();
    var color = [color0,color1,color2,color3,color4,color5];
    for(var l=0;l<6;l++){
        for(var x=0;x< colId0.length;x++){
            var categoryList=result.split("^");         
            for(var m=0; m < categoryList.length -1;m++){
                var Values=categoryList[m].split("|");
                {
                    if(colId[l][x]==Values[1]){
                        color[l][x]=Values[3];
                    }
                }
            } 
        }
    }
    //    alert(accountName.length);
    var Combined = new Array();
    Combined[0] = ['Month', reqCat1,{
        type : 'string',
        role: 'tooltip'
    },{
        type:'string',
        role:'style'
    },
    reqCat2,{
        type : 'string',
        role: 'tooltip'
    },{
        type:'string',
        role:'style'
    },
    reqCat3,{
        type : 'string', 
        role: 'tooltip'
    },{
        type:'string',
        role:'style'
    },
    reqCat4,{
        type : 'string',
        role: 'tooltip'
    },{
        type:'string',
        role:'style'
    },
    reqCat5,{
        type : 'string',
        role: 'tooltip'
    },{
        type:'string',
        role:'style'
    },
    others,{
        type:'string',
        role:'tooltip'
    },{
        type:'string',
        role:'style'
    }];
    for (var i = 0; i < 10; i++){
        Combined[i + 1] = [ accountName[i], resourceCount1[i],reqCat1[i],color0[i],resourceCount2[i],reqCat2[i],color1[i],resourceCount3[i],reqCat3[i],
        color2[i],resourceCount4[i],reqCat4[i],color3[i],resourceCount5[i],reqCat5[i],color4[i],othersCount[i],others[i],color5[i]];
    }
    
    //second parameter is false because first row is headers, not data.
    var data = google.visualization.arrayToDataTable(Combined, false);
    var options = {
        colors: ['#0000FF', '#00FF00', '#FF0000','#00BFFF'],
        legend: 'none',
        //        bar: { 
        //           groupWidth: '90%'
        //        },
        //        series: { 1: {color: 'lightgray'} },
        //         chartArea: {left:80.6,top:20, width:539.4,height:"340px"},
        //         bar : {
        //             groupWidth : 200
        //         },
        //        isStacked: true,
        //        
       
        
        //        trendlines: {
        //            0: {
        //                type: 'linear',
        //                color: 'green',
        //                lineWidth: 3,
        //                opacity: 0.3,
        //                showR2: true,
        //                visibleInLegend: true
        //            }
        //        },
        vAxis: {
            title: " Resources Required",
            titleColor: "green"
        }
    }
    var chart = new google.visualization.ColumnChart(document.getElementById('clientResourceChart'));
    function selectHandler() {
        var selection = chart.getSelection()[0];
        if (selection) {
            var practice = (data.getValue(selection.row,selection.column+1));
            var client = (data.getValue(selection.row,0)); 
            var colVal = selection.column; 
            var barColor = data.getValue(selection.row,selection.column+2);       //['#["#0000FF"];', '#00FF00', '#FF0000','#00BFFF'],
            if(colVal<14){
                barColor = [barColor];
                document.getElementById("selectResourceRange").style.display = 'none';
                //                if(colVal==1){
                //                    barColor = ["#0000FF"];
                //                }else if(colVal==3){
                //                    barColor = ["#00FF00"];
                //                }else if(colVal==5){
                //                    barColor = ["#FF0000"];
                //                }else if (colVal==7){
                //                    barColor = ["#00BFFF"];
                //                }else{
                //                    barColor = ["#0000FF"];
                //                }
                getClientResourceDashboardList(practice,client,barColor);
            }else{
                document.getElementById("barColor").value = barColor; 
                document.getElementById("selectResourceRange").style.display = 'block';
                document.getElementById("subClientDiv").style.display = 'none';
                populateRequiredRangeSelectBox(max);
            //            document.getElementById("subClientDiv").style.display = 'none';
                 
            }
        }
    }
    google.visualization.events.addListener(chart, 'select', selectHandler);
    chart.draw(data, options);
    $(window).resize(function () {
        chart.draw(data, options);
    });
}
function populateRequiredRangeSelectBox(max){
    var $select = $('#resourceRange');
    $select.find('option').remove();
    $('<option>').val(-1).text("Select Range").appendTo($select);
    for (var i = 1; i < max;i++) {
    {
        $('<option>').val(i+" AND "+(i+9)).text(i+"-"+(i+9)).appendTo($select);
        i= i+9;
    }
    }
    return false;
}
function getClientResourceListByRange(){
    var resourceRange = document.getElementById('resourceRange').value;
    //    $("#clientResourceChart").css('visibility', 'visible');
    //    document.getElementById('chartTitle').innerHTML = "<font color=green>Client Resources Requirements Yearly Analysis</font>";
    var url='../turnip/clientResourceDetails.action?resourceRange='+resourceRange;//?dashYears='+dashYears+'&dashMonths='+dashMonths;
    var req=initRequest(url);
    req.onreadystatechange = function() {
        if (req.readyState == 4 && req.status == 200) {
            populateClientResourceListByRangeDashboardTable(req.responseText);
        } 
    };
    req.open("GET",url,"true");
    req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req.send(null);
    return false;
}
function populateClientResourceListByRangeDashboardTable(response){
    var barColor = document.getElementById("barColor").value;
    barColor = [barColor]; 
    var dashBoardReq=response.split("^");
    var accountName = new Array();
    var skill=new Array();
    var resourceCount = new Array();
    var reqName ;
    if(response.length!=0){
        document.getElementById("subClientDiv").style.display = 'block';
        document.getElementById('subClientTitle').innerHTML = "<font color=green >&nbsp; &nbsp; Requirement Analysis</font>";
        for(var i=0;i<dashBoardReq.length-1;i++){ 
            var Values=dashBoardReq[i].split("|");
            {  
                accountName.push(Values[0]);
                resourceCount.push(parseInt(Values[2]));
                skill.push((Values[0]+':'+Values[1]+':'+Values[2]));
                reqName="";
            }
        }
        showClientRequirementChart(accountName,resourceCount,skill,reqName,barColor);
    
    }
    else{
        $("#subClientRequirementChart").css('visibility', 'hidden');
    }
}
function getClientResourceDashboardList(selectedValue,clientName,barColor){
    var flags=selectedValue.split("FLAG");
    var addList=flags[0].split(":");
    var accountName = addList[0];
    var reqName = addList[1];
    var url='../turnip/clientRequirementDetails.action?accountName='+accountName+'&reqName='+reqName;
    var req=initRequest(url);
    req.onreadystatechange = function() {
        if (req.readyState == 4 && req.status == 200) {
            populateClientRequirementDashboard(req.responseText,clientName,barColor);
        } 
    };
    req.open("GET",url,"true");
    req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req.send(null);
    return false;
}
function populateClientRequirementDashboard(response,clientName,barColor){ 
    var dashBoardReq=response.split("^");
    var accountName = new Array();
    var skill=new Array();
    var resourceCount = new Array();
    var reqName ;
    if(response.length!=0){
        document.getElementById("subClientDiv").style.display = 'block';
        document.getElementById('subClientTitle').innerHTML = "<font color=green >&nbsp; "+ clientName +"&nbsp; Requirement Analysis</font>";
        for(var i=0;i<dashBoardReq.length-1;i++){ 
            var Values=dashBoardReq[i].split("|");
            {  
                accountName.push(Values[0]);
                resourceCount.push(parseInt(Values[2]));
                skill.push((Values[3]+':'+Values[2]));
                reqName=Values[1];
            }
        }
        showClientRequirementChart(accountName,resourceCount,skill,reqName,barColor);
    
    }
    else{
        $("#subClientRequirementChart").css('visibility', 'hidden');
    }
}

function showClientRequirementChart(accountName,resourceCount,skill,reqName,barColor)
{ 
    //    alert(month.length); 
    //    var barColor = ["#0000FF"];
    var Combined = new Array();
    Combined[0] = ['Month', skill,{
        type : 'string', 
        role: 'tooltip'
    }];
    for (var i = 0; i < accountName.length; i++){
        Combined[i + 1] = [ accountName[i], resourceCount[i], skill[i]];
    }
    //second parameter is false because first row is headers, not data.
    var data = google.visualization.arrayToDataTable(Combined, false);
    var options = {
        colors: barColor,//['#', '#00FF00', '#FF0000','#00BFFF'],
        legend: 'none',
        vAxis: {
            title: " Resources Required",
            titleColor: "green"
        //            allowDecimals: false
        },
        hAxis: {
            title: reqName,
            titleColor: "green",
            textPosition: 'none'
        },
        bar: {
            groupWidth: 20
        }  
    //        isStacked : true
    }
    var chart = new google.visualization.ColumnChart(document.getElementById('subClientRequirementChart'));
    chart.draw(data, options);
    $(window).resize(function () {
        chart.draw(data, options);
    });
}

function getRegionResourcesList(){
    $("#RegionResourceChart").css('visibility', 'visible');
    document.getElementById('chartRegionTitle').innerHTML = "<font color=green>Vendor Open Resources Analysis</font>";
    var url='../turnip/clientRegionResourceDetails.action';//?dashYears='+dashYears+'&dashMonths='+dashMonths;
    var req=initRequest(url);
    req.onreadystatechange = function() {
        if (req.readyState == 4 && req.status == 200) {
            if(req.responseText == "No Records"){
                document.getElementById('norecords').innerHTML = "<font color=red> No Consultants to Display!</font>";
            }
            else{    
                populateClientRegionResourceDashboardTable(req.responseText); 
            }
        } 
    };
    req.open("GET",url,"true");
    req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req.send(null);
    return false;
}
function populateClientRegionResourceDashboardTable(response){
    var dashBoardReq=response.split("^");
    var region = new Array();
    var category1 =new Array();
    var counsultCount1 =new Array();
    var category2 =new Array();
    var counsultCount2 =new Array();
    var category3=new Array();
    var counsultCount3 =new Array();
    var category4=new Array();
    var counsultCount4 =new Array();
    var category0=new Array();
    var counsultCount0 =new Array();
    var others=new Array();
    var othersCount=new Array();
    if(response.length!=0){
        for(var i=0;i<dashBoardReq.length-1;){
            var otherCount=0;
            var j=0;
            var data =[];
            var category =[category0,category1,category2,category3,category4];
            var counsultCount=[counsultCount0,counsultCount1,counsultCount2,counsultCount3,counsultCount4];
            data[0]=dashBoardReq[i].split("|");
            {  
                if(j==0){
                    region.push(data[j][1]);
                }
                do{
                    if(j<5){
                        if((data[j][1]==" ")&&(data[j][2]==" ")){
                            category[j].push((data[j][0]));  
                        } else if(data[j][1]==" "){
                            category[j].push((data[j][2]+":"+data[j][0]));  
                        } else if(data[j][2]==" "){
                            category[j].push((data[j][1]+":"+data[j][0])); 
                        }else{
                            category[j].push((data[j][1]+":"+data[j][2]+":"+data[j][0]));
                        }
                        counsultCount[j].push(parseInt(data[j][0]));
                    }
                    else{
                        otherCount= otherCount+parseInt(data[j][0]);
                    }
                    j++;
                    data[j]= dashBoardReq[i+j].split("|");
                }while(data[0][1]==data[j][1]);
                if(j==1){
                    category1.push('');
                    category2.push('');
                    category3.push('');
                    category4.push('');
                    counsultCount1.push(parseInt(0));
                    counsultCount2.push(parseInt(0));
                    counsultCount3.push(parseInt(0));
                    counsultCount4.push(parseInt(0));
                    othersCount.push(parseInt(0));
                    others.push('');
                }
                else if(j==2){
                    category2.push('');
                    category3.push('');
                    category4.push('');
                    others.push('');
                    counsultCount2.push(parseInt(0));
                    counsultCount3.push(parseInt(0));
                    counsultCount4.push(parseInt(0));
                    othersCount.push(parseInt(0));
                }
                else if(j==3){
                    category3.push('');
                    category4.push('');
                    counsultCount3.push(parseInt(0));
                    counsultCount4.push(parseInt(0));
                    othersCount.push(parseInt(0));
                    others.push('');
                }
                else if(j==4){
                    category4.push('');
                    counsultCount4.push(parseInt(0));
                    othersCount.push(parseInt(0));
                    others.push('');
                }
                else if(otherCount>0){
                    othersCount.push(parseInt(otherCount));
                    others.push(data[j-1][0]+":Others:"+otherCount);
                }
                i=i+j;
            }   
        }
        showClientRegionChart(region,category[0],counsultCount[0],category[1],counsultCount[1],category[2],counsultCount[2],category[3],counsultCount[3],category[4],counsultCount[4],othersCount,others);
    }
    else{
        $("#RegionResourceChart").css('visibility', 'hidden');
    }
}

function showClientRegionChart(region,category1,counsultCount1,category2,counsultCount2,category3,counsultCount3,category4,counsultCount4,category5,counsultCount5,othersCount,others)
{
    var Combined = new Array();
    Combined[0] = ['Month', category1,{
        type : 'string',
        role: 'tooltip'
    },
    category2,{
        type : 'string',
        role: 'tooltip'
    },
    category3,{
        type : 'string', 
        role: 'tooltip'
    },
    category4,{
        type : 'string',
        role: 'tooltip'
    },
    category5,{
        type : 'string',
        role: 'tooltip'
    },
    others,{
        type:'string',
        role:'tooltip'
    }];
    for (var i = 0; i < 10; i++){
        Combined[i + 1] = [ region[i], counsultCount1[i],category1[i],counsultCount2[i],category2[i],counsultCount3[i],category3[i],
        counsultCount4[i],category4[i],counsultCount5[i],category5[i],othersCount[i],others[i]];
    }
    //second parameter is false because first row is headers, not data.
    var data = google.visualization.arrayToDataTable(Combined, false);
    var options = {
        colors: ['#0000FF', '#00FF00', '#FF0000','#00BFFF'],
        legend: 'none',
        vAxis: {
            title: " Consultants Available",
            titleColor: "green"
        }
    //chartArea:{left:100,top:100, width:500, height:150}
    }
    var chart = new google.visualization.ColumnChart(document.getElementById('RegionResourceChart'));
    chart.draw(data, options);
    $(window).resize(function () {
        chart.draw(data, options);
    });
}
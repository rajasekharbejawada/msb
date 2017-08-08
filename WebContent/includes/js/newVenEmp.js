/*
    Document   : newVenEmp
    Created on : June 13, 2017, 8:32:32 PM
    Author     : Asha Eede
*/



$  ( function( ) {
//	alert("action");
    var action=document.getElementById("action").innerHTML;
    var searchflag=document.getElementById("searchFlagForLeftMenu").innerHTML;
    var menuId =     sessionStorage.getItem("menuId");
    var currentId = sessionStorage.getItem("currentId");
    var    parentId=     sessionStorage.getItem("parentId");
   // alert(menuId+" "+currentId+ " "+ parentId)
   
    if(menuId!=null && currentId!=null && parentId!=null ){
        if(document.getElementById(parentId)!=null)
            {
                  document.getElementById(parentId).style.display="block";    
            }
        document.getElementById(parentId).style.display="block";  
if(document.getElementById(currentId)!=null)
            {
       document.getElementById(currentId).style.color="orange"; 
        document.getElementById(currentId).style.fontWeight="bold";
            }
            if(document.getElementById(menuId)!=null)
            {
      //  document.getElementById(menuId).style.background = "url("+CONTENXT_PATH+"/includes/images/menu/icon_minus.png ) 96% center no-repeat ";
            }

    }




//    if(action=="changeMyPassword") 
//    {
//    alert("changeMyPassword");
//         if(menuId!=null && currentId!=null && parentId!=null ){
//             if(document.getElementById(parentId)!=null)
//                 {
//                      document.getElementById(parentId).style.display="none";   
//                 }
//    if(document.getElementById(currentId)!=null)
//                 {
//            document.getElementById(currentId).style.color="White"; 
//            document.getElementById(currentId).style.fontWeight="normal";
//                 }
//                     if(document.getElementById(menuId)!=null)
//                 {
//            document.getElementById(menuId).style.background = "";
//                 }
//        }
//         alert("hello");
//        document.getElementById("utiltiesMenuVen").style.display="block";    
//      
//        document.getElementById("changePasswordUtilitiesMenuVen").style.color="orange"; 
//        document.getElementById("changePasswordUtilitiesMenuVen").style.fontWeight="bold";
//   
//  //      document.getElementById("myAdmin").style.background = "url("+CONTENXT_PATH+"/includes/images/menu/icon_minus.png ) 96% center no-repeat ";
//
//        sessionStorage.setItem("menuId","utilitiesAdmin");
//        sessionStorage.setItem("currentId","changePasswordUtilitiesMenuVen");
//        sessionStorage.setItem("parentId","utiltiesMenuVen");
//       // sessionStorage.clear();    
//    }
    $( document ).ready(function() {
        $('#cssmenu > ul > li > a').click(function() {
            $('#cssmenu li').removeClass('active');
            $(this).closest('li').addClass('active');	
            var checkElement = $(this).next();
            if((checkElement.is('ul')) && (checkElement.is(':visible'))) {
                $(this).closest('li').removeClass('active');
                checkElement.slideUp('normal');
            }
            if((checkElement.is('ul')) && (!checkElement.is(':visible'))) {
                $('#cssmenu ul ul:visible').slideUp('normal');
                checkElement.slideDown('normal');
            }
            if($(this).closest('li').find('ul').children().length == 0) {
                return true;
            } else {
               return false;	
            }		
        });
    });
} );


function leftMenuToggleIdSearchFlag(el,s,searchFlag){
	//var searchflag=document.getElementById("searchFlagForLeftMenu").innerHTML;
	 
	if(searchFlag=="My"){
		 var menuId =     sessionStorage.getItem("menuId");
		    var currentId = sessionStorage.getItem("currentId");
		    var    parentId=     sessionStorage.getItem("parentId");
		 if(menuId!=null && currentId!=null && parentId!=null ){
            if(document.getElementById(parentId)!=null)
                {
                     document.getElementById(parentId).style.display="none";   
                }
//   if(document.getElementById(currentId)!=null)
//                {
//           document.getElementById(currentId).style.color="White"; 
//           document.getElementById(currentId).style.fontWeight="normal";
//                }
                    if(document.getElementById(menuId)!=null)
                {
           document.getElementById(menuId).style.background = "";
                }
       }
       document.getElementById("homeMenuVenEmp").style.display="block";    
     
       document.getElementById("consultantsHomeMenuVen").style.color="orange"; 
       document.getElementById("consultantsHomeMenuVen").style.fontWeight="bold";
  
 //      document.getElementById("myAdmin").style.background = "url("+CONTENXT_PATH+"/includes/images/menu/icon_minus.png ) 96% center no-repeat ";

       sessionStorage.setItem("menuId","homeAdmin");
       sessionStorage.setItem("currentId","consultantsHomeMenuVen");
       sessionStorage.setItem("parentId","homeMenuVenEmp");
	}

	
	 if(searchFlag=="All"){
		 if(menuId!=null && currentId!=null && parentId!=null ){
            if(document.getElementById(parentId)!=null)
                {
                     document.getElementById(parentId).style.display="none";   
                }
            else if(document.getElementById(currentId)!=null)
                {
           document.getElementById(currentId).style.color="White"; 
           document.getElementById(currentId).style.fontWeight="normal";
                }
                    if(document.getElementById(menuId)!=null)
                {
           document.getElementById(menuId).style.background = "";
                }
       }
       document.getElementById("utiltiesMenuVen").style.display="block";    
     
       document.getElementById("consultantsUtilitiesMenuVenAll").style.color="orange"; 
       document.getElementById("consultantsUtilitiesMenuVenAll").style.fontWeight="bold";
  
 //      document.getElementById("myAdmin").style.background = "url("+CONTENXT_PATH+"/includes/images/menu/icon_minus.png ) 96% center no-repeat ";

       sessionStorage.setItem("menuId","utilitiesAdmin");
       sessionStorage.setItem("currentId","consultantsUtilitiesMenuVenAll");
       sessionStorage.setItem("parentId","utiltiesMenuVen");
	}
	
	
	 if(searchFlag=="Open"){
		 if(menuId!=null && currentId!=null && parentId!=null ){
            if(document.getElementById(parentId)!=null)
                {
                     document.getElementById(parentId).style.display="none";   
                }
   if(document.getElementById(currentId)!=null)
                {
           document.getElementById(currentId).style.color="White"; 
           document.getElementById(currentId).style.fontWeight="normal";
                }
                    if(document.getElementById(menuId)!=null)
                {
           document.getElementById(menuId).style.background = "";
                }
       }
       document.getElementById("utiltiesMenuVen").style.display="block";    
     
       document.getElementById("consultantsUtilitiesMenuVen").style.color="orange"; 
       document.getElementById("consultantsUtilitiesMenuVen").style.fontWeight="bold";
  
 //      document.getElementById("myAdmin").style.background = "url("+CONTENXT_PATH+"/includes/images/menu/icon_minus.png ) 96% center no-repeat ";

       sessionStorage.setItem("menuId","utilitiesAdmin");
       sessionStorage.setItem("currentId","consultantsUtilitiesMenuVen");
       sessionStorage.setItem("parentId","utiltiesMenuVen");
	}
}


function leftMenuToggleId(el,s)
{
		 var currentId = $(el).attr('id');
		    document.location.hash = currentId;
		   
		    
		    var pp = $(el).parent().parent().parent().parent().attr('id');
		 
		 //   alert("parent is an parent====>"+pp);
		  //  alert("currentId is====>"+currentId);
		    
		    document.getElementById(pp).style.display="block";
		    document.getElementById(currentId).style.color="orange"; 
		    document.getElementById(currentId).style.fontWeight="bold";
		    var image = $(el).parent().parent().parent().parent().parent().attr('id');
		    sessionStorage.setItem("menuId",s);
		    sessionStorage.setItem("currentId",currentId);
		    sessionStorage.setItem("parentId",pp);
	
   
//sessionStorage.clear();
    
    
}



$  ( function( ) {       
	 
    $("#homeVendorEmpLeftMenu").click(function() {
    	
    	 if ($('#homeMenuVenEmp').css('display') == 'block') {
      		  $('#homeMenuVenEmp').hide();  
      		}
      	  else{
      			 $('#homeMenuVenEmp').css("display","block");
      			 $('#homeMenuVenEmp').removeClass("panel-collapse in");
      		}
       	 if ( $('#dashboardMenuVen').css('display') == 'block') {
       		 $('#dashboardMenuVen').hide(); 
       		 $('#testIconDashboard').removeClass('fa-sort-desc');
                $('#testIconDashboard').addClass('fa-sort-asc'); 
       	 }
       	if ( $('#utiltiesMenuVen').css('display') == 'block') {
      		 $('#utiltiesMenuVen').hide(); 
      		 $('#testIconUtilities').removeClass('fa-sort-desc');
               $('#testIconUtilities').addClass('fa-sort-asc'); 
      	 }
       	 
      });
      $("#dashboardVendorEmpLeftMenu").click(function() {
    	
    	  
    	  if ($('#dashboardMenuVen').css('display') == 'block') {
       		  $('#dashboardMenuVen').hide();  
       		}
       	  else{
       			 $('#dashboardMenuVen').css("display","block");
       			 $('#dashboardMenuVen').removeClass("panel-collapse in");
       		}
        	 if ($('#homeMenuVenEmp').css('display') == 'block') {
        		 $('#homeMenuVenEmp').hide(); 
                 $('#testIconHome').removeClass('fa-sort-desc');
                 $('#testIconHome').addClass('fa-sort-asc');
        	 }
        	 if ($('#utiltiesMenuVen').css('display') == 'block') {
        		 $('#utiltiesMenuVen').hide(); 
                 $('#testIconUtilities').removeClass('fa-sort-desc');
                 $('#testIconUtilities').addClass('fa-sort-asc');
        	 }

      });
      
  $("#utilitiesVendorEmpLeftMenu").click(function() {
    	
    	  
    	  if ($('#utiltiesMenuVen').css('display') == 'block') {
       		  $('#utiltiesMenuVen').hide();  
       		}
       	  else{
       			 $('#utiltiesMenuVen').css("display","block");
       			 $('#utiltiesMenuVen').removeClass("panel-collapse in");
       		}
        	 if ($('#homeMenuVenEmp').css('display') == 'block') {
        		 $('#homeMenuVenEmp').hide(); 
                 $('#testIconHome').removeClass('fa-sort-desc');
                 $('#testIconHome').addClass('fa-sort-asc');
        	 }
        	 if ($('#dashboardMenuVen').css('display') == 'block') {
        		 $('#dashboardMenuVen').hide(); 
                 $('#testIconDashboard').removeClass('fa-sort-desc');
                 $('#testIconDashboard').addClass('fa-sort-asc');
        	 }

      });

});
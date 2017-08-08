/*
    Document   : newCustPrjMgr
    Created on : June 16, 2017, 8:32:32 PM
    Author     : Asha Eede
*/



$  ( function( ) {
    var action=document.getElementById("action").innerHTML
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




    if(action=="getMainProjects") 
    {
   // alert("dashBoardDetails");
         if(menuId!=null && currentId!=null && parentId!=null ){
             if(document.getElementById(parentId)!=null)
                 {
                      document.getElementById(parentId).style.display="none";   
                 }
//    if(document.getElementById(currentId)!=null)
//                 {
//            document.getElementById(currentId).style.color="White"; 
//            document.getElementById(currentId).style.fontWeight="normal";
//                 }
                     if(document.getElementById(menuId)!=null)
                 {
            document.getElementById(menuId).style.background = "";
                 }
        }
        document.getElementById("homeProjectManager").style.display="block";    
      
        document.getElementById("projectsHomeProjectManager").style.color="orange"; 
        document.getElementById("projectsHomeProjectManager").style.fontWeight="bold";
   
  //      document.getElementById("myAdmin").style.background = "url("+CONTENXT_PATH+"/includes/images/menu/icon_minus.png ) 96% center no-repeat ";

        sessionStorage.setItem("menuId","homeAdmin");
        sessionStorage.setItem("currentId","projectsHomeProjectManager");
        sessionStorage.setItem("parentId","homeProjectManager");
       // sessionStorage.clear();    
    }
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



function leftMenuToggleId(el,s)
{
    //alert("el is---->"+el);
//  //  document.getElementById(s).style.background = "url("+CONTENXT_PATH+"/includes/images/menu/icon_minus.png ) 96% center no-repeat ";
//    alert(s);
    var currentId = $(el).attr('id');
    document.location.hash = currentId;
   
    
    var pp = $(el).parent().parent().parent().parent().attr('id');
 
 //   alert("parent is an parent====>"+pp);
  //  alert("currentId is====>"+currentId);
    
    document.getElementById(pp).style.display="block";
    document.getElementById(currentId).style.color="orange"; 
    document.getElementById(currentId).style.fontWeight="bold";
    $('#homeMenuConsultant').addClass("panel-collapse in");
    $('#homeMenuConsultant').removeClass("panel-collapse collapse");
    var image = $(el).parent().parent().parent().parent().parent().attr('id');
    sessionStorage.setItem("menuId",s);
    sessionStorage.setItem("currentId",currentId);
    sessionStorage.setItem("parentId",pp);
//sessionStorage.clear();
    
    
}



$  ( function( ) {       
	 
    $("#homeCustPMLeftMenu").click(function() {
    	
    	 if ($('#homeProjectManager').css('display') == 'block') {
      		  $('#homeProjectManager').hide();  
      		}
      	  else{
      			 $('#homeProjectManager').css("display","block");
      			 $('#homeProjectManager').removeClass("panel-collapse in");
      		}
       	 if ( $('#utilitiesProjectManager').css('display') == 'block') {
       		 $('#utilitiesProjectManager').hide(); 
       		 $('#testIconUtilities').removeClass('fa-sort-desc');
                $('#testIconUtilities').addClass('fa-sort-asc'); 
       	 }
       	 if ($('#dashboardProjectManager').css('display') == 'block') {
    		 $('#dashboardProjectManager').hide(); 
             $('#testIconDashboard').removeClass('fa-sort-desc');
             $('#testIconDashboard').addClass('fa-sort-asc');
    	 }

       	 
      });
      $("#utilitiesCustPMLeftMenu").click(function() {
    	
    	  
    	  if ($('#utilitiesProjectManager').css('display') == 'block') {
       		  $('#utilitiesProjectManager').hide();  
       		}
       	  else{
       			 $('#utilitiesProjectManager').css("display","block");
       			 $('#utilitiesProjectManager').removeClass("panel-collapse in");
       		}
        	 if ($('#homeProjectManager').css('display') == 'block') {
        		 $('#homeProjectManager').hide(); 
                 $('#testIconHome').removeClass('fa-sort-desc');
                 $('#testIconHome').addClass('fa-sort-asc');
        	 }
        	 if ($('#dashboardProjectManager').css('display') == 'block') {
        		 $('#dashboardProjectManager').hide(); 
                 $('#testIconDashboard').removeClass('fa-sort-desc');
                 $('#testIconDashboard').addClass('fa-sort-asc');
        	 }

      });
      
 $("#dashboardCustPMLeftMenu").click(function() {
    	
    	  
    	  if ($('#dashboardProjectManager').css('display') == 'block') {
       		  $('#dashboardProjectManager').hide();  
       		}
       	  else{
       			 $('#dashboardProjectManager').css("display","block");
       			 $('#dashboardProjectManager').removeClass("panel-collapse in");
       		}
        	 if ($('#homeProjectManager').css('display') == 'block') {
        		 $('#homeProjectManager').hide(); 
                 $('#testIconHome').removeClass('fa-sort-desc');
                 $('#testIconHome').addClass('fa-sort-asc');
        	 }
        	 if ( $('#utilitiesProjectManager').css('display') == 'block') {
           		 $('#utilitiesProjectManager').hide(); 
           		 $('#testIconUtilities').removeClass('fa-sort-desc');
                    $('#testIconUtilities').addClass('fa-sort-asc'); 
           	 }

      });

});
/*
    Document   : newCustEmp
    Created on : June 13, 2017, 8:32:32 PM
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




    if(action=="doTasksSearch") 
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
        document.getElementById("homeMenu").style.display="block";    
      
        document.getElementById("tasksHome").style.color="orange"; 
        document.getElementById("tasksHome").style.fontWeight="bold";
   
  //      document.getElementById("myAdmin").style.background = "url("+CONTENXT_PATH+"/includes/images/menu/icon_minus.png ) 96% center no-repeat ";

        sessionStorage.setItem("menuId","homeAdmin");
        sessionStorage.setItem("currentId","tasksHome");
        sessionStorage.setItem("parentId","homeMenu");
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
	 
    $("#homeCustEmpLeftMenu").click(function() {
    	
    	 if ($('#homeMenu').css('display') == 'block') {
      		  $('#homeMenu').hide();  
      		}
      	  else{
      			 $('#homeMenu').css("display","block");
      			 $('#homeMenu').removeClass("panel-collapse in");
      		}
       	 if ( $('#utilitiesMenu').css('display') == 'block') {
       		 $('#utilitiesMenu').hide(); 
       		 $('#testIconUtilities').removeClass('fa-sort-desc');
                $('#testIconUtilities').addClass('fa-sort-asc'); 
       	 }
       	 
      });
      $("#utilitiesCustEmpLeftMenu").click(function() {
    	
    	  
    	  if ($('#utilitiesMenu').css('display') == 'block') {
       		  $('#utilitiesMenu').hide();  
       		}
       	  else{
       			 $('#utilitiesMenu').css("display","block");
       			 $('#utilitiesMenu').removeClass("panel-collapse in");
       		}
        	 if ($('#homeMenu').css('display') == 'block') {
        		 $('#homeMenu').hide(); 
                 $('#testIconHome').removeClass('fa-sort-desc');
                 $('#testIconHome').addClass('fa-sort-asc');
        	 }


      });
      


});
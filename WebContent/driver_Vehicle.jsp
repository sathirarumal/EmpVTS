<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import= "models.Driver"  %>
<%@page import= "java.sql.ResultSet"  %>
<%@page import= "javax.servlet.http.HttpSession"  %>
<%@include file="driver_NavBar.jsp" %>

<link href="css/plugins/airDatepicker/datepicker.css" rel="stylesheet" />
<link href="css/plugins/lcSwitch/lc_switch.css" rel="stylesheet" />
<link href="css/plugins/mScrollbar/jquery.mCustomScrollbar.min.css" rel="stylesheet" />
<script src="js/plugins/mScrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="js/plugins/airDatepicker/datepicker.min.js"></script>
<script src="js/plugins/airDatepicker/i18n/datepicker.en.js"></script>
<script src="js/plugins/validate/jquery.validate11.js"></script>
<script src="js/plugins/lcSwitch/lc_switch.min.js"></script>

<div class="container main-wrapper pt-30" style="max-width:80%; max-height:70%;">
        <div class="contert-wrapper pb-15">
            <div class="cell pb-20">
                <h1 class="title" style="font-size:30px">YOUR VEHICLE DETAILS</h1>
            </div>
                             		

  					<%
  					HttpSession session1 = request.getSession();  					
 					String eId = (String) session1.getAttribute("eid");
 					
 					Driver driverObj = new Driver();
                   	ResultSet rs=driverObj.getMyVehicle(eId);
					while(rs.next()){
					%>						
							 <h4 class="title"><%=rs.getString(1)%>&nbsp &nbsp &nbsp<%=rs.getString(2)%></h4> 
  						
  					<%}%>	

				</div>    
 
   		</div>
 </div>



<script type="text/javascript">

	$(function(){
    	$(".content").mCustomScrollbar();
    	
	});
	
	$(".content").mCustomScrollbar({
	    axis:"y",
	   	setHeight:"100px"
	});

                    
     function addEmp()
     {
         //console.log("sdsdsd");
        jQuery.ajax({
        type: "POST",
        url: 'admin/adminEmpAdd.java',
        dataType: 'json',
        data: $('#adminEmp').serialize(),

        success: function (obj) {
                if(obj.code == 300){
               $('#error').html("Error ").fadeout(5000);
           }
           else if(obj.code == 200){
               $('#success').html("Vaccination details saved Successfully").fadeout(5000);
           }
            }
        });
     }
        
</script>
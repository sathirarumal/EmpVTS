<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import= "models.Admin"  %>
<%@page import= "java.sql.ResultSet"  %>    

<%@include file="navBar.jsp" %>

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
                <h1 class="title" style="font-size:30px">ROUTE MANAGEMENT</h1>
            </div>
            <form action="adminRouteAdd" method="post" id="adminRouteAdd">
                  <div class="row">
                       <div class="col-md-12">
                           
                                   <div class="row form-row">    
                                        <div class="col-md-4 input-layout">
                                            <h4 class="title">ROUTE-ID</h4>
                                            <input type="text" class="lettersonly" name="rid">
                                        </div>
                                        
                                        <div class="col-md-4 input-layout">
                                            <h4 class="title">MOTHER ROUTE-ID</h4>
                                            <input type="text" class="lettersonly" name="mrid">
                                        </div>                                                                     
                                   </div>
                                    
                                    <div class="row form-row">                                        
                                        <div class="col-md-4 input-layout">
                                            <h4 class="title">STARTING CITY</h4>
                                            <input type="text" class="lettersonly" name="sc">
                                        </div>
                                        
                                        <div class="col-md-4 input-layout">
                                            <h4 class="title">DESTINATION CITY</h4>
                                            <input type="text" class="lettersonly" name="dc">
                                        </div>
                                    </div> 
                                     
                                    <div class="row">      
                                        <div class="col-md-12">
                                        <button type="submit" class="bx-but bx-save" name="save" >Save</button>
                                        </div>
                                    </div>                                                                                        
                       </div>
                      
             </div>
         </form>
         	<div class="alert-warning" id="error">${param.message}</div><br><br>
                
                <h5 class="title">ADDED ROUTES DETAILS</h5>
                  <br>		
         		<div class="mCustomScrollbar" data-mcs-theme="dark">
  					<%
  						Admin admin=new Admin();
  						ResultSet rs=admin.getRoutes();
						while(rs.next()){
					%>						
						<h4 class="title" style="padding-top: 8px;"><%=rs.getString(1)%>&nbsp &nbsp &nbsp<%=rs.getString(2)%>&nbsp &nbsp &nbsp<%=rs.getString(3)%>&nbsp &nbsp &nbsp<%=rs.getString(4)%>&nbsp &nbsp &nbsp<a href="deleteRoute.jsp?id=<%=rs.getString(1)%>"><span class="glyphicon glyphicon-trash" ></span>delete</a></h4>  						
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
        
    $('.datepick').datepicker({
        language: 'en'
    });
    
    $('input').lc_switch();
    
    
    $('body').delegate('.lcs_switch', 'lcs-on', function() {       
        $('#forDate').show();
        $('#forPeriod').hide();      
    });
    
    $('body').delegate('.lcs_switch', 'lcs-off', function() {       
        $('#forPeriod').show();
        $('#forDate').hide();      
    });

        
     function saveVaccine()
     {
         //console.log("sdsdsd");
        jQuery.ajax({
        type: "POST",
        url: 'Controllers/actionAddVaccine.php',
        dataType: 'json',
        data: $('#vaccine').serialize(),

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
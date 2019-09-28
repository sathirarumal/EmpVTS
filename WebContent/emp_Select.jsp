<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import= "models.Emp"  %>
<%@page import= "java.sql.ResultSet"  %>
<%@page import= "javax.servlet.http.HttpSession"  %>

<%@include file="emp_NavBar.jsp" %>

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
                <h1 class="title" style="font-size:30px">SELECT YOUR RIDE</h1>
            </div>
            <form action="EmpRideAdd.java" method="post" name="EmpRideAdd">
                  
                      <div class="row form-row">                                        
                                        <div class="col-md-4 input-layout">
                                            <h4 class="title">ROUTE ID</h4>
                                            <input type="text" class="lettersonly" name="rid">
                                        </div>
                                        
                                        <div class="col-md-4 input-layout">
                                            <h4 class="title">Driver</h4>
                                            <input type="text" class="lettersonly" name="driver">
                                        </div>
                                        
                                        <div class="col-md-4 input-layout">
                                            <h4 class="title">TIME</h4>
                                            <input type="text" class="lettersonly" name="time">
                                        </div>
                       </div>
                       
                       <div class="row">      
                                        <div class="col-md-12">
                                        <button type="submit" class="bx-but bx-save" name="save" >Save</button>
                                        </div>
                       </div> 
                                            
             	  
         	</form>
             <div class="alert-warning" id="error">${param.message}</div><br><br>
                 		
         		<div class="mCustomScrollbar" data-mcs-theme="dark">
  					<%
  					HttpSession session1 = request.getSession();  					
  					String eId = (String) session1.getAttribute("eid");
  					
  						Emp emp=new Emp();
  						ResultSet rs=emp.getAllDrivers(eId);
  						if(rs.next()){
						while(rs.next()){
					%>						
						<h4 class="title" style="padding-top: 8px;"><%=rs.getString(1)%>&nbsp &nbsp &nbsp<%=rs.getString(2)%>&nbsp &nbsp &nbsp<%=rs.getString(3)%>&nbsp &nbsp &nbsp<%=rs.getString(4)%>&nbsp &nbsp &nbsp<%=rs.getString(5)%>&nbsp &nbsp &nbsp<%=rs.getString(6)%>&nbsp &nbsp &nbsp</h4>  						
  					<%}%>
  					<%}else{%>	  					
  					 <h4 class="title">First select ride to continue</h4>
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
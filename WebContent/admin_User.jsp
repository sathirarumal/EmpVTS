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
                <h1 class="title" style="font-size:30px">USER ACCOUNTS MANAGEMENT</h1>
            </div>
            <form action="adminUserAdd" method="post" id="adminDriverAdd">
                  <div class="row">
                       <div class="col-md-12">
                           
                                   <div class="row form-row">    
                                        <div class="col-md-4 input-layout">
                                            <h4 class="title">EMP-NO</h4>
                                            <input type="text" class="lettersonly" name="empNo">
                                        </div>
                                        
                                        <div class="col-md-4 input-layout">
                                            <h4 class="title">PASSWORD</h4>
                                            <input type="password" class="lettersonly" name="pw">
                                        </div>
                                        
                                        <div class="col-md-4 input-layout">
                                            <h4 class="title">CONFIRM PASSWORD</h4>
                                            <input type="password" class="lettersonly" name="cpw">
                                        </div>
                                    </div>
                                    
                                    <div class="row form-row">
                                        <div class="col-md-4 input-layout pl-20" style="width:170px">
                                        <h5 class="title">DRIVER</h5>
                                        </div>
                                        <div class="col-md-4 input-layout">
                                        <input type="checkbox" class="lcs_switch lcs_checkbox_switch lcs_on" value="1" uncheckValue="0" name="acType"/>
                                        </div>
                                    </div>
                                    
                                    <div class="row form-row" id="driver">    
                                        <div class="col-md-4 input-layout">
                                            <h4 class="title">VEHICLE-NO</h4>
                                            <input type="text" class="lettersonly" name="vn">
                                        </div>
                                        
                                        <div class="col-md-4 input-layout">
                                            <h4 class="title">ROUT-NO</h4>
                                            <input type="text" class="lettersonly" name="rn">
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
                <h5 class="title">ISSUED EMPLOYEE ACCOUNTS</h5>
                <br>  		
         		<div class="mCustomScrollbar" data-mcs-theme="dark">
  					<%
  						Admin admin=new Admin();
  						ResultSet rs=admin.getIssuedUser();
						while(rs.next()){
					%>						
							<h4 class="title" style="padding-top: 8px;;"><%=rs.getString(1)%>&nbsp &nbsp &nbsp<%=rs.getString(2)%>&nbsp &nbsp &nbsp<%=rs.getString(3)%>&nbsp &nbsp &nbsp<%=rs.getString(4)%>&nbsp &nbsp &nbsp<a href="deleteUser.jsp?id=<%=rs.getString(1)%>"><span class="glyphicon glyphicon-trash" ></span>delete</a></h4>
  						
  					<%}%>	

				</div>    

   		</div>
 </div>



<script type="text/javascript">


	$(function(){
		$(".content").mCustomScrollbar();
		$('#driver').hide();
		$('#error').hide(5000);
	});

	$(".content").mCustomScrollbar({
    	axis:"y",
   		setHeight:"100px"
	});
        
    
    $('input').lc_switch();
    
    
    $('body').delegate('.lcs_switch', 'lcs-on', function() {       
        $('#driver').show();    
    });
    
    $('body').delegate('.lcs_switch', 'lcs-off', function() {       
        $('#driver').hide();    
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
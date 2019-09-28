<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <!--====================================================================
        Style sheet
       =====================================================================-->
        <link href="fonts/font.css" rel="stylesheet" />
        <link href="css/bootstrap.css" rel="stylesheet" />
        <link href="css/custom/normalize.css" rel="stylesheet" />
        <link href="css/custom/button.css" rel="stylesheet" />
        <link href="css/custom/common.css" rel="stylesheet" />
        <link href="css/custom/mainmenu.css" rel="stylesheet" />
        <link href="css/custom/form.css" rel="stylesheet" />
        <link href="css/custom/accordion.css" rel="stylesheet" />
        <link href="css/plugins/airDatepicker/datepicker.css" rel="stylesheet" />

        <!--====================================================================
        Java script
        =====================================================================-->
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery-1.11.2.min.js"></script>
        <script src="js/jquery-ui-1.12.0.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/custom/custom-plugins-collections.js"></script>
        <script src="js/custom/common.js"></script>
        <script src="js/custom/form.js"></script>
        <script src="js/plugins/airDatepicker/datepicker.min.js"></script>
        <script src="js/plugins/airDatepicker/i18n/datepicker.en.js"></script>
        <script src="js/jquery.validate.js"></script>
        
        <!-- =====================================================================-->
    </head> 
    <body style="background-image:url(images/8.jpg);">
    <div class="container main-wrapper">
    <div class="bread-crumb-wrp with-mb">
        <a>User</a>
        <a>Registration</a>
    </div>
        <div class="content" style="padding-left:200px;opacity:0.9 ">    
        <div class="contert-wrapper pb-15" style="width:85%">
            <div class="cell">
                <h1 class="title" style="padding-left: 230px">REGISTRATION</h1>
            </div>
            <form class="cmxform" action="" method="post" id="reg">
                  <div class="row">
                          <div class="col-md-12" style="padding-top:100px; padding-right: 100px; " >
                              <div class="row form-row">    
                                        <div class="col-md-4 input-layout col-md-offset-2">
                                            <h4 class="title">First Name</h4>
                                            <input type="text" id="cname" name="fname" required>
                                        </div>
                           
                           
                                         
                                        <div class="col-md-4 input-layout col-md-offset-2">                                            
                                            <h4 class="title">Last Name</h4>
                                            <input type="text" id="cname"  name="lname" required>
                                        </div>
                                    </div>
                              
                                    <div class="row form-row"> 
                                        <div class="col-md-4 input-layout col-md-offset-2">
                                            <h4 class="title">Birthday</h4>
                                            <input type="text" class="datepick" data-language="en" name="bday" required>
                                        </div>
                                        <div class="col-md-4 input-layout col-md-offset-2">
                                            <h4 class="title">Country</h4>
                                            <input type="text" id="cname" name="country" required>
                                        </div>
                                    </div>
                                    
                                    <div class="row form-row">     
                                        <div class="col-md-4 col-md-offset-2" style="width:100px">
                                            <h4 class="title">Gender</h4>
                                        </div>
                                        <div class="col-md-4 col-md-offset-2">
                                            <input type="radio" class="pr30" name="gender"
                                                   value="Male"> Male 
                                             <input type="radio" name="gender"
                                            value="Female"> Female
                                        </div>
                                    </div>
                              

                           
                                    <div class="row form-row">     
                                        <div class="col-md-4 input-layout col-md-offset-2">
                                            <h4 class="title">Email Address</h4>
                                            <input type="email" class="" name="email" required>
                                        </div>
                                    </div>   
                           
                           
                                    <div class="row form-row">     
                                        <div class="col-md-4 input-layout col-md-offset-2">
                                            <h4 class="title">Telephone Number</h4>
                                            <input type="text" class="" name="pnum" required>
                                        </div>   
                                    </div>
                                   
                                    <div class="row form-row"> 
                                        <hr size="10" noshade>
                                        <div class="col-md-4 input-layout col-md-offset-2">
                                            <h4 class="title">USER NAME</h4>
                                            <input type="text" id="cname" minlength="8" name="username" required>
                                        </div>
                                    </div>
                                    <div class="row form-row">                                       
                                        <div class="col-md-4 input-layout col-md-offset-2">
                                            <h4 class="title">PASSWORD</h4>
                                            <input type="password" class="" name="password" required>
                                        </div>
                                    </div>
                              </div>   
                          </div>
                             
            

                                    <div class="row">
                                        <div class="col-md-8">
                                            <button type="submit" class="bx-but bx-save" name="save" onclick="registerThis();" >Save</button>
                                        </div>
                                        <div id="errormsg"> </div>
                                    </div>
                <div class="alert-warning" id="error"></div>
                <div class="alert-success" id="success"></div>
                </form>
        </div>
            
      </div>
    </div>
    </body>
</html>
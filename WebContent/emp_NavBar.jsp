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
        
        <!-- =====================================================================-->
        
    </head>
    <body>
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header navbar-left">
                <img src="images/logo.png" style="width:70px;height:70px">
            </div>
            <div class="navbar-header navbar-left pr-30">
                <h2 class="navbar white pt-20" style="font-family:Times New Roman">EMPLOYEE TRANSPORT EMP-PROFILE</h2>
            </div>
           <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right pt-15">
                    <li><a href="emp_Main.jsp" >MAIN</a></li>
                    <li><a href="emp_Select.jsp">SEARCH A RIDE</a></li>                                                             
                     <li class="dropdown">
                        <a href="#" data-toggle="dropdown" class="dropdown-toggle" style="color:#FFFFFF"><span class="glyphicon glyphicon-user" ></span><b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="emp_Profile.jsp"> MY PROFILE</a></li>
                            <li class="divider"></li>
                            <li><a href="login.jsp">LOG OUT</a></li>
                        </ul>
                     </li>                    
                </ul>             
            </div><!-- /.navbar-collapse -->
        </div> 
    </nav>

</body>
</html>
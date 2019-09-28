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
        <link href="css/custom/login.css" rel="stylesheet" />
        
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
        
        <!-- =====================================================================-->

    </head>
    <body style="background-image:url(images/login.png);">
    <div class="wrapper fadeInDown">
     <div id="formContent">
    
    <div class="fadeIn first">
        <h1 class="details bg-blue">Sign In</h1>
    </div>
	<% session.setAttribute("eid",null);%>
    <!-- Login Form -->
    <form action="login1" method="post" name="login">
    
      <input type="text" id="login" class="fadeIn second" name="username" placeholder="username">
      <input type="password" id="password" class="fadeIn third" name="password" placeholder="password">
      <input type="submit" class="fadeIn fourth" name="save" value="Log In">
      
    </form>

    <!-- Remind Passowrd -->
    <div id="formFooter">
      <a class="underlineHover" href="#">Forgot Password?</a>
    </div>

    </div>
    </div>
    </body>
</html>
<%-- 
    Document   : index
    Created on : Feb 25, 2012, 8:37:08 PM
    Author     : Pancha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">


<head>
  	<title>Stock Management System</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />

	<!-- The main style sheet -->
  	<link rel="stylesheet" href="css/style.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="css/div_styles.css" type="text/css" />
	<!-- START MooSlide -->
	<!-- The CSS -->
  	<link rel="stylesheet" href="css/mooslide.css" type="text/css" media="screen" />
    <!-- Mootools - the core -->
	<script type="text/javascript" src="js/mootools12.js"></script>
    <!-- MooSlide (show/hide login form) -->
	<script type="text/javascript" src="js/mooSlide2-moo12.js"></script>
	<script language="javascript" type="text/ecmascript">
	window.addEvent('domready',function(){
		var myLogin = new mooSlide2({ slideSpeed: 1500, fadeSpeed: 500,  toggler:'login', content:'loginPanel', height:300, close: false, effects:Fx.Transitions.Bounce.easeOut , from:'top'});
		//optional: AutoStart the slider on page load:
		//MyLogin.run();
	    $('close').addEvent('click', function(e){
			e = new Event(e);
			myLogin.clearit();
			e.stop();
		});
	});
	</script>
</head>

<body>
<div class="container_index">
  <table width="100%" height="114">
    <tr>
      <td width="121" height="108"><center><img src="images/logo.png"/></center></td>
      <td width="605" style="padding-left:8px;color:#000079;font-size:22px;">

        <p>Sigiri Textile Industries (Pvt) Ltd.        </p>
        <p>No:227/1,
          Galle Road,Katubedda,
          Mt.Lavinia,
      Sri Lanka. </p></td>
      <td width="457">&nbsp;</td>
    </tr>
  </table>
  <table width="100%">
    <tr>
      <td width="100%" height="66">&nbsp;</td>
    </tr>
  </table>
  <table width="100%" height="326">
    <tr>
      <td width="73" height="270">&nbsp;</td>
      <td width="745">
      <p><a href="#" id="login" style="font-size:20px"><b>Click here to Continue</b></a></p>
      </td>
      <td width="262">&nbsp;</td>
    </tr>
  </table>
  <table width="100%" height="144">
    <tr>
      <td width="829" height="138">&nbsp;</td>
      <td width="309">&nbsp;</td>
    </tr>
  </table>

</div>

    <!-- Login Panel using MooSlide -->
<div id="loginPanel" class="mooSlide">
			<div class="left">
            </div>

			<form class="right" action="menu.jsp" method="post" >
				<h1>Member Login</h1>
				<label for="log"><b>Username: </b></label>
				<input type="text" name="log" id="log" value="" size="23"/>
				<label for="pwd"><b>Password:</b></label>
				<input type="password" name="pwd" id="pwd" size="23" />
            	<label><input class="rememberme" name="rememberme" id="rememberme" type="checkbox" checked="checked" value="forever" /> &nbsp;Remember me</label>
				<input type="submit" name="submit" value="" class="button_login"/>
			</form>
			<div class="clearfix"></div>

			<div class="loginClose"><a href="#" id="close">&nbsp;</a></div>
	</div> <!-- / Login panel -->

    <!-- / container -->

</body>
</html>

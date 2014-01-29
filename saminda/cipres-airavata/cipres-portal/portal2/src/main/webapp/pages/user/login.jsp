<%@ include file="/pages/common/taglibs.jsp" %><head>

	<title>Login</title>
	<!-- meta name="heading" content="Login"/ -->
	<meta name="menu" content="Home"/>
    </head>

<body onLoad="detectBrowser()"/>

  <s:url id="registerUrl" action="register"/>
  <s:url id="guestUrl" action="guestLogin"/>
  <s:url id="forgotPasswordUrl" action="forgotPassword" method="input" includeParams="none"/>
 <!-- added from terri's page --> 
  <s:url id="iplantLogin" action="iplantLogin"/>
  
  <c:import url="http://www.phylo.org/includes/newcontent/appfp.html"/>

<!-- BEGIN MAIN CONTENT AREA -->
<div class="span-14 append-1">
		
 	<h3 class="headline">The CIPRES Science Gateway now offers PhyloBayes MPI and DPPDIV, along with fast RAxML and MrBayes codes.</h3>
<!-- this should probably be in the include --> 
	<h5><strong>First Time Users: Please review the</strong> <a href="http://www.phylo.org/index.php/portal/xsede">XSEDE Primer</a> <strong>and our</strong> <a href="http://www.phylo.org/index.php/portal/use_policy">Fair Use Policy</a>.
 </h5>

<hr />

<!-- adding iPlant Login 1 -->
<div class="span-7">
	 <fieldset>
	 <legend>CIPRES Login:</legend>
<!-- changed to be like terri's -->
	  <s:form id="loginBox" action="login" theme="simple">
	    <p>
	      <span class="warning-red">*</span>Username:<br/>
	      <s:textfield name="username" size="25"/>
	    </p>
	    <p>
	      <span class="warning-red">*</span>Password:<br/>
	      <s:password name="currentPassword" size="25"/>
	    </p>
	    <p>
	      <s:submit cssClass="button" value="Login" method="login"/>&nbsp;
          <s:reset cssClass="button"/>
	    </p>
	      <s:a href="%{forgotPasswordUrl}">Forgot Password?</s:a>
     </s:form>
	 </fieldset>

<!-- under the cipres box -->
	 <div>
		<h4>Not registered yet? </h4>
			<s:a href="%{registerUrl}">Register</s:a><b> &nbsp;| &nbsp;</b>
	        <s:a href="%{guestUrl}">Proceed without Registering</s:a>
	 </div>
</div>
<!-- add the iplant login box -->
<div class="span-7 last">	
	 <fieldset>
	 <legend>iPlant users login here:</legend>
<!--	<a href="https://gucumatz.iplantcollaborative.org/idp/Authn/UserPassword"><img src="images/iplant-btn.png" alt="iPlant login" height="59" width="237" border="0" /></a> -->
	<s:if test="%{iplantEnabled()}">
		<s:a href="%{iplantLogin}"><img src="images/iplant-btn.png" alt="iPlant login" height="59" width="237" border="0" /></a> </s:a>
	<!--Login via iPlant?-->
	</s:if>
	<p><a href=javascript:popupWithSizes('http://www.phylo.org/index.php/help/iplant',450,400,'0')>What is this?</a></p>
     </fieldset>
</div>

<!-- end add iplant login 2 -->
 
<script type="text/javascript">
function detectBrowser()
{
var is_chrome = navigator.userAgent.toLowerCase().indexOf('chrome') > -1;
if (is_chrome == true)
	alert("Warning: There a known issues in using the Google Chrome browser for CIPRES Science Gateway. Specifically, data uploads and job creation are difficult or fail completely.  We are working on a fix, but in the meantime, we recommend you switch to a different browser.");
}
</script>

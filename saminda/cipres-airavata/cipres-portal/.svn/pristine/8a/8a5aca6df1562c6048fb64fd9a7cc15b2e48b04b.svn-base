<%@ include file="/pages/common/taglibs.jsp" %>
<head>
	<title>iPlant Login</title>
	<!--<meta name="heading" content="iPlant Login"> -->
	<meta name="menu" content="Home"/>
    </head>




<div align="left">
  <marquee bgcolor="#FFFFFF" direction="left" scrollamount="4" width="85%">
  <center>
  </marquee>
</div>
  <br/>

<body onload="detectBrowser()"/>

  <fieldset>
 <legend>One Time Coordination of CIPRES and iPlant Accounts</legend>
  <s:form id="loginBox" action="iplantRegister" theme="simple">
  If you already have a CIPRES account, please enter your username and password so that we can link your CIPRES account to your iPlant account.  Otherwise, leave the fields blank, press Submit, and a new CIPRES account will be created.
	<b><b>
If an error occurs or you change your mind, please use the Logout tab to end the CIPRES/iPlant session. 
    <p>
      <span class="warning-red">*</span>Username:<br/>
      <s:textfield name="username" size="30"/>
    </p>
    <p>
      <span class="warning-red">*</span>Password:<br/>
      <s:password name="currentPassword" size="30"/>
    </p>
    <p>
	  <s:submit cssClass="button" value="Submit"/>&nbsp;
      <s:reset cssClass="button"/>&nbsp
	  <!--
      <s:submit cssClass="button" value="I Changed My Mind" method="getMeOutOfHere"/>
	  -->
    </p>
  </s:form>
 </fieldset>
<script type="text/javascript">
function detectBrowser()
{
var is_chrome = navigator.userAgent.toLowerCase().indexOf('chrome') > -1;
if (is_chrome == true)
	alert("Warning: There a known issues in using the Google Chrome browser for CIPRES Science Gateway. Specifically, data uploads and job creation are difficult or fail completely.  We are working on a fix, but in the meantime, we recommend you switch to a different browser.");
}
</script>

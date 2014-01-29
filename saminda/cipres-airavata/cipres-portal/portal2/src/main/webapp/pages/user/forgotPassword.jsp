<%@ taglib prefix="s" uri="/struts-tags" %>

<head>
	<title>Password Reset</title>
	<meta name="heading" content="Password Reset"/>
	<meta name="menu" content="Home"/>
</head>

<div class="formBox"> 
    <strong>Forgot your login information?</strong><br/><br/>
    Please enter either your registered username or email address,
    and you will receive a password reset confirmation link by email.<br/><br/>
  <s:form action="forgotPassword" theme="simple">
    <p>
      Username:<br/>
      <s:textfield name="username" size="30"/>
    </p>
    <p>
      Email:<br/>
      <s:textfield name="email" size="30"/>
    </p>
    <p>
      <s:submit value="Submit"/>&nbsp;
      <s:reset value="Reset"/>
    </p>
  </s:form>
</div>

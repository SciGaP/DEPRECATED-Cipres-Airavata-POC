<%@ taglib prefix="s" uri="/struts-tags" %>

<head>
	<title>User Profile Update</title>
	<meta name="menu" content="My Profile"/>
</head>

<h4><span class="username"><s:property value="authenticatedUsername"/></span> 's Profile</h4>

<div class="formBox">
  <h4><strong>Update Personal Information</strong></h4>
  <s:form action="updateProfile" theme="simple">
  <table>
    <tr><td><p><span class="warningPlain">* Required</span><p></td></tr>
    <tr>
      <td>
        <p><span class="warningPlain">*</span> First Name:<br />
        <s:textfield name="firstName" size="30"/></p>
      </td>
    </tr>
    <tr>
      <td>
        <p><span class="warningPlain">*</span> Last Name:<br />
        <s:textfield name="lastName" size="30"/></p>
      </td>
    </tr>
    <tr>
      <td>
        <p><span class="warningPlain">*</span> Email:<br />
        <s:textfield name="email" size="30"/></p>
      </td>
    </tr>
    <tr>
      <td>
        <p><span class="warningPlain">*</span> Confirm Email:<br />
        <s:textfield name="confirmEmail" size="30"/></p>
      </td>
    </tr>

    <tr>
      <td>
        <p>Organization:<br />
        <s:textfield name="organization" size="30"/></p>
      </td>
    </tr>

    <tr>
      <td>
        <p>
          <s:submit value="Update Profile"/>&nbsp;
          <s:reset value="Reset"/>
        </p>
      </td>
    </tr>
  </table>
  </s:form>
</div>

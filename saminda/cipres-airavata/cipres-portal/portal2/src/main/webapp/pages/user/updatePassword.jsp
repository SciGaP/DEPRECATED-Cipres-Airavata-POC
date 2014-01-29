<%@ taglib prefix="s" uri="/struts-tags" %>
<head>
	<title>User Password Update</title>
	<meta name="menu" content="My Profile"/>
</head>

<h4><span class="username"><s:property value="authenticatedUsername"/></span> 's Profile</h4>

<div class="formBox">
  <h4><strong>Update Password</strong></h4>
  <s:form action="updatePassword" theme="simple">
  <table>
    <tr><td><p><span class="warningPlain">* Required</span><p></td></tr>
    <tr>
      <td>
        <p><span class="warningPlain">*</span> Current Password:<br />
        <s:password name="currentPassword" size="30"/></p>
      </td>
    </tr>
    <tr>
      <td>
        <p><span class="warningPlain">*</span> New Password:<br />
        <s:password name="newPassword" size="30"/></p>
      </td>
    </tr>
    <tr>
      <td>
        <p><span class="warningPlain">*</span> New Password Confirmation:<br />
        <s:password name="confirmNewPassword" size="30"/></p>
      </td>
    </tr>
    <tr>
      <td>
        <p>
          <s:submit value="Update Password"/>&nbsp;
          <s:reset value="Reset"/>
        </p>
      </td>
    </tr>
  </table>
  </s:form>
</div>

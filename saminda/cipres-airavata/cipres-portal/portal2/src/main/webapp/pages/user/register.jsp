<%@ include file="/pages/common/taglibs.jsp" %>
<head>
	<title>Registration</title>
	<meta name="heading" content="New User Registration"/>
	<meta name="menu" content="Home"/>
</head>

<s:url id="guestUrl" action="guestLogin"/>

<p> New Users - please register or <s:a href="%{guestUrl}">proceed </s:a> without registration</p>

<fieldset>

	  <legend>Registration</legend>

      <s:form action="register" theme="simple" method="post">
      <table>
        <tr>
          <td>
            <p><span class="warningPlain">*</span>Username:<br/>
            <s:textfield name="username" size="30"/></p>
          </td>
        </tr>
        <tr>
          <td>
            <p><span class="warningPlain">*</span>Password:<br />
            <s:password name="newPassword" size="30"/></p>
          </td>
		  <td>
            <p><span class="warningPlain">*</span>Confirm Password:<br/>
            <s:password name="confirmNewPassword" size="30"/></p>
		  </td>
        </tr>
        <tr>
          <td>
            <p><span class="warningPlain">*</span>First Name:<br />
            <s:textfield name="firstName" size="30"/></p>
          </td>
          <td>
            <p><span class="warningPlain">*</span>Last Name:<br />
            <s:textfield name="lastName" size="30"/></p>
          </td>
        </tr>
        <tr>
          <td>
            <p><span class="warningPlain">*</span>Email:<br />
            <s:textfield name="email" size="30"/></p>
          </td>
          <td>
            <p><span class="warningPlain">*</span>Confirm Email:<br />
            <s:textfield name="confirmEmail" size="30"/></p>
          </td>
        </tr>
        <tr>
          <td>
          	<p>Organization:<br />
          	<s:textfield key="organization" size="30"/></p>
          </td>
        </tr>
        <tr>
          <td>
			<s:submit cssClass="button" value="Register" method="register"/>
			<s:reset cssClass="button"/>
			<s:submit cssClass="button" value="Cancel" method="cancel"/>
          </td>
        </tr>
      </table>
      </s:form>

</fieldset>

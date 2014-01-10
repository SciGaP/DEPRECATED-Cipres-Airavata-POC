<%@ taglib prefix="s" uri="/struts-tags" %>
<head>
	<title>User Profile</title>
	<meta name="menu" content="My Profile"/>
</head>


<h4><span class="username"><s:property value="authenticatedUsername"/></span> 's Profile</h4>

<div class="formBox">
  <h4><strong>Personal Information</strong></h4>
  <table>
    <tr>
      <th><p>Username:</p></th>
      <td><s:property value="authenticatedUsername"/></td>
    </tr>
    <tr>
      <th><p>Password:</p></th>
      <td>********</td>
      <td>
        <p>
          <span class="button">
            <s:url id="updatePasswordUrl" action="updatePassword" method="input"
              includeParams="none"/>
            <s:a href="%{updatePasswordUrl}">Edit</s:a>
          </span>
        </p>
      </td>
    </tr>
    <tr><td><hr class="space"/></td></tr>
    <tr>
      <th><p>First Name:</p></th>
      <td><s:property value="authenticatedUser.firstName"/></td>
      <td>
        <p>
          <span class="button">
            <s:url id="updateProfileUrl" action="updateProfile" method="input"
              includeParams="none"/>
            <s:a href="%{updateProfileUrl}">Edit</s:a>
          </span>
        </p>
      </td>
    </tr>
    <tr>
      <th><p>Last Name:</p></th>
      <td><s:property value="authenticatedUser.lastName"/></td>
    </tr>
    <tr>
      <th><p>Email:</p></th>
      <td><s:property value="authenticatedUser.email"/></td>
    </tr>
    <tr>
      <th><p>Organization:</p></th>
      <td><s:property value="authenticatedUser.institution"/></td>
    </tr>
    <tr>
      <th><p>Teragrid Allocation: </p></th>
      <td><s:property value="%{authenticatedUser.getAccount('teragrid')}"/></td>
    </tr>
  </table>
</div>

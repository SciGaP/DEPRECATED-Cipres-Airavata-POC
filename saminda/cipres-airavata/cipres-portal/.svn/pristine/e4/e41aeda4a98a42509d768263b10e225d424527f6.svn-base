<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login page</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
<p>
<p>
<%@include file ="navbar.jsp" %>
<%@include file ="header.jsp" %>

<p>
JobHandle: <s:property value="statusData.jobHandle"/>
<br>
Date Submitted: <s:date name="statusData.dateSubmitted"/>
<br>
Stage: <s:property value="statusData.jobStage"/>
<br>
<br>

<s:url action="taskDelete" var="taskDeleteUrl">
	<s:param name="cipresUrl"><s:property value="statusData.statusUri.url"/></s:param>
</s:url>

<a href="${taskDeleteUrl}">DELETE This Job.</a>

<s:if test="statusData.failed">
	<font color = "red">There was an ERROR processing the job!</font>
</s:if>
<br>

<s:if test="statusData.terminalStage">
	Job is finished.  These are the results:
	<p>
	<table>
		<s:iterator value="resultFiles" id="fileData">
			<tr>
				<td> Filename: <s:property value="filename"/> </td>
				<td> Length: <s:property value="length"/> </td>
				<!-- % sign is needed or fileUri.url will be treated as a string literal, not ognl -->

				<!--
				This doesn't work for umbrella account.  Browser prompts end user for credentials he doesn't have.
				<td> <s:a href="%{fileUri.url}">Download</s:a> </td>
				-->

				<!-- Try this instead -->
				<s:url action="download" var="downloadUrl">
					<s:param name="fileUrl"><s:property value="fileUri.url"/></s:param>
				</s:url>
				<td>
				<a href="${downloadUrl}">Download</a>
				</td>


			</tr>
		</s:iterator>
	</table>
</s:if>
<s:else>
	Job is NOT finished.  These are the files in the working directory.
	Understand that these files will be modified and eventually moved from their current
	location, as the job continues and the portal processes the results.  If you try to
	download at the moment a file is being moved, you may get an error.  
	<p>
	<table>
		<s:iterator value="workingDirFiles" id="fileData">
			<tr>
				<td> Filename: <s:property value="filename"/> </td>
				<td> Length: <s:property value="length"/> </td>


				<!-- % sign is needed or fileUri.url will be treated as a string literal, not ognl -->
				<!--
				This doesn't work for umbrella account.  Browser prompts end user for credentials he doesn't have.
				<td> <s:a href="%{fileUri.url}">Download</s:a> </td>
				-->

				<!-- Try this instead -->
				<s:url action="download" var="downloadUrl">
					<s:param name="fileUrl"><s:property value="fileUri.url"/></s:param>
				</s:url>
				<td>
				<a href="${downloadUrl}">Download</a>
				</td>

			</tr>
		</s:iterator>
	</table>
</s:else>
<br>
<table class="taskmessages">
<caption>Task Messages</caption>
	<s:iterator value="statusData.messages" id="taskMessage">
		<tr>
			<td><s:date name="timestamp"/> </td>
			<td><s:property value="stage"/> </td>
			<td><s:property value="message"/> </td>
		</tr>
	</s:iterator>
</table>
</div>

</body>




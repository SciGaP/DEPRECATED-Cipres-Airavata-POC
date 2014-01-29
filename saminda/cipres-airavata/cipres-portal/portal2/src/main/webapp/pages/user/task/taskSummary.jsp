<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="/pages/common/taglibs.jsp"%>
<%@ page isELIgnored='false'%>

<div class="tabbedBox">
<table class="cpu">
	<tr>
		<td><span class="prompt">You may edit your task using the tabs above.</span></td>
		<td class="cpu"> 
			<span class="attention1">Current CPU Hr Usage:</span>
			<span class="attention2"><s:property value="%{getCPUHours()}"/></span>
			<s:a href="javascript:popitup('http://www.phylo.org/tools/cpu_help.html')">Explain this?</s:a>
		</td>
	</tr>
</table>

<s:form action="createTask" theme="simple">
	<s:token/>
  <table class="appTable">
    <tr><td><span class="warningPlain">* Required</span></td></tr>
    <tr>
      <td><span class="warningPlain">*</span>Description:</td>
      <td>
        <s:textfield name="label" size="30" value="%{currentTaskLabel}" onChange="submitform()"/>
        <%-- s:submit value="Set Description" method="execute"/ --%>
      </td>
    </tr>

    <tr>
      <td><span class="warningPlain">*</span>Input:</td>
      <td>
        <span class="button">
          <s:a href="%{dataTabUrl}" onclick="submitform()">
            <s:if test="%{hasInput()}">
              <span style="font-weight: bold">
                <s:property value="inputCount"/> Inputs Set
              </span>
            </s:if>
            <s:else>Select Input Data</s:else>
          </s:a>
        </span>
      </td>
    </tr>

    <tr>
      <td><span class="warningPlain">*</span>Tool:</td>
      <td>
        <span class="button">
          <s:a href="%{toolTabUrl}" onclick="submitform()">
            <s:if test="%{hasTool()}">
              <span style="font-weight: bold">
                <s:property value="toolLabel"/>
              </span>
            </s:if>
            <s:else>Select Tool</s:else>
          </s:a>
        </span>
        <s:if test="%{hasTool()}">
		<c:set var="tool" value="${fn:toLowerCase(toolLabel)}"/>
		<a href="javascript:popitup('http://www.phylo.org/tools/${tool}.html')"/>click for more info</a>
        </s:if>

      </td>
    </tr>
    <tr>
      <td>Parameters:</td>
      <td>
        <span class="button">
          <s:a href="%{parametersTabUrl}" onclick="submitform()">
            <s:if test="%{hasParameters() && hasTool()}">
              <span style="font-weight: bold">
                <s:property value="%{getParameterCount()}"/> Parameters Set
              </span>
            </s:if>
            <s:else>Set Parameters</s:else>
          </s:a>
        </span>
      </td>
    </tr>
  </table>
  <table class="listOptions">
    <tr>
        <td><s:submit value="Save Task" method="execute"/></td>
        <td><s:submit value="Save and Run Task" method="execute" onclick="warnAboutDelay()"/></td>
        <td><s:submit value="Discard Task" method="cancel"/></td>
    </tr>
    <tr>
      <td class="prompt">Saved tasks can be run later from the task list</td>
      <td class="prompt">Your task will be saved</td>
      <td class="prompt">Clear all user-entered information</td>
    </tr>
	<tr>
		<td colspan="3" style="color:#F00; font-weight: bold; font-size: 120%; text-align: center" >
			 XSEDE tasks are limited to 168 hours. Non-XSEDE tasks are limited to 72 hours.
		</td>
	</tr>
  </table>
</s:form>
</div>
<SCRIPT language="JavaScript">
function submitform()
{
  /*
  alert(document.forms[0].label.value);
  alert(document.forms[0].action);
  alert(document.forms[0].param.value);
  var target = document.forms[0].action + "?tab=" + document.forms[0].param.value;
  document.forms[0].action = "http://localhost:8080/portal2/createTask!changeTab.action?tab=Select+Data";*/
  document.forms[0].submit();
}

function warnAboutDelay()
{
	alert("Submitting a job to run is a time consuming process. " +  
	"Pressing the back button, page reload or cancel, or opening new tabs, while your job is being submitted can " +
	"cause data corruption.  Please be patient.");
}
</SCRIPT> 

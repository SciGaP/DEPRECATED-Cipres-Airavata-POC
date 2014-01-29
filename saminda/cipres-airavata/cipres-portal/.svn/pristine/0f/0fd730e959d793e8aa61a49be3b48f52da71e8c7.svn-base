<%@ taglib prefix="s" uri="/struts-tags" %>

<h3>View Task Details</h3>

<div id="column">
  <s:if test="%{isRefreshable()}">
    <span class="button">
      <s:url id="refreshTaskUrl" action="task" method="display"
        includeParams="none">
        <s:param name="id" value="currentTaskId"/>
      </s:url>
      <s:a href="%{refreshTaskUrl}">Refresh Task</s:a>
    </span>
    <br/><br/>
  </s:if>
  <table class="form">
    <tr>
      <th>Task:</th>
      <td><s:property value="currentTaskLabel"/></td>
    </tr>
    <tr>
      <th>Owner:</th>
      <td><s:property value="currentTaskOwner"/></td>
    </tr>
    <tr>
      <th>Group:</th>
      <td><s:property value="currentTaskGroup"/></td>
    </tr>
    <tr>
      <th nowrap>Date Created:</th>
      <td><s:property value="currentTaskCreationDate"/></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
      <th>Tool:</th>
      <td><s:property value="toolLabel"/></td>
    </tr>
    <tr>
      <th>Input:</th>
      <td>
        <s:if test="%{hasMainInput()}">
          <span class="simpleLink">
            <s:url id="inputUrl" action="task" method="displayInput" includeParams="none"/>
            <s:a href="javascript:popitup('%{inputUrl}')">
              View (<s:property value="mainInputCount"/>)
            </s:a>
          </span>
        </s:if>
        <s:else>None</s:else>
      </td>
    </tr>
    <tr>
      <th>Parameters:</th>
      <td>
        <s:if test="%{hasParameters()}">
          <span class="simpleLink">
            <s:url id="parametersUrl" action="task" method="displayParameters"
              includeParams="none"/>
            <s:a href="javascript:popitup('%{parametersUrl}')">
              View (<s:property value="parameterCount"/>)
            </s:a>
          </span>
        </s:if>
        <s:else>None</s:else>
      </td>
    </tr>

    <tr>
      <th>Output:</th>
      <td>
        <s:if test="%{hasOutput()}">
          <span class="simpleLink">
            <s:url id="outputUrl" action="setTaskOutput" method="displayOutput"
              includeParams="none"/>
            <s:a href="%{outputUrl}">
              View (<s:property value="outputCount"/>)
            </s:a>
          </span>
        </s:if>
        <s:else>None</s:else>
      </td>
    </tr>

    <tr>
      <th nowrap>Intermediate Results:
  	<img src="<s:url value="/images/new.gif"/>"/>
     </th>
      <td>
        <s:if test="%{hasWorkingDirectory()}">
          <span class="simpleLink">
            <s:url id="workingDirectoryUrl" action="task" method="displayWorkingDirectory"
              includeParams="none"/>
            <s:a href="javascript:popitup('%{workingDirectoryUrl}')">
				List
            </s:a>
          </span>
        </s:if>
        <s:else>None</s:else>
      </td>
    </tr>
    <tr>

      <th>Status:</th>
      <td><s:property value="currentTaskStage"/></td>
    </tr>
  </table>
</div>

<div class="clear">
  <s:if test="%{hasTaskMessages()}">
    <br/>
    <table class="form">
      <tr><th>Task Messages:</th></tr>
      <tr>
        <td class="source">
          <s:iterator value="taskMessages" id="message">
            <s:property value="#message"/><br/>
          </s:iterator>
        </td>
      </tr>
    </table>
  </s:if>
  <br/>
  
  <span class="button">
    <s:url id="deleteTaskUrl" action="task" method="delete" includeParams="none"/>
    <s:a href="javascript:confirm_delete('%{deleteTaskUrl}')">Delete Task</s:a>
  </span>
  
  <span class="button">
    <s:url id="listTasksUrl" action="task" method="list" includeParams="none"/>
    <s:a href="%{listTasksUrl}">Return To Task List</s:a>
  </span>
</div>

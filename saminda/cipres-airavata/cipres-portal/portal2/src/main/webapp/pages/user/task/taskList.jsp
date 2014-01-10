<%@ taglib prefix="s" uri="/struts-tags" %>

<s:if test="%{hasFolderTasks()}">
  <div class="navInner">
    <ul>
      <s:iterator value="tabLabels" id="tab">
        <s:url id="tabUrl" action="task" method="list">
          <s:param name="tab" value="%{#tab}"/>
        </s:url>
        <li>
          <s:if test="%{currentTabLabel == #tab}">
            <s:a href="%{tabUrl}" cssClass="current">
              <span><s:property value="%{#tab}"/></span>
            </s:a>
          </s:if>
          <s:else>
            <s:a href="%{tabUrl}">
              <span><s:property value="%{#tab}"/></span>
            </s:a>
          </s:else>
        </li>
      </s:iterator>
    </ul>
  </div>
  <div class="tabbedBox">
    <s:if test="%{currentTabSize > 0}">
      <s:form action="paginateTasks" theme="simple">
		<table class="cpu"> 
        <tr>
          <td>
            <span class="button">
              <s:url id="refreshTasksUrl" action="task" method="refresh"
                includeParams="none"/>
              <s:a href="%{refreshTasksUrl}">Refresh&nbsp;Tasks</s:a>
            </span>
			</td>
			<td class="cpu"> 
				<span class="attention1">Current CPU Hr Usage:</span>
				<span class="attention2"><s:property value="%{getCPUHours()}"/></span>
				<s:a href="javascript:popitup('http://www.phylo.org/tools/cpu_help.html')">Explain this?</s:a>
			</td>
        </tr>
		</table>

      <table class="pageNav"> 
        <tr>
          <td class="prompt">
            <s:if test="%{currentTabSize != 1}">
              There are currently <s:property value="%{currentTabSize}"/>
              tasks in this tab.
              (Items <s:property value="%{thisPageFirstElementNumber + 1}"/> -
              <s:property value="%{thisPageLastElementNumber + 1}"/> are shown here.)
            </s:if>
            <s:else>
              There is currently 1 data item in this tab.
            </s:else>
          </td>
          <td class="records">
            Show
            <s:select name="pageSize" list="#{ 20:'20', 40:'40', 100:'100', 200:'200' }"
              onchange="reload(this.form)" value="pageSizeString"/>
            records on each page
          </td>
          <td>
            <div class="arrows">
              <!-- First Page -->
              <s:if test="%{isFirstPage() == false}">
                <s:url id="firstPageUrl" action="task" method="setPage" includeParams="none">
                  <s:param name="page" value="%{'0'}"/>
                </s:url>
                <span class="simpleLink">
                  <s:a href="%{firstPageUrl}">
                    <img src="<s:url value="/images/doubleArrow.gif"/>" alt="double left arrow" border="0"/>
                  </s:a>
                </span>
              </s:if>
              <s:else>
                <img src="<s:url value="/images/doubleArrow_dark.gif"/>" alt="double left arrow" border="0"/>
              </s:else>
              
              <!-- Previous Page -->
              <s:if test="%{hasPreviousPage()}">
                <s:url id="previousPageUrl" action="task" method="setPage" includeParams="none">
                  <s:param name="page" value="%{previousPageNumber}"/>
                </s:url>
                <span class="simpleLink">
                  <s:a href="%{previousPageUrl}">
                    <img src="<s:url value="/images/singleArrow.gif"/>" alt="single left arrow" border="0"/>
                  </s:a>
                </span>
              </s:if>
              <s:else>
                <img src="<s:url value="/images/singleArrow_dark.gif"/>" alt="single left arrow" border="0"/>
              </s:else>
              
              <!-- Current Page -->
              Page <s:property value="%{pageNumber + 1}"/>
              of <s:property value="%{lastPageNumber + 1}"/>
              
              <!-- Next Page -->
              <s:if test="%{hasNextPage()}">
                <s:url id="nextPageUrl" action="task" method="setPage" includeParams="none">
                  <s:param name="page" value="%{nextPageNumber}"/>
                </s:url>
                <span class="simpleLink">
                  <s:a href="%{nextPageUrl}">
                    <img src="<s:url value="/images/singleArrow_b.gif"/>" alt="single left arrow" border="0"/>
                  </s:a>
                </span>
              </s:if>
              <s:else>
                <img src="<s:url value="/images/singleArrow_b_dark.gif"/>" alt="single left arrow" border="0"/>
              </s:else>
              
              <!-- Last Page -->
              <s:if test="%{isLastPage() == false}">
                <s:url id="lastPageUrl" action="task" method="setPage" includeParams="none">
                  <s:param name="page" value="%{lastPageNumber}"/>
                </s:url>
                <span class="simpleLink">
                  <s:a href="%{lastPageUrl}">
                    <img src="<s:url value="/images/doubleArrow_b.gif"/>" alt="double left arrow" border="0"/>
                  </s:a>
                </span>
              </s:if>
              <s:else>
                <img src="<s:url value="/images/doubleArrow_b_dark.gif"/>" alt="double left arrow" border="0"/>
              </s:else>
            </div>
          </td>
        </tr>
      </table>
      </s:form>
      <s:form name="selectTasks" action="task" theme="simple">
      <hr class="space"/>
      <table class="list">
        <!-- Field Headers -->
        <tr>
          <th>
            <s:checkbox name="allChecked" onclick="ids.check(this)"/><br/>
	      </th>
	      <th>
            Select all
          </th>
          <th>Label</th>
          <th>Tool</th>
          <th>Input</th>
          <th>Parameters</th>
          <th>Output</th>
          <th>Date Created</th>
          <th>Action</th>
        </tr>
        
        <!-- Task Rows -->
        <s:set name="action" value="top"/>
        <s:iterator value="currentTaskTab" id="task" status="status">
          <s:if test="%{#status.odd == true}">
            <s:set name="rowclass" value="%{'tableroww'}"/>
          </s:if>
          <s:else>
            <s:set name="rowclass" value="%{'tablerowb'}"/>
          </s:else>
          <tr class="<s:property value="#rowclass"/>">
            <td style="white-space: nowrap">
              <s:checkbox name="selectedIds" fieldValue="%{#task.taskId}"
                value="%{selectedIds.{^ #this == #task.taskId}.size > 0}" theme="simple"
                onclick="ids.check(this)"/>
	    </td>
	    <td>
              <span class="button listLink">
                <s:url id="cloneTaskUrl" action="createTask" method="clone"
                  includeParams="none">
                  <s:param name="task" value="%{#task.taskId}"/>
                </s:url>
                <s:a href="%{cloneTaskUrl}">Clone</s:a>
              </span>
            </td>
            <s:url id="taskUrl" action="task" method="display" includeParams="none">
              <s:param name="id" value="%{#task.taskId}"/>
            </s:url>
            <td>
              <span class="simpleLink">
                <s:a href="%{taskUrl}" title="%{#task.label}">
                  <s:property value="%{#action.getLabel(#task)}"/>
                </s:a>
              </span>
            </td>
            <td><s:property value="%{#action.getToolLabel(#task)}"/></td>
            <td>
              <s:if test="%{#action.hasMainInput(#task)}">
                <span class="simpleLink">
                  <s:url id="inputUrl" action="task" method="displayInput" includeParams="none">
                    <s:param name="id" value="%{#task.taskId}"/>
                  </s:url>
                  <s:a href="javascript:popitup('%{inputUrl}')">
                    View (<s:property value="%{#action.getMainInputCount(#task)}"/>)
                  </s:a>
                </span>
              </s:if>
              <s:else>None</s:else>
            </td>
            <td>
              <s:if test="%{#action.hasParameters(#task)}">
                <span class="simpleLink">
                  <s:url id="parametersUrl" action="task" method="displayParameters"
                    includeParams="none">
                    <s:param name="id" value="%{#task.taskId}"/>
                  </s:url>
                  <s:a href="javascript:popitup('%{parametersUrl}')">
                    View (<s:property value="%{#action.getParameterCount(#task)}"/>)
                  </s:a>
                </span>
              </s:if>
              <s:else>None</s:else>
            </td>
            <td>
              <s:if test="%{#action.hasOutput(#task)}">
                <span class="simpleLink">
                  <s:url id="outputUrl" action="setTaskOutput" method="displayOutput"
                    includeParams="none">
                    <s:param name="id" value="%{#task.taskId}"/>
                  </s:url>
                  <s:a href="%{outputUrl}">
                    View (<s:property value="%{#action.getOutputCount(#task)}"/>)
                  </s:a>
                </span>
              </s:if>
              <s:else>None</s:else>
            </td>
            <td><s:property value="%{#action.getCreationDate(#task)}"/></td>
            <td>
              <s:if test="%{#action.isReady(#task)}">
                <span class="button listLink" onclick="warnAboutDelay()" >
                  <s:url id="runTaskUrl" action="createTask" method="run"
                    includeParams="none">
                    <s:param name="id" value="%{#task.taskId}"/>
                  </s:url>
                  <s:a href="%{runTaskUrl}">Run&nbsp;Task</s:a>
                </span>
              </s:if>
              <s:elseif test="%{#action.isCompleted(#task)}">
                <span class="button listLink">
                  <s:if test="%{#action.hasOutput(#task)}">
                    <s:a href="%{outputUrl}">View&nbsp;Output</s:a>
                  </s:if>
                  <s:else><a href="#" disabled="true">View&nbsp;Output</a></s:else>
                </span>
              </s:elseif>
              <s:elseif test="%{#action.hasError(#task)}">
                <span class="button listLink">
                  <s:a href="%{taskUrl}">View&nbsp;Error</s:a>
                </span>
              </s:elseif>
              <s:else>
                <span class="button listLink">
                  <s:a href="%{taskUrl}">View&nbsp;Status</s:a>
                </span>
              </s:else>
            </td>
          </tr>
        </s:iterator>
      </table>
    <table class="listOptions">
      <tr>
        <td>
          <s:hidden name="taskAction" value="%{'Move'}"/>
          Move selected to&nbsp;
          <s:select name="targetFolder" list="allFolders" listKey="folderId"
            listValue="label"/>&nbsp;
          <s:submit value="GO" method="cancel"/>
        </td>
        <td>
          <span class="button">
            <s:url id="createTaskUrl" action="createTask" method="create"
              includeParams="none"/>
            <s:a href="%{createTaskUrl}">Create New Task</s:a>
          </span>
        </td>
      </tr>
      <tr>
        <td><s:submit value="Delete Selected" method="cancel" onclick="return confirm_form()"/></td>
        <s:if test="%{hasNewTask()}">
          <td>
            <span class="button">
              <s:url id="continueTaskUrl" action="createTask" method="edit"
                includeParams="none"/>
              <s:a href="%{continueTaskUrl}">Continue Editing Current Task</s:a>
            </span>
          </td>
        </s:if>
      </tr>
    </table>
      </s:form>
    </s:if>
  </div>
</s:if>
<s:else>
  <h4>There are currently no tasks in this folder.</h4>
  <br/>
  <span class="button">
    <s:url id="createTaskUrl" action="createTask" method="create" includeParams="none"/>
    <s:a href="%{createTaskUrl}">Create New Task</s:a>
  </span>
  <s:if test="%{hasNewTask()}">
    <span class="button">
      <s:url id="continueTaskUrl" action="createTask" method="edit" includeParams="none"/>
      <s:a href="%{continueTaskUrl}">Continue Editing Current Task</s:a>
    </span>
  </s:if>
</s:else>

<script type="text/javascript">
var ids = new CheckBoxGroup();
ids.addToGroup("selectedIds");
ids.setControlBox("allChecked");
ids.setMasterBehavior("all");

function warnAboutDelay()
{
	alert("Submitting a job to run is a time consuming process. " +  
	"Pressing the back button, page reload or cancel, or opening new tabs, while your job is being submitted can " +
	"cause data corruption.  Please be patient.");
}
</script>

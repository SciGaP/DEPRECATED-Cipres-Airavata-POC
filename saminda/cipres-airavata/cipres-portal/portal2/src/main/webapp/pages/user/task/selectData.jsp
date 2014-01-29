<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="tabbedBox">
<s:if test="%{hasInput()}">
  <s:if test="%{hasMappedInput()}">
    <h5>You have selected the following data items to be set as input to the current task:</h5>
    <table class="list">
      <!-- Field Headers -->
      <tr>
        <th>Label</th>
        <th>Bytes</th>
        <th>Data Format</th>
        <th>Date Created</th>
      </tr>
      <!-- Data Item Rows -->
      <s:set name="action" value="top"/>
      <s:iterator value="mappedInput" id="dataItem" status="status">
        <s:if test="%{#status.odd == true}">
          <s:set name="rowclass" value="%{'tableroww'}"/>
        </s:if>
        <s:else>
          <s:set name="rowclass" value="%{'tablerowb'}"/>
        </s:else>
        <tr class="<s:property value="#rowclass"/>">
          <td><s:property value="%{#action.getLabel(#dataItem)}"/></td>
          <td><s:property value="%{#action.getDataLength(#dataItem)}"/></td>
          <td><s:property value="%{#action.getDataFormat(#dataItem)}"/></td>
          <td><s:property value="%{#action.getCreationDate(#dataItem)}"/></td>
        </tr>
      </s:iterator>
    </table>
    <br/>
  </s:if>
  <s:if test="%{hasUnmappedInput()}">
    <h5 class="clear">
      You have selected <s:property value="unmappedInputCount"/> data
      <s:property value="%{pluralize('item', getUnmappedInputCount())}"/>
      to be set as input to the current task that are no longer present in your user data.
    </h5>
  </s:if>
  <h5 class="clear">If you would like to select new input, you may do so below:</h5>
</s:if>

<s:if test="%{hasInputData()}">
  <s:form name="selectData" action="createTask" theme="simple">
  	<s:token/>
    <table class="list">
      <!-- Field Headers -->
      <tr>
		<!--
        <th>
          <s:checkbox name="allChecked" onclick="ids.check(this)"/>
          Select all
        </th>
		-->
        <th>Select One</th>
        <th>Label</th>
        <th>Bytes</th>
        <th>Data Format</th>
        <th>Date Created</th>
      </tr>
        
      <!-- Data Item Rows -->
      <s:set name="action" value="top"/>
      <s:iterator value="inputData" id="dataItem" status="status">
        <s:if test="%{#status.odd == true}">
          <s:set name="rowclass" value="%{'tableroww'}"/>
        </s:if>
        <s:else>
          <s:set name="rowclass" value="%{'tablerowb'}"/>
        </s:else>
        <tr class="<s:property value="#rowclass"/>">
          <td>
            <s:checkbox name="selectedIds" fieldValue="%{#dataItem.userDataId}"
              value="%{selectedIds.{^ #this == #dataItem.userDataId}.size > 0}" theme="simple"
              onclick="ids.check(this)"/>
          </td>
          <td><s:property value="%{#action.getLabel(#dataItem)}"/></td>
          <td><s:property value="%{#action.getDataLength(#dataItem)}"/></td>
          <td><s:property value="%{#action.getDataFormat(#dataItem)}"/></td>
          <td><s:property value="%{#action.getCreationDate(#dataItem)}"/></td>
        </tr>
      </s:iterator>
    </table>
    <table class="listOptions">
      <tr>
        <td>
          <s:submit value="Select Data" method="execute"/>&nbsp;
          <span class="prompt">Save Selected Data to Active Task</span>
        </td>
        <td><s:submit value="Cancel" method="cancel"/></td>
      </tr>
    </table>
  </s:form>
</s:if>
<s:else>
  <br/>
  <h5>There is currently no data available.<br/>What would you like to do?</h5>
  <br/>
  <span class="button">
    <s:url id="uploadDataUrl" action="pasteData" method="upload" includeParams="none"/>
    <s:a href="%{uploadDataUrl}">Upload/Enter Data</s:a>
  </span>
  <%--
  <span class="button">
    <s:url id="searchDataUrl" action="searchData" includeParams="none"/>
    <href="%{searchDataUrl}">Search Database</s:a>
  </span>
  --%>
</s:else>
</div>

<script type="text/javascript">
var ids = new CheckBoxGroup();
ids.addToGroup("selectedIds");
//ids.setControlBox("allChecked");
//ids.setMasterBehavior("all");
ids.setMaxAllowed(1, "You must uncheck the current selection to make a new selection.");
</script>

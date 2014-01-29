<%@ taglib prefix="s" uri="/struts-tags" %>

<h3>View Task Output Details</h3>

<span class="button">
  <s:url id="saveOutputUrl" action="setTaskOutput" method="input" includeParams="none"/>
  <s:a href="%{saveOutputUrl}">Save To Current Folder</s:a>
</span>
<span class="button">
  <s:url id="outputUrl" action="setTaskOutput" method="display" includeParams="none"/>
  <s:a href="%{outputUrl}">Return</s:a>
</span>
<br/><br/>
<span class="button" style="font-size: 1.3em">
  <s:url id="saveFileUrl" action="setTaskOutput" method="displayOutputFile" includeParams="none"/>
  <s:a href="%{saveFileUrl}">Download File</s:a>
</span>
<br/><br/>

<div id="column">
  <table class="form">
    <tr>
      <th>Tool:</th>
      <td><s:property value="toolLabel"/></td>
    </tr>
    <tr>
      <th>File Name:</th>
      <td><s:property value="filename"/></td>
    </tr>
    <tr>
      <th>File Size:</th>
      <td><s:property value="outputFileSize"/> Bytes</td>
    </tr>
  </table>
</div>

<s:if test="%{canRead()}">
  <table class="list">
    <!-- Field Headers -->
    <tr>
      <s:if test="%{canTransform()}">
        <th>Results</th>
      </s:if>
      <s:set name="action" value="top"/>
      <s:iterator value="recordFields" id="field">
        <th><s:property value="%{#action.getRecordField(#field)}"/></th>
      </s:iterator>
    </tr>
        
    <!-- Data Item Rows -->
    <s:set name="action" value="top"/>
    <s:iterator value="dataRecordList" id="dataRecord" status="status">
      <s:if test="%{#status.odd == true}">
        <s:set name="rowclass" value="%{'tableroww'}"/>
      </s:if>
      <s:else>
        <s:set name="rowclass" value="%{'tablerowb'}"/>
      </s:else>
      <tr class="<s:property value="#rowclass"/>">
        <s:if test="%{canTransform()}">
          <td>
            <s:url id="transformUrl" action="setTaskOutput" method="displayTransformedOutput"
              includeParams="none">
              <s:param name="index" value="#dataRecord.index"/>
            </s:url>
            <span class="simpleLink">
              <s:a href="%{transformUrl}">View</s:a>
            </span>
          </td>
        </s:if>
        <s:iterator value="%{#action.getRecordFields()}" id="field">
          <td>
            <s:property value="%{#action.getShortDataRecordField(#dataRecord, #field)}"/>
          </td>
        </s:iterator>
      </tr>
    </s:iterator>
  </table>
</s:if>

<s:if test="%{canDisplay()}">
<div class="clear">
  <br/>
  <span class="simpleLink">
    <s:a href="#" onclick="switchMenu('contents');">Show/Hide Output Contents</s:a>
  </span>
  <br/>
  <div id="contents">
    <br/>
    <s:property value="formattedOutput" escape="false"/>
  </div>
  <br/>
</div>
</s:if>

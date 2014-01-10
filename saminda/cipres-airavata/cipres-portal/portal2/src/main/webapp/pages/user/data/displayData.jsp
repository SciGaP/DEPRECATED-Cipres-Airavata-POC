<%@ taglib prefix="s" uri="/struts-tags" %>


<div class="column span-16 append-8 last">
  <h3>View Data Details</h3>
  
  <table class="form">
    <tr>
      <th>Label:</th>
      <td><s:property value="label"/></td>
    </tr>
    <tr>
      <th>Owner:</th>
      <td><s:property value="owner"/></td>
    </tr>
    <tr>
      <th>Group:</th>
      <td><s:property value="group"/></td>
    </tr>
    <tr>
      <th>Bytes:</th>
      <td><s:property value="dataLength"/></td>
    </tr>
    <tr>
      <th>Date Created:</th>
      <td><s:property value="creationDate"/></td>
    </tr>
    <tr>
      <th>Data Format:</th>
      <td><s:property value="dataFormat"/></td>
    </tr>
  </table>
</div>

<div class="clear">
<s:if test="%{hasFields()}">
  <table class="list">
    <tr><th colspan="2">Data Details</th></tr>
    <s:set name="action" value="top"/>
    <s:iterator value="fields" id="field" status="status">
      <s:if test="%{#status.odd == true}">
        <s:set name="rowclass" value="%{'tableroww'}"/>
      </s:if>
      <s:else>
        <s:set name="rowclass" value="%{'tablerowb'}"/>
      </s:else>
      <tr class="<s:property value="#rowclass"/>">
        <td style="font-style: italic">
          <s:property value="%{#action.getFieldLabel(#field)}"/>
        </td>
        <td><s:property value="%{#action.getFieldValue(#field)}"/></td>
      </tr>
    </s:iterator>
  </table>
</s:if>

<s:if test="%{hasDataRecords()}">
  <br/>
  <h5 style="clear: left">Data Records</h5>
  <table class="list">
    <!-- Field Headers -->
    <tr>
      <s:set name="action" value="top"/>
      <s:iterator value="dataRecordFields" id="field">
        <th><s:property value="%{#action.getFieldLabel(#field)}"/></th>
      </s:iterator>
    </tr>
    
    <!-- Data Item Rows -->
    <s:iterator value="dataRecordList" id="dataRecord" status="status">
      <s:if test="%{#status.odd == true}">
        <s:set name="rowclass" value="%{'tableroww'}"/>
      </s:if>
      <s:else>
        <s:set name="rowclass" value="%{'tablerowb'}"/>
      </s:else>
      <tr class="<s:property value="#rowclass"/>">
        <%-- TODO: make clickable link to drill down into the data record's source --%>
        <s:iterator value="dataRecordFields" id="field">
          <td><s:property value="%{getFieldValue(#dataRecord, #field)}"/></td>
        </s:iterator>
      </tr>
    </s:iterator>
  </table>
  <br/>
</s:if>

<div class="clear">
<s:if test="%{hasSourceDocument()}">
  <br/>
  <span class="simpleLink">
    <s:a href="#" onclick="switchMenu('contents');">Show/Hide Data Contents</s:a>

	<%-- s:if test="%{getDataType() == 'Phylogenetic Tree'}" --%>
	<s:if test="%{getDataFormat() == 'Newick (Phylip) Tree [.dnd]'}">
			<s:if test="%{isDrawConfigured()}">
				|	
				<s:url id="drawurl" action="draw" > </s:url>
				<s:a href="javascript:popitup('%{drawurl}')">Draw Tree</s:a>
			</s:if>	
	</s:if>

  </span>
  <br/>
  <div id="contents" style="display: none">
    <br/>
    <s:property value="formattedSourceData" escape="false"/>
  </div>
  <br/>
</s:if>
</div>

<span class="button">
  <s:url id="deleteDataUrl" action="data" method="delete" includeParams="none"/>
  <s:a href="javascript:confirm_delete('%{deleteDataUrl}')">Delete Data</s:a>
</span>

<span class="button">
	<s:url id="downloadDataUrl" action="data" method="download" includeParams="none"/>
	<s:a href="%{downloadDataUrl}">Download Data</s:a>
</span>

<span class="button">
  <s:url id="listDataUrl" action="data" method="list" includeParams="none"/>
  <s:a href="%{listDataUrl}">Return To Data List</s:a>
</span>
</div>

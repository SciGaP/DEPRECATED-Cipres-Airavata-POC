<%@ taglib prefix="s" uri="/struts-tags" %>

<h3>Save Output</h3>

<s:form action="setTaskOutput" theme="simple">
<table class="form">
  <tr><td><h4>Save Output File</h4></td></tr>
  <tr><td><span class="warningPlain">* Required</span></td></tr>
  <tr>
    <td>Tool:</td>
    <td><s:property value="toolLabel"/></td>
  </tr>
  <tr>
    <td>File Name:</td>
    <td><s:property value="filename"/></td>
  </tr>
  <tr>
    <td>File Size:</td>
    <td>
      <s:property value="outputFileSize"/> Bytes
    </td>
  </tr>
  <tr>
    <td><span class="warningPlain">*</span>Label:</td>
    <td><s:textfield name="label" size="50"/></td>
  </tr>
  <tr>
    <td><span class="warningPlain">*</span>Data Format:</td>
    <td><s:select name="dataFormat" list="phyloDataFormats"/></td>
  <%-- s:include value="/pages/common/dataUploadLists.jsp"/ --%>
  <tr>
    <td>
      <s:submit value="Save" method="execute"/>&nbsp;
      <s:submit value="Cancel" method="cancel"/>
    </td>
  </tr>
</table>
<%-- not used in portal2, set as hidden values to avoid validation error --%>
<s:hidden name="entityType" value="UNKNOWN"/>
<s:hidden name="dataType" value="UNKNOWN"/>
</s:form>

<div class="clear">
<s:if test="%{canDisplay()}">
  <br/>
  <span class="simpleLink">
    <s:a href="#" onclick="switchMenu('contents');">Show/Hide Data Contents</s:a>
  </span>
  <br/>
  <div id="contents" style="display: none">
    <br/>
    <s:property value="formattedOutput" escape="false"/>
  </div>
  <br/>
</s:if>
</div>

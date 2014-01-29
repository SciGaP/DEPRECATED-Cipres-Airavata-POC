<%@ taglib prefix="s" uri="/struts-tags" %>

<h3>Upload File</h3>

<s:form action="pasteData" theme="simple" method="POST"
  enctype="multipart/form-data">
<table class="form">
  <tr>
    <td>Label:</td>
    <td><s:textfield name="label" size="50"/></td>
  </tr>
  <tr>
    <td>Upload your file:</td>
    <td><s:file name="upload" size="50"/></td>
  </tr>
  <tr>
    <td>
      For Multiple Uploads, Click
      <span class="simpleLink">
        <s:url id="uploadDataUrl" action="uploadData" method="upload"
          includeParams="none"/>
        <s:a href="%{uploadDataUrl}">Here</s:a>
      </span>
    </td>
  </tr>
  <tr>
    <td>Or, enter your data:</td>
    <td><s:textarea name="source" cols="50" rows="10"/></td>
  </tr>
  <tr>
    <td colspan="2">
      <s:include value="/pages/common/dataUploadLists.jsp"/>
    </td>
  </tr>
  <tr>
    <td>
      <s:submit value="Save" method="executePaste"/>&nbsp;
      <s:submit value="Cancel" method="cancel"/>
    </td>
  </tr>
</table>
</s:form>

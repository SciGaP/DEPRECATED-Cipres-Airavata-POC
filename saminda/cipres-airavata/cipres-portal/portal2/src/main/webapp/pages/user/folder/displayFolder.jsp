<%@ taglib prefix="s" uri="/struts-tags" %>

<div id="column span-5">
<p></p>
<p></p>
<p></p>
 <h4>Current Folder Details:</h4>
<p></p> 
  <table class="form">
    <tr>
      <th>Label:</th>
      <td><s:property value="currentFolder.label"/></td>
    </tr>
    <s:if test="%{currentFolderHasDescription()}">
      <tr>
        <th>Description:</th>
        <td><s:property value="currentFolderDescription"/></td>
      </tr>
    </s:if>
  </table>
</div>

<s:if test="%{isRegistered()}">
  <div class="clear">
    <s:if test="%{currentFolderHasParent() == false}">
      <span class="button">
        <s:url id="createSubfolderUrl" action="folder" method="create" includeParams="none">
          <s:param name="parentFolder" value="%{currentFolder.folderId}"/>
        </s:url>
        <s:a href="%{createSubfolderUrl}">Create Subfolder</s:a>
      </span>
    </s:if>
    <span class="button">
      <s:url id="editFolderUrl" action="folder" method="edit" includeParams="none"/>
      <s:a href="%{editFolderUrl}">Edit Folder</s:a>
    </span>
    <span class="button">
      <s:url id="deleteFolderUrl" action="folder" method="delete" includeParams="none"/>
      <s:a href="javascript:confirm_delete('%{deleteFolderUrl}')">Delete Folder</s:a>
    </span>
  </div>
</s:if>

<s:if test="%{currentFolderHasParent() == false}">
  <br/>
  <%--
  <span class="button">
    <s:url id="importBwbUrl" action="importBwbData" method="input" includeParams="none"/>
    <s:a href="%{importBwbUrl}" title="Import data from the original Biology Workbench">
      Import BWB Data To This Folder
    </s:a>
  --%>
  </span>
</s:if>

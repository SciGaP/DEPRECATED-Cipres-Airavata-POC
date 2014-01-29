<%@ taglib prefix="s" uri="/struts-tags" %>
	<title>Home</title>

<h4>Welcome
  <span class="username"><s:property value="authenticatedUsername"/></span>
  to the CIPRES Science Gateway V <s:a href="http://www.phylo.org/index.php/portal/v33">3.3</s:a>.  If you would like to view a demo, click
  <s:url id="demoUrl" action="help" includeParams="none"/>
  <s:a href="http://www.phylo.org/index.php/help">here</s:a>.</h4>
  <br/>

<s:if test="%{isRegistered()}">
  <div class="clear">
    <span class="button">
      <s:url id="createFolderUrl" action="folder" method="create" includeParams="none"/>
      <s:a href="%{createFolderUrl}">Create New Folder</s:a>
    </span>
  </div>
  <br/>
  <br/>
</s:if>

<s:if test="%{hasCurrentFolder()}">
  <s:include value="/pages/user/folder/displayFolder.jsp"/>
</s:if>
<s:elseif test="%{hasFolders()}">
  <p>Click on a folder in the left panel to manage its contents.</p>
</s:elseif>


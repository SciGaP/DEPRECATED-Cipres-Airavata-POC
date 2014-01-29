<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="column span-5 append-1 folders">

<s:url id="homeUrl" action="folder" method="list" includeParams="none"/>
<s:a href="%{homeUrl}"><h3>Folders</h3></s:a>
<table id="treemenu">
  <s:if test="%{hasFolders()}">
    <s:set name="action" value="top"/>
    <s:iterator value="folders" id="folder">
    
      <!-- Top-level folder -->
      <s:url id="displayUrl" action="folder" method="display" includeParams="none">
        <s:param name="id" value="%{#folder.folderId}"/>
      </s:url>
      <tr>
        <th>
          <s:if test="%{#action.isExpanded(#folder)}">
            <s:a href="javascript:toggleFolder(%{#folder.folderId})" id="%{#folder.folderId}">
              <img src="<s:url value="/images/button_open.gif"/>" border="0"/>
            </s:a>
          </s:if>
          <s:else>
            <s:a href="javascript:toggleFolder(%{#folder.folderId})" id="%{#folder.folderId}">
              <img src="<s:url value="/images/button_closed.gif"/>" border="0"/>
            </s:a>
          </s:else>
        </th>
        <td>
          <s:a href="%{displayUrl}">
            <s:if test="%{#action.isCurrentFolder(#folder)}">
              <img src="<s:url value="/images/folder_sel_sm.gif"/>" border="0"/>
            </s:if>
            <s:else>
              <img src="<s:url value="/images/folder_sm.gif"/>" border="0"/>
            </s:else>
          </s:a>
        </td>
        <td colspan="2">
          <s:if test="%{#action.isCurrentFolder(#folder)}">
            <s:set name="style" value="%{'font-size: 110%; font-weight: bold; font-style: italic'}"/>
          </s:if>
          <s:else>
            <s:set name="style" value=""/>
          </s:else>
          <s:a href="%{displayUrl}" cssStyle="%{#style}">
            <s:property value="#folder.label"/>
          </s:a>
        </td>
      </tr>
      
      <!-- Expanded folder contents -->
      <s:if test="%{#action.isExpanded(#folder)}">
        <s:set name="display" value="%{'table-row-group'}"/>
      </s:if>
      <s:else>
        <s:set name="display" value="%{'none'}"/>
      </s:else>
      <tbody id="folder_<s:property value="%{#folder.folderId}"/>"
        style="display: <s:property value="#display"/>">
        <tr>
          <th/><td/>
          <td colspan="2">
            <s:url id="listDataUrl" action="data" method="list" includeParams="none">
              <s:param name="id" value="%{#folder.folderId}"/>
            </s:url>
            <s:a href="%{listDataUrl}">
              <img src="<s:url value="/images/page.gif"/>" border="0"/>
              Data (<s:property value="%{#action.getDataItemCount(#folder)}"/>)
            </s:a>
          </td>
        </tr>
        <tr>
          <th/><td/>
          <td colspan="2">
            <s:url id="listTasksUrl" action="task" method="list" includeParams="none">
              <s:param name="id" value="%{#folder.folderId}"/>
            </s:url>
            <s:a href="%{listTasksUrl}">
              <img src="<s:url value="/images/page.gif"/>" border="0"/>
              Tasks (<s:property value="%{#action.getTaskCount(#folder)}"/>)
            </s:a>
          </td>
        </tr>
      
      <!-- First level of subfolders -->
      <s:iterator value="%{#action.getSubfolders(#folder)}" id="subfolder">
    
      <!-- First-level subfolder -->
      <s:url id="displayUrl" action="folder" method="display" includeParams="none">
        <s:param name="id" value="%{#subfolder.folderId}"/>
      </s:url>
      <tr>
        <th/>
        <th>
          <s:if test="%{#action.isExpanded(#subfolder)}">
            <s:a href="javascript:toggleFolder(%{#subfolder.folderId})" id="%{#subfolder.folderId}">
              <img src="<s:url value="/images/button_open.gif"/>" border="0"/>
            </s:a>
          </s:if>
          <s:else>
            <s:a href="javascript:toggleFolder(%{#subfolder.folderId})" id="%{#subfolder.folderId}">
              <img src="<s:url value="/images/button_closed.gif"/>" border="0"/>
            </s:a>
          </s:else>
        </th>
        <td>
          <s:a href="%{displayUrl}">
            <s:if test="%{#action.isCurrentFolder(#subfolder)}">
              <img src="<s:url value="/images/folder_sel_sm.gif"/>" border="0"/>
            </s:if>
            <s:else>
              <img src="<s:url value="/images/folder_sm.gif"/>" border="0"/>
            </s:else>
          </s:a>
        </td>
        <td>
          <s:if test="%{#action.isCurrentFolder(#subfolder)}">
            <s:set name="style" value="%{'font-size: 110%; font-weight: bold; font-style: italic'}"/>
          </s:if>
          <s:else>
            <s:set name="style" value=""/>
          </s:else>
          <s:a href="%{displayUrl}" cssStyle="%{#style}">
            <s:property value="#subfolder.label"/>
          </s:a>
        </td>
      </tr>
      
      <!-- Expanded subfolder contents -->
      <s:if test="%{#action.isExpanded(#subfolder) && #display != 'none'}">
        <s:set name="subdisplay" value="%{'table-row-group'}"/>
      </s:if>
      <s:else>
        <s:set name="subdisplay" value="%{'none'}"/>
      </s:else>
      <tbody id="folder_<s:property value="%{#subfolder.folderId}"/>"
        style="display: <s:property value="#subdisplay"/>">
        <tr>
          <th/><th/><td/>
          <td>
            <s:url id="listDataUrl" action="data" method="list" includeParams="none">
              <s:param name="id" value="%{#subfolder.folderId}"/>
            </s:url>
            <s:a href="%{listDataUrl}">
              <img src="<s:url value="/images/page.gif"/>" border="0"/>
              Data (<s:property value="%{#action.getDataItemCount(#subfolder)}"/>)
            </s:a>
          </td>
        </tr>
        <tr>
          <th/><th/><td/>
          <td>
            <s:url id="listTasksUrl" action="task" method="list" includeParams="none">
              <s:param name="id" value="%{#subfolder.folderId}"/>
            </s:url>
            <s:a href="%{listTasksUrl}">
              <img src="<s:url value="/images/page.gif"/>" border="0"/>
              Tasks (<s:property value="%{#action.getTaskCount(#subfolder)}"/>)
            </s:a>
          </td>
        </tr>
      </tbody>
      
      </s:iterator>

      </tbody>
      
    </s:iterator>
  </s:if>
  <s:else>
    <tr><th/><th>None</th></tr>
  </s:else>
</table>

</div>

<script type="text/javascript">
function toggleFolder(folder) {
	var request = getAjaxRequest();
	if (request ==  null) {
		alert("getAjaxRequest() returned null!");
		return;
	}
	request.onreadystatechange = function() {
		if (request.readyState == 4) {
			if (request.status == 200) {
				var folders = request.responseXML.getElementsByTagName("folder");
				for (i=0; i<folders.length; i++) {
					var id = folders[i].attributes.getNamedItem("id").nodeValue;
					var block = document.getElementById("folder_" + id);
					var target = document.getElementById(id).attributes.getNamedItem("href");
					var image = document.getElementById(id).getElementsByTagName("img")[0];
					var expanded = folders[i].attributes.getNamedItem("expanded");
					if (expanded != null && expanded.nodeValue == "true") {
						block.style.display = "";
						target.nodeValue = "javascript:toggleFolder(" + id + ")";
						image.attributes.getNamedItem("src").nodeValue = "/portal2/images/button_open.gif";
					} else {
						block.style.display = "none";
						target.nodeValue = "javascript:toggleFolder(" + id + ")";
						image.attributes.getNamedItem("src").nodeValue = "/portal2/images/button_closed.gif";
					}
				}
			}
		}
	}
	var parameters = "?id=" + folder;
	request.open("GET", "toggleFolder.action" + parameters, true);
	request.setRequestHeader("If-Modified-Since", new Date(0));
	request.send(null);
}
</script>

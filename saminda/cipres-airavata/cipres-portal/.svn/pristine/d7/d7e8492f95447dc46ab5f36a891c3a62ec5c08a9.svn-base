<%@ taglib prefix="s" uri="/struts-tags" %>

<s:if test="%{hasFolderData()}">
  <div class="navInner">
    <ul>
      <s:iterator value="tabLabels" id="tab">
        <s:url id="tabUrl" action="data" method="list">
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
      <s:form action="paginateData" theme="simple">
      <table class="pageNav"> 
        <tr>
          <td class="prompt">
            <s:if test="%{currentTabSize != 1}">
              There are currently <s:property value="%{currentTabSize}"/>
              data items in this tab.
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
                <s:url id="firstPageUrl" action="data" method="setPage" includeParams="none">
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
                <s:url id="previousPageUrl" action="data" method="setPage" includeParams="none">
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
                <s:url id="nextPageUrl" action="data" method="setPage" includeParams="none">
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
                <s:url id="lastPageUrl" action="data" method="setPage" includeParams="none">
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
      <hr class="space"/>
      <s:form name="selectData" action="data" theme="simple">


      <fieldset>
      <legend>Use Data</legend>
      <table class="list">
        <!-- Field Headers -->
        <tr>
          <th>
            <s:checkbox name="allChecked" onclick="ids.check(this)"/>
            Select all
          </th>
          <th>User Data ID</th>

          <s:if test="%{isCurrentTabUnknown()}">
            <th>Label</th>
            <s:set name="action" value="top"/>
            <s:iterator value="currentTabFields" id="field">
              <th><s:property value="%{#action.getRecordField(#field)}"/></th>
            </s:iterator>
            <th>Date Created</th>
          </s:if>

          <s:elseif test="%{isCurrentTabPhysical()}">
            <th>Label</th>
            <th>Bytes</th>
            <th>Data Format</th>
            <th>Date Created</th>
          </s:elseif>

		  <!--
          <s:else>
            <s:set name="action" value="top"/>
            <s:iterator value="currentTabFields" id="field">
              <th><s:property value="%{#action.getRecordField(#field)}"/></th>
            </s:iterator>
            <s:if test="%{#action.canDisplay()}">
              <th>View</th>
            </s:if>
          </s:else>
		  -->
        </tr>
        
        <!-- Data Item Rows -->
        <s:set name="action" value="top"/>
        <s:iterator value="currentDataTab" id="dataItem" status="status">
          <s:if test="%{#status.odd == true}">
            <s:set name="rowclass" value="%{'tableroww'}"/>
          </s:if>
          <s:else>
            <s:set name="rowclass" value="%{'tablerowb'}"/>
          </s:else>

          <s:set name="dataId" value="%{#dataItem.userDataId}"/>
          
          <tr class="<s:property value="#rowclass"/>">
            <td>
              <s:checkbox name="selectedIds" fieldValue="%{#dataId}"
                value="%{selectedIds.{^ #this == #dataId}.size > 0}" theme="simple"
                onclick="ids.check(this)"/>
            </td>
            <td>
              <s:url id="dataUrl" action="data" method="display" includeParams="none">
                <s:param name="id" value="%{#dataId}"/>
              </s:url>
              <span class="simpleLink">
                <s:a href="%{dataUrl}">
                  <s:property value="%{#dataId}"/>
                </s:a>
              </span>
            </td>
            
            <!-- Row in the "All Data" tab -->
            <s:if test="%{isCurrentTabPhysical()}">
              <td><s:property value="%{#action.getLabel(#dataItem)}"/></td>
              <td><s:property value="%{#action.getDataLength(#dataItem)}"/></td>
              <td><s:property value="%{#action.getDataFormat(#dataItem)}"/></td>
              <td><s:property value="%{#action.getCreationDate(#dataItem)}"/></td>
            </s:if>
            
            <!-- Row for an unparsable data item, with no data records -->
            <s:elseif test="%{#action.hasDataRecords(#dataItem) == false}">
              <s:if test="%{isCurrentTabUnknown()}">
                <td><s:property value="%{#action.getLabel(#dataItem)}"/></td>
              </s:if>
              <!-- Generate blank table cells for each unrepresented column -->
              <s:iterator value="currentTabFields"><td/></s:iterator>
              <s:if test="%{isCurrentTabUnknown()}">
                <td><s:property value="%{#action.getCreationDate(#dataItem)}"/></td>
              </s:if>
            </s:elseif>
            
            <!-- Row for a parsable data item, with data records -->
            <s:else>
              <s:iterator value="%{#action.getDataRecordList(#dataItem)}" id="dataRecord"
                status="recordStatus">
                <s:if test="%{isCurrentTabUnknown()}">
                  <td><s:property value="%{#action.getLabel(#dataItem)}"/></td>
                </s:if>
                <s:iterator value="%{#action.getCurrentTabFields()}" id="field">
                  <td>
                    <s:property value="%{#action.getDataRecordField(#dataRecord, #field)}"/>
                  </td>
                </s:iterator>
                <s:if test="%{isCurrentTabUnknown()}">
                  <td><s:property value="%{#action.getCreationDate(#dataItem)}"/></td>
                </s:if>
                <s:if test="%{#action.canDisplay()}">
                  <td>
                    <!-- TODO: externalize this URL -->
                    <s:url id="siriusUrl" value="http://8ball.sdsc.edu/siriuswb/siriuswb.jsp"
                      includeParams="none">
                      <s:param name="username" value="%{authenticatedUsername}"/>
                      <s:param name="password" value="%{authenticatedPassword}"/>
                      <s:param name="input" value="%{#dataId}"/>
                      <s:param name="pass" value="%{authenticatedPassword}"/>
                      <s:param name="type" value="%{siriusType}"/>
                    </s:url>
                    <s:a href="javascript:popitup('%{siriusUrl}')">
                      <img src="<s:url value="/images/newstructure.jpg"/>" border="0"/>
                    </s:a>
                  </td>
                </s:if>
              </s:iterator>
            </s:else>
            
          </tr>
        </s:iterator>
      </table>
      </fieldset>
      
      <fieldset>
      <legend>Manage Data</legend>
      <table class="listOptions">
        <tr>
          <td>
            <s:select name="dataAction" list="#{'Move':'Move', 'Copy':'Copy'}"/>
            &nbsp;selected to&nbsp;
          </td>
          <td>
            <span class="button">
              <s:url id="uploadDataUrl" action="pasteData" method="upload"
                includeParams="none"/>
              <s:a href="%{uploadDataUrl}">Upload Data</s:a>
            </span>
          </td>
		  <%--
          <td>
            <span class="button">
              <s:url id="changeTabSortingUrl" action="data" method="changeTabSorting"
                includeParams="none"/>
              <s:a href="%{changeTabSortingUrl}">Change Sorting</s:a>
            </span>
          </td>
		  --%>
        </tr>
        <tr>
          <td>
            <s:select name="targetFolder" list="allFolders" listKey="folderId"
              listValue="label"/>&nbsp;
            <s:submit value="GO" method="cancel"/>
          </td>

		  <!-- not needed for cipres -->
		  <%--
          <td>
            <span class="button">
              <s:url id="searchDataUrl" action="searchData" includeParams="none"/>
              <s:a href="%{searchDataUrl}">Search for Data</s:a>
            </span>
          </td>
		  --%>
        </tr>
        <tr>
          <td><s:submit value="Delete Selected" method="cancel" onclick="return confirm_form()"/></td>
        </tr>
      </table>
      </fieldset>
      
      </s:form>
    </s:if>
  </div>
</s:if>
<s:else>
  <h4>
    There is currently no data in this folder.<br/>What would you like to do?
  </h4>
  <br/>
  <span class="button">
    <s:url id="uploadDataUrl" action="pasteData" method="upload" includeParams="none"/>
    <s:a href="%{uploadDataUrl}">Upload/Enter Data</s:a>
  </span>
  <span class="button">
    <s:url id="createTaskUrl" action="createTask" method="create" includeParams="none"/>
    <s:a href="%{createTaskUrl}">Create a Task</s:a>
  </span>
  <%--
  <span class="button">
    <s:url id="searchDataUrl" action="searchData" includeParams="none"/>
    <s:a href="%{searchDataUrl}">Search for Data</s:a>
  </span>
  --%>
</s:else>

<script type="text/javascript">
var ids = new CheckBoxGroup();
ids.addToGroup("selectedIds");
ids.setControlBox("allChecked");
ids.setMasterBehavior("all");
</script>

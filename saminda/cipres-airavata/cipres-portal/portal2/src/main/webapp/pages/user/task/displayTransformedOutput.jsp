<%@ taglib prefix="s" uri="/struts-tags" %>

<s:if test="%{hasTransformedRecords()}">
  <h3>View Output Record Details</h3>
  <s:if test="%{resultCount > 0}">
    <s:form action="paginateOutput" theme="simple">
    <table> 
      <tr>
        <td class="prompt">
          <s:if test="%{resultCount != 1}">
            This output contains <s:property value="%{resultCount}"/> records.
            (Records <s:property value="%{thisPageFirstElementNumber + 1}"/> -
            <s:property value="%{thisPageLastElementNumber + 1}"/> are shown here.)
          </s:if>
          <s:else>
            This output contains 1 record.
          </s:else>
        </td>
        <td>
          Show
          <s:select name="pageSize" list="#{ 20:'20', 40:'40', 100:'100', 200:'200' }"
            onchange="reload(this.form)" value="pageSizeString"/>
          records on each page
        </td>
        <td>
          <div class="pageNav">
            <!-- First Page -->
            <s:if test="%{isFirstPage() == false}">
              <s:url id="firstPageUrl" action="paginateOutput" method="setPage" includeParams="none">
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
              <s:url id="previousPageUrl" action="paginateOutput" method="setPage" includeParams="none">
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
              <s:url id="nextPageUrl" action="paginateOutput" method="setPage" includeParams="none">
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
              <s:url id="lastPageUrl" action="paginateOutput" method="setPage" includeParams="none">
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
    <s:form action="setTaskOutput" theme="simple">
    <table class="listOptions">
      <tr>
        <td>
          <s:submit value="Save Results" method="saveSelected"/>&nbsp;
          <span class="prompt">Save Selected Output Records to Current Folder</span>
        </td>
      </tr>
    </table>
    <table class="list">
      <!-- Field Headers -->
      <tr>
        <th>
          <s:checkbox name="allChecked" onclick="ids.check(this)"/>
          Select all
        </th>
        <s:set name="action" value="top"/>
        <s:iterator value="transformedRecordFields" id="field">
          <th><s:property value="%{#action.getRecordField(#field)}"/></th>
        </s:iterator>
      </tr>
        
      <!-- Data Item Rows -->
      <s:set name="action" value="top"/>
      <s:iterator value="transformedRecordPage" id="dataRecord" status="status">
        <s:if test="%{#status.odd == true}">
          <s:set name="rowclass" value="%{'tableroww'}"/>
        </s:if>
        <s:else>
          <s:set name="rowclass" value="%{'tablerowb'}"/>
        </s:else>
        <tr class="<s:property value="#rowclass"/>">
          <td>
            <s:set name="index" value="%{#status.index}"/>
            <s:checkbox name="selectedIds" fieldValue="%{#index}"
              value="%{selectedIds.{^ #this == #index}.size > 0}" theme="simple"
              onclick="ids.check(this)"/>
          </td>
          <s:iterator value="%{#action.getTransformedRecordFields()}" id="field">
            <td>
              <s:if test="%{#action.isPrimaryId(#field)}">
                <s:url id="dataUrl" action="paginateOutput" method="displayTransformedRecord"
                  includeParams="none">
                  <s:param name="id" value="%{#index}"/>
                </s:url>
                <span class="simpleLink">
                  <s:a href="%{dataUrl}">
                    <s:property value="%{#action.getTransformedRecordField(#dataRecord, #field)}"/>
                  </s:a>
                </span>
              </s:if>
              <s:else>
                <s:property value="%{#action.getTransformedRecordField(#dataRecord, #field)}"/>
              </s:else>
            </td>
          </s:iterator>
        </tr>
      </s:iterator>
    </table>
    <table class="listOptions">
      <tr>
        <td>
          <s:submit value="Save Results" method="saveSelected"/>&nbsp;
          <span class="prompt">Save Selected Output Records to Current Folder</span>
        </td>
      </tr>
    </table>
    </s:form>
  </s:if>
  <s:else>
    <p class="prompt">This output contains 0 records.</p>
  </s:else>
</s:if>
<s:else>
  <h5>This output contains 0 records.</h5>
  <br/>
</s:else>

<script type="text/javascript">
var ids = new CheckBoxGroup();
ids.addToGroup("selectedIds");
ids.setControlBox("allChecked");
ids.setMasterBehavior("all");
</script>

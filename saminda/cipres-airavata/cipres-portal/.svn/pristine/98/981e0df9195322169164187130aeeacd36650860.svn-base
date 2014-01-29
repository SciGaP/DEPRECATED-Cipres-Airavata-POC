<%@ taglib prefix="s" uri="/struts-tags" %>

<body onload="resolveParameters()">

<!-- Task creation step tabs -->
<div class="navInner">
  <ul>
    <s:url id="summaryTabUrl" action="createTask" method="changeTab"
      includeParams="none">
      <s:param name="tab" value="%{'Task Summary'}"/>
    </s:url>
    <li>
      <s:if test="%{tab == null || tab == 'Task Summary'}">
        <s:a href="%{summaryTabUrl}" cssClass="current">
          <span>Task Summary</span>
        </s:a>
      </s:if>
      <s:else>
        <s:a href="%{summaryTabUrl}">
          <span>Task Summary</span>
        </s:a>
      </s:else>
    </li>
    <s:url id="dataTabUrl" action="createTask" method="changeTab"
      includeParams="none">
      <s:param name="tab" value="%{'Select Data'}"/>
    </s:url>
    <li>
      <s:if test="%{tab == 'Select Data'}">
        <s:a href="%{dataTabUrl}" cssClass="current">
          <span>Select Data</span>
        </s:a>
      </s:if>
      <s:else>
        <s:a href="%{dataTabUrl}">
          <span>Select Data</span>
        </s:a>
      </s:else>
    </li>
    <s:url id="toolTabUrl" action="createTask" method="changeTab"
      includeParams="none">
      <s:param name="tab" value="%{'Select Tool'}"/>
    </s:url>
    <li>
      <s:if test="%{tab == 'Select Tool'}">
        <s:a href="%{toolTabUrl}" cssClass="current">
          <span>Select Tool</span>
        </s:a>
      </s:if>
      <s:else>
        <s:a href="%{toolTabUrl}">
          <span>Select Tool</span>
        </s:a>
      </s:else>
    </li>
    <s:url id="parametersTabUrl" action="createTask" method="changeTab"
      includeParams="none">
      <s:param name="tab" value="%{'Set Parameters'}"/>
    </s:url>
    <li>
      <s:if test="%{tab == 'Set Parameters'}">
        <s:a href="%{parametersTabUrl}" cssClass="current">
          <span>Set Parameters</span>
        </s:a>
      </s:if>
      <s:else>
        <s:a href="%{parametersTabUrl}">
          <span>Set Parameters</span>
        </s:a>
      </s:else>
    </li>
  </ul>
</div>

<s:if test="%{tab == null || tab == 'Task Summary'}">
  <s:include value="/pages/user/task/taskSummary.jsp"/>
</s:if>
<s:elseif test="%{tab == 'Select Data'}">
  <s:include value="/pages/user/task/selectData.jsp"/>
</s:elseif>
<s:elseif test="%{tab == 'Select Tool'}">
  <s:include value="/pages/user/task/selectTool.jsp"/>
</s:elseif>
<s:elseif test="%{tab == 'Set Parameters'}">
  <div class="tabbedBox">
    <s:if test="%{tool != null}">
      <div id="parameters">
        <s:include value="/pages/tool/%{tool.toLowerCase()}.jsp"/>
      </div>
    </s:if>
    <s:else>
      <h5>You must select a tool before you can set parameters.</h5>
      <br/>
    </s:else>
  </div>
</s:elseif>
<s:else>
  <div class="tabbedBox">
    <h4>Unknown Tab</h4>
  </div>
</s:else>

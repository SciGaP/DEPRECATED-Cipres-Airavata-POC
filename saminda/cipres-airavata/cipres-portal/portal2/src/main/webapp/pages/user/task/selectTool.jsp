<%@ taglib prefix="s" uri="/struts-tags" %>

<hr class="space"/>
<div class="navInner">
  <ul>
    <li>
      <s:url id="phylogenyTabUrl" action="createTask" method="changeToolTab"
        includeParams="none">
        <s:param name="tab" value="%{'Phylogeny / Alignment Tools'}"/>
      </s:url>
      <s:if test="%{toolTab == 'Phylogeny / Alignment Tools'}">
        <s:a href="%{phylogenyTabUrl}" cssClass="current">
          <span>Phylogeny / Alignment Tools</span>
        </s:a>
      </s:if>
      <s:else>
        <s:a href="%{phylogenyTabUrl}">
          <span>Phylogeny / Alignment Tools</span>
        </s:a>
      </s:else>
    </li>
  </ul>
</div>


<hr class="space"/>
<h4><s:property value="#type"/> Tools</h4>
<div class="column span-8">
  <ul class="toollist">
    <s:set name="action" value="top"/>
    <s:iterator value="%{splitFirstColumn(getToolsOfType(#type))}" id="tool">
      <li>
        <s:url id="selectToolUrl" action="createTask" method="selectTool" includeParams="none">
          <s:param name="selectedTool" value="%{#tool}"/>
        </s:url>
        <strong>
          <s:a href="%{selectToolUrl}">
            <s:property value="%{#action.getToolLabel(#tool)}"/>
          </s:a>
        </strong>
        <s:if test="%{#action.hasToolVersion(#tool)}">
          (<s:property value="%{#action.getToolVersion(#tool)}"/>)
        </s:if>
        <span class="simpleLink">
          <s:a href="javascript:popitup('http://www.phylo.org/tools/%{#tool.toLowerCase()}.html')">
            <img src="<s:url value="/images/info.png"/>" border="0"/>
          </s:a>
        </span>
        - <s:property value="%{#action.getToolDescription(#tool)}"/>
      </li>
    </s:iterator>
   <%--
  </ul>
</div>
<div class="column span-8 last">
  <ul>
  --%>
    <s:set name="action" value="top"/>
    <s:iterator value="%{splitSecondColumn(getToolsOfType(#type))}" id="tool">
      <li>
        <s:url id="selectToolUrl" action="createTask" method="selectTool" includeParams="none">
          <s:param name="selectedTool" value="%{#tool}"/>
        </s:url>
        <strong>
          <s:a href="%{selectToolUrl}">
            <s:property value="%{#action.getToolLabel(#tool)}"/>
          </s:a>
        </strong>
        <s:if test="%{#action.hasToolVersion(#tool)}">
          (<s:property value="%{#action.getToolVersion(#tool)}"/>)
        </s:if>
        <span class="simpleLink">
          <s:a href="javascript:popitup('http://www.phylo.org/tools/%{#tool.toLowerCase()}.html')">
            <img src="<s:url value="/images/info.png"/>" border="0"/>
          </s:a>
        </span>
        - <s:property value="%{#action.getToolDescription(#tool)}"/>
      </li>
    </s:iterator>
    <br/>
    <li>
    <p>
    <strong>
      <em>
  	<p width="800px"><strong>If there is a  tool or a feature you need, please <a href="javascript:popupWithSizes('http://phylo-bugz.sdsc.edu/fogbugz/default.asp?pg=pgPublicEdit',800,600,'1')">let us know</a>.
	</strong></p> 
      </em>
    </strong>
  </p>
  </li>
  </ul>
</div>

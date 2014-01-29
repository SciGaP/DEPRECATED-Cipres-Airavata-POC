<%@ include file="/pages/common/taglibs.jsp" %>
<%@ page isELIgnored='false'%>

<!-- determine the current menu tab to highlight -->
<c:set var="current_menu" scope="request">
	<decorator:getProperty property="meta.menu" default="My Workbench"/>
</c:set>

<ul>
	<!-- make them the same for now -->
	<!-- s:property value="%{isAuthenticated()}"/ -->
	<s:if test="%{isAuthenticated() != true}">
		<li><a href="<s:url action='home.action'/>" class="${current_menu == 'Home' ? 'current' : ''}"><span>Home</span></a></li>
		<li><a href="<s:url action='tools.action'/>" class="${current_menu == 'Toolkit' ? 'current': ''}"><span>Toolkit</span></a></li>
		<li><a href="<s:url action='home.action'/>" class="${current_menu == 'My Workbench' ? 'current' : ''}"><span>My Workbench</span></a></li>
		<li><a href="<s:url action='profile.action'/>" class="${current_menu == 'My Profile' ? 'current' : ''}"><span>My Profile</span></a></li>
		<li><a href="javascript:popitup('http://www.phylo.org/index.php/help/')" class='${current_menu == 'Help' ? 'current' : ''}'><span>Help</span></a></li>
		<li><a href="javascript:popitup('http://www.phylo.org/ee/index.php/portal/cite_us')" class='${current_menu == 'Cite' ? 'current' : ''}'><span>How to Cite Us</span></a></li>
		<li><a href="<s:url action='logout.action'/>"><span>Logout</span></a></li>
		<li><a href="<s:url action='statistics.action'/>" class="${current_menu == 'Statistics' ? 'current' : ''}"><span>Job Logs</span></a></li>
	</s:if>
	<s:else>
		<!-- Default selection -->
		<li><a href="<s:url action='home.action'/>" class="${current_menu == 'Home' ? 'current' : ''}"><span>Home</span></a></li>
		<li><a href="<s:url action='tools.action'/>" class="${current_menu == 'Toolkit' ? 'current': ''}"><span>Toolkit</span></a></li>
		<li><a href="<s:url action='home.action'/>" class="${current_menu == 'My Workbench' ? 'current' : ''}"><span>My Workbench</span></a></li>
		<li><a href="<s:url action='profile.action'/>" class="${current_menu == 'My Profile' ? 'current' : ''}"><span>My Profile</span></a></li>
		<li><a href="javascript:popitup('http://www.phylo.org/index.php/help/')" class='${current_menu == 'Help' ? 'current' : ''}'><span>Help</span></a></li>
		<li><a href="javascript:popitup('http://www.phylo.org/index.php/portal/cite_us')" class='${current_menu == 'Cite' ? 'current' : ''}'><span>How to Cite Us</span></a></li>
		<li><a href="<s:url action='logout.action'/>"><span>Logout</span></a></li>
		<li><a href="<s:url action='statistics.action'/>" class="${current_menu == 'Statistics' ? 'current' : ''}"><span>Job Logs</span></a></li>
	</s:else>
</ul>


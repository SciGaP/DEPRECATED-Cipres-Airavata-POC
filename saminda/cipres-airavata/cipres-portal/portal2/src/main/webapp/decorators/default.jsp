<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN"
   "http://www.w3.org/TR/html4/strict.dtd">

<%@ include file="/pages/common/taglibs.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
<script type="text/javascript">
</script>
	<%@ include file="/pages/common/meta.jsp" %>
	<title>Cipres Science Gateway | <decorator:title default="Welcome"/></title>
  <!-- Framework CSS -->
	<link rel="stylesheet" href="<c:url value='/css/blueprint/screen.css'/>" type="text/css" media="screen, projection"/>
	<link rel="stylesheet" href="<c:url value='/css/blueprint/print.css'/>" type="text/css" media="print"/>
  <!--[if IE]><link rel="stylesheet" href="<c:url value='/css/blueprint/ie.css'/>" type="text/css" media="screen, projection"/><![endif]-->
  <!-- Custom CSS -->
	<link rel="stylesheet" href="<c:url value='/css/custom.css'/>" type="text/css" media="screen, projection"/>
	<link rel="stylesheet" href="<c:url value='/css/cipres.css'/>" type="text/css" media="screen, projection"/>
	<link rel="stylesheet" href="<c:url value='/css/messages.css'/>" type="text/css" media="screen, projection"/>
  <!-- javascript -->
    <!-- added for the whats this? start -->
    <script type="text/javascript" src="<c:url value='https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js'/>"></script>
  	<script type="text/javascript" src="<c:url value='/js/qtip/jquery.qtip.min.js'/>"></script>
  	<!-- added for the whats this? end -->
  	<script type="text/javascript" src="<c:url value='/js/ngbw.js'/>"></script>
  	<script type="text/javascript" src="<c:url value='/js/swami.js'/>"></script>
  	<script type="text/javascript" src="<c:url value='/js/checkboxgroup.js'/>"></script>
  	<script type="text/javascript" src="<c:url value='/js/switchcontent.js'/>"></script>
  	<script type="text/javascript" src="<c:url value='/js/animatedcollapse.js'/>"></script>
  	
  <!-- added for the whats this? one line -->	
  	<script type="text/javascript" src="<c:url value='/js/qtip/qtip.custom.js'/>"></script>

	<!-- pick up any header info from *.jsp if any -->
	<!-- meta name="heading" content="Login"/ -->
	<decorator:head/>
</head>

<body onload="<decorator:getProperty property='body.onload'/>" <decorator:getProperty property="body.id" writeEntireProperty="true"/><decorator:getProperty property="body.class" writeEntireProperty="true"/>>

<div class="container-stretch">	

<div class="container">
<!-- BEGIN HEADER CONTAINER -->

	<div id="page-head" class="span-24 last">
	<!-- BEGIN PAGE HEADER -->
					<div class="top-affiliates">
			<a href="http://www.iplantcollaborative.org/"><img src="images/iplant-top.gif" alt="iPlant logo" height="45" width="138" border="0" class="iplant-top" /></a>
			<a href="http://www.xsede.org/"><img src="images/xsede-top.gif" alt="XSEDE logo" height="45" border="0" class="xsede-top" /></a>
			</div>
					  
		<h1><a href="home.action">Cipres Web Portal</a></h1>
	</div>
	<!-- END PAGE HEADER -->	

	<div class="span-24 last">
	<!-- BEGIN MAIN NAVIGATION -->
		<div class="navMain">
			<%@ include file="/pages/common/menu.jsp" %>
		</div>
	</div>
	<!-- END MAIN NAVIGATION -->
</div>

</div>
	<!-- END HEADER CONTAINER -->		

	<s:if test="%{isAuthenticated()}">
		<div class="container main">
		<!-- BEGIN CONTAINER -->
	</s:if>
	<s:else>
		<div class="container mainpage">
		<!-- BEGIN CONTAINER -->
	</s:else>

	<hr class="space" />

	<!-- show list of user folders after user login or guest login-->
	<s:if test="%{isAuthenticated()}">
		<div id="sidebar" class="span-6"><!-- BEGIN SIDEBAR CONTENT -->
			<s:include value="/pages/user/folder/folderList.jsp"/>
		</div><!-- END SIDEBAR CONTENT -->
	</s:if>
	
	<!-- BEGIN MAIN CONTENT AREA (condition 1, logged in)-->	
	<s:if test="%{isAuthenticated()}">
	<div class="span-18 last">
	
	</s:if>
    <!-- BEGIN MAIN CONTENT AREA(condition 2, not logged in) -->
    <s:elseif test="%{#attr.myPage.getTitle() == 'Registration'}">
	<div class="span-18">
	</s:elseif>
	
    <s:else>
	<div class="span-24">
	</s:else>

		<%@ include file="/pages/common/messages.jsp" %>

		<decorator:usePage id="myPage" />
<!-- when user is authenticated and not on home page, show the TG icons, and phylowidget -->
		<s:if test="%{isAuthenticated() and #attr.myPage.getTitle() != 'Home'}" > 
			<div style="float:right" >
			<!-- XSEDE ICONS -->
				<a href=javascript:popitup("https://portal.xsede.org/scheduled-downtimes")>
					<img src="images/Calendar-July21-FINAL.jpg" alt="XSEDE calendar" name="wwww" title="XSEDE Calendar" 
					width="30" height="32" border="0">
				</a>
				<a href=javascript:popitup("https://portal.xsede.org/resource-monitor")>
					<img src="images/traffic-light-all.jpg" alt="XSEDE Status" title="XSEDE Traffic Report" 
					width="30" height="32" border="0">
				</a>
			<!-- END XSEDE ICONS-->
			
				<a href=javascript:popitup("http://www.phylowidget.org/full/index.html")>
					<img src="images/pw-icon.jpg" alt="Phylowidget" title="Phylowidget" 
					width="30" height="32" border="0">
				</a>
			<!-- end phylowidget icon-->	
			</div>
		</s:if>
<!-- end icons for tg etc -->

<!-- this seems new for the iplant login page -->
		<h3><decorator:getProperty property="meta.heading"/></h3>
		<decorator:body/>
	</div>
	<!-- END MAIN CONTENT AREA -->

	<!-- this conditional prevents the right column from displaying when it should not display -->
	<!-- Logically the test for 'iPlant Login' page should be in the list below, but for reasons I can't fully
		explain it doesn't work.  It appears that isAuthenticated() isn't actually being called on login.jsp
		and on iplantRegister.jsp, at least not when we aren't logged in yet,  and the resulting test (whatever 
		it actually looks like) evaluates to false regardless of what page we're on.   Since we don't want the
		right hand column, i.e. apprc.html, showing up on the iplant Login page, we just test for that page
		by itself in the else case.
	-->
	<s:if test="%{isAuthenticated() or #attr.myPage.getTitle() == 'Registration' or #attr.myPage.getTitle() == 'List of Available Tools' 
		or  #attr.myPage.getTitle() == 'Password Reset'}">
	</s:if>
	<s:else>
		<s:if test="%{#attr.myPage.getTitle() != 'iPlant Login'}">
			<!-- display the right column -->
    		<c:import url="http://www.phylo.org/includes/newcontent/apprc.html"/>
		</s:if>
	</s:else>

<!-- bottom of the page, issue reports, bug collectors, mail list -->
    <div class="span-24 last">	

	<div class="reportIssue">
		<a href="javascript:popupWithSizes('http://phylo-bugz.sdsc.edu/fogbugz/default.asp?pg=pgPublicEdit',800,600,'1')">
		<img src="<c:url value='/images/report_issue_plain.gif'/>" alt="Report an Issue" width="138" height="29" border="0" />
		</a>
		<a href="javascript:popupWithSizes('http://phylo-bugz.sdsc.edu/fogbugz/default.asp?pg=pgPublicEdit',800,600,'1')">
		<img src="<c:url value='/images/request_feature_plain.gif'/>" alt="Request a Feature" width="138" height="29" border="0" />
		</a>
		<a href="javascript:popupWithSizes('https://lists.sdsc.edu/mailman/listinfo/cipres_portal',800,1000,'1')">
		<img src="<c:url value='/images/subscribe.gif'/>" alt="Subscribe to Portal News" border="0" />
		</a>
	</div>
	</div>

	
	<div id="footer" class="span-24 last"><!-- BEGIN FOOTER CONTENT -->
		<hr class="space">
		<%@ include file="/pages/common/footer.jsp" %>
	</div><!-- END FOOTER CONTENT -->
	
</div><!-- END CONTAINER -->

</body>
</html>

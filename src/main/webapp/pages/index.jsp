<?xml version="1.0" encoding="UTF-8"?>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Botteghino degli Eventi</title>

<sj:head loadFromGoogle="true" />

<link rel="stylesheet" type="text/css" href="/css/demo.css" />
<link rel="stylesheet" type="text/css" href="/css/style.css" />
<link href='http://fonts.googleapis.com/css?family=Kelly+Slab' rel='stylesheet' type='text/css' />
<!--[if lt IE 9]>
		<link rel="stylesheet" type="text/css" href="css/styleIE.css" />
	<![endif]-->
<script type="text/javascript" src="/js/modernizr.custom.11333.js" />

<!-- FANCYBOX CODE -->
	<!-- Add mousewheel plugin (this is optional) -->
	<script type="text/javascript" src="/js/jquery.mousewheel-3.0.6.pack.js" />

	<!-- Add fancyBox main JS and CSS files -->
	<script type="text/javascript" src="/fancybox/jquery.fancybox.js?v=2.1.3" />
	<link rel="stylesheet" type="text/css" href="/fancybox/jquery.fancybox.css?v=2.1.2" media="screen" />

	<!-- Add Button helper (this is optional) -->
	<link rel="stylesheet" type="text/css" href="/fancybox/helpers/jquery.fancybox-buttons.css?v=1.0.5" />
	<script type="text/javascript" src="/fancybox/helpers/jquery.fancybox-buttons.js?v=1.0.5" />

	<!-- Add Thumbnail helper (this is optional) -->
	<link rel="stylesheet" type="text/css" href="/fancybox/helpers/jquery.fancybox-thumbs.css?v=1.0.7" />
	<script type="text/javascript" src="/fancybox/helpers/jquery.fancybox-thumbs.js?v=1.0.7" />

	<!-- Add Media helper (this is optional) -->
	<script type="text/javascript" src="/fancybox/helpers/jquery.fancybox-media.js?v=1.0.5" />
	
	<!-- END FANCYBOX CODE -->

	<script type="text/javascript">
		$(document).ready(function() {
			$('.fancybox').fancybox();
		});
	</script>


</head>

<body>
	<div class="container">

		<h1>Benvenuto nel Botteghino Online! Scegli un evento e acquistalo subito: basta qualche click!!</h1>
		<h2 class="ss-subtitle">Botteghino timeline</h2>
		<div id="ss-links" class="ss-links">
			<a href="#gennaio">Gen</a> <a href="#febbraio">Feb</a> <a
				href="#marzo">Mar</a> <a href="#aprile">Apr</a> <a href="#maggio">Mag</a>
			<a href="#giugno">Giu</a> <br /> <a href="#luglio">Lug</a> <a
				href="#agosto">Ago</a> <a href="#september">Set</a> <a href="#september">Ott</a> <a
				href="#august">Nov</a> <a href="#july">Dic</a>
		</div>
		
		<div id="ss-categories" class="ss-links">
		<a href="#gennaio">Gen</a> <a href="#febbraio">Feb</a> <a
			href="#marzo">Mar</a> <a href="#aprile">Apr</a> <a href="#maggio">Mag</a>
		<a href="#giugno">Giu</a> <br /> <a href="#luglio">Lug</a> <a
			href="#agosto">Ago</a> <a href="#september">Set</a> <a href="#september">Ott</a> <a
			href="#august">Nov</a> <a href="#july">Dic</a>
	</div>
		
		<div id="ss-cart" class="ss-cart">
			<a href="#cart">Il tuo carrello è vuoto</a>
		</div>
		
		<div id="ss-container" class="ss-container">
			<div class="ss-row">
				<div class="ss-left">
					<h2 id="gennaio">Gennaio</h2>
				</div>
				<div class="ss-right">
					<h2>Eventi</h2>
				</div>
			</div>

			<s:iterator status="status" value="events">
				<s:if test="%{(#status.index)%3==0}">
					<div class="ss-row ss-medium">
					<div class="ss-left">
						<a href="http://tympanus.net/Tutorials/TypographyEffects/"
							class="ss-circle ss-circle-1">Image</a>
					</div>
					<div class="ss-right">
						<h3>
							<span><s:property value="authore" /></span> 
							
							<s:url action="detail.action" var="URLevent1">
								<s:param name="idEvent"><s:property value="id" /></s:param>
							</s:url> 
							<s:a cssClass="fancybox fancybox.ajax" href="%{URLevent1}">
								<s:property value="title" />
							</s:a>

						</h3>
					</div>
				</div>
				</s:if>
				<s:elseif test="%{(#status.index)%3==1}">
    				<div class="ss-row ss-large">
				<div class="ss-left">
					<h3>
						<span><s:property value="authore" /></span> 
						<s:url action="detail.action" var="URLevent2">
							<s:param name="idEvent"><s:property value="id" /></s:param>
						</s:url> 
						<s:a cssClass="fancybox fancybox.ajax" href="%{URLevent2}">
							<s:property value="title" />
						</s:a>						
					</h3>
				</div>
				<div class="ss-right">
					<a href="http://tympanus.net/Development/HoverClickTriggerCircle/"
						class="ss-circle ss-circle-2">Image</a>
				</div>
			</div>
				</s:elseif>
				<s:else>
    				<div class="ss-row ss-small">
				<div class="ss-left">
					<a href="http://tympanus.net/Tutorials/ElasticSlideshow/"
						class="ss-circle ss-circle-3">Image</a>
				</div>
				<div class="ss-right">
					<h3>
						<span><s:property value="authore" /></span> 
						<s:url action="detail.action" var="URLevent3">
							<s:param name="idEvent"><s:property value="id" /></s:param>
						</s:url> 
						<s:a cssClass="fancybox fancybox.ajax" href="%{URLevent3}">
							<s:property value="title" />
						</s:a>
					</h3>
				</div>
			</div>
				</s:else>
				
			</s:iterator>
			
			<div class="ss-row">
				<div class="ss-left">
					<h2 id="febbraio">Febbraio</h2>
				</div>
				<div class="ss-right">
					<h2>Eventi</h2>
				</div>
			</div>
			
			<div class="ss-row">
				<div class="ss-left">
					<h2 id="marzo">Marzo</h2>
				</div>
				<div class="ss-right">
					<h2>Eventi</h2>
				</div>
			</div>
			
			<div class="ss-row">
				<div class="ss-left">
					<h2 id="aprile">Aprile</h2>
				</div>
				<div class="ss-right">
					<h2>Eventi</h2>
				</div>
			</div>
			
			<div class="ss-row">
				<div class="ss-left">
					<h2 id="maggio">Maggio</h2>
				</div>
				<div class="ss-right">
					<h2>Eventi</h2>
				</div>
			</div>
			
			<div class="ss-row">
				<div class="ss-left">
					<h2 id="giungo">Giugno</h2>
				</div>
				<div class="ss-right">
					<h2>Eventi</h2>
				</div>
			</div>
			
			<div class="ss-row">
				<div class="ss-left">
					<h2 id="luglio">Luglio</h2>
				</div>
				<div class="ss-right">
					<h2>Eventi</h2>
				</div>
			</div>
			
			<div class="ss-row">
				<div class="ss-left">
					<h2 id="august">August</h2>
				</div>
				<div class="ss-right">
					<h2>2011</h2>
				</div>
			</div>
		</div>
	</div>



	<!-- JAVASCRIPTs -->

<!-- <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" /> -->

	<script type="text/javascript" src="/js/jquery.easing.1.3.js" />
	<script type="text/javascript" src="/js/animazione.js" />

</body>
</html>

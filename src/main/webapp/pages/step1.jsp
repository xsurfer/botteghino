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
<link href='http://fonts.googleapis.com/css?family=Kelly+Slab'
	rel='stylesheet' type='text/css' />
<!--[if lt IE 9]>
		<link rel="stylesheet" type="text/css" href="css/styleIE.css" />
	<![endif]-->
<script type="text/javascript" src="/js/modernizr.custom.11333.js"></script>

<script type="text/javascript"
	src="http://jzaefferer.github.com/jquery-validation/jquery.validate.js"></script>

<!-- FANCYBOX CODE -->
<!-- Add mousewheel plugin (this is optional) -->
<script type="text/javascript" src="/js/jquery.mousewheel-3.0.6.pack.js"></script>

<!-- Add fancyBox main JS and CSS files -->
<script type="text/javascript"
	src="/fancybox/jquery.fancybox.js?v=2.1.3"></script>
<link rel="stylesheet" type="text/css"
	href="/fancybox/jquery.fancybox.css?v=2.1.2" media="screen" />

<!-- Add Button helper (this is optional) -->
<link rel="stylesheet" type="text/css"
	href="/fancybox/helpers/jquery.fancybox-buttons.css?v=1.0.5" />
<script type="text/javascript"
	src="/fancybox/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>

<!-- Add Thumbnail helper (this is optional) -->
<link rel="stylesheet" type="text/css"
	href="/fancybox/helpers/jquery.fancybox-thumbs.css?v=1.0.7" />
<script type="text/javascript"
	src="/fancybox/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>

<!-- Add Media helper (this is optional) -->
<script type="text/javascript"
	src="/fancybox/helpers/jquery.fancybox-media.js?v=1.0.5"></script>

<!-- END FANCYBOX CODE -->

<script type="text/javascript">
	$().ready(
			function() {

				$.validator.addMethod("cRequired",
						$.validator.methods.required, "Obbligatorio");
				$.validator.addMethod("cMinlength",
						$.validator.methods.minlength, "Non valido");
				$.validator.addMethod("cMaxlength",
						$.validator.methods.maxlength, "Non valido");

				$.validator.addClassRules({
					name_field : {
						cRequired : true,
						cMinlength : 2
					}
				});

				$.validator.addClassRules({
					surname_field : {
						cRequired : true,
						cMinlength : 2
					}
				});

				$.validator.addClassRules({
					identity_field : {
						cRequired : true,
						cMinlength : 6,
						cMaxlength : 6
					}
				});

				$("#step1form").validate();

			});
</script>
</head>

<body>
	<div class="container">

		<h1>Benvenuto nel Botteghino Online! Scegli un evento e
			acquistalo subito: basta qualche click!!</h1>
		<h2 class="ss-subtitle">Step 1 - Assegna i tuoi biglietti</h2>

		<div id="ss-container" class="ss-container">

			<s:form id="step1form" action="step2">
				<s:set name="ticketNumber" value="%{0}" />
				<s:iterator status="status" value="items">
					<!-- PER OGNI EVENTO -->
					<div class="ss-row">
						<div class="ss-left">
							<h3>
								<s:property value="event.author" />
								-
								<s:property value="event.description" />
								<span>Location: <s:property value="event.location" /></span>
							</h3>
							<div class="detail">
								<s:set name="it" value="quantity" />
								<s:set name="eventoId" value="event.id" />
								<s:iterator status="stat" value="(#it).{ #this }">

									<s:set name="name" value="%{tickets[#ticketNumber].guest.name}" />
									<s:set name="surname"
										value="%{tickets[#ticketNumber].guest.surname}" />
									<s:set name="identity"
										value="%{tickets[#ticketNumber].guest.identity}" />

									<s:hidden name="tickets[%{#ticketNumber}].event"
										value="%{#eventoId}" />
										
									<div class="ticket" >
									<span>Ticket #<s:property value="#stat.count" /></span>
									
									<div>
									<span class="label">Nome:</span>
									<span class="input"><s:textfield
											cssClass="name_field"
											name="tickets[%{#ticketNumber}].guest.name" size="20"
											value="%{#name}" />
									</span>
									</div>

									<div>
									<span class="label">Cognome:</span>
									<span class="input"> <s:textfield
											cssClass="surname_field"
											name="tickets[%{#ticketNumber}].guest.surname" size="20"
											value="%{#surname}" />
									</span>
									</div>
									
									<div>
									<span class="label">C. Identità:</span>
									<span class="input"> <s:textfield
											cssClass="identity_field"
											name="tickets[%{#ticketNumber}].guest.identity" size="6"
											value="%{#identity}" />
									</span>
									</div>
									</div>
									<s:set var="ticketNumber" value="%{#ticketNumber + 1}" />
								</s:iterator>
							</div>
						</div>
					</div>
				</s:iterator>
				<div class="ss-row">
					<div class="ss-left">&nbsp;</div>
					<div class="ss-right">
						<h3>
							<span>Attenzione: i biglietti sono strettamente personali, quindi non cedibili. Verrà richiesto un documento di identità il giorno dell'evento</span>
						</h3>
						<div>
							<s:hidden name="token" value="%{token}" />
							<s:submit value="Avanti" />
						</div>
					</div>
				</div>
			</s:form>
		</div>
	</div>
</body>
</html>

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
				$.validator.addMethod("cRange", $.validator.methods.range,
						"Non valido");
				$.validator.addMethod("cMinlength",
						$.validator.methods.minlength, "Non valido");
				$.validator.addMethod("cMaxlength",
						$.validator.methods.maxlength, "Non valido");

				$.validator.addClassRules({
					quantity_field : {
						cRequired : true,
						cRange : [ 1, 4 ]
					}
				});

				$(".toValidate").validate();

			});
</script>
</head>

<body>
	<div class="container">

		<h1>Benvenuto nel Botteghino Online! Scegli un evento e
			acquistalo subito: basta qualche click!!</h1>
		<h2 class="ss-subtitle">Check out</h2>

		<div id="ss-container" class="ss-container">
			<div class="ss-row">

				<div class="ss-left">
					<s:iterator status="status" value="items">
						<h3>
							<s:property value="event.author" /> - <s:property value="event.description" />
							<span>Location: <s:property value="event.location" /></span> 
							<span>Prezzo: <s:property value="event.price" /></span>
						</h3>

						<div class="detail">
						
							<s:property value="message" />
						
							<s:form cssClass="toValidate" action="update">
								<s:hidden name="idItem" value="%{(#status.index)}" />
								<s:textfield cssClass="quantity_field" name="item.quantity"
									size="2" value="%{quantity}" label="Quantità" />
								<br />
								<s:submit value="Aggiorna" />
							</s:form>

							<s:url action="remove" var="removeUrl">
								<s:param name="idItem">
									<s:property value="%{(#status.index)}" />
								</s:param>
							</s:url>
							<s:a href="%{removeUrl}">Rimuovi dal carrello</s:a>
						</div>
					</s:iterator>
				</div>
			</div>

			<div class="ss-row">
				<div class="ss-left">&nbsp;</div>
				<div class="ss-right">
					<h3>
						<span>Attenzione: verranno riservati temporaneamente il numero di biglietti richiesti. Tali biglietti saranno rimessi disponibili se entro 8 minuti non verrà concluso il processo d'acquisto</span>
						Totale:
						<s:property value="cart.total" />
					</h3>
					<div>
						<s:form action="step1">
							<s:hidden name="token" value="%{token}" />
							<s:submit value="Avanti" />
						</s:form>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>

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
<script type="text/javascript" src="/js/modernizr.custom.11333.js"></script>

<!-- FANCYBOX CODE -->
	<!-- Add mousewheel plugin (this is optional) -->
	<script type="text/javascript" src="/js/jquery.mousewheel-3.0.6.pack.js"></script>

	<!-- Add fancyBox main JS and CSS files -->
	<script type="text/javascript" src="/fancybox/jquery.fancybox.js?v=2.1.3"></script>
	<link rel="stylesheet" type="text/css" href="/fancybox/jquery.fancybox.css?v=2.1.2" media="screen" />

	<!-- Add Button helper (this is optional) -->
	<link rel="stylesheet" type="text/css" href="/fancybox/helpers/jquery.fancybox-buttons.css?v=1.0.5" />
	<script type="text/javascript" src="/fancybox/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>

	<!-- Add Thumbnail helper (this is optional) -->
	<link rel="stylesheet" type="text/css" href="/fancybox/helpers/jquery.fancybox-thumbs.css?v=1.0.7" />
	<script type="text/javascript" src="/fancybox/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>

	<!-- Add Media helper (this is optional) -->
	<script type="text/javascript" src="/fancybox/helpers/jquery.fancybox-media.js?v=1.0.5"></script>
	
	<!-- END FANCYBOX CODE -->

</head>

<body>
	<div class="container">

		<h1>Benvenuto nel Botteghino Online! Scegli un evento e acquistalo subito: basta qualche click!!</h1>
		<h2 class="ss-subtitle">Step 3 - Dati di pagamento</h2>
		
		<div id="ss-container" class="ss-container">	
			
			<s:form action="payment">
				<s:hidden name="token" value="%{token}" />
				<s:textfield name="customer.name"  size="20" value="" label="Nome" />
				<br />
				<s:textfield name="customer.surname"  size="20" value="" label="Cognome" />
				<br />
				<s:textfield name="customer.email"  size="20" value="" label="E-Mail" />
				<br />
				<s:select label="Circuito"
    				name="customer.circuit"
					headerKey="-1" headerValue="Seleziona una voce"
					list="#{'01':'MasterCard', '02':'VisaElectron', '02':'Visa', '03':'American Express'}"
					value="selectedCircuit"
					required="true"/>
	
				<s:textfield name="customer.creditcard" size="16" value="" label="Carta di Credito" />
				<s:textfield name="customer.cvv" size="3" value="" label="CVV" />
				<br />
				<s:submit value="Effettua Pagamento" />
			</s:form>
			
		</div>
	</div>
</body>
</html>

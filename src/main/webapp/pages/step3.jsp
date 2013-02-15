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

<script type="text/javascript" src="http://jzaefferer.github.com/jquery-validation/jquery.validate.js"></script>

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

	<script type="text/javascript">
	$().ready(function() {
		
		$.validator.addMethod("cRequired", $.validator.methods.required, "Obbligatorio");
		$.validator.addMethod("cMinlength", $.validator.methods.minlength, "Non valido");
		$.validator.addMethod("cMaxlength", $.validator.methods.maxlength, "Non valido");
		$.validator.addMethod("cEmail", $.validator.methods.email, "E-mail non valida");
		$.validator.addMethod("cCreditcard", $.validator.methods.creditcard, "Numero CC non valido");
		$.validator.addMethod("cDigits", $.validator.methods.digits, "CVV non valido");
		
		
		$.validator.addClassRules({
			name_field:{
				cRequired: true,
				cMinlength: 2
			}
		});
		
		$.validator.addClassRules({
			surname_field:{
				cRequired: true,
				cMinlength: 2
			}
		});
			
		$.validator.addClassRules({
			email_field:{
				cRequired: true,
				cEmail: true
			}
		});
		
		$.validator.addClassRules({
			creditcard_field:{
				cRequired: true,
				cCreditcard: true
			}
		});
		
		$.validator.addClassRules({
			creditcard_field:{
				cRequired: true,
				cDigits: true,
				cMinlength: 3,
	    		cMaxlength: 3
			}
		});
				
		$("#paymentForm").validate();
	});
	</script>
</head>

<body>
	<div class="container">

		<h1>Benvenuto nel Botteghino Online! Scegli un evento e acquistalo subito: basta qualche click!!</h1>
		<h2 class="ss-subtitle">Step 3 - Dati di pagamento</h2>
		
		<div id="ss-container" class="ss-container">	
			
			<s:form id="paymentForm" action="payment">
				<s:hidden name="token" value="%{token}" />
				<s:textfield id="name_field" name="customer.name"  size="20" value="" label="Nome" />
				<br />
				<s:textfield id="surname_field" name="customer.surname"  size="20" value="" label="Cognome" />
				<br />
				<s:textfield id="email_field" name="customer.email"  size="20" value="" label="E-Mail" />
				<br />
				<s:select label="Circuito"
    				name="customer.circuit"
					headerKey="-1" headerValue="Seleziona una voce"
					list="#{'01':'MasterCard', '02':'VisaElectron', '02':'Visa', '03':'American Express'}"
					value="selectedCircuit"
					required="true"/>
	
				<s:textfield id="creditcard_field" name="customer.creditcard" size="16" value="" label="Carta di Credito" />
				<s:textfield id="cvv_field" name="customer.cvv" size="3" value="" label="CVV" />
				<br />
				<s:submit value="Effettua Pagamento" />
			</s:form>
			
		</div>
	</div>
</body>
</html>

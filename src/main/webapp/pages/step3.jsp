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
	$().ready(function() {
		
		$.validator.addMethod("cRequired", $.validator.methods.required, "Obbligatorio");
		$.validator.addMethod("cMinlength", $.validator.methods.minlength, "Non valido");
		$.validator.addMethod("cMaxlength", $.validator.methods.maxlength, "Non valido");
		$.validator.addMethod("cEmail", $.validator.methods.email, "E-mail non valida");
		$.validator.addMethod("cCreditcard", $.validator.methods.creditcard, "Numero CC non valido");
		$.validator.addMethod("cDigits", $.validator.methods.digits, "CVV non valido");
		$.validator.addMethod("cValueNotEquals", function(value, element, arg){
			  return arg != value;
			 }, "Scegliere un circuito valido");
		
		$("#paymentForm").validate();
		
		$("#name_field").rules("add",{
			cRequired: true,
			cMinlength: 2
			}
		);
		
		$("#surname_field").rules("add",{
			cRequired: true,
			cMinlength: 2
			}
		);
			
		$("#email_field").rules("add",{
			cRequired: true,
			cEmail: true
			}
		);
		
		$("#circuit_field").rules("add",{
			cValueNotEquals: "-1"
			}
		);
		/*
		$("#creditcard_field").rules("add",{
			cRequired: true,
			cCreditcard: true
			}
		);
			*/
		$("#cvv_field").rules("add",{
			cRequired: true,
			cDigits: true,
			cMinlength: 3,
			cMaxlength: 3
			}
		);
				
		
	});
	 
</script>
</head>

<body>
	<div class="container">

		<h1>Benvenuto nel Botteghino Online! Scegli un evento e
			acquistalo subito: basta qualche click!!</h1>
		<h2 class="ss-subtitle">Step 3 - Dati di pagamento</h2>

		<div id="ss-container" class="ss-container">

			<s:form id="paymentForm" action="payment">
				<div class="ss-row">
					<div class="ss-left">
						<h3>Carta di Credito</h3>
						<div class="detail">
							
							<s:property value="message" />

							<s:hidden name="token" value="%{token}" />
							<div class="ticket">
								<div style="clear: both;">
									<span class="label">Nome:</span> <span class="input"> <s:textfield
											id="name_field" name="customer.name" size="20" value=""
											label="Nome" />
									</span>
								</div>

								<div style="clear: both;">
									<span class="label">Cognome:</span> <span class="input">
										<s:textfield id="surname_field" name="customer.surname"
											size="20" value="" label="Cognome" />
									</span>
								</div>

								<div style="clear: both;">
									<span class="label">E-mail:</span> <span class="input">
										<s:textfield id="email_field" name="customer.email" size="20"
											value="" label="E-Mail" />
									</span>
								</div>

								<div style="clear: both;">
									<span class="label">Circuito:</span> <span class="input">
										<s:select id="circuit_field" label="Circuito"
											name="customer.circuit" headerKey="-1"
											headerValue="Seleziona una voce"
											list="#{'mastercard':'MasterCard', 'visaelectron':'VisaElectron', 'visa':'Visa', 'americanexpress':'American Express'}"
											value="selectedCircuit" required="true" />
									</span>
								</div>

								<div style="clear: both;">
									<span class="label">Numero Carta:</span> <span class="input">
										<s:textfield id="creditcard_field" name="customer.creditcard"
											size="16" value="" label="Carta di Credito" />
									</span>
								</div>

								<div style="clear: both;">
									<span class="label">CVV:</span> <span class="input">
										<s:textfield id="cvv_field" name="customer.cvv" size="3"
											value="" label="CVV" />
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="ss-row">
					<div class="ss-left">&nbsp;</div>
					<div class="ss-right">
						<h3>
							<span>L'operazione di pagamento potrebbe richiedere alcuni istanti nel frattempo ti invitiamo ad attendere senza ricaricare la pagina. Grazie della fiducia</span>
						</h3>
						<div><s:submit value="Effettua Pagamento" /></div>
					</div>
				</div>
			</s:form>
		</div>
	</div>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>

<sj:head loadFromGoogle="true" />
<script type="text/javascript" src="http://jzaefferer.github.com/jquery-validation/jquery.validate.js"></script>

	<script type="text/javascript">
	$().ready(function() {
		alert("aa");
		$("#addForm").validate({
	        rules:
	        {
	        	'item.quantity': {
	        		required: true,
	        	    range: [1, 4]
	        	}       
	        },
	        messages: {
	        	'item.quantity': {
                        required: "Obbligatorio",
                        range: "Valore compreso tra 1 e 4"
                }
	        },
	        submitHandler: function(form) {
	            alert($("#addForm").valid())
	            form.submit();
	        }
	    });	
	});
	</script>


<h2><s:property value="event.author" /></h2>
<h3><s:property value="event.title" /></h3>
<p><s:property value="event.description" /></p>
<h3><s:property value="event.location" /></h3>

<s:form id="addForm" action="add">
  <s:hidden name="idEvent" value="%{event.id}" />
  <s:textfield id="quantity_txt" name="item.quantity" size="2" value="0" label="Quantità" /><br />
  <s:submit value="Aggiungi" />
</s:form>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>

<sj:head loadFromGoogle="true" />
<script type="text/javascript" src="http://jzaefferer.github.com/jquery-validation/jquery.validate.js"></script>

	<script type="text/javascript">
	$().ready(function() {
		
		$.validator.addMethod("cValueNotEquals", function(value, element, arg){
			  return arg != value;
			 }, "Scegliere una quantità");
		
		$("#addForm").validate();	
		
		$("#quantity_txt").rules("add",{
			cValueNotEquals: "-1"
			});
	});
	</script>

<div class="info_event">
	<span><s:property value="event.location" />, #data</span>
	<h3><s:property value="event.author" /> - <s:property value="event.title" /></h3>
	<span><s:property value="event.description" /></span>
	<span><s:property value="event.price" /> &euro;</span>
	
	<div class="addiv">
		<span>Aggiungi al carrello:</span>
		<s:form id="addForm" action="add">
  			<s:hidden name="idEvent" value="%{event.id}" />
  			<span>Quantità: <s:select id="quantity_txt" label="Circuito"
    			name="item.quantity"
				headerKey="-1" headerValue="#"
				list="#{'1':'1', '2':'2', '3':'3', '4':'4'}"
				required="true"/></span>
			<span><s:submit cssClass="smallSubmit" value="Aggiungi" /></span>

  		
		</s:form>
	</div>
</div>

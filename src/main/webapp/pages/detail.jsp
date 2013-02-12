<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>

<h2><s:property value="event.author" /></h2>
<h3><s:property value="event.title" /></h3>
<p><s:property value="event.description" /></p>
<h3><s:property value="event.location" /></h3>

<s:form action="add">
  <s:hidden name="idEvent" value="%{event.id}" />
  <s:textfield name="item.quantity" size="2" value="1" label="Quantità" /><br />
  <s:submit value="Aggiungi" />
</s:form>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>

<h2><s:property value="event.authore" /></h2>
<h3><s:property value="event.title" /></h3>
<p><s:property value="event.description" /></p>
<h3><s:property value="event.location" /></h3>

<s:form action="setEvent">
  <s:textfield name="quantity" label="Quantità" />
  <s:submit value="Aggiungi" />
</s:form>
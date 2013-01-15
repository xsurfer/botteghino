<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>

<h2><s:property value="event.authore" /></h2>
<h3><s:property value="event.title" /></h3>
<p><s:property value="event.description" /></p>
<h3><s:property value="event.location" /></h3>

<s:form action="addEvent">
  <s:set name="idEvento" value="event.id"/>
  <s:hidden name="idEvent" value="#idEvento" />
  <s:textfield name="quantity" size="2" value="1" label="Quantità" /><br />
  <s:submit value="Aggiungi" />
</s:form>
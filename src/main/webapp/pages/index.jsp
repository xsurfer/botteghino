<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title><s:text name="HelloWorld.message"/></title>
</head>

<body>

<h1>Store online!</h1>
<h2>

</h2>
<hr>

<div>
<p>Seleziona un articolo:</p>

<s:iterator value="events">
  <div class="articolo">
	<p><s:property value="title" /></p>
	<p><s:property value="authore" /></p>
	<p><s:property value="description" /></p>
</div>
</s:iterator>

</div>

<!--
<h2><s:property value="message"/></h2>
 
<h3>Languagesss</h3>
<ul>
    <li>
        <s:url id="url" action="HelloWorld">
            <s:param name="request_locale">en</s:param>
        </s:url>
        <s:a href="%{url}">English</s:a>
    </li>
    <li>
        <s:url id="url" action="HelloWorld">
            <s:param name="request_locale">es</s:param>
        </s:url>
        <s:a href="%{url}">Espanol</s:a>
    </li>
</ul> 
-->

</body>
</html>

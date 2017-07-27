<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="uiComponents" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%@ taglib prefix="search" uri="http://www.jahia.org/tags/search" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<%--@elvariable id="moduleMap" type="java.util.Map"--%>

<template:addResources type="css" resources="bootstrap.min.css"/>
<template:addResources type="javascript" resources="jqer<.min.js,bootstrap.min.js"/>

<c:set var="subLists" value="${jcr:getChildrenOfType(currentNode, 'jnt:contentList')}"/>
<c:set var="type" value="${currentNode.properties.type.string}"/>
<c:set var="align" value=" ${currentNode.properties.align.string}"/>
<c:set var="fade" value="${currentNode.properties.fade.boolean}"/>

<ul class="nav ${type eq 'pill' ? ' nav-pills': ' nav-tabs'} ${align ne ' justify-content-start' ? align : ''}" id="tabs-${currentNode.identifier}" role="tablist">
    <c:forEach items="${subLists}" var="droppableContent" varStatus="status">
        <li class="nav-item">
            <a class="nav-link ${status.first?' active':''}" data-toggle="tab" href="#tab-${droppableContent.identifier}" role="tab" aria-controls="tab-${droppableContent.identifier}">${droppableContent.displayableName}</a>
        </li>
    </c:forEach>
</ul>
<div class="tab-content">
    <c:forEach items="${jcr:getChildrenOfType(currentNode, 'jmix:droppableContent')}" var="droppableContent" varStatus="status">
        <div class="tab-pane  ${status.first?' active':''} ${fade ? ' fade' : ''} ${fade && status.first ? ' show' : ''}" id="tab-${droppableContent.identifier}" role="tabpanel">
            <template:module node="${droppableContent}" editable="true"/>
        </div>
    </c:forEach>
</div>
<c:if test="${renderContext.editMode}">
    <template:module path="*" nodeTypes="jnt:contentList"/>
</c:if>

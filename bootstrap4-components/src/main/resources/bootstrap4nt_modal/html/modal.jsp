<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<template:addResources type="css" resources="bootstrap.min.css"/>
<template:addResources type="javascript" resources="jquery.min.js,bootstrap.min.js"/>

<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>

<c:if test="${jcr:isNodeType(currentNode, 'bootstrap4mix:advancedModal')}">
    <c:set var="modalSize" value=" modal-${currentNode.properties.modalSize.string}"/>
</c:if>
<c:if test="${jcr:isNodeType(currentNode, 'bootstrap4mix:buttonAdvancedSettings')}">
    <c:set var="style" value="${currentNode.properties.style.string}"/>
    <c:set var="state" value="${currentNode.properties.state.string}"/>
    <c:set var="outline" value="${currentNode.properties.outline.boolean ? '-outline' : ''}"/>
    <c:set var="block" value="${currentNode.properties.block.boolean ? ' btn-block' : ''}"/>

    <c:if test="${size == 'default'}">
        <c:remove var="size"/>
    </c:if>
    <c:if test="${! empty size}">
        <c:set var="size" value=" ${size}"/>
    </c:if>
    <c:if test="${! empty state}">
        <c:set var="state" value=" ${state}"/>
    </c:if>

    <c:choose>
        <c:when test="${state == 'active'}">
            <c:set var="aria">aria-pressed="true"</c:set>
        </c:when>
        <c:when test="${state == 'disabled'}">
            <c:set var="aria">aria-disabled="true"</c:set>
        </c:when>
        <c:otherwise>
            <c:remove var="state"/>
        </c:otherwise>
    </c:choose>
</c:if>
<c:if test="${empty style}">
    <c:set var="style" value="primary"/>
</c:if>

<button type="button" class="btn btn${outline}-${style} ${size} ${state} ${block}" ${aria} data-toggle="modal" data-target="#modal-${currentNode.identifier}">
    ${currentNode.properties.openText.string}
</button>

<div class="modal fade" id="modal-${currentNode.identifier}" tabindex="-1" role="dialog" aria-labelledby="modalLabel_${currentNode.identifier}" aria-hidden="${renderContext.editMode ? 'false' : 'true'}">
    <div class="modal-dialog ${modalSize}"<c:if test='${renderContext.editMode}'> style="margin:5px;"</c:if>>
        <div class="modal-content">
            <c:if test="${not empty title}">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalLabel_${currentNode.identifier}">${title}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
            </c:if>
            <div class="modal-body">
                <c:forEach items="${jcr:getChildrenOfType(currentNode, 'jmix:droppableContent')}" var="droppableContent">
                    <template:module node="${droppableContent}" editable="true"/>
                </c:forEach>
                <c:if test="${renderContext.editMode}">
                    <template:module path="*" nodeTypes="jmix:droppableContent"/>
                </c:if>
            </div>
            <div class="modal-footer">
                <%--<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>--%>
                <button type="button" class="btn btn-${state}" data-dismiss="modal">${currentNode.properties.closeText.string}</button>
            </div>
        </div>
    </div>
</div>
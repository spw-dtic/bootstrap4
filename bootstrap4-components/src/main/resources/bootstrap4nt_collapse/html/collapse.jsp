<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--
- style (string, choicelist[resourceBundle]) = 'primary' autocreated < 'primary', 'secondary', 'success', 'info', 'warning', 'danger', 'link'
 - size (string, choicelist[resourceBundle]) = 'default' autocreated < 'default', 'btn-lg', 'btn-sm', 'info', 'warning', 'danger', 'link'
 - outline (boolean) = 'false' indexed=no
 - block (boolean) = 'false' indexed=no
 - state (string, choicelist[resourceBundle]) = 'default' autocreated < 'default', 'active', 'disabled'
--%>

<c:set var="title" value="${currentNode.displayableName}"/>
<c:set var="linkUrl" value="#"/>

<c:if test="${jcr:isNodeType(currentNode, 'bootstrap4mix:buttonAdvancedSettings')}">
    <c:set var="style" value="${currentNode.properties.style.string}"/>
    <c:set var="size" value="${currentNode.properties.size.string}"/>
    <c:set var="state" value="${currentNode.properties.state.string}"/>
    <c:set var="outline" value="${currentNode.properties.outline.boolean ? '-outline' : ''}"/>
    <c:set var="block" value="${currentNode.properties.block.boolean ? ' btn-block' : ''}"/>
    <c:if test="${size == 'default'}">
        <c:remove var="size"/>
    </c:if>
    <c:if test="${! empty size}">
        <c:set var="size" value=" ${size}"/>
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
    <c:if test="${! empty state}">
        <c:set var="state" value=" ${state}"/>
    </c:if>
</c:if>
<c:if test="${empty style}">
    <c:set var="style" value="primary"/>
</c:if>

<a href="#collapse-${currentNode.identifier}" class="btn btn${outline}-${style} ${size} ${state} ${block}" ${aria} data-toggle="collapse" aria-expanded="false" aria-controls="collapse-${currentNode.identifier}">${title}</a>
<div class="collapse${renderContext.editMode?'edit':''}" id="collapse-${currentNode.identifier}">
    <c:forEach items="${jcr:getChildrenOfType(currentNode, 'jmix:droppableContent')}" var="droppableContent">
        <template:module node="${droppableContent}" editable="true"/>
    </c:forEach>
    <c:if test="${renderContext.editMode}">
        <template:module path="*" nodeTypes="jmix:droppableContent"/>
    </c:if>
</div>


<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<template:addResources type="css" resources="bootstrap.min.css"/>

<c:set var="createSection" value="${jcr:isNodeType(currentNode,'bootstrap4mix:createSection')}"/>
<c:set var="createContainer" value="${jcr:isNodeType(currentNode,'bootstrap4mix:createContainer')}"/>
<c:set var="createRow" value="${jcr:isNodeType(currentNode,'bootstrap4mix:createRow')}"/>

<c:set var="gridType" value="${currentNode.properties.gridType.string}"/>

<c:if test="${createSection}">
    <c:set var="sectionType" value="${currentNode.properties['sectionElement'].string}"/>
    <c:set var="sectionCssClass" value="${currentNode.properties['sectionCssClass'].string}"/>
    <c:set var="sectionId" value="${currentNode.properties['sectionId'].string}"/>
    <c:set var="sectionRole" value="${currentNode.properties['sectionRole'].string}"/>

    <${sectionType}<c:if test="${not empty sectionId}"> id="${sectionId}"</c:if><c:if
        test="${not empty sectionCssClass}"><c:out value=" "/>class="${sectionCssClass}"</c:if><c:if
        test="${not empty sectionRole}"><c:out value=" "/>role="${sectionRole}"</c:if>>
</c:if>

<c:if test="${createContainer}">
    <c:set var="containerId" value="${currentNode.properties['containerId'].string}"/>
    <c:set var="containerCssClass" value="${currentNode.properties['containerCssClass'].string}"/>
    <c:set var="gridLayout" value="${currentNode.properties['gridLayout'].string == 'full-width' ? 'container-fluid' : 'container'}"/>
    <div<c:if test="${not empty containerId}"> id="${containerId}"</c:if> class="${gridLayout}<c:if
        test="${not empty containerCssClass}"><c:out value=" "/>${containerCssClass}</c:if>">
</c:if>

<c:if test="${createRow}">
    <c:set var="rowId" value="${currentNode.properties['rowId'].string}"/>
    <c:set var="rowCssClass" value="${currentNode.properties['rowCssClass'].string}"/>
    <c:set var="rowVerticalAlignment" value="${currentNode.properties['rowVerticalAlignment'].string}"/>
    <c:if test="${rowVerticalAlignment eq 'default'}">
        <c:remove var="rowVerticalAlignment"/>
    </c:if>
    <c:set var="rowHorizontalAlignment" value="${currentNode.properties['rowHorizontalAlignment'].string}"/>
    <c:if test="${rowHorizontalAlignment eq 'default'}">
        <c:remove var="rowHorizontalAlignment"/>
    </c:if>
    <div<c:if test="${not empty rowId}"> id="${rowId}"</c:if> class="row<c:if test='${not empty rowCssClass}'><c:out
        value=' '/>${rowCssClass}</c:if><c:if test='${not empty rowVerticalAlignment}'><c:out
        value=' '/>${rowVerticalAlignment}</c:if><c:if test='${not empty rowHorizontalAlignment}'><c:out
        value=' '/>${rowHorizontalAlignment}</c:if>">
</c:if>

<template:module node="${currentNode}" view="hidden.${gridType}" editable="false"/>

<c:if test="${createRow}">
    </div>
</c:if>

<c:if test="${createContainer}">
    </div>
</c:if>

<c:if test="${createSection}">
    </${sectionType}>
</c:if>

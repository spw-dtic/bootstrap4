<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib"%>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<c:set var="colName" value="${currentNode.name}"/>
<c:set var="grid" value="${currentNode.properties.grid.string}"/>
<c:set var="createAbsoluteAreas" value="${jcr:isNodeType(currentNode, 'bootstrap4mix:createAbsoluteAreas')}"/>
<c:set var="moduleType" value="${createAbsoluteAreas? 'absoluteArea' : 'area'}"/>
<c:set var="level" value="${createAbsoluteAreas? currentNode.properties.level.string : '0'}"/>
<c:if test="${createAbsoluteAreas && renderContext.editModeConfigName eq 'studiomode'}">
    <c:set var="displayAbsoluteArea">
        <div class="card text-white bg-danger mb-3">
            <div class="card-header">
                Absolute Area
            </div>
            <div class="card-body">
                <p class="card-text">
                Define area for level ${level}.
                </p>
            </div>
        </div>
    </c:set>
</c:if>
<c:choose>
    <c:when test="${grid == '4_8'}">
        <div class="col-md-4">${displayAbsoluteArea}<template:area path="${colName}-side" areaAsSubNode="true" moduleType="${moduleType}" level="${level}"/></div>
        <div class="col-md-8">${displayAbsoluteArea}<template:area path="${colName}-main" areaAsSubNode="true" moduleType="${moduleType}" level="${level}"/></div>
    </c:when>
    <c:when test="${grid == '8_4'}">
        <div class="col-md-8">${displayAbsoluteArea}<template:area path="${colName}-main" areaAsSubNode="true" moduleType="${moduleType}" level="${level}"/></div>
        <div class="col-md-4">${displayAbsoluteArea}<template:area path="${colName}-side" areaAsSubNode="true" moduleType="${moduleType}" level="${level}"/></div>
    </c:when>
    <c:when test="${grid == '3_9'}">
        <div class="col-md-3">${displayAbsoluteArea}<template:area path="${colName}-side" areaAsSubNode="true" moduleType="${moduleType}" level="${level}"/></div>
        <div class="col-md-9">${displayAbsoluteArea}<template:area path="${colName}-main" areaAsSubNode="true" moduleType="${moduleType}" level="${level}"/></div>
    </c:when>
    <c:when test="${grid == '9_3'}">
        <div class="col-md-9">${displayAbsoluteArea}<template:area path="${colName}-main" areaAsSubNode="true" moduleType="${moduleType}" level="${level}"/></div>
        <div class="col-md-3">${displayAbsoluteArea}<template:area path="${colName}-side" areaAsSubNode="true" moduleType="${moduleType}" level="${level}"/></div>
    </c:when>
    <c:when test="${grid == '2_10'}">
        <div class="col-md-2">${displayAbsoluteArea}<template:area path="${colName}-side" areaAsSubNode="true" moduleType="${moduleType}" level="${level}"/></div>
        <div class="col-md-10">${displayAbsoluteArea}<template:area path="${colName}-main" areaAsSubNode="true"  moduleType="${moduleType}"  level="${level}"/></div>
    </c:when>
    <c:when test="${grid == '10_2'}">
        <div class="col-md-10">${displayAbsoluteArea}<template:area path="${colName}-main" areaAsSubNode="true"  moduleType="${moduleType}"  level="${level}"/></div>
        <div class="col-md-2">${displayAbsoluteArea}<template:area path="${colName}-side" areaAsSubNode="true" moduleType="${moduleType}" level="${level}"/></div>
    </c:when>
    <c:when test="${grid == '4_4_4'}">
        <div class="col-md-4">${displayAbsoluteArea}<template:area path="${colName}-main" areaAsSubNode="true" moduleType="${moduleType}" level="${level}"/></div>
        <div class="col-md-4">${displayAbsoluteArea}<template:area path="${colName}-side" areaAsSubNode="true" moduleType="${moduleType}" level="${level}"/></div>
        <div class="col-md-4">${displayAbsoluteArea}<template:area path="${colName}-extra" areaAsSubNode="true" moduleType="${moduleType}" level="${level}"/></div>
    </c:when>
    <c:when test="${grid == '3_6_3'}">
        <div class="col-md-3">${displayAbsoluteArea}<template:area path="${colName}-side" areaAsSubNode="true" moduleType="${moduleType}" level="${level}"/></div>
        <div class="col-md-6">${displayAbsoluteArea}<template:area path="${colName}-main" areaAsSubNode="true" moduleType="${moduleType}" level="${level}"/></div>
        <div class="col-md-3">${displayAbsoluteArea}<template:area path="${colName}-extra" areaAsSubNode="true" moduleType="${moduleType}" level="${level}"/></div>
    </c:when>
    <c:when test="${grid == '3_3_3_3'}">
        <div class="col-md-3">${displayAbsoluteArea}<template:area path="${colName}-main" areaAsSubNode="true" moduleType="${moduleType}" level="${level}"/></div>
        <div class="col-md-3">${displayAbsoluteArea}<template:area path="${colName}-side" areaAsSubNode="true" moduleType="${moduleType}" level="${level}"/></div>
        <div class="col-md-3">${displayAbsoluteArea}<template:area path="${colName}-extra" areaAsSubNode="true" moduleType="${moduleType}" level="${level}"/></div>
        <div class="col-md-3">${displayAbsoluteArea}<template:area path="${colName}-extra2" areaAsSubNode="true" moduleType="${moduleType}" level="${level}"/></div>
    </c:when>
    <c:when test="${grid == '6_6'}">
        <div class="col-md-6">${displayAbsoluteArea}<template:area path="${colName}-main" areaAsSubNode="true" moduleType="${moduleType}" level="${level}"/></div>
        <div class="col-md-6">${displayAbsoluteArea}<template:area path="${colName}-side" areaAsSubNode="true" moduleType="${moduleType}" level="${level}"/></div>
    </c:when>
    <c:when test="${grid == '12'}">
        <div class="col">${displayAbsoluteArea}<template:area path="${colName}-main" areaAsSubNode="true"  moduleType="${moduleType}"  level="${level}"/></div>
    </c:when>
    <c:otherwise>
        <c:if test="${renderContext.editMode}">
            <div class="col">
                <div class="alert alert-warning alert-dismissible fade show" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <strong><fmt:message key="bootstrap4nt_grid.warning"/></strong>
                    <fmt:message key="bootstrap4nt_grid.couldNotDisplayGrid">
                        <fmt:param value="${columns}"/>
                    </fmt:message>
                </div>
            </div>
        </c:if>
    </c:otherwise>
</c:choose>

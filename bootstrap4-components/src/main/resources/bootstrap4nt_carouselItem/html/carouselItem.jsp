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

<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="caption" value="${currentNode.properties['caption'].string}"/>
<c:set var="imageNode" value="${currentNode.properties.image.node}"/>
<c:choose>
    <c:when test="${renderContext.editMode}">
        <div class="media">
            <a class="media-left" href="#">
                <c:if test="${! empty imageNode}">
                    <template:include view="image">
                        <template:param name="style" value="width: 64px"/>
                    </template:include>
                </c:if>
            </a>
            <div class="media-body">
                <c:if test="${not empty title}">
                    <h4 class="media-heading">${title}</h4>
                </c:if>
                <c:if test="${not empty caption}">
                    <p>${caption}</p>
                </c:if>
            </div>
        </div>
    </c:when>
    <c:otherwise>
        <c:if test="${! empty imageNode}">
            <template:include view="image">
                <template:param name="class" value="d-block w-100"/>
            </template:include>
        </c:if>
        <c:if test="${! empty title || ! empty caption}">
            <div class="carousel-caption d-none d-md-block">
                <c:if test="${not empty title}">
                    <h3>${title}</h3>
                </c:if>
                <c:if test="${not empty caption}">
                    <p>${caption}</p>
                </c:if>
            </div>
        </c:if>
    </c:otherwise>
</c:choose>




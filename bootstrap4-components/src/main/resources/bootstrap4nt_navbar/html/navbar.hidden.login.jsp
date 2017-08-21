<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>

<%--@elvariable id="currentUser" type="org.jahia.services.usermanager.JahiaUser"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<c:choose>
    <c:when test="${renderContext.loggedIn}">
        <ul class="navbar-nav flex-row ml-md-auto d-none d-md-flex">
            <li class="nav-item dropdown">
                <a class="nav-item nav-link dropdown-toggle mr-md-2" href="#" id="${currentNode.identifier}"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        ${currentUser.username}
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="${currentNode.identifier}">
                    <c:if test="${!renderContext.settings.distantPublicationServerMode and renderContext.mainResource.node.properties['j:originWS'].string ne 'live' and not jcr:isNodeType(renderContext.mainResource.node.resolveSite, 'jmix:remotelyPublished')}">
                        <c:if test="${! renderContext.liveMode}">
                            <a href="<c:url value='${url.live}'/>" class="dropdown-item">
                                <fmt:message key="bootstrap4mix_customBaseNavbar.label.live"/>
                            </a>
                        </c:if>
                        <c:if test="${! renderContext.previewMode && jcr:hasPermission(renderContext.mainResource.node, 'editModeAccess')}">
                            <a href="<c:url value='${url.preview}'/>" class="dropdown-item">
                                <fmt:message key="bootstrap4mix_customBaseNavbar.label.preview"/>
                            </a>
                        </c:if>
                        <c:if test="${! renderContext.editMode && jcr:hasPermission(renderContext.mainResource.node, 'editModeAccess')}">
                            <a href="<c:url value='${url.edit}'/>" class="dropdown-item">
                                <fmt:message key="bootstrap4mix_customBaseNavbar.label.edit"/>
                            </a>
                        </c:if>
                        <c:if test="${! renderContext.editMode && !jcr:hasPermission(renderContext.mainResource.node, 'editModeAccess') && jcr:hasPermission(renderContext.mainResource.node, 'contributeModeAccess')}">
                            <a href="<c:url value='${url.contribute}'/>" class="dropdown-item">
                                <fmt:message key="bootstrap4mix_customBaseNavbar.label.contribute"/>
                            </a>
                        </c:if>
                    </c:if>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="${url.logout}" class="logout"><fmt:message
                            key="bootstrap4mix_customBaseNavbar.label.logout"/></a>
                </div>
            </li>
        </ul>
    </c:when>
    <c:otherwise>
        <ul class="navbar-nav flex-row ml-md-auto d-none d-md-flex">
            <li class="nav-item">
                <a class="nav-link p-2 login" href="${url.login}" target="_blank" rel="noopener"
                   aria-label="<fmt:message key='bootstrap4mix_customBaseNavbar.label.login'/>">
                    <svg class="d-block align-text-top" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 10.29 8.57"
                         focusable="false" style="width: 1rem;height: 1rem;">
                        <title><fmt:message key="bootstrap4mix_customBaseNavbar.label.login"/></title>
                        <path d="M133.8,147l-3.64,3.64a.42.42,0,0,1-.3.13.43.43,0,0,1-.43-.43v-1.93h-3A.43.43,0,0,1,126,148v-2.57a.43.43,0,0,1,.43-.43h3v-1.93a.43.43,0,0,1,.43-.43.42.42,0,0,1,.3.13l3.64,3.64a.42.42,0,0,1,0,.6Zm2.49,2.06a1.93,1.93,0,0,1-1.93,1.93h-2.14a.22.22,0,0,1-.21-.21c0-.19-.09-.64.21-.64h2.14a1.08,1.08,0,0,0,1.07-1.07v-4.72a1.08,1.08,0,0,0-1.07-1.07h-1.93c-.17,0-.43,0-.43-.21s-.09-.64.21-.64h2.14a1.93,1.93,0,0,1,1.93,1.93Z"
                              fill="currentColor" fill-rule="evenodd"></path>
                    </svg>
                </a>
            </li>
        </ul>
    </c:otherwise>
</c:choose>
</ul>
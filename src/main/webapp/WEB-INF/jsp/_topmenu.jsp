<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- Static navbar -->
<nav class="navbar navbar-default navbar-static-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="<c:url value="/"/>"><spring:message code="brandName"/></a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<!-- <li class="active"><a href="<c:url value="/"/>">Home</a></li> -->
					
					<!-- Only for doctor/admin -->
					<%-- <li><a href="<c:url value="/patient/select"/>"><spring:message code="selectPatient"/></a></li>
					<li><a href="<c:url value="/patient/add"/>"><spring:message code="registerPatient"/></a></li> --%>
				
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<sec:authorize access="isAuthenticated()">
					<sec:authentication var="user" property="principal" />
					<li class="navbar-center"><spring:message code="greetings"/>, <strong>
						<c:out value="${user.username}"/></strong></li>
				
					<li>
						<c:url var="logoutUrl" value="/logout"/>
						<form class="form-group" action="${logoutUrl}" method="post">
						  <button class="btn btn-default" type="submit"> <spring:message code="logout"/> </button>
						  <sec:csrfInput/>
						</form>
					</li>
				</sec:authorize>
				<sec:authorize access="isAnonymous()">
					<li><a href="<c:url value="/login"/>"> <spring:message code="login"/> </a></li>
				</sec:authorize>
				
				<li><a href="?locale=en">En</a></li>
				<li><a href="?locale=ru">Ru</a></li>
				<c:if test="${not empty sessionScope.user}">
					<li>
						<%-- <form class="form-inline navbar-center-form">
				            <select class="form-control input-sm" id="language" name="language" onchange="submit()">
				                <option value="en" ${fn:containsIgnoreCase(language, 'en') ? 'selected' : ''}>English</option>
				                <option value="ru" ${fn:containsIgnoreCase(language, 'ru') ? 'selected' : ''}>Русский</option>
				            </select>
				            <c:forEach items="${param}" var="parameter">
				            	<c:if test="${parameter.key ne 'language' and not empty parameter.value}">
				            		<input type="hidden" name="<c:out value="${parameter.key}"/>"
				            			value="<c:out value="${parameter.value}"/>">
				            	</c:if>
				            </c:forEach>
					    </form> --%>
					</li>
				</c:if>
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
</nav>


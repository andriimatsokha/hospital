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
				<sec:authorize access="hasRole('ADMIN')">
					<li><a href="<c:url value="/admin/users"/>">Users</a></li>
				</sec:authorize>
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
						<form class="form-inline navbar-center-form" action="${logoutUrl}" method="post">
						  <button class="btn btn-link" type="submit"> <spring:message code="logout"/> </button>
						  <sec:csrfInput/>
						</form>
					</li>
				</sec:authorize>
				<sec:authorize access="isAnonymous()">
					<li><a href="<c:url value="/login"/>"> <spring:message code="login"/> </a></li>
				</sec:authorize>
				
				<li>
					<c:choose>
						<c:when test="${param.locale ne null }">
							<c:set var="language" value="${param.locale }"/> 
						</c:when>
						<c:otherwise>
							<c:set var="language" value="${cookie.hospitalLocaleCookie.value }"/>
						</c:otherwise>
					</c:choose>
					
					<form class="form-inline navbar-center-form">
			            <select class="form-control input-sm" name="locale" onchange="submit()">
			                <option value="en" ${fn:containsIgnoreCase(language, 'en') ? 'selected' : ''}>English</option>
			                <option value="ru" ${fn:containsIgnoreCase(language, 'ru') ? 'selected' : ''}>Русский</option>
			            </select>
				    </form>
				</li>
				
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
</nav>


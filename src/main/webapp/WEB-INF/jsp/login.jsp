<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/WEB-INF/jsp/_header.jsp" />
<title>Hospital Main Page</title>
</head>

<body>
	<jsp:include page="/WEB-INF/jsp/_topmenu.jsp"/>

	<div class="container">

		<h2><spring:message code="login"/></h2>
		<div class="row">
			<div class="col-sm-4">
				<c:if test="${param.error ne null}">
					<div class="alert alert-danger">    
	                    <spring:message code="login.error"/>
	                </div>
                </c:if>
                <c:if test="${param.logout ne null}">
	                <div class="alert alert-success"> 
	                    <spring:message code="login.successLogout"/>
	                </div>
                </c:if>
				<c:url value="/login" var="loginUrl" />
				<form class="form-group" action="${loginUrl }" method="post">
					<input class="form-control" type="text" name="username">
					<input class="form-control" type="password" name="password">
					<button type="submit" class="btn btn-default"><spring:message code="login"/></button>
					
					<sec:csrfInput/>
				</form>
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/jsp/_footer.jsp"></jsp:include>
</body>
</html>

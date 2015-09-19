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
		<div class="row">
			<div class="col-sm-4">
			
				<h2>Add user</h2>
				<c:url var="addUserUrl" value="/admin/adduser"/>
				<form class="form-group" action="${addUserUrl }" method="post">
					Login: <input class="form-control" type="text" name="login" value="${param.login}">
					Password: <input class="form-control" type="password" name="password">
					Role:
					<select class="form-control" name="roleName">
						<c:forEach items="${roles}" var="roleEnum">
							<c:set var="selected" value="" />
							<c:if test="${param.role eq roleEnum}"><c:set var="selected" value="selected"/> </c:if>
							<option value="${roleEnum }" ${selected} > <spring:message code="role.${roleEnum}"/>
						</c:forEach>
					</select>
					<br>
					<button class="btn btn-default" type="submit">Add</button>
					<sec:csrfInput/>
				</form>
				
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/jsp/_footer.jsp"></jsp:include>
</body>
</html>

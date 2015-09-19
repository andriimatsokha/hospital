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
			
				<h2>All users</h2>
				
				<table class="table table-bordered table-striped table-condensed">
					<thead>
						<tr>
							<th>#</th>
							<th>Login</th>
							<th>Roles</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${users}" var="user" varStatus="status">
							<tr>
								<td>${status.count }</td>
								<td>${user.login }</td>
								<td>
									<c:forEach items="${user.roles}" var="role">
										<spring:message code="role.${role.name}"/><br>
									</c:forEach>
								</td>
						
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<a class="btn btn-default" href="<c:url value='/admin/adduser'/>">Add user</a>
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/jsp/_footer.jsp"></jsp:include>
</body>
</html>

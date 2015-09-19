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
			
				<h2>All employees</h2>
				
				<table class="table table-bordered table-striped table-condensed">
					<thead>
						<tr>
							<th>#</th>
							<th>Name</th>
							<th>Profession</th>
							<th>Office</th>
							<th>HireDate</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${employees}" var="employee" varStatus="status">
							<tr>
								<td>${status.count }</td>
								<td>${employee.firstName } ${employee.lastName }</td>
								<td>${employee.profession.name }</td>
								<td>${employee.office }</td>
								<td>${employee.hireDate }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/jsp/_footer.jsp"></jsp:include>
</body>
</html>

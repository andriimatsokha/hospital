<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/WEB-INF/jsp/_header.jsp" />
<title>Hospital Main Page</title>
</head>

<body>
	<jsp:include page="/WEB-INF/jsp/_topmenu.jsp" />

	<div class="container">
		<div class="row">
			<div class="col-sm-4">

				<h2>Edit employee</h2>
				<c:url var="editEmployeeUrl" value="/admin/employee/edit" />
				<form:form modelAttribute="employee" cssClass="form-horizontal"
					method="post">
					<input type="hidden" name="userid" value="${param.userid}">
					<input type="hidden" name="id" value="${employee.id}">

					<div class="form-group">
						<label for="username" class="col-sm-4 control-label">Username</label>
						<div class="col-sm-8">
							<input id="username" class="form-control" value="${username}"
								readonly />
						</div>
					</div>

					<div class="form-group">
						<label for="firstName" class="col-sm-4 control-label">First
							name</label>
						<div class="col-sm-8">
							<form:input path="firstName" cssClass="form-control"
								placeholder="First name" />
							<form:errors path="firstName" />
						</div>
					</div>
					<div class="form-group">
						<label for="lastName" class="col-sm-4 control-label">Last
							name</label>
						<div class="col-sm-8">
							<form:input path="lastName" cssClass="form-control"
								placeholder="Last name" />
							<form:errors path="lastName" />
						</div>
					</div>
					<div class="form-group">
						<label for="officeNumber" class="col-sm-4 control-label">Office</label>
						<div class="col-sm-8">
							<form:input path="officeNumber" cssClass="form-control"
								placeholder="Office" />
							<form:errors path="officeNumber" />
						</div>
					</div>
					<div class="form-group">
						<label for="hireDate" class="col-sm-4 control-label">HireDate
							(dd/MM/yyyy)</label>
						<div class="col-sm-8">
							<form:input path="hireDate" cssClass="form-control"
								placeholder="HireDate (dd/MM/yyyy)" />
							<form:errors path="hireDate" />
						</div>
					</div>
					<div class="form-group">
						<label for="profession" class="col-sm-4 control-label">Profession</label>
						<div class="col-sm-8">
							<form:select cssClass="form-control" path="profession">
								<form:options items="${professions}" itemValue="id"
									itemLabel="name" />
							</form:select>
							<form:errors path="profession" />
						</div>
					</div>

					<input type="hidden" name="user" value="${param.userid}">

					<div class="form-group">
						<div class="col-sm-8 col-sm-offset-4">
							<button class="btn btn-default" type="submit">Save</button>
						</div>
					</div>
					<sec:csrfInput />
				</form:form>
				<%-- 				<form class="form-group" action="${editEmployeeUrl }" method="post">
					<input type="hidden" name="userid" value="${param.userid}">
					Username: <input class="form-control" readonly="readonly" type="text" value="${username}">
					First Name: <input class="form-control" type="text" name="firstName" value="${employee.firstName}">
					Last Name: <input class="form-control" type="text" name="lastName" value="${employee.lastName}">
					Office: <input class="form-control" type="text" name="office" value="${employee.officeNumber}">
					<fmt:formatDate var="hireDate" value="${employee.hireDate}" pattern="MM/dd/yyyy"/>
					HireDate (MM/dd/yyyy): <input class="form-control" type="text" name="hireDate" value="${hireDate }">
					Profession:
					<select class="form-control" name="profession">
						<c:forEach items="${professions}" var="profession">
							<c:set var="selected" value="" />
							<c:if test="${employee.profession.id eq profession.id}"><c:set var="selected" value="selected"/> </c:if>
							<option value="${profession.id }" ${selected} > ${profession.name }
						</c:forEach>
					</select>
					<br>
					<button class="btn btn-default" type="submit">Save</button>
					<sec:csrfInput/>
				</form> --%>

			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/jsp/_footer.jsp"></jsp:include>
</body>
</html>

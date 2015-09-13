<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/WEB-INF/jsp/_header.jsp" />
<title>Hospital Main Page</title>
</head>

<body>
	<jsp:include page="/WEB-INF/jsp/_topmenu.jsp"></jsp:include>

	<div class="container">
		<div class="row">
			<div class="col-sm-5">
				<h2>Add role</h2>

				<c:url value="/roles/add" var="actionUrl" />
				<form class="form-group" action="${actionUrl }" method="post">
					<input class="form-control" type="text" name="name">
					<button class="btn btn-default" type="submit">Submit</button>
				</form>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/jsp/_footer.jsp"></jsp:include>
</body>
</html>

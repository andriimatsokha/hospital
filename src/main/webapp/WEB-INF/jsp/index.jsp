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
	<jsp:include page="/WEB-INF/jsp/_topmenu.jsp"/>

	<div class="container">

		<h2>Hello World Spring! [hospital]</h2>
		${1 + 2 }
	</div>
	
	<jsp:include page="/WEB-INF/jsp/_footer.jsp"></jsp:include>
</body>
</html>

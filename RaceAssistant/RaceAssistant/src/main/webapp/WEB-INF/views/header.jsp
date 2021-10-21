<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<style>
table, th, td {
	border: 3px solid black;
	cellpadding: 5;
}

body {
	margin: 0;
	padding: 0;
	background-color: gray;
}

header {
	background: black;
	color: white;
	text-align: right;
}

footer {
	background: black;
	height: 100px;
	width: 100%;
	position:static;
	bottom:0;
}
</style>
<meta charset="ISO-8859-1">
</head>
<body>
	<header>
		<h1
			style="color: red; font-family: papyrus, fantasy; font-size: 60px; text-align: center;">Race
			Assistant</h1>
		<sec:authorize access="isAuthenticated()">
		User: 
		<sec:authentication property="principal.username" />
		| <a style="color: white;"
				href="${pageContext.request.contextPath}/logout">Logout</a> &nbsp;
			</sec:authorize>
	</header>

</body>
</html>
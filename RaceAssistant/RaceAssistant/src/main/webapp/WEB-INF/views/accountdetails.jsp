<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<jsp:include page="header.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Account Details</title>
</head>
<body>
	<div align="center">
		<c:if test="${message != null}">
			<p class="text-danger"
				style="font-weight: bold; color: MediumSeaGreen">${message}</p>
		</c:if>
		<h2>Account Details:</h2>
		<table>
			<tr>
				<th>Username:</th>
				<td><sec:authentication property="principal.username" /></td>
			<tr>
			<tr>
				<th>Account Type:</th>
				<td><sec:authentication property="principal.authorities" /></td>
			<tr>
			<tr>
				<th>Change Password:</th>
				<td><a href="passwordchange">Click Here</a></td>
			<tr>
		</table>
		<br> <a href="home" title="Go To Home Page">Exit</a>
	</div>
	<br>
	<br>
	<footer></footer>
</body>
</html>
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
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
  
</head>
<body style="background-color:gray;">
	<div align="center">
		<c:if test="${message != null}">
			<p style="font-weight: bold; color: MediumSeaGreen">${message}</p>
		</c:if>
		<h2>Account Details:</h2>
		<div class="container">
		<table class="table table-sm table-bordered table-hover table-dark w-auto">
			<tr >
				<th width="165">Username:</th>
				<td width="200"><sec:authentication property="principal.username" /></td>
			<tr>
			<tr>
				<th>Account Type:</th>
				<td><sec:authentication property="principal.authorities" /></td>
			<tr>
			<tr>
				<th>Change Password:</th>
				<td><a style="color:white" href="passwordchange">Click Here</a></td>
			<tr>
		</table>
		<br> <a class="btn btn-dark" style="background-color:black;border-color:white;" href="home" title="Go To Home Page">Exit</a>
	</div></div>
	<br>
	<br>
	<footer></footer>
</body>
</html>
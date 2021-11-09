<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Race</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body style="background-color: gray; margin: 0; padding: 0;">
	<div align="center">
		<h1>Edit Race</h1>
		<form:form action="save" method="post" modelAttribute="rd">
			<table
				class="table table-sm table-bordered table-hover table-dark w-auto">
				<form:hidden path="ID" />
				<tr>
					<th width="120">Race Name:</th>
					<td><form:input path="raceName" /></td>
				</tr>
				<tr>
					<th>Track Name:</th>
					<td><form:input path="trackName" /></td>
				</tr>
				<tr>
					<th>Race Date:</th>
					<td><form:input type="date" path="raceDate" /></td>
				</tr>



			</table>
			<br>
			<div class="btn-group" role="group" aria-label="Basic example">
				<input style="background-color: black; border-color: white;"
					class="btn btn-dark" type="submit" value="Save" /> <a
					style="background-color: black; border-color: white;"
					class="btn btn-dark" href="home" title="Go To Login">Cancel</a>
			</div>
		</form:form>
	</div>
	<br>
	<br>
	<footer></footer>
</body>
</html>
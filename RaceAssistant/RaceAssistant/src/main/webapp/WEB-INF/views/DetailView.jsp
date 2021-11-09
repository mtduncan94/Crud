<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
<title>Race Detail View</title>
</head>

<body style="background-color: gray">
	<div align="center">
		<h1>Race Details:</h1>
		<form action="home" method="post" modelAttribute="rd">
			<table
				class="table table-sm table-bordered table-hover table-dark w-auto">
				<tr>
					<th width="120">ID:</th>
					<td width="200">${rd.ID}</td>
				</tr>
				<tr>
					<th>Race Name:</th>
					<td>${rd.raceName}</td>
				</tr>
				<tr>
					<th>Track Name:</th>
					<td>${rd.trackName}</td>
				</tr>
				<tr>
					<th>Race Date:</th>
					<td>${rd.raceDate}</td>
				</tr>
			</table>
			<br> <input type="submit"
				style="background-color: black; border-color: white;"
				class="btn btn-dark" value="Exit" />
		</form>
	</div>
	<br>
	<br>
	<footer></footer>
</body>
</html>

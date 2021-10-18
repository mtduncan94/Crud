<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Race Assistant</title>
<style>
body {
	background-color: gray
}

h1 {
	font-size: 60px;
	color: red;
	background-color: black;
	text-align: center;
	font-family: papyrus, fantasy;
}

table, th, td {
	border: 3px solid black;
	cellpadding: 5;
}
</style>
</head>
<body>
	<div align="center">
		<h1>Race Assistant</h1>
		<h2>All Races:</h2>

		<table>
			<tr>
				<th>ID</th>
				<th>Race Name</th>
				<th>Track Name</th>
				<th>Race Date</th>
			</tr>

			<c:forEach var="Race" items="${listRaces}">
				<tr>
					<td>${Race.ID}</td>
					<td><a title="Click For Details" href="get?ID=${Race.ID}">${Race.raceName}</a></td>
					<td>${Race.trackName}</td>
					<td>${Race.raceDate}</td>
				</tr>
			</c:forEach>
		</table>

		<br>

		<form:form action="${pageContext.request.contextPath}/logout"
			method="post">
			<input type="submit" value="Logout">
		</form:form>

		<sec:authorize access="hasRole('ADMIN')">
			<a href="admin" title="Edit/Add Race">Administrative View</a>
		</sec:authorize>

	</div>

</body>
</html>
>

<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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
				<th>Action</th>
			</tr>

			<c:forEach var="Race" items="${listRaces}">
				<tr>
					<td>${Race.ID}</td>
					<td><a title="Click For Details" href="get?ID=${Race.ID}">${Race.raceName}</a></td>
					<td>${Race.trackName}</td>
					<td>${Race.raceDate}</td>

					<td><a href="edit?ID=${Race.ID}" title="Click To Edit Race">Edit</a>
						&nbsp;&nbsp; <a href="delete?ID=${Race.ID}"
						title="Click To Delete">Delete</a></td>
				</tr>
			</c:forEach>
		</table>

		<br>
		<h2>Add New Race:</h2>
		<form action="save">
			<table>
				<tr>
					<th>Race Name</th>
					<th>Track Name</th>
					<th>Date</th>
					<th>Action</th>
				</tr>

				<tr>
					<td><input type="text" name="raceName" id="raceName"
						required="" title="Enter Race Name"
						oninvalid="setCustomValidity('Please Enter Race Name ')"
						onchange="try{setCustomValidity('')}catch(e){}" />
					<td><input type="text" name="trackName" id="trackName"
						required="" title="Enter Track Name"
						oninvalid="setCustomValidity('Please Enter Track Name ')"
						onchange="try{setCustomValidity('')}catch(e){}" />
					<td><input type="date" name="raceDate" id="raceDate"
						required="" title="Enter Race Date"
						oninvalid="setCustomValidity('Please Enter Race Date ')"
						onchange="try{setCustomValidity('')}catch(e){}" />
					<td><input type="submit" value="Submit New Race" /></td>
				</tr>
			</table>
		</form>

		<form:form action="${pageContext.request.contextPath}/logout"
			method="post">
			<input type="submit" value="Logout">
		</form:form>

	</div>

</body>
</html>
>

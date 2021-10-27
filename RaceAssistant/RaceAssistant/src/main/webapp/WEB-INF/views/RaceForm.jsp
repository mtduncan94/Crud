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
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
	crossorigin="anonymous">
<link
	href="https://getbootstrap.com/docs/4.0/examples/signin/signin.css"
	rel="stylesheet" crossorigin="anonymous">
</head>
<body style="background-color: gray; margin: 0; padding: 0;">
	<div align="center">
		<h1>Edit Race</h1>
		<form:form action="save" method="post" modelAttribute="rd">
			<table>
				<form:hidden path="ID" />
				<tr>
					<th>Race Name:</th>
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
				

				
			</table><br>
					<input style="background-color:black; color:white;" type="submit"
						value="Save" />&nbsp;&nbsp;&nbsp;<a
						style="color: black; font-weight: bold;" href="home"
						title="Go To Login">Cancel</a>
		</form:form>
	</div>
	<br>
	<br>
	<footer></footer>
</body>
</html>
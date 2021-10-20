<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Race</title>
</head>
<body>
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
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="Save" />&nbsp;&nbsp;&nbsp;<a style="color: black; font-weight: bold;"
						href="home" title="Go To Login">Cancel</a></td>

				</tr>
			</table>
		</form:form>
	</div>
	<br><br><footer></footer>
</body>
</html>
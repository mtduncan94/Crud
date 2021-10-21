<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Race Detail View</title>
</head>

<body style="position:static;
	top:0;">
	<div align="center">
		<h1>Race Details:</h1>
		<form action="home" method="post" modelAttribute="rd">
			<table>
				<tr>
					<th>ID</th>
					<td>${rd.ID}</td>
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
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="Back" title="Go To Home Page" /></td>
				</tr>
			</table>
		</form>
	</div>
	<br><br><footer></footer>
</body>
</html>

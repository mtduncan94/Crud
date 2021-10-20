<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<jsp:include page="header.jsp" />


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<!-- Bootstrap DataTable CSS -->
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
<title>Race Assistant</title>
</head>
<body style="background-color:gray;	margin:0;
	padding:0;">
	<div align="center">
<h2>Available Races:</h2>

		<table id="raceTable" class="table">
			<thead>
				<tr>
					<th>ID</th>
					<th>Race Name</th>
					<th>Track Name</th>
					<th>Race Date</th>
					<sec:authorize access="hasRole('ADMIN')">
						<th>Action</th>
					</sec:authorize>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="Race" items="${listRaces}">
				<tr>
					<td>${Race.ID}</td>
					<td><a style="color: black;" title="Click For Details"
						href="get?ID=${Race.ID}">${Race.raceName}</a></td>
					<td>${Race.trackName}</td>
					<td>${Race.raceDate}</td>

					<sec:authorize access="hasRole('ADMIN')">
						<td><a style="font-weight:bold; color: MediumSeaGreen;" href="edit?ID=${Race.ID}"
							title="Click To Edit Race">Edit</a>&nbsp;&nbsp;| &nbsp;&nbsp;
							 <a style="font-weight:bold; color: red;" href="delete?ID=${Race.ID}"
							
							onclick="return confirm('Please Confirm Deletion')"
							title="Click To Delete">Delete</a></td>
					</sec:authorize>
				</tr>
			</c:forEach>
			</tbody>
		</table>

		<br>
		<sec:authorize access="hasRole('ADMIN')">
			<h2>Add New Race:</h2>
			<form action="save">
				<table>
					<thead>
						<tr>
							<th>Race Name</th>
							<th>Track Name</th>
							<th>Date</th>
							<th>Add</th>
						</tr>
					</thead>

					<tbody>
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
					</tbody>
				</table>
			</form>
		</sec:authorize>
	</div>

	<!-- jQuery js-->
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<!-- Bootstrap js -->
	<script type="text/javascript"
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<!-- jQuery Datatable js -->
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
	<!-- Bootstrap Datatable js -->
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
	<script type="text/javascript">
      $(document).ready( function () {
          $('#raceTable').DataTable({})
          });
    </script>

	<br>
	<br>
	<footer></footer>
</body>
</html>


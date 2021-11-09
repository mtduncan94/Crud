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
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<style>
#raceTable_previous a {
	background-color: black;
	color: white;
}

#raceTable_next a {
	background-color: black;
	color: white;
}

.pagination>li>a, .pagination>li>span {
	background-color: black !important;
	border: 1px solid white !important;
}
</style>

<title>Race Assistant</title>
</head>
<body id="top" style="background-color: gray; margin: 0; padding: 0;">
	<header>
		<div style="text-align: left;">
			<sec:authorize access="hasRole('ADMIN')">
				<a href="#addRace" style="color: white;">Add Race?</a>
			</sec:authorize>
		</div>
	</header>
	<div align="center">
		<c:if test="${message != null}">
			<p style="font-weight: bold; color: MediumSeaGreen">${message}</p>
		</c:if>
		<h2>Available Races:</h2>
		<div class="container">
			<table id="raceTable" class="table table-hover table-dark">
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
							<td><a style="color: white;" title="Click For Details"
								href="get?ID=${Race.ID}">${Race.raceName}</a></td>
							<td>${Race.trackName}</td>
							<td>${Race.raceDate}</td>

							<sec:authorize access="hasRole('ADMIN')">
								<td><a style="font-weight: bold; color: MediumSeaGreen;"
									href="edit?ID=${Race.ID}" title="Click To Edit Race">Edit</a>&nbsp;&nbsp;|
									&nbsp;&nbsp; <a style="font-weight: bold; color: red;"
									href="delete?ID=${Race.ID}"
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
				<form action="add" id="addRace">
					<table class="table table-sm table-hover table-dark w-auto">
						<thead>
							<tr>
								<th style="text-align: center">Race Name</th>
								<th style="text-align: center">Track Name</th>
								<th style="text-align: center">Date</th>
							</tr>
						</thead>

						<tbody>
							<tr>
								<td style="text-align: center; background-color: black;"><input
									type="text" name="raceName" id="raceName" required=""
									title="Enter Race Name" placeholder="Race Name"
									oninvalid="setCustomValidity('Please Enter Race Name ')"
									onchange="try{setCustomValidity('')}catch(e){}" />
								<td style="text-align: center; background-color: black;"><input
									type="text" name="trackName" id="trackName" required=""
									title="Enter Track Name" placeholder="Track Name"
									oninvalid="setCustomValidity('Please Enter Track Name ')"
									onchange="try{setCustomValidity('')}catch(e){}" />
								<td style="text-align: center; background-color: black;"><input
									type="date" name="raceDate" id="raceDate" required=""
									title="Enter Race Date"
									oninvalid="setCustomValidity('Please Enter Race Date ')"
									onchange="try{setCustomValidity('')}catch(e){}" />
							</tr>
						</tbody>
					</table>
					<input type="submit" value="Submit New Race" class="btn btn-dark"
						style="background-color: black; border-color: white;" />
				</form>
			</sec:authorize>
		</div>
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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>



	<div id="myModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div style="background-color: black; color: white"
					class="modal-header">
					<h5 class="modal-title">Site Guidelines</h5>
				</div>
				<div style="background-color: gray;" class="modal-body">
					<p>Do you consent to following website guidelines?</p>

					<div style="text-align: center;">
						<button type="button"
							style="background-color: black; border-color: white; color: white"
							class="btn btn-default" data-dismiss="modal">Yes,
							Contiue To Site</button>
						&nbsp;&nbsp;&nbsp; <a style="color: black;"
							href="${pageContext.request.contextPath}/logout">No, Sign Out</a>

					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			$('#raceTable').DataTable({})
		
			
			if ($.cookie('checkModal') == null) {
				$('#myModal').modal('show');
				$.cookie('checkModal', '1');
			}

			$('#myModal').modal({
				backdrop : 'static',
				keyboard : false
			});

	

		});
	</script>
	<br>
	<br>
	<footer style="position: static;">
		<div style="text-align: center;">
			<a href="#top" style="color: white;">Back To Top</a>
		</div>
	</footer>
</body>
</html>


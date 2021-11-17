<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="header.jsp" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Create an account</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
	crossorigin="anonymous">
<link
	href="https://getbootstrap.com/docs/4.0/examples/signin/signin.css"
	rel="stylesheet" crossorigin="anonymous">
<style>
input {
	color: white;
	background-color: black;
}

::-ms-reveal {
	filter: invert(100%);
}
</style>
</head>

<body style="background-color: gray; margin: 0; padding: 0;">
	<div class="container">
		<c:if test="${message != null}">
			<p style="text-align: center; font-weight: bold; color: Red">${message}</p>
		</c:if>
		<form:form method="POST" modelAttribute="userForm" class="form-signin">
			<h2 class="form-signin-heading">Create your account:</h2>
			<spring:bind path="name">
				<div style="color: red; font-weight: bold;"
					class="form-group ${status.error ? 'has-error' : ''}">
					<form:input style="background-color:black" type="text" path="name"
						class="form-control" placeholder="Username" autofocus="true"></form:input>
					<form:errors path="name"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="password">
				<div style="color: red; font-weight: bold;"
					class="form-group ${status.error ? 'has-error' : ''}">
					<form:input style="background-color:black" type="password" id="newPassword"
						path="password" class="form-control" placeholder="Password"></form:input>
					<form:errors path="password"></form:errors>
				</div>
			</spring:bind>

			<input oninput="checkPasswordMatch(this);"
				style="background-color:black" type="password"
				class="form-control" name="passwordConfirm"
				placeholder="Confirm Your Password"></input>

			<input class="form-control" style="background-color:black" placeholder="Add Resume(Optional)" type="file" />

			<button style="background-color: black; border-color: white;"
				class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
		</form:form>

		<a style="text-align: center; color: black; font-weight: bold;"
			href="home" title="Go To Login">Cancel</a>
	</div>

	<script>
		function checkPasswordMatch(fieldConfirmPassword) {
			if (fieldConfirmPassword.value != $("#newPassword").val()) {
				fieldConfirmPassword
						.setCustomValidity("Passwords do not match!");

			} else {
				fieldConfirmPassword.setCustomValidity("");
			}

		}
	</script>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
	<br>
	<footer></footer>
</body>
</html>
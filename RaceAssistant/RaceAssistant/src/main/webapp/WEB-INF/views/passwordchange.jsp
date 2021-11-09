<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="header.jsp" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Change Password</title>
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
  background-color: black;}
::-ms-reveal {
  filter: invert(100%);
}</style>
</head>

<body style="background-color: gray; margin: 0; padding: 0;">
	<div class="container">

		<form:form method="post" modelAttribute="changePassword"
			class="form-signin">
			<h2 class="form-signin-heading">Change Password:</h2>
			<c:if test="${message != null}">
				<p class="text-danger" style="font-weight: bold;">${message}</p>
			</c:if>
			<input style="background-color: black;" type="password" name="oldPassword" class="form-control"
				placeholder="Old Password" oninvalid="setCustomValidity('Please Enter Current Password ')"
								onchange="try{setCustomValidity('')}catch(e){}" required autofocus />

			<input style="background-color: black;" type="password" name="newPassword" id="newPassword"
				class="form-control" placeholder="New Password" oninvalid="setCustomValidity('Please Enter New Password')"
								onchange="try{setCustomValidity('')}catch(e){}"required />

			<input style="background-color: black;" type="password" class="form-control" name="passwordConfirm"
				placeholder="Confirm New Password" required
				oninput="checkPasswordMatch(this);" />

			<button style="background-color: black; border-color: white"
				class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
		</form:form>

		<a style="text-align: center; color: black; font-weight: bold;"
			href="accountdetails" title="Cancel">Cancel</a>
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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Welcome To Race Assistant</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
	crossorigin="anonymous">
<link
	href="https://getbootstrap.com/docs/4.0/examples/signin/signin.css"
	rel="stylesheet" crossorigin="anonymous">
</head>
<body style="background-color: gray;">
	<div class="container">
		<h1
			style="font-size: 60px; color: red; background-color: black; text-align: center; font-family: papyrus, fantasy;">Welcome
			To Race Assistant</h1>
		<div style="color: red; font-weight: bold; margin: 30px 0px;">${SPRING_SECURITY_LAST_EXCEPTION.message}</div>
		<form class="form-signin" method="post" action="/RaceAssistant/login">
			<h2 class="form-signin-heading">Please sign in</h2>
			<p>
				<label for="username" class="sr-only">Username</label> <input
					type="text" id="username" name="username" class="form-control"
					placeholder="Username" required="" autofocus=""
					title="Enter Username"
					oninvalid="setCustomValidity('Please Enter Username')"
					onchange="try{setCustomValidity('')}catch(e){}">
			</p>
			<p>
				<label for="password" class="sr-only">Password</label> <input
					type="password" id="password" name="password" class="form-control"
					placeholder="Password" required="" title="Enter Password"
					oninvalid="setCustomValidity('Please Enter Password')"
					onchange="try{setCustomValidity('')}catch(e){}">
			</p>
			<button style="background-color:black; border:black" class="btn btn-lg btn-primary btn-block" type="submit"
				title="Click To Sign In">Sign in</button>
		</form>
	</div>
</body>
</html>

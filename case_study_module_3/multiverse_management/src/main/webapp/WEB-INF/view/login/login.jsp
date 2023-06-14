<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Log in</title>
	<!-- Font Awesome -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>
	<!-- Google Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet"/>
	<!-- MDB -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.css" rel="stylesheet"/>
	<!-- MDB -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js"></script>
	<style>
		.bg-image-vertical {
			position: relative;
			overflow: hidden;
			background-repeat: no-repeat;
			background-position: right center;
			background-size: auto 100%;
		}

		@media (min-width: 1025px) {
			.h-custom-2 {
				height: 100%;
			}
		}
	</style>
	<script>
		function validateForm() {
			let email = document.getElementById("form2Example18").value;
			let password = document.getElementById("form2Example28").value;

			if (email.trim() === "") {
				alert("Please enter your email address.");
				return false;
			}

			if (password.trim() === "") {
				alert("Please enter your password.");
				return false;
			}

			return true;
		}
	</script>
</head>
<body>
<section class="vh-100">
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-6 text-black">
				<div class="px-5 ms-xl-4">
					<i class="fas fa-crow fa-2x me-3 pt-5 mt-xl-4" style="color: #709085;"></i>
					<span class="h1 fw-bold mb-0">Logo</span>
				</div>

				<div class="d-flex align-items-center h-custom-2 px-5 ms-xl-4 mt-5 pt-5 pt-xl-0 mt-xl-n5">
					<form method="post" action="/authUser" onsubmit="return validateForm()">
						<h3 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Log in</h3>
						<div class="form-outline mb-4">
							<input type="email" name="email" id="form2Example18" class="form-control form-control-lg"/>
							<label class="form-label" for="form2Example18">Email address</label>
						</div>

						<div class="form-outline mb-4">
							<input type="password" name="password" id="form2Example28" class="form-control form-control-lg"/>
							<label class="form-label" for="form2Example28">Password</label>
						</div>

						<div class="pt-1 mb-4">
							<button class="btn btn-info btn-lg btn-block">Login</button>
						</div>

						<c:if test="${not empty error}">
							<c:choose>
								<c:when test="${error == 'invalid_email'}">
									<p class="text-danger">Invalid email. Please try again.</p>
								</c:when>
								<c:when test="${error == 'invalid_password'}">
									<p class="text-danger">Invalid password. Please try again.</p>
								</c:when>
							</c:choose>
						</c:if>

						<p class="small mb-2"><a class="text-muted" href="/forgot-password">Forgot password?</a></p>
						<p>Don't have an account? <a href="/signup" class="link-info">Register here</a></p>
					</form>
				</div>
			</div>
			<div class="col-sm-6 px-0 d-none d-sm-block">
				<img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/img3.webp"
					 alt="Login image" class="w-100 vh-100" style="object-fit: cover; object-position: left;">
			</div>
		</div>
	</div>
</section>
</body>
</html>


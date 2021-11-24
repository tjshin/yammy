<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.study.member.GoogleProfile"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="templatemo">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id"
	content="403080930715-vace0dgrftjiuv9liu4u7qf1vf3v1u1t.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<title>로그인</title>

<link
	href="http://fonts.googleapis.com/css?family=PT+Serif:400,700,400italic,700itali"
	rel="stylesheet">
<link
	href="http://fonts.googleapis.com/css?family=Raleway:400,900,800,700,500,200,100,600"
	rel="stylesheet">
<link rel="stylesheet" href="bootstrap/bootstrap.css">
<link rel="stylesheet" href="css/misc.css">
<link rel="stylesheet" href="css/blue-scheme.css">
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />

<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/jquery-migrate-1.2.1.min.js"></script>

<script>
	function onSignIn(googleUser) {
		var profile = googleUser.getBasicProfile();
		console.log("ID: " + profile.getId());
		console.log('Full Name: ' + profile.getName());
		console.log('Given Name: ' + profile.getGivenName());
		console.log('Family Name: ' + profile.getFamilyName());
		console.log("Image URL: " + profile.getImageUrl());
		console.log("Email: " + profile.getEmail());

		var id_token = googleUser.getAuthResponse().id_token;
		console.log("ID Token: " + id_token);

		var id = profile.getId();
		var mname = profile.getName();
		var email = profile.getEmail();

		var url = "/member/login/google/callback";
		url += "?id=" + id;
		url += "&mname=" + mname;
		url += "&email=" + email;

		location.href = url;
	}

	window.Kakao.init("36bbb9f15e74a9580efcc6a8255f4dd8");

	function kakaoLogin() {
		Kakao.Auth.login({
			success : function(response) {
				Kakao.API.request({
					url : '/v2/user/me',
					success : function(response) {
						console.log(response)
					},
					fail : function(error) {
						console.log(error)
					},
				})
			},
			fail : function(error) {
				console.log(error)
			},
		})
	}

	function loginPost() {

		document.getElementById('form').submit();

	}

	function onEnterLogin() {

		var keyCode = window.event.keyCode;

		if (keyCode == 13) {

			loginPost();

		}

	}
</script>

<style>
#remember {
	font-size: 12px;
}
</style>

</head>
<body onkeydown="javascript:onEnterLogin();">
	<section id="homeIntro" class="parallax first-widget">
		<div class="parallax-overlay">
			<div class="container home-intro-content">
				<h2>Login</h2>
				<br />
				<div>
					<div>

						<div class="container" align="center" style="margin-left: 100px;">
							<form id="form" class="form-horizontal" action="/member/login"
								method="post">
								<div class="form-group">
									<label class="control-label col-sm-3" for="id">ID</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" id="id" name="id"
											required="required" value="${c_id_val}">
									</div>
								</div>
								<br />
								<div class="form-group">
									<label class="control-label col-sm-3" for="password">Password</label>
									<div class="col-sm-4">
										<input type="password" class="form-control" id="password"
											name="password" required="required">
									</div>
								</div>

								<div class="form-group">
									<div class="col-sm-offset-5 col-sm-3">
										<label id="remember">
										<c:choose>
											<c:when test="${c_id =='Y'}">
											<input type="checkbox" id="c_id" name="c_id" value="Y" checked="checked"> &nbsp; Remember ID
										</c:when>
										<c:otherwise>
											<input type="checkbox" id="c_id" name="c_id" value="Y"> &nbsp; Remember ID
          								</c:otherwise>		
										</c:choose>
										</label>
									</div>
								</div>
								<br />
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-6">
										<a href="#" onClick="loginPost()"
											class="main-button accent-color">로그인</a> <a
											href="/member/agree" class="main-button accent-color">회원가입</a>
										<a href="/member/find" class="main-button accent-color2">계정
											찾기</a><br /> <br />

										<div class="form-inline">
											<label> <a
												href="https://kauth.kakao.com/oauth/authorize?client_id=b39f6433b5558171ad972ddc2bea324a&redirect_uri=http://localhost:8000/member/login/kakao/callback&response_type=code">
													<img src="${root }/images/kakao_login_button.jpg"
													style="height: 40px; width: auto;">
											</a>
											</label><br /> <label>
												<div class="g-signin2" data-onsuccess="onSignIn"
													data-theme="dark"></div>
											</label>
										</div>
									</div>
								</div>
							</form>
						</div>


					</div>
				</div>
				<!-- /.col-md-12 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</section>
	<!-- /#homeIntro -->

</body>
</html>
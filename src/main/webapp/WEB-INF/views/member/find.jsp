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

<title>계정 찾기</title>

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

<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/jquery-migrate-1.2.1.min.js"></script>

<style>
#remember {
	font-size: 12px;
}
</style>

<script>

function sendEmail(form){
	
	var mname = form.mname.value;
	var email = form.email.value;
	
	if(mname == ""){
		alert("이름을 입력하세요.");
		form.mname.focus();
		return false;
	}else if(email == ""){
		alert("이메일을 입력하세요.");
		form.email.focus();
		return false;
	}
}
</script>

</head>
<body>
	<section id="homeIntro" class="parallax first-widget">
		<div class="parallax-overlay">
			<div class="container home-intro-content">
				<h2>Email 본인 확인</h2>
				<br />
				<div class="row">
					<div class="col-md-12">

						<div class="container" align="center" style="margin-left: 100px;">
							<form id="form" class="form-horizontal" action="${root }/member/sendEmail"
								method="post" onsubmit="return sendemail(this)">
								
								<div class="form-group">
									<label class="control-label col-sm-3" for="id">Email</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" id="email"
											placeholder="Email을 입력하세요." name="email" required="required">
									</div>
								</div>
								<br />
								<div class="col-sm-offset-2 col-sm-6">
								<label> 
								<button class="btn btn-default">확인</button>
								<button class="btn btn-default" onclick="history.back()">뒤로</button>
								</label>
								</div>
								<br /><br />

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
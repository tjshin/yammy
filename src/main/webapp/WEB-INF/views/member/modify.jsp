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

<title>패스워드 수정</title>

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
<script>

function checkPassword(form){
	
	var password = form.password.value;
	var passwordCheck = form.passwordCheck.value;
	
	if(password == ""){
		alert("수정하실 패스워드를 입력하세요.");
		form.password.focus();
		return false;
	}if(passwordCheck == ""){
		alert("패스워드 확인을 입력하세요.");
		form.passwordCheck.focus();
		return false;
	}if (password != passwordCheck) {
		alert("패스워드와 패스워드 확인이 일치하지 않습니다.");
		form.password.value = "";
		form.passwordCheck.value = "";
		form.password.focus();
		return false;
	}
}
</script>

</head>
<body>
	<section id="homeIntro" class="parallax first-widget">
		<div class="parallax-overlay">
			<div class="container home-intro-content">

				<h4>${dto.mname } 님의 아이디는 "${dto.id }"입니다</h4><br/>
				
				<div class="row">
					<div class="col-md-12">
						<div class="container" align="center" style="margin-left: 100px;">
							<form id="form" class="form-horizontal" action="${root }/member/modify"
								method="post" onsubmit="return checkPassword(this)">
								<input type="hidden" id="id" name="id" value="${dto.id }">
								<div class="form-group">
									<label class="control-label col-sm-3" for="id">Password</label>
									<div class="col-sm-4">
										<input type="password" class="form-control" id="password"
											placeholder="수정하실 패스워드를 입력하세요." name="password" required="required">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3" for="id">Password 확인</label>
									<div class="col-sm-4">
										<input type="password" class="form-control" id="passwordCheck"
											placeholder="패스워드를 한 번 더 입력하세요." name="passwordCheck" required="required">
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
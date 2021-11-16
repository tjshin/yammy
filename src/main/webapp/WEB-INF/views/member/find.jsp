<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.study.member.GoogleProfile" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="keywords" content="">
	<meta name="description" content="">
    <meta name="author" content="templatemo">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="403080930715-vace0dgrftjiuv9liu4u7qf1vf3v1u1t.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<title>계정 찾기</title>
    <!-- 
	Medigo Template
	http://www.templatemo.com/preview/templatemo_460_medigo
    -->
    
	<!-- Google Fonts -->
	<link href="http://fonts.googleapis.com/css?family=PT+Serif:400,700,400italic,700itali" rel="stylesheet">
	<link href="http://fonts.googleapis.com/css?family=Raleway:400,900,800,700,500,200,100,600" rel="stylesheet">

	<!-- Stylesheets -->
	<link rel="stylesheet" href="bootstrap/bootstrap.css">
	<link rel="stylesheet" href="css/misc.css">
	<link rel="stylesheet" href="css/blue-scheme.css">
	
	<!-- JavaScripts -->
	<script src="js/jquery-1.10.2.min.js"></script>
	<script src="js/jquery-migrate-1.2.1.min.js"></script>

	<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />

	

<style>
	#remember{
		font-size:12px;
	}
</style>

</head>
<body>
	<section id="homeIntro" class="parallax first-widget">
	    <div class="parallax-overlay">
		    <div class="container home-intro-content">
		    <h2>계정 찾기</h2>
		    <br/>
		        <div class="row">
		        	<div class="col-md-12">
		        		
		        		<div class="container">
							  <form id="form" class="form-horizontal" action="/member/findProc" method="post" >
								<div class="form-group" >
								  <label class="control-label col-sm-2" for="id">Email</label>
								  <div class="col-sm-4">
									<input type="text"  class="form-control" id="email" placeholder="Email을 입력하세요" 
									 name="email" required="required">
								  </div>
								</div><br/>
								
									<a href="#"  class="main-button accent-color">확인</a>
									<a href="#" class="main-button accent-color">뒤로</a><br/><br/>

									
								
								
								  </form>
								</div>
							  
							
							</div>
		        	</div> <!-- /.col-md-12 -->
		        </div> <!-- /.row -->
		    </div> <!-- /.container -->
	</section> <!-- /#homeIntro -->


</body>
</html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no, maximum-scale=1">

<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id"
	content="403080930715-vace0dgrftjiuv9liu4u7qf1vf3v1u1t.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>

<title>top test</title>



<!-- Google Fonts -->
<link
	href="http://fonts.googleapis.com/css?family=PT+Serif:400,700,400italic,700itali"
	rel="stylesheet">
<link
	href="http://fonts.googleapis.com/css?family=Raleway:400,900,800,700,500,200,100,600"
	rel="stylesheet">

<!-- Stylesheets -->
<link rel="stylesheet" href="${root }/bootstrap/bootstrap.css">
<link rel="stylesheet" href="${root }/css/misc.css">
<link rel="stylesheet" href="${root }/css/blue-scheme.css">

<!-- JavaScripts -->
<script src="${root }/js/jquery-1.10.2.min.js"></script>
<script src="${root }/js/jquery-migrate-1.2.1.min.js"></script>

<!-- Kakao logout -->
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

<script>
	Kakao.init('36bbb9f15e74a9580efcc6a8255f4dd8');
</script>



<script>
	function signOut() {
		if (gapi.auth2 != undefined) {
			var auth2 = gapi.auth2.getAuthInstance();
			auth2.signOut().then(function() {
				console.log('User signed out.');
			});
			auth2.disconnect();
		}

		location.href = "/member/logout"
	}
</script>


</head>

<body>


	<div class="responsive_menu">
		<!-- 모바일버전 -->
		<ul class="main_menu">
			<li><a href="${root }/">Home</a></li>
			<li><a href="#">구장별 게시판</a>
				<ul>

					<li><a href="${root }/bbs/list?bbscate=jamsil"><img src="${root }/images/map/emblem_LG.png" style="width:45px;"><img src="${root }/images/map/emblem_OB.png" style="width:45px;">잠실(LG/두산)</a></li>
					<li><a href="${root }/bbs/list?bbscate=gocheok"><img src="${root }/images/map/emblem_WO.png" style="width:45px;">고척(키움)</a></li>
					<li><a href="${root }/bbs/list?bbscate=incheon"><img src="${root }/images/map/emblem_SK.png" style="width:45px;">인천(SSG)</a></li>
					<li><a href="${root }/bbs/list?bbscate=suwon"><img src="${root }/images/map/emblem_KT.png" style="width:45px;">수원(KT)</a></li>
					<li><a href="${root }/bbs/list?bbscate=daejeon"><img src="${root }/images/map/emblem_HH.png" style="width:45px;">대전(한화)</a></li>
					<li><a href="${root }/bbs/list?bbscate=gwangju"><img src="${root }/images/map/emblem_HT.png" style="width:45px;">광주(KIA)</a></li>
					<li><a href="${root }/bbs/list?bbscate=daegu"><img src="${root }/images/map/emblem_SS.png" style="width:45px;">대구(삼성)</a></li>
					<li><a href="${root }/bbs/list?bbscate=changwon"><img src="${root }/images/map/emblem_NC.png" style="width:45px;">창원(NC)</a></li>
					<li><a href="${root }/bbs/list?bbscate=busan"><img src="${root }/images/map/emblem_LT.png" style="width:45px;">사직(롯데)</a></li>

				</ul></li>

			<li><a href="${root }/notice/list">공지사항</a></li>
			<li><a href="${root }/ticket/list">티켓 양도</a></li>

			<li><a href="${root }/sikdang/map_main">경기장 주변 맛집</a>
				<ul>
					<li><a href="${root }/sikdang/map_main">지도에서 보기</a></li>
					<li><a href="${root }/review/list">리뷰 목록</a></li>
					<li><a href="${root }/sikdang/map_search">리뷰 등록</a></li>

				</ul></li>

			<li><a href="${root}/member/mypage">My Page</a>
				<ul>
					<li><a href="${root}/member/mypage"><span
							class="glyphicon glyphicon-list"></span>회원정보</a></li>
					<li><a href="${root}/member/update">회원정보 수정</a></li>
				</ul></li>
			<li><a href="${root }/chatbot/chatting">1:1 문의</a></li>
			<c:choose>

				<c:when test="${empty sessionScope.id }">
					<li><a href="${root}/member/agree"><span
							class="glyphicon glyphicon-user"></span> Sign Up</a></li>
					<li><a href="${root}/member/login"><span
							class="glyphicon glyphicon-log-in"></span> Login</a></li>
				</c:when>
				<c:when test="${sessionScope.grade == 'A'}">
					<li><a href="#">관리자</a>
						<ul>
							<li><a href="${root}/admin/member/list"><span
									class="glyphicon glyphicon-list"></span> 회원 목록</a></li>
							<li><a href="${root}/admin/sikdang/list">맛집 목록</a></li>
							<li><a href="${root}/admin/message/list">전체 쪽지 목록</a></li>
							<li><a href="${root}/admin/bbs/reply/list>전체 게시판 댓글 목록</a></li>
							<li><a href="${root }/admin/review/reply/list">전체 리뷰 댓글 목록</a></li>
							<li><a href="${root }/admin/ocrtest">OCR 실험실</a></li>
						</ul></li>
					<li><a href="${root}/member/logout"><span
							class="glyphicon glyphicon-log-out"></span> Logout</a></li>
				</c:when>

				<c:when test="${sessionScope.grade == 'KH'}">
					<li><a id="kakaoLogout" href="${root}/member/logout"><span
							class="glyphicon glyphicon-log-out"></span>Logout</a></li>
				</c:when>

				<c:when test="${sessionScope.grade == 'GH'}">

					<li><a href="#" onclick="signOut()"><span
							class="g-signin2"></span> Logout</a></li>

				</c:when>

				<c:otherwise>

					<li><a href="${root}/member/logout"><span
							class="glyphicon glyphicon-log-out"></span> Logout</a></li>
				</c:otherwise>
			</c:choose>

		</ul>
		<!-- /.main_menu -->
	</div>
	<!-- /.responsive_menu -->




	<header class="site-header clearfix">
		<!-- static-info-project -->

		<div class="site-header clearfix">


			<div class="container">

				<div class="row">


					<div class="row">

						<div class="pull-left logo">

							<a href="${root }/"> <img src="${root }/images/yammylogo.png"
								alt="야구에 미치다 yammy">

							</a>


						</div>
						<!-- /.logo -->


						<div class="main-navigation pull-right">

							<nav class="main-nav visible-md visible-lg">

								<ul class="sf-menu">
									<li class="active"><a href="${root }/">Home</a></li>

									<li><a href="#">구장별 게시판</a>
										<ul>

											<li><a href="${root }/bbs/list?bbscate=jamsil"><img src="${root }/images/map/emblem_LG.png" style="width:45px;"><img src="${root }/images/map/emblem_OB.png" style="width:45px;">잠실(LG/두산)</a></li>
											<li><a href="${root }/bbs/list?bbscate=gocheok"><img src="${root }/images/map/emblem_WO.png" style="width:45px;">고척(키움)</a></li>
											<li><a href="${root }/bbs/list?bbscate=incheon"><img src="${root }/images/map/emblem_SK.png" style="width:45px;">인천(SSG)</a></li>
											<li><a href="${root }/bbs/list?bbscate=suwon"><img src="${root }/images/map/emblem_KT.png" style="width:45px;">수원(KT)</a></li>
											<li><a href="${root }/bbs/list?bbscate=daejeon"><img src="${root }/images/map/emblem_HH.png" style="width:45px;">대전(한화)</a></li>
											<li><a href="${root }/bbs/list?bbscate=gwangju"><img src="${root }/images/map/emblem_HT.png" style="width:45px;">광주(KIA)</a></li>
											<li><a href="${root }/bbs/list?bbscate=daegu"><img src="${root }/images/map/emblem_SS.png" style="width:45px;">대구(삼성)</a></li>
											<li><a href="${root }/bbs/list?bbscate=changwon"><img src="${root }/images/map/emblem_NC.png" style="width:45px;">창원(NC)</a></li>
											<li><a href="${root }/bbs/list?bbscate=busan"><img src="${root }/images/map/emblem_LT.png" style="width:45px;">사직(롯데)</a></li>

										</ul></li>


									<li><a href="${root }/notice/list">공지사항</a></li>
									<li><a href="${root }/ticket/list">티켓 양도</a></li>

									<li><a href="${root }/sikdang/map_main">경기장 주변 맛집</a>
										<ul>
											<li><a href="${root }/sikdang/map_main">지도에서 보기</a></li>
											<li><a href="${root}/review/list">리뷰 목록</a></li>
											<li><a href="${root }/sikdang/map_search">리뷰 등록</a></li>

										</ul></li>

									<li><a href="${root}/member/mypage">My Page</a>
										<ul>
											<li><a href="${root}/member/mypage"><span
													class="glyphicon glyphicon-list"></span>회원정보</a></li>
											<li><a href="${root}/member/update">회원정보 수정</a></li>
										</ul></li>


									<li><a href="${root }/chatbot/chatting">1:1 문의</a></li>

									<c:choose>

										<c:when test="${empty sessionScope.id }">
											<li><a href="${root}/member/agree"><span
													class="glyphicon glyphicon-user"></span> Sign Up</a></li>
											<li><a href="${root}/member/login"><span
													class="glyphicon glyphicon-log-in"></span> Login</a></li>
										</c:when>


										<c:when test="${sessionScope.grade == 'A'}">
											<li><a href="#">관리자</a>
												<ul>
													<li><a href="${root}/admin/member/list"><span
															class="glyphicon glyphicon-list"></span> 회원 목록</a></li>
													<li><a href="${root}/admin/sikdang/list">맛집 목록</a></li>
													<li><a href="${root}/admin/message/list">전체 쪽지 목록</a></li>
													<li><a href="${root}/admin/bbs/reply/list">전체 게시판 댓글 목록</a></li>
													<li><a href="${root }/admin/review/reply/list">전체 리뷰 댓글 목록</a></li>
													<li><a href="${root }/admin/ocrtest">OCR 실험실</a></li>
												</ul></li>

											<li><a href="${root}/member/logout"><span
													class="glyphicon glyphicon-log-out"></span> Logout</a></li>
										</c:when>

										<c:when test="${sessionScope.grade == 'KH'}">
											<li></li>
											<li></li>
											<li></li>
											<li></li>
											<li></li>
											<li><a id="kakaoLogout" href="${root}/member/logout"><span
													class="glyphicon glyphicon-log-out"></span>Logout</a></li>
										</c:when>



										<c:when test="${sessionScope.grade == 'GH'}">
											<li></li>
											<li></li>
											<li></li>
											<li></li>
											<li></li>
											<li><a href="#" onclick="signOut()"><span
													class=class="g-signin2"></span> Logout</a></li>
										</c:when>

										<c:otherwise>
											<li></li>
											<li></li>
											<li></li>
											<li></li>
											<li></li>
											<li><a href="${root}/member/logout"><span
													class="glyphicon glyphicon-log-out"></span> Logout</a></li>

										</c:otherwise>
									</c:choose>




								</ul>
								<!-- /.sf-menu -->
							</nav>
							<!-- /.main-nav -->

							<!-- This one in here is responsive menu for tablet and mobiles -->
							<div class="responsive-navigation visible-sm visible-xs"
								id="except">
								<a href="#nogo" class="menu-toggle-btn"> <i
									class="fa fa-bars"></i>
								</a>
							</div>
							<!-- /responsive_navigation -->

						</div>
						<!-- /.main-navigation -->

					</div>
					<!-- /.col-md-12 -->

				</div>
				<!-- /.row -->

			</div>
			<!-- /.container -->
		</div>
		<!-- /.site-header -->
	</header>
	<!-- Scripts -->

	<script src="${root }/js/min/plugins.min.js"></script>
	<script src="${root }/js/min/medigo-custom.min.js"></script>

</body>

</html>
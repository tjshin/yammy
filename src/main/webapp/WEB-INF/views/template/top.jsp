<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="en-US">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no, maximum-scale=1">
    <title>top test</title>

    
    
    <!-- Google Fonts -->
	<link href="http://fonts.googleapis.com/css?family=PT+Serif:400,700,400italic,700itali" rel="stylesheet">
	<link href="http://fonts.googleapis.com/css?family=Raleway:400,900,800,700,500,200,100,600" rel="stylesheet">

	<!-- Stylesheets -->
	<link rel="stylesheet" href="${root }/bootstrap/bootstrap.css">
	<link rel="stylesheet" href="${root }/css/misc.css">
	<link rel="stylesheet" href="${root }/css/blue-scheme.css">
	
	<!-- JavaScripts -->
	<script src="${root }/js/jquery-1.10.2.min.js"></script>
	<script src="${root }/js/jquery-migrate-1.2.1.min.js"></script>

	<link rel="shortcut icon" href="${root }/images/favicon.ico" type="image/x-icon" />
    

</head>

<body>


    <div class="responsive_menu">
        <!-- 모바일버전 -->
        <ul class="main_menu">
            <li><a href="#">Home</a></li>
            <li><a href="#">구장별 게시판</a>
            	<ul>
            		<li><a href="/bbs/list">잠실(LG/두산)</a></li>
                    <li><a href="#">고척(키움)</a></li>
                    <li><a href="#">인천(SSG)</a></li>
                    <li><a href="#">수원(KT)</a></li>
                    <li><a href="#">대전(한화)</a></li>
                    <li><a href="#">광주(KIA)</a></li>
                    <li><a href="#">대구(삼성)</a></li>
                    <li><a href="#">창원(NC)</a></li>
                    <li><a href="#">사직(롯데)</a></li>
            	</ul>
            </li>
            
            <li><a href="#">공지사항</a></li>
            <li><a href="#">티켓양도</a></li>
            <li><a href="#">경기장 주변 맛집</a>
                <ul>
                    <li><a href="#">지도에서 보기</a></li>
                    <li><a href="#">리뷰 목록</a></li>
                    <li><a href="#">리뷰 등록</a></li>
                    
                </ul>
            </li>
            <li><a href="#">내 정보</a></li>
            <li><a href="#">1:1 문의(챗봇)</a></li>
        </ul> <!-- /.main_menu -->
    </div> <!-- /.responsive_menu -->


	<header class="site-header clearfix"> 
	<!--피시버전-->
		<div class="container">

			<div class="row">

				<div class="col-md-12">

					<div class="pull-left logo">
						<a href="#">
							<img src="${root }/images/logo.png" alt="Medigo by templatemo">
						</a>
					</div>	<!-- /.logo -->

					<div class="main-navigation pull-right">

						<nav class="main-nav visible-md visible-lg">
							<ul class="sf-menu">
								<li class="active"><a href="#">Home</a></li>
					            <li><a href="#">구장별 게시판</a>
					            	<ul>
					            		<li><a href="#">잠실(LG/두산)</a></li>
                                        <li><a href="#">고척(키움)</a></li>
                                        <li><a href="#">인천(SSG)</a></li>
                                        <li><a href="#">수원(KT)</a></li>
                                        <li><a href="#">대전(한화)</a></li>
                                        <li><a href="#">광주(KIA)</a></li>
                                        <li><a href="#">대구(삼성)</a></li>
                                        <li><a href="#">창원(NC)</a></li>
                                        <li><a href="#">사직(롯데)</a></li>
					            	</ul>
					            </li>
					            
					            <li><a href="#">공지사항</a></li>
                                <li><a href="#">티켓양도</a></li>
                                <li><a href="#">경기장 주변 맛집</a>
					            	<ul>
					            		<li><a href="#">지도에서 보기</a></li>
                                        <li><a href="#">리뷰 목록</a></li>
                                        <li><a href="#">리뷰 등록</a></li>
                                        
					            	</ul>
					            </li>
                                <li><a href="#">내 정보</a></li>
                                <li><a href="#">1:1 문의(챗봇)</a></li>
							</ul> <!-- /.sf-menu -->
						</nav> <!-- /.main-nav -->

						<!-- This one in here is responsive menu for tablet and mobiles -->
					    <div class="responsive-navigation visible-sm visible-xs">
					        <a href="#nogo" class="menu-toggle-btn">
					            <i class="fa fa-bars"></i>
					        </a>
					    </div> <!-- /responsive_navigation -->

					</div> <!-- /.main-navigation -->

				</div> <!-- /.col-md-12 -->

			</div> <!-- /.row -->

		</div> <!-- /.container -->
	</header> <!-- /.site-header -->

    <!-- Scripts -->
	<script src="${root }/js/min/plugins.min.js"></script>
	<script src="${root }/js/min/medigo-custom.min.js"></script>





    <!--상단메뉴-->
    <!-- <div class="container-fluid">
        <nav class="navbar navbar-inverse" style="background-color: #b47c27;">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="${root}/">YAMMY 야미</a>
                </div>
                
                
                <ul class="nav navbar-nav navbar-right">
                    <c:choose>
                        <c:when test="${empty sessionScope.id }">
                            <li><a href="${root}/member/agree"><span class="glyphicon glyphicon-user"></span> Sign
                                    Up</a></li>
                            <li><a href="${root}/member/login"><span class="glyphicon glyphicon-log-in"></span>
                                    Login</a></li>
                        </c:when>
                        <c:when test="${not empty sessionScope.id && sessionScope.grade == 'A'}">
                            
                            <li><a href="${root}/admin/list"><span class="glyphicon glyphicon-list"></span> 회원목록</a>
                            </li>
                            <li><a href="${root}/member/logout"><span class="glyphicon glyphicon-log-out"></span>
                                    로그아웃</a></li>
                        </c:when>
                        <c:otherwise>
                            
                            <li><a href="${root}/member/update"><span class="glyphicon glyphicon-edit"></span> 회원수정</a>
                            </li>
                            <li><a href="${root}/member/logout"><span class="glyphicon glyphicon-log-out"></span>
                                    로그아웃</a></li>
                        </c:otherwise>
                    </c:choose>

                </ul>
            </div>
        </nav>

    </div> -->
</body>

</html>
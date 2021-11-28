<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>

<title>야구에 미치다, Yammy입니다.</title>

<meta charset="utf-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">



</head>
<body>
<div class = "first-widget parallax"> </div>

	<section id="homeIntro" class="parallax first-widget">
	    <div class="parallax-overlay">
		    <div class="container home-intro-content">
		        <div class="row">
		        	<div class="col-md-12">
		        		<h2 class="section-title">야구에 미치다,<img src="${root }/images/yammylogo.png" style="width">&nbsp;&nbsp; 입니다.</h2>
						<p class="section-desc">Everything you need to enjoy baseball.</p>
		        	</div> <!-- /.col-md-12 -->
		        </div> <!-- /.row -->
		    </div> <!-- /.container -->
	    </div> <!-- /.parallax-overlay -->
	</section> <!-- /#homeIntro -->

	<section class="dark-content portfolio">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="section-header">
						<h2 class="section-title"><img src="${root }/images/yammylogo.png" style="width">&nbsp;&nbsp; 소개</h2>
						<p class="section-desc">사이트의 주요 기능들을 만나보세요.</p>
					</div> <!-- /.section-header -->
				</div> <!-- /.col-md-12 -->
			</div> <!-- /.row -->
		</div> <!-- /.container -->
		
		<div id="portfolio-carousel" class="portfolio-carousel portfolio-holder">
			<div class="item">
				<div class="thumb-post">
					<div class="overlay">
						<div class="overlay-inner">
							<div class="portfolio-infos">
								<span class="meta-category">구장별 게시판</span>
								<h3 class="portfolio-title">경기장을 중심으로 한 자유게시판</h3>
							</div>
							<div class="portfolio-expand">
								<a class="fancybox" href="${root }/images/index/bbs.png" title="bbs">
									<i class="fa fa-expand"></i>
								</a>
							</div>
						</div>
					</div>
					<img src="${root }/images/index/bbs.png" alt="bbs">
				</div>
			</div> <!-- /.item -->
			<div class="item">
				<div class="thumb-post">
					<div class="overlay">
						<div class="overlay-inner">
							<div class="portfolio-infos">
								<span class="meta-category">공지사항</span>
								<h3 class="portfolio-title">공지사항 리스트와 조회</h3>
							</div>
							<div class="portfolio-expand">
								<a class="fancybox" href="${root }/images/index/notice.png" title="notice">
									<i class="fa fa-expand"></i>
								</a>
							</div>
						</div>
					</div>
					<img src="${root }/images/index/notice.png" alt="notice">
				</div>
			</div> <!-- /.item -->
			<div class="item">
				<div class="thumb-post">
					<div class="overlay">
						<div class="overlay-inner">
							<div class="portfolio-infos">
								<span class="meta-category">티켓 양도</span>
								<h3 class="portfolio-title">구장별 티켓 양도 게시판과 <br/> 쪽지 기능을 활용한 커뮤니케이션</h3>
							</div>
							<div class="portfolio-expand">
								<a class="fancybox" href="${root }/images/index/ticket.png" title="ticket">
									<i class="fa fa-expand"></i>
								</a>
							</div>
						</div>
					</div>
					<img src="${root }/images/index/ticket.png" alt="ticket">
				</div>
			</div> <!-- /.item -->
			<div class="item">
				<div class="thumb-post">
					<div class="overlay">
						<div class="overlay-inner">
							<div class="portfolio-infos">
								<span class="meta-category">경기장 주변 맛집</span>
								<h3 class="portfolio-title">카카오 지도 API를 활요한 경기장 주변 맛집과 <br/>리뷰 작성</h3>
							</div>
							<div class="portfolio-expand">
								<a class="fancybox" href="${root }/images/index/map.png" title="map">
									<i class="fa fa-expand"></i>
								</a>
							</div>
						</div>
					</div>
					<img src="${root }/images/index/map.png" alt="map">
				</div>
			</div> <!-- /.item -->
			<div class="item">
				<div class="thumb-post">
					<div class="overlay">
						<div class="overlay-inner">
							<div class="portfolio-infos">
								<span class="meta-category">My Page</span>
								<h3 class="portfolio-title">회원정보 조회와 수정</h3>
							</div>
							<div class="portfolio-expand">
								<a class="fancybox" href="${root }/images/index/mypage.png" title="mypage">
									<i class="fa fa-expand"></i>
								</a>
							</div>
						</div>
					</div>
					<img src="${root }/images/index/mypage.png" alt="mypage">
				</div>
			</div> <!-- /.item -->
			<div class="item">
				<div class="thumb-post">
					<div class="overlay">
						<div class="overlay-inner">
							<div class="portfolio-infos">
								<span class="meta-category">Chatbot</span>
								<h3 class="portfolio-title">네이버 CLOVA Chatbot API를 활용한 <br/>1:1 질의응답 서비스</h3>
							</div>
							<div class="portfolio-expand">
								<a class="fancybox" href="${root }/images/index/chatbot.png" title="chatbot">
									<i class="fa fa-expand"></i>
								</a>
							</div>
						</div>
					</div>
					<img src="${root }/images/index/chatbot.png" alt="chatbot">
				</div>
			</div> <!-- /.item -->
		</div> <!-- /#owl-demo -->
	</section> <!-- /.portfolio-holder -->

	<section class="testimonials-widget">

		<div class="container">
			<div class="row" style="text-align:center;">
				<div>
					<span class="testimonial-team">Team 'no.2'</span><br/><br/>
					<span>no.1 개발자를 꿈꾸는 사람들이 모여 Team 'no.2'. </span><br/><br/>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="bxslider">
						<div class="testimonial">
							<div class="testimonial-content">
								<span class="testimonial-author">TaeJin Shin</span>
								<p class="testimonial-description">커멘트1</p>
							</div>
						</div>
						<div class="testimonial">
							<div class="testimonial-content">
								<span class="testimonial-author">ChangSeok Park</span>
								<p class="testimonial-description">커멘트2</p>
							</div>
						</div>
						<div class="testimonial">
							<div class="testimonial-content">
								<span class="testimonial-author">JongBin Oh</span>
								<p class="testimonial-description">커멘트3</p>
							</div>
						</div>
						<div class="testimonial">
							<div class="testimonial-content">
								<span class="testimonial-author">JooYoung Kim</span>
								<p class="testimonial-description">커멘트4</p>
							</div>
						</div>
					</div> <!-- /.bxslider -->
				</div> <!-- /.col-md-12 -->
			</div> <!-- /.row -->
		</div> <!-- /.container -->
	</section> <!-- /.testimonials-widget -->



</body>

</html>
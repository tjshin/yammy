<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script>
$(function() {
	  $(window).scroll(function() {
	    if ($(this).scrollTop() > 250) {
	      $('#topBtn').fadeIn();
	    } else {
	      $('#topBtn').fadeOut();
	    }
	  });

	  $("#topBtn").click(function() {
	    $('html, body').animate({
	      scrollTop : 0
	    }, 400);
	    return false;
	  });
	});
</script>

<style>
#topBtn { 
position: fixed; /* 포지션 고정 */
right: 40px;
bottom: 100px; /* 밑에서 100px */ 
display: none; /* 보여지지 없음 - 기본적으로 안보여지게 */ 
z-index: 9999; /* 포지션을 먼저 지정후 z-좌표(레이어) : 9999입니다. */

 }


</style>

</head>
<body>

	<footer class="site-footer">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
			
				    <a id="topBtn" class="main-button accent-color" href="#">▲TOP</a>
				
					<nav class="footer-nav clearfix">
						<ul class="footer-menu">
							<li><a href="${root }/">Home</a></li>
							<li><a href="https://github.com/tjshin/yammy" target="_blank">GitHub</a></li>
							<li><a href="#">프로젝트 YAMMY</a></li>
							<li><a href="#">팀 'no.2'</a></li>
							<li><a href="https://www.ncloud.com/product/aiService/chatbot"
									target="_blank">NAVER CLOVA</a></li>
							<li><a href="https://apis.map.kakao.com/"
									target="_blank">kakaomap</a></li>
						</ul>
						<!-- /.footer-menu -->
					</nav>
					<!-- /.footer-nav -->
				</div>
				<!-- /.col-md-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-md-12">
					<p class="copyright-text">Copyright &copy; 2021 K-Digital Training project team 2 "YAMMY"</p>
					<nav class="footer-nav clearfix">
						<ul class="footer-menu">
							<li>|</li>
							<li><a href="https://github.com/sign1064" target="_blank">김주영</a></li>
							<li><a href="https://github.com/MC910820" target="_blank">박창석</a></li>
							<li><a href="https://github.com/tjshin" target="_blank">신태진</a></li>
							<li><a href="https://github.com/ohjongbin" target="_blank">오종빈</a></li>
							<li>|</li>
						</ul>
						<!-- /.footer-menu -->
					</nav>
					<!-- /.footer-nav -->
					<p class="copyright-text">Original Design : templatemo</p>
				</div>
				<!-- /.col-md-12 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</footer>
	<!-- /.site-footer -->

</body>
</html>
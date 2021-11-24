<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>삭제</title>
<meta charset="utf-8">
<style type="text/css">
#red {
	color: red;
}
</style>
</head>
<script type="text/javascript">
	function goback() {
		window.history.back();
	}
</script>
<body>


	<div class="first-widget parallax" id="blog">
		<div class="parallax-overlay">
			<div class="container pageTitle">
				<div class="row">
					<div class="col-md-6 col-sm-6">
						<h2 class="page-title">게시글 삭제</h2>
					</div>
					<!-- /.col-md-6 -->
					<div class="col-md-6 col-sm-6 text-right">
						<span class="page-location">HOME /경기장 게시판 /게시글 삭제</span>
					</div>
					<!-- /.col-md-6 -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container -->
		</div>
		<!-- /.parallax-overlay -->
	</div>
	<!-- /.pageTitle -->



	<section class="cta clearfix">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
				<h2>게시글 삭제</h2>
					<form class="form-horizontal" action="./delete" method="post">
						<input type="hidden" name="bbsno" value="${param.bbsno}">
						<input type="hidden" name="bbscate" value="${param.bbscate}">

						<p id="red" class="col-sm-offset-3 col-sm-6">삭제하면 복구할 수 없습니다</p>
					
					<br><br>
						<div class="form-group">
								<button class="mainBtn" type="submit">삭제</button>
								<button class="mainBtn" type="reset" onclick="goback();">
									취소</button>
							
						</div>
								</div>
					<!-- /.col-md-6 -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container -->
		</div>
		<!-- /.parallax-overlay -->
	</div>
	<!-- /.pageTitle -->
						
						
				</div>
			</div>
		</div>
		</from>
	</section>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>기본페이지</title>
<meta charset="utf-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">



</head>



<body>
<div class = "first-widget parallax"> </div>


<div> 
<button type="button" class="btn btn-default" onclick="location.href='/message/sendlist'" >보낸쪽지함</button>
<button type="button" class="btn btn-default" onclick="location.href='/message/recelist'" >받는쪽지함</button>
</div>


    <div>바디에요</div>
    <section class="cta clearfix">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<a href="${root }/admin/sikdang/list" class="main-button accent-color">식당db관리 페이지(임시)<i
						class="icon-button fa fa-arrow-right"></i></a>
				</div>
				<!-- /.col-md-12 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</section>
	<!-- /.cta -->



</body>



</html>
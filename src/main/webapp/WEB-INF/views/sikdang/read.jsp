<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<c:set var="listurl"
	value="${root }/admin/sikdang/list?col=${param.col}&word=${param.word}&nowPage=${param.nowPage}" />
<c:set var="urlhelper"
	value="&col=${param.col}&word=${param.word}&nowPage=${param.nowPage}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>sikdang db read test</title>



</head>
<body>

	<div class="first-widget parallax" id="blog">
		<div class="parallax-overlay">
			<div class="container pageTitle">
				<div class="row">
					<div class="col-md-6 col-sm-6">
						<h2 class="page-title">식당 DB 조회</h2>
					</div>
					<!-- /.col-md-6 -->
					<div class="col-md-6 col-sm-6 text-right">
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
					<a href="${listurl }" class="main-button accent-color"> <i
						class="icon-button fa fa-arrow-left"></i> &nbsp;&nbsp; DB 목록으로 돌아가기
					</a>

				</div>
				<!-- /.col-md-12 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</section>
	<!-- /.cta -->

	<div class="container">
		<div class="row" style="text-align: center">

			<div class="col-md-12 blog-posts">

				<table class="table table-bordered">
					
					<tr>
						<th>식당 ID (kakao)</th>
						<td>${dto.sikid}</td>
					</tr>
					<tr>
						<th>상호명</th>
						<td>${dto.sikname}</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>${dto.sikphone}</td>
					</tr>
					<tr>
						<th>도로명 주소</th>
						<td>${dto.roadadd}</td>
					</tr>
					<tr>
						<th>지번 주소</th>
						<td>${dto.jibunadd}</td>
					</tr>
					<tr>
						<th>kakao URL</th>
						<td><a href="${dto.sikurl }"
							target="_blank">${dto.sikurl}</a></td>
					</tr>
					<tr>
						<th>경도 (cox)</th>
						<td>${dto.cox}</td>
					</tr>
					<tr>
						<th>위도 (coy)</th>
						<td>${dto.coy}</td>
					</tr>
					<tr>
						<th>작성된 리뷰</th>
						<td>${dto.reviewcnt } / <a href=
							"${root }/review/list?col=sikname&word=${dto.sikname}&nowPage=1"
							>☜이 식당에 작성된 리뷰 목록 </a></td>
					</tr>
					<tr>
						<th>인접 구장</th>
						<c:if test="${dto.nearsta == 1}"><td>잠실야구장</td></c:if>
						<c:if test="${dto.nearsta == 2}"><td>고척스카이돔</td></c:if>
						<c:if test="${dto.nearsta == 3}"><td>인천SSG랜더스필드</td></c:if>
						<c:if test="${dto.nearsta == 4}"><td>수원케이티위즈파크</td></c:if>
						<c:if test="${dto.nearsta == 5}"><td>한화생명이글스파크</td></c:if>
						<c:if test="${dto.nearsta == 6}"><td>광주기아챔피언스필드</td></c:if>
						<c:if test="${dto.nearsta == 7}"><td>대구삼성라이온즈파크</td></c:if>
						<c:if test="${dto.nearsta == 8}"><td>창원NC파크</td></c:if>
						<c:if test="${dto.nearsta == 9}"><td>사직야구장</td></c:if>
					</tr>
					<tr>
						<th>인접 구장과의 직선 거리(m)</th>
						<td>${dto.distance}</td>
					</tr>

				</table>
				


				<div class="row" style="text-align: center">
					<br>
					<div class="col-md-12">
						<a href="${listurl}" class="btn btn-default">DB 목록</a>
						<a href="${root }/admin/sikdang/create"
								class="btn btn-default">DB 등록</a>
						<a href="${root }/admin/sikdang/delete?sikid=${dto.sikid}${urlhelper}"
								class="btn btn-red">DB 삭제</a>
						
					</div>
					<br><br><br>  
				</div>




			</div>
			<!-- /.col-md-8 -->
		</div>
	</div>

</body>
</html>
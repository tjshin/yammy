<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<c:set var="readurl1" value="${root}/review/read?hugino=" />
<c:set var="readurl2" value="&col=${col }&word=${word }&nowPage=${nowPage }"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>review list test</title>
</head>
<body>

<div class="first-widget parallax" id="blog">
		<div class="parallax-overlay">
			<div class="container pageTitle">
				<div class="row">
					<div class="col-md-6 col-sm-6">
						<h2 class="page-title">리뷰 목록</h2>
					</div> <!-- /.col-md-6 -->
					<div class="col-md-6 col-sm-6 text-right">
						<span class="page-location">Home / 경기장 주변 맛집 / 리뷰 목록</span>
					</div> <!-- /.col-md-6 -->
				</div> <!-- /.row -->
			</div> <!-- /.container -->
		</div> <!-- /.parallax-overlay -->
	</div> <!-- /.pageTitle -->


	<section class="cta clearfix">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<a href="${root }/sikdang/map_main" class="main-button accent-color">
						<i class="icon-button fa fa-arrow-left"></i>
						&nbsp;&nbsp;전체 지도로 돌아가기</a>
					<a href="${root }/sikdang/map_search" class="main-button accent-color">리뷰 등록하러 가기<i
							class="icon-button fa fa-arrow-right"></i></a>
				</div> <!-- /.col-md-12 -->
			</div> <!-- /.row -->
		</div> <!-- /.container -->
	</section> <!-- /.cta -->




	<div class="container">

		<br>

		<form class="form-inline" action="${root}/review/list">
			<div class="form-group">
				<select class="form-control" name="col">
					<option value="sikname" <c:if test="${col=='sikname'}"> selected </c:if>
						>식당 상호명</option>
					<option value="nick" <c:if test="${col=='nick'}"> selected </c:if>
						>닉네임</option>
					<option value="htitle" <c:if test="${col=='htitle'}"> selected </c:if>
						>제목</option>
					<option value="hcontents" <c:if test="${col=='hcontents'}"> selected </c:if>
						>내용</option>
					<option value="title_content" <c:if test="${col=='title_content'}"> selected</c:if>
						>제목+내용</option>
					<option value="total" <c:if test="${col=='total'}"> selected </c:if>
						>전체출력</option>
				</select>
			</div>
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Enter 검색어" name="word" value="${word}">
			</div>
			<button type="submit" class="mainBtn">검색</button>

		</form>
		
		<div class="row">

			<div class="col-md-12 blog-posts">
				<div class="row">
					<div class="col-md-12">
					
						<c:choose>
						<c:when test="${empty list }">
						<div class="post-blog">
						<div class="blog-content">
							등록된 리뷰가 없습니다.
						</div>
						</div>									
						</c:when>
						<c:otherwise>
						<c:forEach var="dto" items="${list }">
					
					
						<div class="post-blog">

							<div class="blog-content">
								<span class="meta-date">${dto.hdate }</span>
								<span class="meta-comments">댓글: 댓글 기능 추가해라</span>
								<span class="meta-author">닉네임: &nbsp;<a href="#">${dto.nick }</a></span>
								<span>/</span>
								
								<c:if test="${dto.stadium == 1}"><span>서울 잠실</span></c:if>
								<c:if test="${dto.stadium == 2}"><span>서울 고척</span></c:if>
								<c:if test="${dto.stadium == 3}"><span>인천</span></c:if>
								<c:if test="${dto.stadium == 4}"><span>수원</span></c:if>
								<c:if test="${dto.stadium == 5}"><span>대전</span></c:if>
								<c:if test="${dto.stadium == 6}"><span>광주</span></c:if>
								<c:if test="${dto.stadium == 7}"><span>대구</span></c:if>
								<c:if test="${dto.stadium == 8}"><span>창원</span></c:if>
								<c:if test="${dto.stadium == 9}"><span>부산 사직</span></c:if>
								
								<h3><a href="${readurl1}${dto.hugino}${readurl2}">
								${dto.htitle }</a></h3>
								<p class="light-text">방문한 식당:&nbsp;<a href="${dto.sikurl }" target="_blank">${dto.sikname }</a></p>
								<p><a href="${readurl1}${dto.hugino}${readurl2}">
								리뷰 자세히 보기...</a></p>
							</div> <!-- /.blog-content -->
						</div> <!-- /.post-blog -->
						</c:forEach>
						</c:otherwise>
						</c:choose>
					</div> <!-- /.col-md-12 -->
					<div class="col-md-12">
						${paging }
					</div> <!-- /.col-md-12 -->
				</div> <!-- /.row -->
			</div> <!-- /.col-md-8 -->
						
		</div> <!-- /.row -->
	</div> <!-- /.container -->

</body>
</html>
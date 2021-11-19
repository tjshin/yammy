<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<c:set var="listurl"
	value="${root }/review/list?col=${param.col}&word=${param.word}&nowPage=${param.nowPage}" />
<c:set var="urlhelper"
	value="&col=${param.col}&word=${param.word}&nowPage=${param.nowPage}" />
<%@ taglib prefix="util" uri="/ELFunctions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>review read test</title>

<script>

 </script>

</head>
<body>

	<div class="first-widget parallax" id="blog">
		<div class="parallax-overlay">
			<div class="container pageTitle">
				<div class="row">
					<div class="col-md-6 col-sm-6">
						<h2 class="page-title">리뷰 조회</h2>
					</div>
					<!-- /.col-md-6 -->
					<div class="col-md-6 col-sm-6 text-right">
						<span class="page-location">Home / 경기장 주변 맛집 / 리뷰 조회</span>
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
					<a href="${root }/sikdang/map_main"
						class="main-button accent-color"> <i
						class="icon-button fa fa-arrow-left"></i> &nbsp;&nbsp; 지도로 돌아가기
					</a> <a href="${listurl }" class="main-button accent-color"> <i
						class="icon-button fa fa-arrow-left"></i> &nbsp;&nbsp; 목록으로 돌아가기
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
		<div class="row">

			<div class="col-md-12 blog-posts">
				<div class="row">
					<div class="col-md-12">
						<div class="post-blog">

							<div class="blog-content">
								<span class="meta-date">${dto.hdate }</span>
								<c:set var="reviewrcount"
									value="${util:reviewrcount(dto.hugino, reviewrservice) }" />
								<span class="meta-comments">댓글 수: ${reviewrcount }</span> <span
									class="meta-author"><a href="#blog-author">${dto.nick }</a></span>
								<span>/</span>

								<c:if test="${dto.stadium == 1}">
									<span>서울 잠실</span>
								</c:if>
								<c:if test="${dto.stadium == 2}">
									<span>서울 고척</span>
								</c:if>
								<c:if test="${dto.stadium == 3}">
									<span>인천</span>
								</c:if>
								<c:if test="${dto.stadium == 4}">
									<span>수원</span>
								</c:if>
								<c:if test="${dto.stadium == 5}">
									<span>대전</span>
								</c:if>
								<c:if test="${dto.stadium == 6}">
									<span>광주</span>
								</c:if>
								<c:if test="${dto.stadium == 7}">
									<span>대구</span>
								</c:if>
								<c:if test="${dto.stadium == 8}">
									<span>창원</span>
								</c:if>
								<c:if test="${dto.stadium == 9}">
									<span>부산 사직</span>
								</c:if>

								<h3>${dto.htitle }</h3>
								<div class="panel-heading"></div>
								<div class="panel-body">
									<p>${dto.hcontents }</p>
								</div>
								<div class="tag-items">
									<span class="small-text">Tags:</span> <a href="#" rel="tag">태그
										누르면</a> <a href="#" rel="tag">해당 태그를 검색어로 하는</a> <a href="#"
										rel="tag">list로 넘어갈 수 있게 하는거 어떨까요</a>
								</div>
							</div>
							<!-- /.blog-content -->
						</div>
						<!-- /.post-blog -->
					</div>
					<!-- /.col-md-12 -->
				</div>
				<!-- /.row -->
				<div class="row">
					<div class="col-md-12">
						<div id="blog-author" class="clearfix">

							<div class="blog-author-info">
								<h4 class="author-name">
									<a href="#">${dto.nick }</a>
								</h4>
								<p>프로필에는 어떤 내용을 노출시킬까요?</p>
							</div>
						</div>
					</div>
					<!-- /.col-md-12 -->
				</div>
				<!-- /.row -->

				<div class="row">
					<br>
					<div class="col-md-12">
						<a href="${listurl}" class="main-button accent-color">리뷰 목록</a>
						<c:if test="${sessionScope.id !=null }">
							<a href="${root }/sikdang/map_search"
								class="main-button accent-color">리뷰 등록</a>
						</c:if>
						<c:if
							test="${sessionScope.id !=null && sessionScope.id == dto.id}">
							<a href="${root }/review/update?hugino=${dto.hugino}${urlhelper}"
								class="main-button accent-color">리뷰 수정</a>
							<a href="${root }/review/delete?hugino=${dto.hugino}${urlhelper}"
								class="main-button accent-color">리뷰 삭제</a>
						</c:if>
					</div>
				</div>


				<div class="row">
					<div class="col-md-12">
						<div id="blog-comments" class="blog-post-comments">
							<h3>댓글 수: ${reviewrcount }</h3>
							<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>test</button>
							<div class="blog-comments-content list-group">
								<div class="media">

									<div class="media-body">
										<div class="media-heading">
											<h4>JS 정상 실행 시 닉네임이 표시</h4>
											<a href="#"><span>댓글 작성일 표시 부분</span><span>Reply</span></a>
										</div>
										<p>
											댓글 내용 표시될 부분<span class="label label-primary">New</span>
										</p>

									</div>
								</div>
							</div>
							<!-- /.blog-comments-content -->

							<div class="comments-footer">1234 paging 자리</div>

						</div>
						<!-- /.blog-post-comments -->
					</div>
					<!-- /.col-md-12 -->
				</div>
				<!-- /.row -->
				<div class="row">
					<div class="col-md-12">
						<div class="comment-form">
							<h3>댓글 남기기</h3>
							<div class="widget-inner">

								<div class="row">
									<div class="col-md-12">
										<p>
											<label for="hrecontents">댓글 내용:</label>
											<textarea id ="hrecontents" name="hrecontents" rows="5">
											<c:if test="${sessionScope.id == null }">
											댓글은 로그인 후 남길 수 있습니다.
											</c:if>
											<c:if test="${sessionScope.id != null }"></c:if>
											</textarea>
										</p>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
									<c:if test="${sessionScope.id != null }">
										<input class="mainBtn" type="button" name="submit"
											value="댓글 등록" id="mainBtn"></c:if>
									</div>
								</div>

							</div>
							<!-- /.widget-inner -->
						</div>
						<!-- /.widget-main -->
					</div>
					<!-- /.col-md-12 -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.col-md-8 -->
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">MODAL</h4>
				</div>
				<div class="modal-body" style="margin: auto;">
					<p style="text-align: center;">삭제하면 복구 할 수 없습니다.</p>
				</div>
				<div class="modal-footer">
					<button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
					<button id='modalRemoveBtn' type="button" class="btn btn-danger">삭제</button>
					<button id='modalCloseBtn' type="button" class="btn btn-default">취소</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	<script type="text/javascript">
	var hugino = "${dto.hugino}";
	var sno = "${sno}";
	var eno = "${eno}";
	var nPage = "${nPage}";
	var nowPage = "${param.nowPage}";
	var colx = "${param.col}";
	var wordx = "${param.word}";
	var id = "${sessionScope.id}";
	var deleteimage = "<img src='${root }/images/trash-alt-solid.svg' alt='댓글 삭제 버튼' style='width:30px;height:30px;'>";
	</script>
	<script type="text/javascript" src="${root}/js/reviewreply/revreply.js"></script>

	<script type="text/javascript"
		src="${root}/js/reviewreply/replyprocess.js"></script>


</body>
</html>
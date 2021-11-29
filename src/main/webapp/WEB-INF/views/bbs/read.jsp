<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<title>조회</title>
<meta charset="utf-8">

<script type="text/javascript">
	function updateM() {
		var url = "${root}/bbs/update";
		url += "?bbscate=${dto.bbscate}";
		url += "&bbsno=${dto.bbsno}";
		location.href = url;
	}
	function deleteM() {
		var url = "${root}/bbs/delete";
		url += "?bbscate=${dto.bbscate}";
		url += "&bbsno=${dto.bbsno}";
		location.href = url;
	}

	function listM() {
		var url = "${root}/bbs/list";
		url += "?bbscate=${dto.bbscate}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;
	}
</script>


</head>





<body>

	<div class="first-widget parallax" id="blog">
		<div class="parallax-overlay">
			<div class="container pageTitle">
				<div class="row">
					<div class="col-md-6 col-sm-6">
						<h2 class="page-title">게시글 조회</h2>
					</div>
					<!-- /.col-md-6 -->
					<div class="col-md-6 col-sm-6 text-right">
						<span class="page-location">Home / 경기장 게시판 / 게시글 조회</span>
					</div>
					<!-- /.col-md-6 -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container -->
		</div>
		<!-- /.parallax-overlay -->
	</div>
	<div class="container">

		<br>
		<br>
		<header>
			<div class="panel panel-default">
				<div class="panel-heading">
					<!-- 모바일에서 작성 icon_write_mbl -->
					<h3 class="title ub-word">
						<span class="title_headtext"></span> <span class="title_subject">${dto.btitle}</span><span
							class="title_device"></span>
					</h3>

					<div align="right">
						<span class='nickname' title=''>${dto.nick}</span> <span
							class="gall_date" title="2021-11-03 22:35:02">${dto.bdate}</span>
					</div>
					<div align="right">
						<span class="gall_count">조회수: ${dto.bview}</span>
						<div class="count">추천수: ${dto.bcnt}</div>
						<div class="count">댓글 수: ${dto.rcnt}</div>
					</div>
				</div>
			</div>
		</header>



		<div class="panel panel-default">


			<div class="panel-heading">내용</div>
			<div class="panel-body">${dto.bcontents}</div>


		</div>





		<!-- 추천 기능 -->
		<div class="row">
			<div class="col-md-12">
				<div class="bbs-like" style="text-align: center;">
					<button class='bbslikeBtn' type='button' id='bbslikeBtn'
						style='background-color: #ffffff; border-radius: 50%; width: 100px; height: 100px;'>
						<img src="${root }/images/thumbs-up-solid.svg" alt="따봉"
							style="width: 50px; height: 50px;">
					</button>
					<div class="like-count">
						<h3 style="color: #00a8d6;">추천 수 표시 될 자리</h3>
					</div>
				</div>
			</div>
		</div>







		<div>
			<br>
			<div class="col-md-12">

				<button type="button" class="mainBtn" onclick="listM()">목록</button>


				<c:if test="${sessionScope.id !=null }">
					<button type="button" class="mainBtn"
						onclick="location.href='/bbs/create?bbscate=${param.bbscate}'">등록</button>
				</c:if>
				<c:if test="${sessionScope.id !=null  && sessionScope.id == dto.id}">
					<button type="button" class="mainBtn" onclick="updateM()">수정</button>
					<button type="button" class="mainBtn" onclick="deleteM()">삭제</button>
				</c:if>
			</div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<div id="blog-comments" class="blog-post-comments">
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
									<label for="recontents">댓글 내용:</label>
									<c:if test="${sessionScope.id == null }">
										<textarea id="recontents" name="recontents" rows="5" readonly>댓글은 로그인 후 남길 수 있습니다.</textarea>
									</c:if>
									<c:if test="${sessionScope.id != null }">
										<textarea id="recontents" name="recontents" rows="5"></textarea>
									</c:if>

								</p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<c:if test="${sessionScope.id != null }">
									<input class="mainBtn" type="button" name="submit"
										value="댓글 등록" id="mainBtn">
								</c:if>
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
	
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">댓글 수정, 삭제</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>내용</label>
						<textarea cols="10" rows="3" class="form-control"
							name='recontents'>New Reply!!!!</textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button id='modalModBtn' type="button" class="btn btn-warning">수정</button>
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
		var bbsno = "${dto.bbsno}";
		var sno = "${sno}";
		var eno = "${eno}";
		var total = "${total}";
		var nPage = "${nPage}";
		var nowPage = "${param.nowPage}";
		var colx = "${param.col}";
		var wordx = "${param.word}";
		var sessionid = "${sessionScope.id}";
		var deleteimage = "<img src='${root }/images/trash-alt-solid.svg' alt='댓글 삭제 버튼' style='width:30px;height:30px;'>";
		var modifyimage = "<img src='${root }/images/edit-solid.svg' alt='댓글 수정 버튼' style='width:30px;height:30px;'>";
		var likeimage = "<img src='${root }/images/thumbs-up-solid.svg' alt='따봉' style='width:50px;height:50px;'>";
	</script>
	<script type="text/javascript" src="${root}/js/reply/revreply.js"></script>

	<script type="text/javascript" src="${root}/js/reply/replyprocess.js"></script>
	<script type="text/javascript" src="${root}/js/like/likeprocess.js"></script>

</body>
</html>
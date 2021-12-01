<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>게시글 수정</title>

<script type="text/javascript" src="${root}/ckeditor/ckeditor.js">
	
</script>
<script type="text/JavaScript">
	$(function() {
		CKEDITOR.replace('bcontents'); // <TEXTAREA>태그 id 값
	});

	function checkIn(f) {
		if (f.btitle.value == "") {
			alert("제목을 입력하세요");
			f.btitle.focus()
			return false;
		}
		if (CKEDITOR.instances['bcontents'].getData() == '') {
			window.alert('내용을 입력해 주세요.');
			CKEDITOR.instances['bcontents'].focus();
			return false;
		}

	}
</script>
</head>
<body>

	<div class="first-widget parallax" id="contact">
		<div class="parallax-overlay">
			<div class="container pageTitle">
				<div class="row">
					<div class="col-md-6 col-sm-6">
						<h2 class="page-title">게시글 수정</h2>
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

	<div class="container">
		<h1 class="col-sm-offset-2 col-sm-10"></h1>
		<form class="form-horizontal" action="/bbs/update" method="post"
			onsubmit="return checkIn(this)">

			<input type="hidden" name="mtest" value="${param.mtest}">
			<input type="hidden" name="bbscate" value="${dto.bbscate}">
			<input type="hidden" name="bbsno" value="${dto.bbsno}">
			<input type="hidden" name="nick" value="${dto.nick}">
			<div class="form-group">
				<div class="col-sm-6">
					<input type="hidden" name="id" id="id" class="form-control"
						value="${dto.id}">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="btitle">제목</label>
				<div class="col-sm-8">
					<input type="text" name="btitle" id="btitle" class="form-control"
						value="${dto.btitle}">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="bcontents">내용</label>
				<div class="col-sm-8">
					<textarea rows="12" cols="7" id="bcontents" name="bcontents"
						class="form-control">${dto.bcontents}</textarea>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-5">
					<button class="mainBtn">수정</button>
					<button type="reset" class="mainBtn">취소</button>
				</div>
			</div>
		</form>
	</div>



</body>
</html>
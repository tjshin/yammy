<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>Q&A</title>
<!-- <link href="/css/style.css" rel="Stylesheet" type="text/css">  /static 폴더 기준 -->

<script type="text/JavaScript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<!-- WebSocket 관련 설정 -->
<script src="/js/sockjs.min.js"></script>
<script src="/js/stomp.min.js"></script>

<script type="text/JavaScript" src="/js/app.js"></script>

<script>
	$(function() {

		$(document).ready(function() {

			$('select[name=content]').change(function() {

				if ($(this).val() == "1") {

					$('#msg').val("");
					$("#msg").attr("readonly", false);

				} else {

					$('#msg').val($(this).val());

					$("#msg").attr("readonly", true);

				}

			});

		});

	});
</script>

<style>

#main-container {
	width: 600px;
	height: 623px;
	border: 1px;
	margin: 10px 250px;
	display: inline-block;
	
}

#chat-container {
	vertical-align: bottom;
	border: 1px solid black;
	margin: 10px;
	min-height: 600px;
	max-height: 600px;
	overflow: scroll;
	overflow-x: hidden;
	background: #9bbbd4;
}

#receMessage {
	font-color: #black;
	border: none;
	text-align: left;
	background-color: white;
	min-width: 10%;
	width: auto;
	max-width: 60%;
}

#sendMessage {
	font-color: #black;
	text-align: left;
	min-width: 10%;
	max-width: 60%;
	width: auto;
	float: right;
	background: yellow;
	border-radius: 10px 10px 10px 10px;
}


.chat {
	font-size: 15px;
	color: black;
	margin: 5px;
	min-height: 20px;
	padding: 5px;
	height: auto;
	word-break: break-all;
	display: inline-block;
	border-radius: 10px 10px 10px 10px;
}
</style>


</head>
<body>

	<div class="first-widget parallax" id="contact">
		<div class="parallax-overlay">
			<div class="container pageTitle">
				<div class="row">
					<div class="col-md-6 col-sm-6">
						<h2 class="page-title">Q&A</h2>
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

	<div id="main-content" class="container">
		<H2></H2>
		<form class="form-inline">
			<div class="form-group">
				<label for="connect" style="margin-left:45px;"> </label>
				<button id="connect" class="btn btn-default" type="submit">시작하기</button>
				<button id="disconnect" class="btn btn-default2" type="submit"
					disabled="disabled">끝내기</button>
			</div>
		</form>
		<br />
		<form class="form-inline" onchange="handleOnChange(this)">
			<select id="content" name="content" style="width: 37%; height: 33px; margin-left:50px; font-size:17px;"
				class="form-control">
				<option value="1" selected="selected">직접입력</option>
				<option value="안녕하세요?">안녕하세요?</option>
				<option value="Yammy는 무슨 뜻인가요?">Yammy는 무슨 뜻인가요?</option>
				<option value="로그인이 되지 않습니다.">로그인이 되지 않습니다.</option>
				<option value="티켓 양도는 어떻게 하나요?">티켓 양도는 어떻게 하나요?</option>
				<option value="구장별 게시판 이용은 어떻게 하나요?">구장별 게시판 이용은 어떻게 하나요?</option>
				<option value="경기장 주변 맛집은 어떻게 이용하나요?">경기장 주변 맛집은 어떻게 이용하나요?</option>
				<option value="티켓 양도 거래 중에 사기를 당했을 때는 어떻게 해야 하나요?">티켓 양도 거래 중에 사기를 당했을 때는 어떻게 해야 하나요?</option>
				<option value="Yammy의 메일 주소를 알려주세요.">Yammy의 메일 주소를 알려주세요.</option>
				<option value="고객센터 번호을 알고 싶어요.">고객센터 번호을 알고 싶어요.</option>
				<option value="야구 일정을 알고 싶어요.">야구 일정을 알고 싶어요.</option>

			</select>
			<br/>
			<br/>
			<div class="form-group" style="width: 75%;">
				<label for="msg" style="margin-left:45px;"></label> <input type="text" id="msg"
					class="form-control" placeholder="문의 사항을 입력하세요."
					style="width: 92%;">
			</div>
			<button id="send" class="btn btn-default" disabled type="submit">보내기</button>
		</form>


		<div id="main-container">
			<div id="chat-container">
				<p id="enter"></p>
			</div>
		</div>
		<br />

	</div>


</body>
</html>
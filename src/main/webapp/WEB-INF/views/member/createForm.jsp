<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>회원가입</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="templatemo">

<link
	href="http://fonts.googleapis.com/css?family=PT+Serif:400,700,400italic,700itali"
	rel="stylesheet">
<link
	href="http://fonts.googleapis.com/css?family=Raleway:400,900,800,700,500,200,100,600"
	rel="stylesheet">
<link rel="stylesheet" href="bootstrap/bootstrap.css">
<link rel="stylesheet" href="css/misc.css">
<link rel="stylesheet" href="css/blue-scheme.css">
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />

<!-- JavaScripts -->
<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/jquery-migrate-1.2.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
	function inCheck(f) {
		if (f.id.value.length == 0) {
			alert("아이디를 입력하세요");
			f.id.focus();
			return false;
		}
		if (f.passwd.value.length == 0) {
			alert("비번을 입력하세요");
			f.passwd.focus();
			return false;
		}
		if (f.repasswd.value.length == 0) {
			alert("비번확인을 입력하세요");
			f.repasswd.focus();
			return false;
		}
		if (f.passwd.value != f.repasswd.value) {
			alert("비번과 비번확인이 일치하지 않습니다.");
			f.passwd.value = "";
			f.repasswd.value = "";
			f.passwd.focus();
			return false;
		}
		if (f.mname.value.length == 0) {
			alert("이름을 입력하세요");
			f.mname.focus();
			return false;
		}
		if (f.nick.value.length == 0) {
			alert("닉네임을 입력하세요");
			f.nick.focus();
			return false;
		}
		if (f.tel.value.length == 0) {
			alert("전화번호를 입력하세요");
			f.tel.focus();
			return false;
		}
		if (f.email.value.length == 0) {
			alert("이메일을 입력하세요");
			f.email.focus();
			return false;
		}
		if (f.job.selectedIndex == 0) {
			alert("직업을 선택하세요");
			f.job.focus();
			return false;
		}
	}

	function idCheck(id) {
		if (id == '') {
			alert("아이디를 입력하세요");
			document.frm.id.focus();
		} else {
			var url = "/member/idcheck";
			var param = "id=" + id;

			$.get(url, param, function(data, textStatus) {

				$("#idcheck").text(data.str);
			})
		}
	}

	function emailCheck(email) {
		if (email == '') {
			alert("email를 입력하세요");
			document.frm.email.focus();
		} else {
			var url = "/member/emailcheck";
			url += "?email=" + email;

			$.get(url, function(data, textStatus) {

				$("#emailcheck").text(data.str);

			})
		}
	}

	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {

						var addr = '';
						var extraAddr = '';

						if (data.userSelectedType === 'R') {
							addr = data.roadAddress;
						} else {
							addr = data.jibunAddress;
						}

						if (data.userSelectedType === 'R') {
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}

						} else {

						}

						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}
</script>
<style>
#need {
	color: red;
}

#idcheck, #emailcheck {
	color: red;
	font-size: 13px;
}
</style>

</head>
<body>
	<div class="first-widget parallax" id="blog">
		<div class="parallax-overlay">
			<div class="container pageTitle">
				<div class="row">
					<div class="col-md-6 col-sm-6">
						<h2 class="page-title">회원가입</h2>
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
		<br /> <label class="col-sm-offset-2 col-sm-15">( * 필수입력사항)</label> <br />

		<form class="form-horizontal" action="create" method="post" name='frm'
			enctype="multipart/form-data" onsubmit="return inCheck(this)">
			<div class="form-group">
				<label class="control-label col-sm-2" for="fnameMF">사진</label>
				<div class="col-sm-4">
					<input type="file" class="form-control" id="fnameMF" name="fnameMF"
						accept=".jpg,.gif,.png">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="id"><span
					id="need">*</span>아이디</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="id" name="id">
				</div>
				<button type="button" class="btn btn-default col-sm-2"
					onclick="idCheck(document.frm.id.value)">ID 중복확인</button>
				<div id="idcheck"></div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="passwd"><span
					id="need">*</span>비밀번호</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="password"
						name="password">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="repasswd"><span
					id="need">*</span>비밀번호 확인</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="repassword"
						name="repassword">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="mname"><span
					id="need">*</span>이름</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="mname" name="mname">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="nick"><span
					id="need">*</span>닉네임</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="nick" name="nick">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="phone"><span
					id="need">*</span>전화번호</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="phone" name="phone">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="email"><span
					id="need">*</span>이메일</label>
				<div class="col-sm-3">
					<input type="email" class="form-control" id="email" name="email">
				</div>

				<button type="button" class="btn btn-default col-sm-2"
					onclick="emailCheck(document.frm.email.value)">Email 중복확인</button>
				<div id="emailcheck"></div>

			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="sample6_postcode">우편번호</label>
				<div class="col-sm-1">
					<input type="text" class="form-control" name="postcode"
						id="sample6_postcode">
				</div>

				<button type="button" class="btn btn-default col-sm-2"
					onclick="sample6_execDaumPostcode()">주소검색</button>

			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="sample6_address">주소</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="sample6_address"
						name="address1"> <input type="text" class="form-control"
						id="sample6_detailAddress" name="address2">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="favteam">응원구단 선택</label>
				<div class="col-sm-6">
					<select name="favteam" id="favteam" style="width:37%; height:30px;" class="form-control">
						<option value="없음">없음</option>
						<option value="NC 다이노스">NC 다이노스</option>
						<option value="두산 베어스">두산 베어스</option>
						<option value="KT 위즈">KT 위즈</option>
						<option value="LG 트윈스">LG 트윈스</option>
						<option value="키움 히어로즈">키움 히어로즈</option>
						<option value="KIA 타이거즈">KIA 타이거즈</option>
						<option value="Lotte 자이언츠">Lotte 자이언츠</option>
						<option value="삼성 라이온즈">삼성 라이온즈</option>
						<option value="SSG 랜더스">SSG 랜더스</option>
						<option value="한화 이글스">한화 이글스</option>
					</select>
				</div>
			</div>
			<br />

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-5">
					<button type="submit" class="btn btn-default">등록</button>
					<button type="reset" class="btn btn-default">취소</button>
				</div>
			</div>
		</form>
		<br>
		<br>
	</div>

</body>
</html>
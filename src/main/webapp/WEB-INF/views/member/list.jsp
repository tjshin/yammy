<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*,com.study.member.*"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>회원 목록</title>
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

<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/jquery-migrate-1.2.1.min.js"></script>


<script type="text/javascript">
	function read(id) {
		var url = "${root}/member/read";
		url += "?id=" + id;

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
						<h2 class="page-title">회원 목록</h2>
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

		<br>
		<form class="form-inline" method="post" action="list">
			<div class="form-group">
				<select name="col" class="form-control">
					<option value="mname" <c:if test="${col=='mname' }">selected</c:if>>성명</option>
					<option value="id" <c:if test="${col=='id' }">selected</c:if>>아이디</option>
					<option value="email" <c:if test="${col=='email' }">selected</c:if>>이메일</option>
					<option value="total" <c:if test="${col=='total' }">selected</c:if>>전체출력</option>
				</select>
			</div>

			<div class="form-group">
				<input type="text" class="form-control" name="word"
					required="required" value="${word}">
			</div>
			<button class="btn btn-default">검색</button>
			<button class="btn btn-default2" type="button"
				onclick="location.href='/member/createForm'">등록</button>
		</form>

		<br>

		<c:forEach var="dto" items="${list}">
			<table class="table table-bordered">
				<tr>
					<td rowspan="5" class="col-sm-2"><img
						src="${root }/member/${dto.filename}" class="img-rounded"
						width="200px" height="200px"></td>
					<th class="col-sm-2">아이디</th>
					<td class="col-sm-8"><a href="javascript:read('${dto.id}')">${dto.id}</a></td>
				</tr>
				<tr>
					<th class="col-sm-2">성명</th>
					<td class="col-sm-8">${dto.mname}</td>
				</tr>
				<tr>
					<th class="col-sm-2">전화번호</th>
					<td class="col-sm-8">${dto.phone}</td>
				</tr>
				<tr>
					<th class="col-sm-2">이메일</th>
					<td class="col-sm-8">${dto.email}</td>
				</tr>
				<tr>
					<th class="col-sm-2">주소</th>
					<td class="col-sm-8">(${dto.postcode}) ${dto.address1}
						${dto.address2}</td>
				</tr>
			</table>
		</c:forEach>
	</div>

	<div>${paging}</div>


</body>
</html>
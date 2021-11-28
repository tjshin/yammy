<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="util" uri="/ELFunctions"%>
<c:set var="root" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<title>게시판목록</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">

<script type="text/javascript">
	function read(bbsno) {
		var url = "read";
		url += "?bbscate=${bbscate}";
		url += "&bbsno=" + bbsno;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		location.href = url;

	}

</script>

<style>
h2{
	color:white;
	font-weight:bold;
}

h6{
	color:white;
}
</style>
</head>
<body>

	<div class="first-widget parallax" id="blog">
		<div class="parallax-overlay">
			<div class="container pageTitle">
				<div class="row">
					<div class="col-md-6 col-sm-10">
				<c:choose>
				<c:when test="${bbscate == 'jamsil'}">
					<h2>잠실야구장 게시판
					<a href="https://www.lgtwins.com"><img src="${root }/images/map/emblem_LG.png" style="width:70px;"></a>
					<a href="https://www.doosanbears.com"><img src="${root }/images/map/emblem_OB.png" style="width:70px;"></a></h2>
				</c:when>
				<c:when test="${bbscate == 'gocheok'}">
					<h2>고척스카이돔 게시판
					<a href="https://www.heroesbaseball.co.kr"><img src="${root }/images/map/emblem_WO.png" style="width:70px;"></a></h2>
				</c:when>
				<c:when test="${bbscate == 'incheon'}">
					<h2>인천SSG랜더스필드 게시판
					<a href="http://www.ssglanders.com"><img src="${root }/images/map/emblem_SK.png" style="width:70px;"></a></h2>
				</c:when>
				<c:when test="${bbscate == 'suwon'}">
					<h2>수원KT위즈파크 게시판
					<a href="https://www.ktwiz.co.kr"><img src="${root }/images/map/emblem_KT.png" style="width:70px;"></a></h2>
				</c:when>
				<c:when test="${bbscate == 'daejeon'}">
					<h2>한화생명이글스파크 게시판
					<a href="https://www.hanwhaeagles.co.kr"><img src="${root }/images/map/emblem_HH.png" style="width:70px;"></a></h2>
				</c:when>
				<c:when test="${bbscate == 'gwangju'}">
					<h2>광주기아챔피언스필드 게시판
					<a href="https://tigers.co.kr"><img src="${root }/images/map/emblem_HT.png" style="width:70px;"></a></h2>
				</c:when>
				<c:when test="${bbscate == 'daegu'}">
					<h2>대구삼성라이온즈파크 게시판
					<a href="https://www.samsunglions.com"><img src="${root }/images/map/emblem_SS.png" style="width:70px;"></a></h2>
				</c:when>
				<c:when test="${bbscate == 'changwon'}">
					<h2>창원NC파크 게시판
					<a href="https://www.ncdinos.com"><img src="${root }/images/map/emblem_NC.png" style="width:70px;"></a></h2>
				</c:when>
				<c:when test="${bbscate == 'busan'}">
					<h2>사직야구장 게시판
					<a href="http://www.giantsclub.com/html/"><img src="${root }/images/map/emblem_LT.png" style="width:70px;"></a></h2>
				</c:when>
			</c:choose>
			<h6>(마크를 클릭하시면 해당 구단 홈페이지로 이동하실 수 있습니다.)</h6>
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
	<div class="container">

		
		<br>

		<form class="form-inline" action="/bbs/list">
			<div class="form-group">
				<select class="form-control" name="col">
					<option value="" <c:if test="${col=='nick'}"> selected </c:if>>닉네임</option>
					<option value="btitle"
						<c:if test="${col=='btitle'}"> selected </c:if>>제목</option>
					<option value="bcontents"
						<c:if test="${col=='bcontents'}"> selected </c:if>>내용</option>
					<option value="title_content"
						<c:if test="${col=='title_content'}"> selected</c:if>>제목+내용</option>
				</select>
			</div>
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Enter 검색어"
					name="word" value="${word}"> <input type="hidden"
					class="form-control" name="bbscate" value="${bbscate}">
			</div>
			<button type="submit" class="btn btn-default">검색</button>&nbsp;
			<a href="#" onClick="top.location='javascript:location.reload()'"><img src="${root }/images/refresh.svg" style="width:25px;"></a>

		</form>

		<div class="row">


			<table class="table table-striped">
				<thead>
					<tr>
						<th>글번호</th>
						<th>머릿말</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>날짜</th>
						<th>조회</th>
						<th>추천</th>
					</tr>
				</thead>

				<tbody>


					<c:forEach var="dto" items="${list}">
						<script>
							console
									.log(dto.bbsno)
						</script>
						<tr>
							<td>${dto.bbsno}</td>
							<td>${dto.bcname}</td>
							<td><a href="javascript:read('${dto.bbsno}')">${dto.btitle}[${dto.rcnt}]</a></td>
							<td>${dto.nick}</td>
							<td>${dto.bdate}</td>
							<td>${dto.bview}</td>
							<td>${dto.bcnt}</td>

						</tr>
					</c:forEach>


				</tbody>

			</table>

		</div>
		<div>
			<button type="button" class="btn btn-default"
				onclick="location.href='/bbs/create?bbscate=${param.bbscate}'">등록</button>
			<button type="button" class="btn btn-default3"
				onclick="location.href='../bbs/bestlist'">인기글</button>

		</div>
				</form>
		<div>${paging}</div>
	</div>


</body>
</html>
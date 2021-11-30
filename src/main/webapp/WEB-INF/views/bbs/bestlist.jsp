<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="util" uri="/ELFunctions"%>
<c:set var="root" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<title>인기글 게시판</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">

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
  table{
   text-align:center;
   margin-left:20px;
  }
  
  th{
   text-align:center;
  }
  </style>
</head>
<body>

	<div class="first-widget parallax" id="blog">
		<div class="parallax-overlay">
			<div class="container pageTitle">
				<div class="row">
					<div class="col-md-6 col-sm-6">
						<h2 class="page-title">인기글 게시판</h2>
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
	</div><br/>
	<div class="container">
		<form class="form-inline" action="/bbs/bestlist">
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

		</form><br/>

		<div class="row">
       <table class="table table-striped">
				<thead>
					<tr>
						<th>글번호</th>
						<th>머릿말</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>날짜</th>
						<th>조회수</th>
						<th>추천수</th>
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
							<td><a href="javascript:read('${dto.bbsno}')">[ <c:choose>
				<c:when test="${dto.bbscate == 'jamsil'}">
					잠실야구장 게시판
				</c:when>
				<c:when test="${dto.bbscate == 'gocheok'}">
					고척스카이돔 게시판
				</c:when>
				<c:when test="${dto.bbscate == 'incheon'}">
					인천SSG랜더스필드 게시판
				</c:when>
				<c:when test="${dto.bbscate == 'suwon'}">
					수원KT위즈파크 게시판
				</c:when>
				<c:when test="${dto.bbscate == 'daejeon'}">
					한화생명이글스파크 게시판
				</c:when>
				<c:when test="${dto.bbscate == 'gwangju'}">
					광주기아챔피언스필드 게시판
				</c:when>
				<c:when test="${dto.bbscate == 'daegu'}">
					대구삼성라이온즈파크 게시판
				</c:when>
				<c:when test="${dto.bbscate == 'changwon'}">
					창원NC파크 게시판
				</c:when>
				<c:when test="${dto.bbscate == 'busan'}">
					사직야구장 게시판
				</c:when>
				<c:otherwise>
					bbscate : ${dto.bbscate} 오류났다 고쳐라
				</c:otherwise>
			</c:choose>]${dto.btitle}[${dto.rcnt}]</a></td>
							<td>${dto.nick}</td>
							<td>${dto.bdate}</td>
							<td>${dto.bview}</td>
							<td>${dto.bcnt}</td>

						</tr>
					</c:forEach>


				</tbody>

			</table>

		</div>
				</form>
		<div>${paging}</div>
	</div>


</body>
</html>
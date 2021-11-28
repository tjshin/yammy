<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<c:set var="readurl" value="${root}/bbs/read?bbsno=" />
<c:set var="urlhelper" value="&col=${col }&word=${word }&nowPage=${nowPage }"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>review reply db list test</title>
    
</head>
<body>

<div class="first-widget parallax" id="blog">
		<div class="parallax-overlay">
			<div class="container pageTitle">
				<div class="row">
					<div class="col-md-6 col-sm-6">
						<h2 class="page-title">게시판 댓글 DB 목록</h2>
					</div> <!-- /.col-md-6 -->
					<div class="col-md-6 col-sm-6 text-right">

						<span class="page-location">Home / 게시판 댓글 DB 목록</span>

					</div> <!-- /.col-md-6 -->
				</div> <!-- /.row -->
			</div> <!-- /.container -->
		</div> <!-- /.parallax-overlay -->
	</div> <!-- /.pageTitle -->


	<section class="cta clearfix">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<a href="${root }/" class="main-button accent-color">
						<i class="icon-button fa fa-arrow-left"></i>
						&nbsp;&nbsp;홈으로 돌아가기</a>
				</div> <!-- /.col-md-12 -->
			</div> <!-- /.row -->
		</div> <!-- /.container -->
	</section> <!-- /.cta -->




	<div class="container">

		<br>

		<form class="form-inline" method="post" action="${root}/admin/bbs/reply/list">
			<div class="form-group">
				<select class="form-control" name="col">
					<option value="nick" <c:if test="${col=='nick'}"> selected </c:if>
						>닉네임</option>
					<option value="id" <c:if test="${col=='id'}"> selected </c:if>
						>작성자 ID</option>
					<option value="recontents" <c:if test="${col=='recontents'}"> selected </c:if>
						>내용</option>
					<option value="total" <c:if test="${col=='total'}"> selected </c:if>
						>전체출력</option>
				</select>
			</div>
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Enter 검색어" name="word" value="${word}">
			</div>
			<button type="submit" class="btn btn-default">검색</button>

		</form>
		
		<div class="row">
			<table class="table table-striped">
		    <thead>
		    <tr>
		    <th>댓글 번호</th>		    
		    <th>댓글 내용 / 클릭 시 원본 글 이동</th>
		    <th>작성자 닉네임(ID)</th>
		    <th>작성일자</th>
		    <th>삭제</th>
		    </tr>
		    </thead>
		    <tbody>
		 
			<c:choose>   
			<c:when test="${empty adminlist}">
			   <tr><td colspan="6">DB에 등록된 댓글이 없습니다.</td>
			</c:when>
			<c:otherwise>
		  
		    <c:forEach var="dto" items="${adminlist}"> 
		   
		    <tr>
		    <td>${dto.reno}</td>
		    <td><a href="${readurl}${dto.bbsno}">${dto.recontents}</a></td>
		    <td><a href="${root }/admin/bbs/list?col=id&word=${dto.id}">${dto.nick}(${dto.id})</a></td>
		    <td>${dto.redate }</td>
		    <td>
		        <a href="${root }/admin/bbs/reply/delete?reno=${dto.reno}${urlhelper}">
		        <img src="${root }/images/trash-alt-solid.svg"
		        alt="DB에서 삭제합니다."
		        style="width:20px;height:20px;"></a>
		    </td>
		    </tr>
		    </c:forEach>
		    </c:otherwise>
		    </c:choose>
		 
		    </tbody>
		  
		    </table>

					
			<div class="col-md-12">
				${paging }
			</div> <!-- /.col-md-12 -->
		</div> <!-- /.row -->
	</div> <!-- /.container -->

</body>
</html>
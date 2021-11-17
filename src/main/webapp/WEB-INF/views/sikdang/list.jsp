<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<c:set var="readurl1" value="${root}/admin/sikdang/read?hugino=" />
<c:set var="readurl2" value="&col=${col }&word=${word }&nowPage=${nowPage }"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>sikdang db list test</title>
</head>
<body>

<div class="first-widget parallax" id="blog">
		<div class="parallax-overlay">
			<div class="container pageTitle">
				<div class="row">
					<div class="col-md-6 col-sm-6">
						<h2 class="page-title">식당 DB 목록</h2>
					</div> <!-- /.col-md-6 -->
					<div class="col-md-6 col-sm-6 text-right">
						<span class="page-location">Home / 식당 DB 목록</span>
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

		<form class="form-inline" action="${root}/admin/sikdang/list">
			<div class="form-group">
				<select class="form-control" name="col">
					<option value="sikid" <c:if test="${col=='sikid'}"> selected </c:if>
						>식당 ID (kakao)</option>
					<option value="sikname" <c:if test="${col=='sikname'}"> selected </c:if>
						>상호명</option>
					<option value="sikphone" <c:if test="${col=='sikphone'}"> selected </c:if>
						>전화번호</option>
					<option value="address" <c:if test="${col=='address'}"> selected </c:if>
						>주소(도로+지번)</option>
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
			<table class="table table-striped">
		    <thead>
		    <tr>
		    <th>식당 ID (kakao)</th>
		    <th>상호명</th>
		    <th>URL</th>
		    <th>작성된 리뷰</th>
		    <th>수정/삭제</th>
		    </tr>
		    </thead>
		    <tbody>
		 
			<c:choose>   
			<c:when test="${empty adminlist}">
			   <tr><td colspan="6">DB에 등록된 식당이 없습니다.</td>
			</c:when>
			<c:otherwise>
		  
		    <c:forEach var="dto" items="${adminlist}"> 
		   
		    <tr>
		    
		    <td>${dto.sikid}</td>
		    <td>
		    <a href="#">${dto.sikname}</a>
		    </td>
		    <td>
		    <a href="${dto.sikurl }" target="_blank">${dto.sikurl}</a>
		    </td>
		    <td>${dto.reviewcnt }</td>
		    <td> <a href="#">
		          수정 아이콘
		        </a>
		        /
		        <a href="#">
		          삭제 아이콘
		        </a>
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
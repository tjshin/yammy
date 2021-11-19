<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>


<title>조회</title>
<meta charset="utf-8">


<script src="http://code.jquery.com/jquery-latest.js"></script>

<script src="/resources/jquery/jquery-3.3.1.min.js"></script>

<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
	   
	   <script type="text/javascript">
	function updateM() {
		var url = "${root}/bbs/update";
		url += "?bbsno=${dto.bbsno}";
		location.href = url;
	}
	function deleteM() {
		var url = "${root}/bbs/delete";
		url += "?bbsno=${dto.bbsno}";
		location.href = url;
	}

	function listM() {
		var url = "${root}/bbs/list";
		url += "?nowPage=${param.nowPage}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		location.href = url;
	}


</script>


</head>





<body>

	<div class="first-widget parallax"></div>
	<div class="container">

		<h2>게시글</h2>
		<header>
			<div class="panel panel-default">
				<div class="panel-heading">
					<!-- 모바일에서 작성 icon_write_mbl -->
					<h3 class="title ub-word">
						<span class="title_headtext"></span> <span class="title_subject">${dto.btitle}</span><span
							class="title_device"></span>
					</h3>

					<div align="right">
						<span class='nickname' title=''>${dto.nick}<span></span> <span
							class="gall_date" title="2021-11-03 22:35:02">${dto.bdate}</span>
					</div>
					<div align="right">
						<span class="gall_count">조회수: ${dto.bview}</span> <span
							class="gall_reply_num">추천수: </span> <span class="gall_comment"><a
							href="#focus_cmt">댓글수: </a></span>
					</div>
				</div>
			</div>
		</header>



		<div class="panel panel-default">


			<div class="panel-heading">내용</div>
			<div class="panel-body">${dto.bcontents}</div>


		</div>




	
		<!-- 추천 기능 -->
		<div>
			<div class="w3-border w3-center w3-padding">
				<c:if test="${ id == null }">
					추천 기능은 <a href="${root }/member/login">로그인</a></button> 후 사용 가능합니다.<br />
					<i class="fa fa-heart" style="font-size:16px;color:red"></i>
					<span class="rec_count"></span>					
				</c:if>
				<c:if test="${ id != null }">
					<button class="w3-button w3-black w3-round" id="likeupdate">
						<i class="fa fa-heart" style="font-size:16px;color:red"></i>
						&nbsp;<span class="rec_count"></span>
					</button> 
				</c:if>
			</div>
		</div>






		<div>
			<br>
			<div class="col-md-12">
			
				<button type="button" class="btn" onclick="listM()">목록</button>
			

				<c:if test="${sessionScope.id !=null }">
				</c:if>
				<c:if test="${sessionScope.id !=null  && sessionScope.id == dto.id}">
				
				<button type="button" class="btn"onclick="location.href='/bbs/create'">등록</button>
					<button type="button" class="btn" onclick="updateM()">수정</button>
					<button type="button" class="btn" onclick="deleteM()">삭제</button>
				</c:if>
			</div>
		</div>

<table class="table table-striped">
   <thead>
    <tr>
    <th>아이디</th>
    <th>내용</th>
    <th>날짜</th>
    </tr>
   </thead>
 <tbody>  
 	<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td colspan="6">댓글을 작성해주세요..</td>
					</c:when>
					<c:otherwise>

						<c:forEach var="rdto" items="${list}">

							<tr>
							
								<td>${rdto.nick}</td>
								<td>${rdto.recontents}</td>
								<td>${rdto.redate}</td>

							</tr>
						</c:forEach>
					</c:otherwise>
			</c:choose>
      ${paging}
 </tbody>
 </table>
					<br> <br>

	<!-- panel start-->
<div class="first-widget parallax"></div>
<div class="container">
<h2 class="col-sm-offset-2 col-sm-10">댓글쓰기</h2>
<form class="form-horizontal" 
      action="create/reply"
      method="post"
      onsubmit="return checkIn(this)"
      >
   
    
    
        	 <div class="form-group">
        <label class="control-label col-sm-2" for="sendid" style="color: black; font-weight: bolder;">닉네임</label>
        <div class="col-sm-8">
       <input type="text" name="id" id="id" class="form-control" value="${dto.nick}" readonly> 
       		
        </div>
        </div>

  <div class="form-group">
    <label class="control-label col-sm-2" for="recontent">내용</label>
    <div class="col-sm-8">
    <textarea rows="12" cols="7" id="recontents" name="recontents" class="form-control"></textarea>
    </div>
  </div>



   <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button class="btn">등록</button>
    <button type="reset" class="btn">취소</button>
   </div>
 </div>

        <!-- ul end  -->
</div>




</html> 

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html> 
<html> 
<head>
  <title>homepage</title>
  <meta charset="utf-8">
  <script type="text/javascript" src="${root}/ckeditor/ckeditor.js">     </script>
  <script type="text/JavaScript">

  $(function() {
         CKEDITOR.replace('bcontents'); // <TEXTAREA>태그 id 값
   });
 
 
 function checkIn(f){
         if (f.btitle.value == ""){
              alert("제목을 입력하세요");
              f.btitle.focus()
              return false;
         }
         if (f.bcontents.value == ""){
              alert("내용을 입력하세요");
              f.bcontents.focus();
              return false;
         }
    

 }
 </script>
</head>
<body> 


<br>
	<div class="first-widget parallax" id="blog">
	<div class="parallax-overlay">
			<div class="container pageTitle">
				<div class="row">
					<div class="col-md-6 col-sm-6">
						<h2 class="page-title">게시글 작성</h2>
					</div>
					<!-- /.col-md-6 -->
					<div class="col-md-6 col-sm-6 text-right">
						<span class="page-location">Home / 경기장 게시판 /글쓰기</span>
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
<form class="form-horizontal" 
      action="create"
      method="post"
      onsubmit="return checkIn(this)"
      >
      <input type="hidden" name="bbscate" value="${param.bbscate}">
   
   <a href='/bbs/list?bbscate=${param.bbscate}'>
   	<c:choose>
			<c:when test="${param.bbscate == 'jamsil'}"><h2>잠실야구장 게시판</h2></c:when>
			<c:when test="${param.bbscate == 'gocheok'}"><h2>고척스카이돔 게시판</h2></c:when>
			<c:when test="${param.bbscate == 'incheon'}"><h2>인천SSG랜더스필드 게시판</h2></c:when>
			<c:when test="${param.bbscate == 'suwon'}"><h2>수원KT위즈파크 게시판</h2></c:when>
			<c:when test="${param.bbscate == 'daejeon'}"><h2>한화생명이글스파크 게시판</h2></c:when>
			<c:when test="${param.bbscate == 'gwangju'}"><h2>광주기아챔피언스필드 게시판</h2></c:when>
			<c:when test="${param.bbscate == 'daegu'}"><h2>대구삼성라이온즈파크 게시판</h2></c:when>
			<c:when test="${param.bbscate == 'changwon'}"><h2>창원NC파크 게시판</h2></c:when>
			<c:when test="${param.bbscate == 'busan'}"><h2>사직야구장 게시판</h2></c:when>
			<c:otherwise><h2> bbscate : ${param.bbscate} 오류났다 고쳐라</h2></c:otherwise>
		</c:choose>
   </a>
   
   
    
      <div class="form-group">
    <label class="control-label col-sm-2" for="bcate">머릿말</label>
    <div class="col-sm-6">
      <select class="form-control" name="bcate">
        <option value="1"
        <c:if test= "${bcate==1}"> selected </c:if>
        >잡담</option>
        <option value="2"
        <c:if test= "${bcate==2}"> selected </c:if>
        >야구응원</option>
        <option value="3"
        <c:if test= "${bcate==3}"> selected </c:if>
        >야구장 주변정보</option>
      </select>
    </div>
  </div>
    
    
    	
        
<div class="form-group">
    <label class="control-label col-sm-2" for="btitle">제목</label>
    <div class="col-sm-8">
      <input type="text" name="btitle" id="btitle" class="form-control">
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="bcontents">내용</label>
    <div class="col-sm-8">
    <textarea rows="12" cols="7" id="bcontents" name="bcontents" class="form-control"></textarea>
    </div>
  </div>
  


   <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button class="mainBtn">등록</button>
    <button type="reset" class="mainBtn">취소</button>
   </div>
 </div>

</form>
</div>
</body> 
</html> 
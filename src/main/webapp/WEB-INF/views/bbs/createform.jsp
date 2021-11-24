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
         CKEDITOR.replace('content'); // <TEXTAREA>태그 id 값
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
      <input type="hidden" name="bbscate" value="${param.bbscate }">
   
    
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
    <label class="control-label col-sm-2" for="content">내용</label>
    <div class="col-sm-8">
    <textarea rows="12" cols="7" id="bcontents" name="bcontents" class="form-control"></textarea>
    </div>
  </div>
  
  <!-- <div class="form-group">
    <label class="control-label col-sm-2" for="filenameMF">첨부파일</label>
    <div class="col-sm-6">          
      <input type="file" class="form-control" id="filenameMF" 
      name="filenameMF" accept=".jpg,.png,.gif" required="required">
    </div>
  </div>-->


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
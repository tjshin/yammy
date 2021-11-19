<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html> 
<html> 
<head>
  <title>homepage</title>
  <meta charset="utf-8">
  <script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js">     </script>
  <script type="text/JavaScript">

  $(function() {
         CKEDITOR.replace('content'); // <TEXTAREA>태그 id 값
   });
 
 
 function checkIn(f){
         if (f.btitle.value == ""){
              alert("제목을 입력하세요");
              f.title.focus()
              return false;
         }
         if (f.bcontents.value == ""){
              alert("내용을 입력하세요");
              f.content.focus();
              return false;
         }
    

 }
 </script>
</head>
<body> 


<br>
<div class="first-widget parallax"></div>
<div class="container">
<h2 class="col-sm-offset-2 col-sm-10">게시글 쓰기</h2>
<form class="form-horizontal" 
      action="create"
      method="post"
      onsubmit="return checkIn(this)"
      >
   
    
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
        <label class="control-label col-sm-3" for="sendid" style="color: black; font-weight: bolder;">게시판이름</label>
        <div class="col-sm-5">
          <input type="text" name="bbscate" id="bbscate" class="form-control" value="{bbscate}"> 
    </div></div>
        	 <div class="form-group">
        <label class="control-label col-sm-2" for="sendid" style="color: black; font-weight: bolder;">글쓴이</label>
        <div class="col-sm-8">
       <input type="text" name="id" id="id" class="form-control" value="${id}" readonly> 
       		
        </div>
        </div>
<div class="form-group">
    <label class="control-label col-sm-2" for="btitle">제목</label>
    <div class="col-sm-8">
      <input type="text" name="btitle" id="btitle" class="form-control">
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="bcontent">내용</label>
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
    <button class="btn">등록</button>
    <button type="reset" class="btn">취소</button>
   </div>
 </div>

</form>
</div>
</body> 
</html> 
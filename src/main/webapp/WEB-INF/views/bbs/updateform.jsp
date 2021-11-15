<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html> 
<html> 
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  

  <title>수정</title>
  <meta charset="utf-8">
 
</head>
<body> 

<div class="first-widget parallax"></div>
 
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">게시판 수정</h1>
<form class="form-horizontal" 
      action="./update"
      method="post"
      >
      <div class="form-group">
      <label class="control-label col-sm-2" for="whead">머릿말</label>
      <div class="col-sm-4">
        <select class="form-control" name="col">
          <option value="cateno"
          <c:if test= "${col=='cateno'}"> selected </c:if>
          >잡담</option>
          <option value="pname"
          <c:if test= "${col=='pname'}"> selected </c:if>
          >야구응원</option>
          <option value="price"
          <c:if test= "${col=='price'}"> selected </c:if>
          >야구장 주변정보</option>     
          <option value="total"
          <c:if test= "${col=='total'}"> selected </c:if>
          >댓글</option>   
      </select>
      </div>
    </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="title">제목</label>
    <div class="col-sm-8">
      <input type="text" name="title" id="title" 
      class="form-control" value="${dto.btitle}">
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="content">내용</label>
    <div class="col-sm-8">
    <textarea rows="12" cols="7" id="content" name="content" 
    class="form-control">${dto.bcontent}</textarea>
    </div>
  </div>
  
  <!-- <div class="form-group">
    <label class="control-label col-sm-2" for="oldfile">원본파일</label>
    <div class="col-sm-6">
      <img src="/contents/storage/${oldfile }" 
      class="img-rounded" width="200px" height="200px">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="filenameMF">변경파일</label>
    <div class="col-sm-6">          
      <input type="file" class="form-control" id="filenameMF" 
      name="filenameMF" accept=".jpg,.png,.gif" required="required">
    </div>
  </div>-->
  
   <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button class="btn">수정</button>
    <button type="reset" class="btn">취소</button>
   </div>
 </div>
</form>
</div>
</body> 
</html> 
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html> 
<head>
  <title>삭제</title>
  <meta charset="utf-8">
  <style type="text/css">
  #red{
    color:red;
  }
  </style>
  
  <script type="text/javascript">
  
  function goBack(){
      window.history.back();
              }
  </script>
  
  
  
</head>
<body> 

<div class = first-widget>  </div>
<div class="container">
 
<h2 class="col-sm-offset-2 col-sm-10">받은 쪽지 삭제</h2>
<form class="form-horizontal" 
      action="${root }/message/rdelete"
      method="post"
      >
  <input type="hidden" name="messageno" value="${param.messageno}">
  <div class="form-group">
    
    
    
  <p id="red" class="col-sm-offset-2 col-sm-6">삭제하면 복구할 수 없습니다</p>
  
   <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button class="btn">삭제</button>
    <button type="reset" class="btn" onclick="goBack();">취소</button>
   </div>
 </div>
 </div>
</form>
 
</div>
</body> 
</html>
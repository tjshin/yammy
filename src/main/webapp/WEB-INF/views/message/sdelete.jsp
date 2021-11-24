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
<div class="first-widget parallax" id="blog">
		<div class="parallax-overlay">
			<div class="container pageTitle">
				<div class="row">
					<div class="col-md-6 col-sm-6">
						<h2 class="page-title">보낸 쪽지 삭제</h2>
					</div> <!-- /.col-md-6 -->
					
				</div> <!-- /.row -->
			</div> <!-- /.container -->
		</div> <!-- /.parallax-overlay -->
	</div> <!-- /.pageTitle -->
<br/>
<div class="container">
<form class="form-horizontal" 
      action="${root }/message/sdelete"
      method="post"
      >
  <input type="hidden" name="messageno" value="${param.messageno}">
  <div class="form-group">
    
    
    
  <p id="red" class="col-sm-offset-2 col-sm-6">삭제하면 복구할 수 없습니다.</p>
  
   <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button class="btn btn-red">삭제</button>
     <button type="reset" class="btn btn-default2" onclick="goBack();">취소</button>
   </div>
 </div>
 </div>
</form>
 
</div>
</body> 
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="first-widget parallax" id="blog">
		<div class="parallax-overlay">
			<div class="container pageTitle">
				<div class="row">
					<div class="col-md-6 col-sm-6">
						<h2 class="page-title">티켓 사진 수정</h2>
					</div> <!-- /.col-md-6 -->
				</div> <!-- /.row -->
			</div> <!-- /.container -->
		</div> <!-- /.parallax-overlay -->
	</div> <!-- /.pageTitle -->
<br/>
  <form class="form-horizontal" 
        action="/ticket/updateFile"
        method="post"
        enctype="multipart/form-data"
        >   
    <input type="hidden" name="oldfile" value="${oldfile}">    
    <input type="hidden" name="ticketno" value="${ticketno}">    
        
    <div class="form-group">
      <label class="control-label col-sm-2" for="oldfile">원본파일</label>
      <div class="col-sm-6">
        <img src="/ticket/storage/${oldfile}" 
        class="img-rounded" width="200px" height="200px">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="filenameMF">변경파일</label>
      <div class="col-sm-6">          
        <input type="file" class="form-control" id="filenameMF" 
        name="filenameMF" accept=".jpg,.png,.gif" required="required" style="width:50%;">
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-8">
        <button type="submit" class="btn btn-default">수정</button>
        <button type="button" class="btn btn-default2" 
        onclick="history.back()">취소</button>
      </div>
    </div>
  </form>


</body>
</html>
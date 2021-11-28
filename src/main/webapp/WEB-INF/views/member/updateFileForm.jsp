<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>회원사진 수정</title>
    <meta name="keywords" content="">
	<meta name="description" content="">
    <meta name="author" content="templatemo">
    <!-- 
	Medigo Template
	http://www.templatemo.com/preview/templatemo_460_medigo
    -->

	<!-- Google Fonts -->
	<link href="http://fonts.googleapis.com/css?family=PT+Serif:400,700,400italic,700itali" rel="stylesheet">
	<link href="http://fonts.googleapis.com/css?family=Raleway:400,900,800,700,500,200,100,600" rel="stylesheet">

	<!-- Stylesheets -->
	<link rel="stylesheet" href="bootstrap/bootstrap.css">
	<link rel="stylesheet" href="css/misc.css">
	<link rel="stylesheet" href="css/blue-scheme.css">
	
	<!-- JavaScripts -->
	<script src="js/jquery-1.10.2.min.js"></script>
	<script src="js/jquery-migrate-1.2.1.min.js"></script>

	<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />


</head>
<body>


	<div class="first-widget parallax" id="blog">
		<div class="parallax-overlay">
			<div class="container pageTitle">
				<div class="row">
					<div class="col-md-6 col-sm-6">
						<h2 class="page-title">회원사진 수정</h2>
					</div> <!-- /.col-md-6 -->
				</div> <!-- /.row -->
			</div> <!-- /.container -->
		</div> <!-- /.parallax-overlay -->
	</div> <!-- /.pageTitle -->

	<div class="container">

        <h1 class="col-sm-offset-2 col-sm-10"></h1>
          <form class="form-horizontal" 
                action="updateFile"
                method="post"
                enctype="multipart/form-data"
                >   
            <input type="hidden" name="oldfile" value="${param.oldfile}">    
                
            <div class="form-group">
              <label class="control-label col-sm-2" for="oldfile">원본파일</label>
              <div class="col-sm-6">
                <img src="/member/storage/${dto.filename}" 
                class="img-rounded" width="200px" height="200px">
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-sm-2" for="fnameMF">변경파일</label>
              <div class="col-sm-6">          
                <input type="file" class="form-control" id="fnameMF" 
                name="fnameMF" accept=".jpg,.png,.gif" required="required">
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
        
        </div>


</body>
</html>
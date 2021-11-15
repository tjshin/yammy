<%@ page contentType="text/html; charset=UTF-8" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>공지사항 작성</title>
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

<script type="text/JavaScript">
        
 function checkIn(f){

         if (f.ntitle.value == ""){
              alert("제목를 입력하세요");
              f.ntitle.focus();
              return false;
         }
         if (f.ncontents.value == '') {
             window.alert('내용을 입력해 주세요.');
             f.ncontents.focus();
             return false;
         }
 }
 </script>

</head>
<body>
<div class="first-widget parallax" id="blog">
		<div class="parallax-overlay">
			<div class="container pageTitle">
				<div class="row">
					<div class="col-md-6 col-sm-6">
						<h2 class="page-title">공지사항 작성</h2>
					</div> <!-- /.col-md-6 -->
					
				</div> <!-- /.row -->
			</div> <!-- /.container -->
		</div> <!-- /.parallax-overlay -->
	</div> <!-- /.pageTitle -->
	<div class="container">
        <h2 class="col-sm-offset-2 col-sm-10"></h2>
        <form class="form-horizontal" 
              action="/admin/notice/create"
              method="post"
              onsubmit="return checkIn(this)"
              >
         
          <div class="form-group">
            <label class="control-label col-sm-2" for="wname">작성자</label>
            <div class="col-sm-6">
              <input type="text" name="id" id="id" class="form-control" value="${sessionScope.id }" readonly/>
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-sm-2" for="ntitle">제목</label>
            <div class="col-sm-8">
              <input type="text" name="ntitle" id="ntitle" class="form-control">
            </div>
          </div>
          
          <div class="form-group">
            <label class="control-label col-sm-2" for="ncontents">내용</label>
            <div class="col-sm-8">
            <textarea rows="12" cols="7" id="ncontents" name="ncontents" class="form-control"></textarea>
            </div>
          </div>
          
          
           <div class="form-group">
           <div class="col-sm-offset-2 col-sm-5">
            <button class="btn">등록</button>
            <button type="reset" class="btn">취소</button>
           </div>
         </div>
        </form>
        </div>
	<!-- Scripts -->
	<script src="js/min/plugins.min.js"></script>
	<script src="js/min/medigo-custom.min.js"></script>

</body>
</html>
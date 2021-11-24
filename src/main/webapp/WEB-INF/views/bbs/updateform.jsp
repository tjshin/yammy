<%@ page contentType="text/html; charset=UTF-8" %> 
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>게시글 수정</title>
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
  <script type="text/javascript" src="${root}/ckeditor/ckeditor.js">     </script>
  <script type="text/JavaScript">

  $(function() {
         CKEDITOR.replace('bcontents'); // <TEXTAREA>태그 id 값
   });
        
 function checkIn(f){

         if (f.btitle.value == ""){
              alert("제목를 입력하세요");
              f.btitle.focus();
              return false;
         }
         if (f.bcontents.value == '') {
             window.alert('내용을 입력해 주세요.');
             f.bcontents.focus();
             return false;
         }
 }
 </script>
</head>
<body>

	<div class="first-widget parallax" id="contact">
		<div class="parallax-overlay">
			<div class="container pageTitle">
				<div class="row">
					<div class="col-md-6 col-sm-6">
						<h2 class="page-title">게시글 수정</h2>
					</div> <!-- /.col-md-6 -->
					
				</div> <!-- /.row -->
			</div> <!-- /.container -->
		</div> <!-- /.parallax-overlay -->
	</div> <!-- /.pageTitle -->

	<div class="container">
        <h1 class="col-sm-offset-2 col-sm-10"></h1>
        <form class="form-horizontal" 
              action="/bbs/update"
              method="post"
              onsubmit="return checkIn(this)"
              >
        
        <input type="hidden" name="bbscate" value="${dto.bbscate}">      
        <input type="hidden" name="bbsno" value="${dto.bbsno}">
          <div class="form-group">
            <label class="control-label col-sm-2" for="nick">${dto.nick}님의 글</label>
            <div class="col-sm-6">
              <input type="hidden" name="id" id="id" 
              class="form-control" value="${dto.id}" >
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-sm-2" for="btitle">제목</label>
            <div class="col-sm-8">
              <input type="text" name="btitle" id="btitle" 
              class="form-control" value="${dto.btitle}">
            </div>
          </div>
          
          <div class="form-group">
            <label class="control-label col-sm-2" for="bcontents">내용</label>
            <div class="col-sm-8">
            <textarea rows="12" cols="7" id="bcontents" name="bcontents" 
            class="form-control">${dto.bcontents}</textarea>
            </div>
          </div>
          
           <div class="form-group">
           <div class="col-sm-offset-2 col-sm-5">
            <button class="mainBtn">수정</button>
            <button type="reset" class="mainBtn">취소</button>
           </div>
         </div>
        </form>
        </div>

		<!-- Scripts -->
	<script src="js/min/plugins.min.js"></script>
	<script src="js/min/medigo-custom.min.js"></script>
	<script>
        function initialize() {
          var mapOptions = {
            zoom: 14,
            center: new google.maps.LatLng(13.758468, 100.567481)
          };

          var map = new google.maps.Map(document.getElementById('map-canvas'),
              mapOptions);
        }

        function loadScript() {
          var script = document.createElement('script');
          script.type = 'text/javascript';
          script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&' +
              'callback=initialize';
          document.body.appendChild(script);
        }

        window.onload = loadScript;
    </script>


</body>
</html>
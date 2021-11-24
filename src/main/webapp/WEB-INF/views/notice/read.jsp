<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>공지사항</title>
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
	
	<script type="text/javascript">
	function update() {
		var url = "/admin/notice/update";
		url += "?noticeno=${dto.noticeno}";
		location.href = url;
	}
	function delete() {
		var url = "/admin/notice/delete";
		url += "?noticeno=${dto.noticeno}";
		location.href = url;
	}
</script>

</head>
<body>

	<div class="first-widget parallax" id="contact">
		<div class="parallax-overlay">
			<div class="container pageTitle">
				<div class="row">
					<div class="col-md-6 col-sm-6">
						<h2 class="page-title">공지사항</h2>
					</div> <!-- /.col-md-6 -->
					
				</div> <!-- /.row -->
			</div> <!-- /.container -->
		</div> <!-- /.parallax-overlay -->
	</div> <!-- /.pageTitle -->

	<div class="container">
	<br>
		<div class="panel panel-default">


			<div class="panel-heading">제목</div>
			<div class="panel-body">${dto.ntitle}</div>

			<div class="panel-heading">내용</div>
			<div class="panel-body">${dto.ncontents}</div>

			<div class="panel-heading">조회수</div>
			<div class="panel-body">${dto.nview}</div>

			<div class="panel-heading">등록일</div>
			<div class="panel-body">${dto.ndate}</div>

		</div>
		<div>
			<c:choose>
    		<c:when test="${sessionScope.id != dto.id && sessionScope.grade == 'A'}">
			<button type="button" class="btn btn-default" onclick="location.href='/admin/notice/create'">등록</button>
			</c:when>
			<c:when test="${sessionScope.id == dto.id && sessionScope.grade == 'A'}">
			<button type="button" class="btn btn-default" onclick="location.href='/admin/notice/create'">등록</button>
			<button type="button" class="btn btn-default" onclick="location.href='/admin/notice/update?noticeno=${dto.noticeno}'">수정</button>
			<button type="button" class="btn btn-red" onclick="location.href='/admin/notice/delete?noticeno=${dto.noticeno}'">삭제</button>
			</c:when>
			</c:choose>
			<button type="button" class="btn btn-default2" onclick="history.back()">목록</button>
			<br/><br/>
		</div>
	</div>

	
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
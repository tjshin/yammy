<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>Q&A</title>
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

    <style>
        #often{
            font-size:20px;
        }
    </style>

</head>
<body>


	<div class="first-widget parallax" id="contact">
		<div class="parallax-overlay">
			<div class="container pageTitle">
				<div class="row">
					<div class="col-md-6 col-sm-6">
						<h2 class="page-title">Q&A</h2>
					</div> <!-- /.col-md-6 -->
					
				</div> <!-- /.row -->
			</div> <!-- /.container -->
		</div> <!-- /.parallax-overlay -->
	</div> <!-- /.pageTitle -->

	<div id="main-content" class="container">
        <H2></H2>
                <form class="form-inline">

                    
                    <div class="form-group">
                        <a href="#" class="main-button accent-color">챗봇 시작하기</a>
                    </div><br/><br/>
                </form>
                <form class="form-inline">
                    <div class="form-group" style="width: 90%;">
                        <label for="msg">문의</label>
                        <input type="text" id="msg" class="form-control" placeholder="내용을 입력하세요." style="width:90%;">
                    </div>
                    <button id="send" class="btn btn-default" disabled type="submit">보내기</button>
                </form>

        <div class="row">
            <div class="col-md-12">
                <table id="conversation" class="table table-striped">
                    <thead>
                    <tr>
                        <th>메세지</th>
                    </tr>
                    </thead>
                    <tbody id="communicate">
                    </tbody>
                </table>
            </div>
        </div>
        <br/>
                <div class="form-group">
                    <p id="often">자주 하는 질문</p>
                    <li><a href="#">로그인이 되지 않습니다.</a></li>
                    <li><a href="#">티켓 양도 거래 중에 사기를 당했을 때는 어떻게 해야 하나요?</a></li>
                    <li><a href="#">고객센터 번호을 알고 싶어요.</a></li>
                </div>
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
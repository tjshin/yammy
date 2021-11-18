<%@ page contentType="text/html; charset=UTF-8" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>회원 탈퇴</title>
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
	<script type="text/javascript">
		function historyback(){
		window.history.back();
		}
	</script>

	<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />

<script type="text/JavaScript">
        


         
 </script>
<style type="text/css">
  #red{
    color:red;
  }
  </style>
</head>
<body>
<div class="first-widget parallax" id="blog">
		<div class="parallax-overlay">
			<div class="container pageTitle">
				<div class="row">
					<div class="col-md-6 col-sm-6">
						<h2 class="page-title">회원 탈퇴</h2>
					</div> <!-- /.col-md-6 -->
					
				</div> <!-- /.row -->
			</div> <!-- /.container -->
		</div> <!-- /.parallax-overlay -->
	</div> <!-- /.pageTitle -->

         <div class="container">
 

<form class="form-horizontal" 
      action="/admin/member/delete"
      method="post"
      >
  <input type="hidden" name="id" value="${param.id}">
 <br/>
  <p id="red" class="col-sm-offset-2 col-sm-6">탈퇴시키면 복구할 수 없습니다. 정말 탈퇴시키시겠습니까?</p>
  
   <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5" style="text-align: center">
    <button class="btn">탈퇴</button>
    <button type="button" class="btn" onclick="historyback()">취소</button>
   </div>
 </div>
</form>
 
</div>
          
	<!-- Scripts -->
	<script src="js/min/plugins.min.js"></script>
	<script src="js/min/medigo-custom.min.js"></script>

</body>
</html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>회원 정보 조회</title>
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
	
	#a{
  padding: 12px 15px;
  font-size: 12px;
  font-family: "Raleway", sans-serif;
  text-transform: uppercase;
  font-weight: 700;
  -webkit-border-radius: 2px;
  -moz-border-radius: 2px;
  -ms-border-radius: 2px;
  -o-border-radius: 2px;
  border-radius: 2px;
}

	#a{
  background-color: #00a8d6;
  color: white;
  padding: 10px 12px;
  font-size: 12px;
  font-family: "Raleway", sans-serif;
  text-transform: uppercase;
  font-weight: 700;
  -webkit-border-radius: 2px;
  -moz-border-radius: 2px;
  -ms-border-radius: 2px;
  -o-border-radius: 2px;
  border-radius: 2px;
  
}
	#a:hover {
  background-color: #31373a;
  transition: all ease 0.5s 0s;
}
    </style>

</head>
<body>
	<div class="first-widget parallax" id="blog">
		<div class="parallax-overlay">
			<div class="container pageTitle">
				<div class="row">
					<div class="col-md-6 col-sm-6">
						<h2 class="page-title">${dto.mname} 님의 회원정보</h2>
					</div> <!-- /.col-md-6 -->
					
				</div> <!-- /.row -->
			</div> <!-- /.container -->
		</div> <!-- /.parallax-overlay -->
	</div> <!-- /.pageTitle -->
	
    <div class="container">
	<form>
        <h2 class="col-sm-offset-2 col-sm-10"></h2>
         <table class="table table-bordered">
         <tr>
             <td colspan="2" style="text-align: center">
                 <img src="${root }/member/${dto.filename}" 
                 width="250px" height="250px" class="img-rounded" >
             </td>
         </tr>
         <tr>
             <th>아이디</th>
             <td>${dto.id}</td>
         </tr>
         <tr>
             <th>성명</th>
             <td>${dto.mname}</td>
         </tr>
         
         <tr>
             <th>닉네임</th>
             <td>${dto.nick}</td>
         </tr>
         
         <tr>
             <th>전화번호</th>
             <td>${dto.phone}</td>
         </tr>
         <tr>
             <th>이메일</th>
             <td>${dto.email}</td>
         </tr>
         <tr>
             <th>우편번호</th>
             <td>${dto.postcode}</td>
         </tr>
         <tr>
             <th>주소</th>
             <td>${dto.address1} ${dto.address2}</td>
         </tr>
         
         <tr> 
             <th>응원구단</th>
             <td>${dto.favteam}</td>
         </tr>

         
         </table>
         </form>
         <div style="text-align: center">
         <a id="a" href="${root }/member/update?id=${dto.id}">정보수정</a>
         <a id="a" href="#" onclick="history.back()">회원목록</a>
         <a id="a" href="${root }/admin/member/delete?id=${dto.id}">회원탈퇴</a>
         </div>
         
         <br>
         
        </div>



</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>회원정보 수정</title>
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
	
	
	<style type="text/css">
  	#need,#emailcheck{
  		color:red;
  	}
  </style>
  
	<!-- JavaScripts -->
	<script src="js/jquery-1.10.2.min.js"></script>
	<script src="js/jquery-migrate-1.2.1.min.js"></script>
	
	<script type="text/javascript">
  function emailCheck(email){
	  //alert(email);
	  if(email==''){
		  alert("email를 입력하세요");
		  document.frm.email.focus();
	  }else{
		  var url = "/member/emailcheck";
		  url += "?email="+email;
		  
		  $.get(url, function(data, textStatus) {
			  
			  $("#emailcheck").text(data.str);
		  	
		  })
	  }
  }

function inCheck(f){
	
	if(f.tel.value.length==0){
		alert("전화번호를 입력하세요");
		f.tel.focus();
		return false;
	}
	if(f.email.value.length==0){
		alert("이메일을 입력하세요");
		f.email.focus();
		return false;
	}
}

</script>
  
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    //document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>

	<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />

</head>
<body>
	<div class="first-widget parallax" id="blog">
		<div class="parallax-overlay">
			<div class="container pageTitle">
				<div class="row">
					<div class="col-md-6 col-sm-6">
						<h2 class="page-title">회원정보 수정</h2>
					</div> <!-- /.col-md-6 -->
				</div> <!-- /.row -->
			</div> <!-- /.container -->
		</div> <!-- /.parallax-overlay -->
	</div> <!-- /.pageTitle -->
	<div class="container">

        <h2 class="col-sm-offset-2 col-sm-10"></h2>
        <label class="col-sm-offset-2 col-sm-15">( <span id="need">*</span> 필수입력사항)</label>
          <form class="form-horizontal" 
                action="update"
                method="post"
                name = 'frm'
                onsubmit="return inCheck(this)"
                >
             <input type="hidden" name="id" value="${dto.id}">
            <div class="form-group">
              <label class="control-label col-sm-2" for="id">아이디</label>
              <div class="col-sm-3">          
               ${dto.id}
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-sm-2" for="mname">이름</label>
              <div class="col-sm-4">          
                ${dto.mname}
              </div>
            </div>
             <div class="form-group">
              <label class="control-label col-sm-2" for="nick"><span id="need">*</span>닉네임</label>
              <div class="col-sm-4">          
                <input type="text" class="form-control" id="nick" 
                 value="${dto.nick}"  name="nick">
              </div>
              </div>
            <div class="form-group">
              <label class="control-label col-sm-2" for="phone"><span id="need">*</span>전화번호</label>
              <div class="col-sm-4">          
                <input type="text" class="form-control" id="phone" 
                 value="${dto.phone}"  name="phone">
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-sm-2" for="email"><span id="need">*</span>이메일</label>
              <div class="col-sm-3">          
                <input type="email" class="form-control" id="email" 
                value="${dto.email}" name="email">
              </div>
              
              <button type="button" class="btn btn-default"
              onclick="emailCheck(document.frm.email.value)">Email 변경</button>
              <div id="emailcheck"></div>
              
            </div>
            <div class="form-group">
              <label class="control-label col-sm-2" for="sample6_postcode">우편번호</label>
              <div class="col-sm-1">          
                <input type="text" class="form-control" 
                 name="postcode" id="sample6_postcode" value="${dto.postcode}">
              </div>
              
              <button type="button" class="btn btn-default"
              onclick="sample6_execDaumPostcode()">주소검색</button>
              
            </div>
            <div class="form-group">
              <label class="control-label col-sm-2" for="sample6_address">주소</label>
              <div class="col-sm-6">          
                <input type="text" class="form-control" id="sample6_address" 
                value="${dto.address1}" 
                 name="address1">
                <input type="text" class="form-control" id="sample6_detailAddress" 
                value="${dto.address2}" 
                 name="address2">
              </div>
            </div>
            
            
            <div class="form-group">
              <label class="control-label col-sm-2" for="favteam">응원구단 선택</label>
              <div class="col-sm-6" >          
                <select class="form-control" name="favteam" id="favteam" style="width:37%; height:30px;">
		        <option value="없음">없음</option>
		        <option value="NC 다이노스">NC 다이노스</option>
		        <option value="두산 베어스">두산 베어스</option>
		        <option value="KT 위즈">KT 위즈</option>
		        <option value="LG 트윈스">LG 트윈스</option>
		        <option value="키움 히어로즈">키움 히어로즈</option>
		        <option value="KIA 타이거즈">KIA 타이거즈</option>
		        <option value="Lotte 자이언츠">Lotte 자이언츠</option>
		        <option value="삼성 라이온즈">삼성 라이온즈</option>
		        <option value="SSG 랜더스">SSG 랜더스</option>
		        <option value="한화 이글스">한화 이글스</option>        
		     	</select>
              </div>
            </div>
            
            
            
            <div class="form-group">        
              <div class="col-sm-offset-2 col-sm-5">
                <button type="submit" class="btn btn-default">수정</button>
                <button type="reset" class="btn btn-default">취소</button>
              </div>
            </div>
          </form>
        
        <br>
        </div>

</body>
</html>
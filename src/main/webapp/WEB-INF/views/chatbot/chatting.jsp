<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Q&A</title>
<link href="/css/style.css" rel="Stylesheet" type="text/css">  <%--/static 폴더 기준 --%>

<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<%-- WebSocket 관련 설정 --%>
<script src="/js/sockjs.min.js"></script>  <%--/static 폴더 기준 --%>
<script src="/js/stomp.min.js"></script>  <%--/static 폴더 기준 --%>

<script type="text/JavaScript" src="/js/app.js"></script>  <%--/static 폴더 기준 --%>

<style>
        #often{
            font-size:20px;
        }
	
	.button {
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

button.btn.btn-default {
  background-color: #00a8d6;
  color: white;
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
button.btn.btn-default:hover {
  background-color: #31373a;
  transition: all ease 0.5s 0s;
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
                    <label for="connect">챗봇 : </label>
                    <button id="connect" class="btn btn-default" type="submit">시작하기</button>
                    <button id="disconnect" class="btn btn-default" type="submit" disabled="disabled">끝내기</button>
                </div>
            </form>
            <form class="form-inline">
                <div class="form-group" style="width: 90%;">
                    <label for="msg">문의 : </label>
<!--                     <input type="text" id="msg" class="form-control" placeholder="내용을 입력하세요." style="width:90%;"> -->
						<select id="msg" class="form-control" name="msg" style="width:90%;">
						<option value="질문을 선택하세요." selected="selected">질문을 선택하세요.</option>
						<option value="야구 일정을 알고 싶어요.">야구 일정을 알고 싶어요.</option>
						<option value="야미의 뜻이 뭔가요?">야미의 뜻이 뭔가요?</option>
						<option value="로그인이 되지 않습니다.">로그인이 되지 않습니다.</option>
						<option value="티켓 양도 거래 중에 사기를 당했을 때는 어떻게 해야 하나요?">티켓 양도 거래 중에 사기를 당했을 때는 어떻게 해야 하나요?</option>
						<option value="고객센터 번호을 알고 싶어요.">고객센터 번호을 알고 싶어요.</option>
				</select>
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
                    <li><a href="#" onclick="q1()">로그인이 되지 않습니다.</a></li>
                    <li><a href="#" onclick="q2()">티켓 양도 거래 중에 사기를 당했을 때는 어떻게 해야 하나요?</a></li>
                    <li><a href="#" onclick="q3()">고객센터 번호을 알고 싶어요.</a></li>
                </div>
</div>

<script>

function q1(){
	alert("아이디/패스워드 찾기로 본인의 계정이 맞는지 확인 하시고, 이후에도 로그인이 안 되실 경우에는 고객센터(02-1234-5678)로 문의 부탁드립니다. ");
}

function q2(){
	alert("계좌이체 내역, 쪽지 내용 등을 캡쳐하셔서 증거물을 확보하신 후에,    경찰(국번없이 112)에 신고하십시오.");
}

function q3(){
	alert("고객센터 번호는 02-1234-5678입니다.");
}
</script>
</body>
</html>
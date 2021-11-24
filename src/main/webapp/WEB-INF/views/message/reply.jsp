<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<c:set var="root" value="${pageContext.request.contextPath }" />    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<script type="text/JavaScript">
        
 function checkIn(f){
       
         if (f.mcontents.value == ""){
              alert("내용을 입력하세요");
              f.mcontents.focus();
              return false;
         }
         
         if (f.receid.value== f.sendid.value){
        	 alert("발신자 , 수신자가 동일 하여 쪽지를 보낼수 없습니다.");
        	 return false;
         }
    
        
 }
 
 

 
 function goBack(){
     window.history.back();
             }




</script>

<title>답장 쓰기</title>

</head>

<body>
<div class="first-widget parallax" id="blog">
		<div class="parallax-overlay">
			<div class="container pageTitle">
				<div class="row">
					<div class="col-md-6 col-sm-6">
						<h2 class="page-title">답장 쓰기</h2>
					</div> <!-- /.col-md-6 -->
					
				</div> <!-- /.row -->
			</div> <!-- /.container -->
		</div> <!-- /.parallax-overlay -->
	</div> <!-- /.pageTitle -->
<br/>
<div class="container">
    <form class="form-horizontal" 
        action="${root }/message/reply"
        method="post"
        onsubmit="return checkIn(this)">
    
    	 <div class="form-group">
        <label class="control-label col-sm-2" for="sendid" style="color: black; font-weight: bolder;">보낸 사람</label>
        <div class="col-sm-8">
            <input type="text" name="sendid" id="sendid" class="form-control" value="${sendid}" readonly> <!--로그인아이디 = sendid 입니다. -->
        </div>
        </div>
    
    
        <div class="form-group">
        <label class="control-label col-sm-2" for="receid" style="color: black; font-weight: bolder;">받는 사람</label>
        <div class="col-sm-8">
            <input type="text" name="receid" id="receid" class="form-control" value="${param.receid}" readonly> <!--read 부분에서  파라미터로 보낸 (보낸사람 아이디)를 가져온다. (보낸사람에게 답장) -->
        </div>
        </div>
    
        <div class="form-group">
        <label class="control-label col-sm-2" for="mcontents" style="color: black; font-weight: bolder;">내용</label>
        <div class="col-sm-8">
        <textarea rows="12" cols="7" id="mcontents" name="mcontents" class="form-control"></textarea>
        </div>
        </div>
           
        <div class="form-group">
        <div class="col-sm-offset-2 col-sm-5">
        <button class="btn btn-default">보내기</button>
        <button type="reset" class="btn btn-default2" onclick="goBack();">취소</button>
        </div>
    </div>
    </form>
    </div>

</body>
</html>
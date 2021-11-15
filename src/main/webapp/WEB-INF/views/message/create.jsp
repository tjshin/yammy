<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<c:set var="root" value="${pageContext.request.contextPath }" />    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<script type="text/JavaScript">
        
 function checkIn(f){
         if (f.receid.value == ""){
              alert("보낼사람을 입력하세요");
              f.receid.focus()
              return false;
         }
         if (f.mcontents.value == ""){
              alert("내용을 입력하세요");
              f.mcontents.focus();
              return false;
         }
    
        
 }
 
 <%
	request.setCharacterEncoding("UTF-8");
String sendid= request.getParameter("sendid"); //컨트롤러(model.addAttribute("sendid", sendid);) 지정한 sendid 값을  view 페이지로 가져온다.
%>


</script>

<title>쪽지 하기</title>

</head>

<body>

<div class = first-widget>  </div>
<div class="container">
    <h1 class="col-sm-offset-2 col-sm-10">쪽지 보내기</h1>
    <form class="form-horizontal" 
        action="${root }/message/create"
        method="post"
        onsubmit="return checkIn(this)">
    
    	 <div class="form-group">
        <label class="control-label col-sm-2" for="sendid" style="color: black; font-weight: bolder;">보내는 사람</label>
        <div class="col-sm-8">
       <input type="text" name="sendid" id="sendid" class="form-control" value="${sendid}" readonly> <!--로그인아이디 = sendid 입니다. -->
       		
        </div>
        </div>
    
    
        <div class="form-group">
        <label class="control-label col-sm-2" for="receid" style="color: black; font-weight: bolder;">받는 사람</label>
        <div class="col-sm-8">
            
            <input type="text" name="receid" id="receid" class="form-control"> <!--read 부분에서 작성자 id 값을 보내준다. -->
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
        <button class="btn btn-primary">보내기</button>
        <button type="reset" class="btn">취소</button>
        </div>
    </div>
    </form>
    </div>


<!-- body 부분 끝 -->
    <!-- Scripts -->
	<script src="js/min/plugins.min.js"></script>
	<script src="js/min/medigo-custom.min.js"></script>


</body>
</html>
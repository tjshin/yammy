<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:set var="root" value="${pageContext.request.contextPath }" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
function createM(){
    var url = "${root }/message/ticketmessage";
    url +="?receid=${dto.id}";
    url +="&ticketno=${dto.ticketno}";
    location.href=url;
  }
</script>

</head>
<body>
<div class = first-widget>  </div>

    <div class="container">
        <div class="row">
        <div class="col-sm-3">
        <img class="img-rounded" src="/ticket/storage/${dto.filename}" style="width:729px">
      
        </div>
        </div>
    
    <br>
    <br>
    
    
        <div class="row">
        <span>
    <img class="img-circle" src="/member/storage/${dto.mfilename}"  style="width: 80px">
                 <!--                     프로필 이미지 경로 변경 -->          
        </span>
    
   
    <p style ="color: #ff8c00">${dto.nick}  
    
    
         
    </p>
    <p style="color:black; font-size: 35px;" >${dto.stadium}</p> 
    

    <form method ="post" action ="${root }/message/ticketmessage" >
	<input type= "hidden" name ="ticketno" id="ticketno" class="form-control"  value="${dto.ticketno}">
	
    <button type="button" class="btn btn-success" onclick="createM()">쪽지 보내기</button>
   
   </form>
   
    <br>
<%--     <p>등록 날짜 :${dto.ticketdate} </p> --%>
<!--     </span> -->
<!--    </div> -->
    
    
    <div class="row">
    <div class="col-sm-1">
        <hr width =740px>
    </div>
    </div>
    
    
    <div class="row">
        <div class="col-sm-6">
        <p style="font-size: 20px; color:black;" id="title">제목: ${dto.tickettitle} </p> 
        <br>
    
        
         <p>${dto.ticketcontents} </p> 
        
        
        
         <br><br><br><br><br>
         <p style="font-size: 15px; color:#0C090A;">거래/양도 장소: ${dto.location} </p> 
         
         <p style="font-size: 15px; color:#0C090A;">경기 날짜: ${dto.gamedate} </p> 
   
    <hr width =740px>
    <br>
    <br>
    
    </div>
    </div>
    </div>
    </div>


</body>
</html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="util" uri="/ELFunctions"%>

<c:set var="root" value="${pageContext.request.contextPath }" />


<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>쪽지 읽기</title>
<meta charset="utf-8">

  
<script type="text/javascript">
        function replyM(){
        	var url = "${root }/message/reply";
        	url +="?receid=${dto.sendid}";
            location.href=url;
        }
        
        function deleteM(){
          var url = "${root }/message/rdelete";
          url += "?messageno=${dto.messageno}";
          location.href=url;
        } 
       function listM(){
            var url = "${root }/message/recelist";
            url += "?nowPage=${param.nowPage}";
            url += "&col=${param.col}";
            url += "&word=${param.word}";
            location.href = url;
                    }
       
       
       function  ticketdetailM(){
           var url = "${root }/ticket/detail?ticketno=${dto.meticketno}";
          
           location.href = url;
                   }
       
    </script>
  
</head>




<body>

<div class = first-widget>  </div>

<div class="container">

		<h2>쪽지 읽기</h2>
		<div class="panel panel-default">
			<div class="panel-heading">보낸사람</div>
			<div class="panel-body">${dto.sendid}</div>

            <div class="panel-heading">내용</div>
			<div class="panel-body">${dto.mcontents}</div>
            
            <div class="panel-heading">보낸 시간 </div>
			<div class="panel-body">${dto.mdate}</div>

		
		

		</div>
		<div>
		         
				<button type="button" class="btn" onclick="replyM()">답장</button>
				<button type="button" class="btn" onclick="deleteM()">삭제</button>
				<button type="button" class="btn" onclick="listM()">목록</button>
				<c:if test = "${dto.meticketno gt 0}"> 
				<button type="button" class="btn" onclick="ticketdetailM()">해당 게시물 이동</button>
				</c:if>
		</div>
	</div>
	<script src="js/min/plugins.min.js"></script>
	<script src="js/min/medigo-custom.min.js"></script>
</body>
</html>
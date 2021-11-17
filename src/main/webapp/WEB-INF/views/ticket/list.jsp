<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="util" uri="/ELFunctions" %>


<c:set var="root" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
		body {
		font-family: "Helvetica Nene", Helvetica, Arial, sans-serif;
		}

		.txt_line {
			
			white-space : nowrap; 
			overflow: hidden; 
			text-overflow: ellipsis;

  }
	</style>
</head>
<body>
<div class = first-widget>  </div>
<div class="container">
        <h3> 티켓 목록</h3>
		
	<!-- 참조 : member/list-->
	<form class="form-inline" action="${root }/ticket/list">
	
	<!-- select으로 닉네임 , 구장 선택-->
	<div class="form-group">
		<select name="col" class="form-control">
		  <option value="nick"
		<c:if test="${col=='nick' }">selected</c:if>
		>닉네임</option>
		<option value="stadium"
		<c:if test="${col=='stadium' }">selected</c:if>
		>지역</option>
		<option value="total"
		<c:if test="${col=='total' }">selected</c:if>
		>전체출력</option>
		</select>
	</div>

	<!-- 검색 input + 등록 button-->
	<div class="form-group">
		<input type="text" class="form-control" name="word" required="required" value="${word}">
	</div>
		<button class="btn btn-info">검색</button>
		<button class="btn btn-default" type="button" 
		onclick="location.href='#'">등록</button>

</form>

	<!-- 참조 : contents/mainlist-->

	<c:choose>   
        <c:when test="${empty list}"> <!-- 목록이 비어 있을경우-->
        <div class="row">
        <h2>등록 된 티켓 목록이 없습니다.</h2> 
        </div>
        </c:when>
        
        <c:otherwise>
        <c:set var="list" value="${list}"/>
        <div class="row">
            <c:forEach var="dto" begin="0" end="3" items="${list}">
            <div class="col-sm-3">

            <a href="${root }/ticket/detail?ticketno=${dto.ticketno}">
            <p>
            <img src="${root }/ticket/${dto.filename}" class="img-thumbnail"  width="236" height="306">
            </p>
            </a>
			<!-- 스크립트 주석 /contents/storage/${dto.filename }     -->
            
       		<div class ="txt_line">

					<p>
						<b>${dto.stadium}</b><br>
						${dto.tickettitle}<br>
						${dto.nick}
					 
					</p>
			</div>
            </div>
            </c:forEach>
        </div>
        
        <div class="row">
            <c:forEach var="dto" begin="4" end="7" items="${list}">
            <div class="col-sm-3">
            
            <a href="${root }/ticket/detail?ticketno=${dto.ticketno}">
            <p><img src="${root }/ticket/${dto.filename}" class="img-thumbnail"  width="236" height="306"></p></a>
           <div class ="txt_line">

					<p>
						<b>${dto.stadium}</b><br>
						${dto.tickettitle}<br>
						${dto.nick}
					 
					</p>
			
			</div>
            </div>
            </c:forEach>
        </div>
        ${paging}  <!--페이징 관련  -->
        </c:otherwise>
        </c:choose>
        </div>


</body>
</html>
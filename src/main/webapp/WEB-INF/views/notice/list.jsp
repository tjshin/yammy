<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="util" uri="/ELFunctions" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<title>공지사항</title>
   
	
	<script type="text/javascript">
     function read(noticeno){
       var url = "/notice/read";
       url += "?noticeno="+noticeno;
       url += "&col=${col}";
       url += "&word=${word}";
       url += "&nowPage=${nowPage}";
       location.href=url;
     }  
  </script>
  
  <style>
  table{
   text-align:center;
  }
  
  th{
   text-align:center;
  }
  </style>
    
</head>
<body>
<div class="first-widget parallax" id="blog">
		<div class="parallax-overlay">
			<div class="container pageTitle">
				<div class="row">
					<div class="col-md-6 col-sm-6">
						<h2 class="page-title">공지사항</h2>
					</div> <!-- /.col-md-6 -->
				</div> <!-- /.row -->
			</div> <!-- /.container -->
		</div> <!-- /.parallax-overlay -->
	</div> <!-- /.pageTitle -->
	<div class="container">
        <br>
       <form class="form-inline" action="${root }/notice/list">
         <div class="form-group">
           <select class="form-control" name="col">
             <option value="ntitle"
             <c:if test= "${col=='ntitle'}"> selected </c:if>
             >제목</option>
             <option value="ncontents"
             <c:if test= "${col=='ncontents'}"> selected </c:if>
             >내용</option>
             <option value="ntitle_ncontents"
             <c:if test= "${col=='ntitle_ncontents'}"> selected</c:if>
             >제목+내용</option>
             <option value="total"
             <c:if test= "${col=='total'}"> selected </c:if>
             >전체출력</option>       
          </select>
         </div>
         <div class="form-group">
           <input type="text" class="form-control" placeholder="Enter 검색어" 
           name="word" value="${word}">
         </div>
         <button type="submit" class="btn btn-default" >검색</button>
         <c:choose>
         <c:when test="${not empty sessionScope.id && sessionScope.grade == 'A'}">
         <button type="button" class="btn btn-default" onclick="location.href='/admin/notice/create'">등록</button>
         </c:when>
         </c:choose>
       </form>
         
       
       <table class="table table-striped">
        <thead>
         <tr>
         <th>번호</th>
         <th>제목</th>
         <th>작성자</th>
         <th>등록날짜</th>
         <th>조회수</th>
         </tr>
        </thead>
        <tbody>
      
     <c:choose>   
     <c:when test="${empty list}">
        <tr><td colspan="6">등록된 글이 없습니다.</td></tr>
     </c:when>
     
     
     <c:otherwise>
        <c:forEach var="dto" items="${list}"> 
        
        <tr>
         <td>${dto.noticeno}</td>
         <td>
         <a href="javascript:read('${dto.noticeno}')">${dto.ntitle}</a>
      
         <c:if test="${util:newImg(fn:substring(dto.ndate,0,10)) }">
              <img src="${root}/images/new.gif"> 
         </c:if>
      
         </td>
         <td>${dto.id}</td>
         <td>${dto.ndate}</td>
         <td>${dto.nview}</td>
        </tr>
        </c:forEach>
        </c:otherwise>
        </c:choose>
      
        </tbody>
       		
       </table>
       <div> ${paging}</div>
					
</div> 
		
			


</body>
</html>
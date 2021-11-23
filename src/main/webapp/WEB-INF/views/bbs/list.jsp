<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="util" uri="/ELFunctions"%>
<c:set var="root" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<title>게시판목록</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
  
   <script type="text/javascript">
     function read(bbsno){
       var url = "read";
       url += "?bbscate=${bbscate}";
       url += "&bbsno="+bbsno;       
       url += "&col=${col}";
       url += "&word=${word}";
       url += "&nowPage=${nowPage}";
       location.href=url;
 
     }
     
     function fileDown(filename){
         var url = "fileDown";
         url += "?filename="+filename;
         location.href=url;
        }
     </script>
</head>
<body>

<div class = first-widget> </div>
<div class="container">
 
  <h2>${bbscate} 게시판</h2>		
		
		
		<br>

		<form class="form-inline" action="/bbs/list">
			<div class="form-group">
				<select class="form-control" name="col">
					<option value="" <c:if test="${col=='nick'}"> selected </c:if>
						>닉네임</option>
					<option value="btitle" <c:if test="${col=='btitle'}"> selected </c:if>
						>제목</option>
					<option value="bcontents" <c:if test="${col=='bcontents'}"> selected </c:if>
						>내용</option>
					<option value="title_content" <c:if test="${col=='title_content'}"> selected</c:if>
						>제목+내용</option>
				</select>
			</div>
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Enter 검색어" name="word" value="${word}">
				<input type="hidden" class="form-control" name="bbscate" value="${bbscate}">
			</div>
			<button type="submit" class="mainBtn">검색</button>

		</form>
		
		<div class="row">
 
 
 <table class="table table-striped">
   <thead>
    <tr>
    <th>글번호</th>
    <th>머릿말</th>
    <th>제목</th>
    <th>글쓴이</th>
    <th>날짜</th>
    <th>조회</th>
    <th>추천</th>
    </tr>
   </thead>
   
   <tbody>
 

  <c:forEach var="dto" items="${list}"> 
  <script>console.log(dto.bbsno)</script>
 <tr>
    <td>${dto.bbsno}</td>
    <td>${dto.bcname}</td>
    <td><a href="javascript:read('${dto.bbsno}')">${dto.btitle}</a></td>
    <td>${dto.nick}</td>
    <td>${dto.bdate}</td>
    <td>${dto.bview}</td>
    <td></td>
    
   </tr>
 </c:forEach>
  

   </tbody>
   
  </table>
  
  </div>
  <div>
      <button type="button" class="mainBtn" onclick="location.href='/bbs/create?bbscate=${param.bbscate}'">등록</button>
<button type="button" class="mainBtn" onclick="location.href='../bbs/bestlist'">인기글</button>

</div>
</form>
  <div>
      ${paging}
  </div>
</div>

		
</body>
</html>
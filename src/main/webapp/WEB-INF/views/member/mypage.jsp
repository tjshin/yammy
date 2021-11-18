<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.*,com.study.member.*" %>
<%@ taglib prefix="util" uri="/ELFunctions" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>회원 정보</title>
    <meta name="keywords" content="">
	<meta name="description" content="">
    <meta name="author" content="templatemo">

<style>
	table, th, tr{
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
						<h2 class="page-title">${mdto.mname} 님의 마이페이지</h2>
					</div> <!-- /.col-md-6 -->
					
				</div> <!-- /.row -->
			</div> <!-- /.container -->
		</div> <!-- /.parallax-overlay -->
	</div> <!-- /.pageTitle -->

    <div class="container">
        <div class="row">
        <div class="col-sm-10">
        <h3><span class="glyphicon glyphicon-user"></span></h3>
        <img class="img-rounded" src="${root }/member/${mdto.filename}" style="width:200px"><br/>
        <a href="/member/updateFile?oldfile=${mdto.filename}">사진 수정</a>
          <div class="caption">
          <p></p>
          <p>ID : ${mdto.id}</p>
          <p>성명 : ${mdto.mname}</p>
          <P>닉네임 : ${mdto.nick}</P>
          <P>이메일 : ${mdto.email }</P>
          <P>연락처 : ${mdto.phone }</P>
          <p>주소 : (${mdto.postcode })${mdto.address1 }  ${mdto.address2}</p>
          <P>포인트 : ${mdto.point }</P>
          <P>응원구단 : ${mdto.favteam }</P>
        </div>
        <div class="col-sm-offset-0 col-sm-20">
		<a href="${root }/message/recelist" class="main-button accent-color">받은 쪽지함</a>
		<a href="${root }/message/sendlist" class="main-button accent-color">보낸 쪽지함</a>
		<a href="${root }/message/create" class="main-button accent-color2">쪽지 쓰기</a>
		</div>
        </div>
        </div>
      

      <div class="col-md-8 blog-posts">
        <div class="row">
            <div class="col-md-12">
                
                <div class="post-blog">
                </div> <!-- /.post-blog -->

                <div class="post-blog">
                    <div class="blog-content">
                    <h3 style="">내가 쓴 게시물</h3>
                    
                    <form class="form-inline" action="${root }/member/mypage">
         <div class="form-group">
           <select class="form-control" name="col">
             <option value="btitle"
             <c:if test= "${col=='btitle'}"> selected </c:if>
             >제목</option>
             <option value="bcontents"
             <c:if test= "${col=='bcontents'}"> selected </c:if>
             >내용</option>
             <option value="btitle_bcontents"
             <c:if test= "${col=='btitle_bcontents'}"> selected</c:if>
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
       </form>
                    
                    
                     <table class="table table-striped">
   <thead>
    <tr>
    <th>제목</th>
    <th>등록날짜</th>
    <th>조회수</th>
    <th>수정</th>
    <th>삭제</th>
    </tr>
   </thead>
   
   <tbody>
   
   
<c:choose>   

<c:when test="${empty bdto}">
   <tr><td colspan="6">등록된 글이 없습니다.</td>
</c:when>

<c:otherwise>
   <c:forEach var="bdto" items="${bdto}"> 
   <tr>
    <td>[${bdto.bcate}]   <a href="javascript:read('${bdto.bbsno}')">    ${bdto.btitle}</a>
    <c:if test="${util:newImg(fn:substring(bdto.bdate,0,10)) }">
         <img src="${pageContext.request.contextPath}/images/new.gif"> 
    </c:if>
    </td>
    <td>${bdto.bdate}</td>
    <td>${bdto.bview}</td>
    <td style="font-size:20px;"><a href="${root }/bbs/delete?bbsno=${bdto.bbsno }"><img src="${root }/images/edit-solid.svg" style="width:15px;"></a></td>
    <td style="font-size:20px;"><a href="${root }/bbs/delete?bbsno=${bdto.bbsno }"><img src="${root }/images/trash-alt-solid.svg" style="width:13px;"></a></td>
   </tr>
   </c:forEach>
   </c:otherwise>
   </c:choose>
   </tbody>
  
  </table>

                       
${mpaging}

                    </div> <!-- /.blog-content -->
                </div> <!-- /.post-blog -->
                
            </div> <!-- /.col-md-12 -->
            
        </div> <!-- /.row -->
    </div> <!-- /.col-md-8 -->
</div>




</body>
</html>
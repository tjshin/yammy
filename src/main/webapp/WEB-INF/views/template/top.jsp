<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
 <c:choose>
    <c:when test="${not empty sessionScope.id && sessionScope.grade == 'A'}">
        <c:set var="str">관리자 페이지 입니다.</c:set>
    </c:when>
    <c:when test="${not empty sessionScope.id && sessionScope.grade != 'A'}">
        <c:set var='str'>안녕하세요  ${sessionScope.id } 님!</c:set>
    </c:when>
    <c:otherwise>
        <c:set var="str">기본 페이지 입니다.</c:set>
    </c:otherwise>
</c:choose>
<!DOCTYPE html> 
<html> 
<head>
  <title>memo</title>
  <meta charset="utf-8">
<!--   viewport는 디바이스 크기에 따라 화면이 달라짐 -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <style type="text/css">
  #grade{
  
   color :white;
  }  
  </style>
  
  
</head>
<body> 
<!--상단메뉴-->
<div class="container-fluid">
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="${root}/">Shop</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="${root}/">Home</a></li>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Product
        <span class="caret"></span></a>
        <ul class="dropdown-menu" id="pmenu">
        </ul>
      </li>
            <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">community
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="${root}/member/mypage">Mypage</a></li>
          <li><a href="${root}/review/list">Review</a></li>
          <li><a href="${root}/notice/list">Notice</a></li>
          <li><a href="#">Q&A</a></li>
        </ul>
      </li>
      <li class="active"><a href="${root}/chatbot/naver_chatting">1:1문의(챗봇)</a></li>
    <li><a id="grade"><span class="glyphicon glyphicon-grain"></span> ${str}</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
     <c:choose>
    <c:when test="${empty sessionScope.id }">
      <li><a href="${root}/member/agree"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="${root}/member/login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
          </c:when>
              <c:when test="${not empty sessionScope.id && sessionScope.grade == 'A'}">
    <li><a href="${root}/admin/contents/create"><span class="glyphicon glyphicon-plus-sign"></span> 상품등록</a></li>
    <li><a href="${root}/admin/contents/list"><span class="glyphicon glyphicon-list"></span> 상품목록</a></li>
    <li><a href="${root}/admin/list"><span class="glyphicon glyphicon-list"></span> 회원목록</a></li>
    <li><a href="${root}/member/logout"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
    </c:when>
    <c:otherwise>
    <li><a href="${root}/cart/list"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
    <li><a href="${root}/member/update"><span class="glyphicon glyphicon-edit"></span> 회원수정</a></li>
    <li><a href="${root}/member/logout"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
        </c:otherwise>
    </c:choose> 
    
    </ul>
  </div>
</nav>
 
</div>
</body>
</html>
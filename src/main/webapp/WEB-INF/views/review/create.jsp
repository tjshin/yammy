<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />


<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no, maximum-scale=1">
<title>review create test</title>

<script type="text/javascript" src="${root }/ckeditor/ckeditor.js"></script>
  <script type="text/JavaScript">
 $(function() {
	 CKEDITOR.replace('hcontents');// <TEXTAREA>태그 id 값
	 });
 
 function checkIn(f){
     if (f.htitle.value == ""){
             alert("리뷰 제목을 입력하세요.");
             f.htitle.focus()
             return false;
     }
     if (CKEDITOR.instances['hcontents'].getData() == '') {
         window.alert('내용을 입력해 주세요.');
         CKEDITOR.instances['hcontents'].focus();
         return false;
     }
     if (document.getElementById('stadium').value == '0') {
    	 window.alert('주변 지역을 선택해 주세요.');
    	 f.stadium.focus()
    	 return false;
     }
     
 }
</script>


</head>
<body>

<div class="first-widget parallax" id="blog">
        <div class="parallax-overlay">
            <div class="container pageTitle">
                <div class="row">
                    <div class="col-md-6 col-sm-6">
                        <h2 class="page-title">리뷰 등록</h2>
                    </div> <!-- /.col-md-6 -->
                    <div class="col-md-6 col-sm-6 text-right">
                    </div> <!-- /.col-md-6 -->
                </div> <!-- /.row -->
            </div> <!-- /.container -->
        </div> <!-- /.parallax-overlay -->
    </div> <!-- /.pageTitle -->


    <section class="cta clearfix">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <a href="${root }/sikdang/map_search" class="main-button accent-color">
                        <i class="icon-button fa fa-arrow-left"></i>
						&nbsp;&nbsp; 식당 다시 검색하기</a>
                    
                </div> <!-- /.col-md-12 -->
            </div> <!-- /.row -->
        </div> <!-- /.container -->
    </section> <!-- /.cta -->
    
    <div class="container">

        <form class="form-horizontal" action="${root }/review/create" method="post" onsubmit="return checkIn(this)">
        <input type="hidden" name="sikid" value="${sdto.sikid }">
        
        
            <br>            
            <div class="form-group">
                <label class="control-label col-sm-2" for="sikname">식당 상호명</label>
                <div class="col-sm-8">
                    <input type="text" name="sikname" id="sikname" class="form-control" 
                    value="${sdto.sikname }" readonly/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="roadadd">도로명 주소</label>
                <div class="col-sm-8">
                    <input type="text" name="roadadd" id="roadadd" class="form-control"
                    value="${sdto.roadadd }" readonly/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="jibunadd">지번 주소</label>
                <div class="col-sm-8">
                    <input type="text" name="jibunadd" id="jibunadd" class="form-control"
                    value="${sdto.jibunadd }" readonly/>
                </div>
            </div>
            <hr>

            <div class="form-group">
                <label class="control-label col-sm-2" for="stadium">지역 선택</label>
                <div class="col-sm-5">
                    <select class="form-control" id="stadium" name="stadium">
                        <option value="0" selected>지역을 선택하세요</option>
                        <option value="1" <c:if test="${stadium==1}"> selected </c:if>
                            >잠실(LG/두산)</option>
                        <option value="2" <c:if test="${stadium==2}"> selected </c:if>
                            >고척(키움)</option>
                        <option value="3" <c:if test="${stadium==3}"> selected </c:if>
                            >인천(SSG)</option>
                        <option value="4" <c:if test="${stadium==4}"> selected </c:if>
                            >수원(KT)</option>
                        <option value="5" <c:if test="${stadium==5}"> selected </c:if>
                            >대전(한화)</option>
                        <option value="6" <c:if test="${stadium==6}"> selected </c:if>
                            >광주(KIA)</option>
                        <option value="7" <c:if test="${stadium==7}"> selected </c:if>
                            >대구(삼성)</option>
                        <option value="8" <c:if test="${stadium==8}"> selected </c:if>
                            >창원(NC)</option>
                        <option value="9" <c:if test="${stadium==9}"> selected </c:if>
                            >사직(롯데)</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="htitle">리뷰 제목</label>
                <div class="col-sm-8">
                    <input type="text" name="htitle" id="htitle" class="form-control">
                </div>
            </div>
            

            <div class="form-group">
                <label class="control-label col-sm-2" for="hcontents">내용</label>
                <div class="col-sm-8">
                    <textarea rows="12" cols="7" id="hcontents" name="hcontents"
                        class="form-control"></textarea>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2" for="star">별점</label>
                <div class="col-sm-5">
                	<div><input type="radio" id="star" name="star" value="5" checked>
                	<label for="star">★★★★★</label></div>
                	<div><input type="radio" id="star" name="star" value="4">
                	<label for="star">★★★★</label></div>
                	<div><input type="radio" id="star" name="star" value="3">
                	<label for="star">★★★</label></div>
                	<div><input type="radio" id="star" name="star" value="2">
                	<label for="star">★★</label></div>
                	<div><input type="radio" id="star" name="star" value="1">
                	<label for="star">★</label></div>
                
                    
                </div>
            </div>
            
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-5">
                    <button class="btn btn-default" type="submit">등록</button>
                    <button type="reset" class="btn btn-default2">취소</button>
                </div>
            </div>
        </form>
    </div>
    
    

</body>
</html>
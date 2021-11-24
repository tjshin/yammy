<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>식당 검색하기</title>
    <link href="${root }/css/map_search.css" rel="stylesheet" type="text/css">
</head>
<body>


<div class="first-widget parallax" id="blog">
        <div class="parallax-overlay">
            <div class="container pageTitle">
                <div class="row">
                    <div class="col-md-6 col-sm-6">
                        <h2 class="page-title">식당 검색, 추가</h2>
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
                    <a href="${root }/sikdang/map_main" class="main-button accent-color">
                        <i class="icon-button fa fa-arrow-left"></i>
                        &nbsp;&nbsp; 전체 지도로 돌아가기</a>
                    <a href="${root }/review/list" class="main-button accent-color">
                        <i class="icon-button fa fa-arrow-left"></i>
                        &nbsp;&nbsp; 리뷰 목록으로 돌아가기
                    </a>
                </div> <!-- /.col-md-12 -->
            </div> <!-- /.row -->
        </div> <!-- /.container -->
    </section> <!-- /.cta -->
	
<div class="map_wrap" style="width: 90%; margin: 0 auto;">
<br><br>
    <div id="map" style="width:100%;height:400px;position:relative;overflow:hidden;"></div>

   
</div>
 <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                    키워드 : <input type="text" value="잠실 야구장 주변 삼겹살" id="keyword" size="60"> 
                    <button class="btn btn-default" type="submit">검색하기</button> 
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=763a821d2c1a10416e3b6d12208ed9c0&libraries=services"></script>
<script type="text/javascript" src="${root }/js/map_search.js">
// 	이 javascript 파일은 키워드로 장소를 검색하는 카카오 API 예제를 수정했습니다.
// 	키워드로 식당을 검색하고, 목록에서 해당 식당의 버튼을 누르면 
// 	API로부터 식당 정보를 프로젝트 DB에 레코드로 저장하고,
// 	해당 식당에 리뷰를 작성(create)하는 페이지로 넘어갑니다.
// 	places.id를 pk로 정했습니다. by 신태진
</script>
</body>
</html>
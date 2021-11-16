<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no, maximum-scale=1">
<title>경기장 주변 맛집 | 전체 지도</title>




<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=763a821d2c1a10416e3b6d12208ed9c0"></script>

<style type="text/css">
#wrap .buttons {
	position: absolute;
	top: 0;
	left: 0;
	z-index: 1000;
	padding: 5px;
}

#wrap .buttons .control-btn {
	margin: 0 5px 5px 0;
}
</style>



</head>

<body>


	<div class="first-widget parallax" id="blog">
		<div class="parallax-overlay">
			<div class="container pageTitle">
				<div class="row">
					<div class="col-md-6 col-sm-6">
						<h2 class="page-title">경기장 주변 맛집</h2>
					</div>
					<!-- /.col-md-6 -->
					<div class="col-md-6 col-sm-6 text-right">
						<span class="page-location">Home / 경기장 주변 맛집</span>
					</div>
					<!-- /.col-md-6 -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container -->
		</div>
		<!-- /.parallax-overlay -->
	</div>
	<!-- /.pageTitle -->

	<section class="cta clearfix">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<a href="${root }/review/list" class="main-button accent-color">리뷰 목록 보러가기<i
						class="icon-button fa fa-arrow-right"></i></a>
					<a href="${root }/sikdang/map_search"
						class="main-button accent-color">리뷰 등록하러 가기<i
						class="icon-button fa fa-arrow-right"></i></a>
				</div>
				<!-- /.col-md-12 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</section>
	<!-- /.cta -->


	<article>
		<div id="wrap" class="section" style="width: 90%; margin: 0 auto;">
			<h2>구장별 지도 이동</h2>
			<p>각 구장별 버튼을 누르면 해당 지역 주변으로 지도를 이동합니다</p>

			<div id="map" style="width: 100%; height: 600px; margin: 0 auto;">
				<!--  style="width:100%;height:600px;margin:0 auto; -->
				<div class="buttons">
					<input id="to-jamsil" type="button" value="잠실(LG/두산)"
						class="control-btn" /> <input id="to-gocheok" type="button"
						value="고척(키움)" class="control-btn" /> <input id="to-incheon"
						type="button" value="인천(SSG)" class="control-btn" /> <input
						id="to-suwon" type="button" value="수원(KT)" class="control-btn" />
					<input id="to-daejeon" type="button" value="대전(한화)"
						class="control-btn" /> <input id="to-gwangju" type="button"
						value="광주(KIA)" class="control-btn" /> <input id="to-daegu"
						type="button" value="대구(삼성)" class="control-btn" /> <input
						id="to-changwon" type="button" value="창원(NC)" class="control-btn" />
					<input id="to-sajik" type="button" value="사직(롯데)"
						class="control-btn" />
				</div>

			</div>
			<code id="snippet" class="snippet"></code>
		</div>
		
		<script type="text/javascript" src="${root }/js/map_main.js">
// 			이 javascript 파일은 지도에 각 구단 엠블렘을 마커로 표시하고,
// 			버튼을 눌렀을 때 해당 구장의 지도를 보여줍니다. by 신태진
		</script>
		<script type="text/javascript">
		var arr = new Array();
		<c:forEach items="${list}" var="dto">
		arr.push("${dto.sikid}");
		arr.push("${dto.sikname}");
		arr.push("${dto.sikphone}");
		arr.push("${dto.roadadd}");
		arr.push("${dto.jibunadd}");
		arr.push("${dto.sikurl}");
		arr.push("${dto.cox}");
		arr.push("${dto.coy}");
		</c:forEach>		  
		</script>
		<script>
			var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
			
			for (var i = 0; i < arr.length; i += 8) {			    
			    var imageSize = new kakao.maps.Size(24, 35); 
			    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
			    
			    var marker = new kakao.maps.Marker({
			        map: map,
			        position: new kakao.maps.LatLng(arr[i+7], arr[i+6]),
			        title : arr[i+1],
			        image : markerImage,
			        clickable: true
			    });
			    
			    var infowindow = new kakao.maps.InfoWindow({
			    	content : '<div style="padding:5px;font-size:14px;width:240px;height:150px;">' +
			    				'<h5>' + arr[i+1] +'</h5>' + 
			    				arr[i+3] + '<br>' + 
			    				arr[i+4] + '<br>' +
			    				arr[i+2] + '<br>' +
			    				'<a href="${root}/review/list?col=sikname&word=' +
			    				arr[i+1] + '">' + 
			    				'리뷰 보러가기</a>' +			    				
			    				'</div>',
			    	removable : true
			    });
			    kakao.maps.event.addListener(marker, 'click', click(map, marker, infowindow));
			    
			    function click(map, marker, infowindow) {
			    	return function() {
			    		infowindow.open(map, marker);
			    	};
			    }
			}
		</script>
		
	</article>

</body>

</html>
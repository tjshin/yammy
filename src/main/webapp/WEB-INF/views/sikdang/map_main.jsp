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
		<div id="wrap" class="section" style="width: 90%; margin: 0 auto;"><br/>
			<p style="font-weight:bold">각 버튼을 누르면 해당 구장의 주변으로 지도가 이동합니다.</p>

			<div id="map" style="width: 100%; height: 600px; margin: 0 auto;">
				<!--  style="width:100%;height:600px;margin:0 auto; -->
				<div class="buttons" style="font-family:arial;font-size:8pt;">
					<input id="to-jamsil" type="button" value="잠실야구장"	class="mainBtn" />
					<input id="to-gocheok" type="button" value="고척스카이돔" class="mainBtn" />
					<input id="to-incheon" type="button" value="인천SSG랜더스필드" class="mainBtn" />
					<input id="to-suwon" type="button" value="수원케이티위즈파크" class="mainBtn" />
					<input id="to-daejeon" type="button" value="한화생명이글스파크" class="mainBtn" />
					<input id="to-gwangju" type="button" value="광주기아챔피언스필드" class="mainBtn" />
					<input id="to-daegu" type="button" value="대구삼성라이온즈파크" class="mainBtn" />
					<input id="to-changwon" type="button" value="창원NC파크" class="mainBtn" />
					<input id="to-sajik" type="button" value="사직야구장" class="mainBtn" />
				</div>

			</div>
			<code id="snippet" class="snippet">마커를 클릭하면 해당 식당의 정보를 볼 수 있습니다</code>
			
			<div id="sikdanglist">
				<br>	
				<div class="row">
				<hr>
					<table class="table table-striped">
				    <thead class="table-head">
				    <tr>
				    <th>상호명</th>
				    <th>작성된 리뷰</th>
				    <th>구장과의 거리(m)</th>
				    </tr>
				    </thead>
				    
				    <tbody class="table-body">				  			   
				    <tr>				    
				    <td>상호명 자리</td>
				    <td>리뷰 목록 a태그</td>
				    <td>거리 자리</td>
				    </tr>
				 
				    </tbody>
				  
				    </table>
				    <hr>				  
					
				</div> <!-- /.row -->
			</div>
		</div>
		<script type="text/javascript">
			var reviewsearch = "<a href='${root}/review/list?col=sikname&word=";
		</script>
		
		<script type="text/javascript" src="${root }/js/mapsikdang/map_main.js">
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
				arr.push("${dto.distance}");
			</c:forEach>		  
		</script>
		<script>
			var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
			
			for (var i = 0; i < arr.length; i += 9) {			    
			    var imageSize = new kakao.maps.Size(24, 35); 
			    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
			    
			    var marker = new kakao.maps.Marker({
			        map: map,
			        position: new kakao.maps.LatLng(arr[i+7], arr[i+6]),
			        title : arr[i+1],
			        image : markerImage,
			        clickable: true
			    });	
			    
			    var copycontent = arr[i+1]\narr[i+3]\narr[i+4]\narr[i+2];
			    			    
			    var infowindow = new kakao.maps.InfoWindow({
			    	content : '<div style="padding:5px;font-size:14px;width:240px;height:220px;">' +
			    				'<h5>' + arr[i+1] +'</h5>' + 
			    				arr[i+3] + '<br>' + 
			    				arr[i+4] + '<br>' +
			    				arr[i+2] + '<br>' +
			    				'<button onclick="copyToClipBoard()">연락처 복사</button><br>' +
			    				'인접 구장과의 거리: ' + arr[i+8] + 'm<br>' + 			    				
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

		    function copyToClipBoard() {
		    	copycontent.select();
		    	document.execCommand('copy');
		    	alert("복사 완료!");
		    }
		</script>
		
	</article>

</body>

</html>
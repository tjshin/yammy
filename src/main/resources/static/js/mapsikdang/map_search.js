// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);
        

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다 
//            console.log(places[i]);
       		
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);
                
        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
			// 마커 누르면 목록으로
			var scroll = '#sikdanglist' + (i + 1);
			// 페이지 내 이동 클릭이벤트			
            kakao.maps.event.addListener(marker, 'click', function() {
                document.location.href = scroll;
            });
            
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });                     

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
            // 목록 누르면 지도로
            itemEl.onclick = function () {
				document.location.href = '#map';
			};
            
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);       
    }     
    
     
                

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {
	// 각 항목 별로 모든 구장과의 거리를 계산 시작!
	var jamsilline = new kakao.maps.Polyline({
		path: [
			new kakao.maps.LatLng(37.5121513808403, 127.071909507224),
			new kakao.maps.LatLng(places.y, places.x)
		]
	});
	var gocheokline = new kakao.maps.Polyline({
		path: [
			new kakao.maps.LatLng(37.4982338495579, 126.867104761712),
			new kakao.maps.LatLng(places.y, places.x)
		]
	});
	var incheonline = new kakao.maps.Polyline({
		path: [
			new kakao.maps.LatLng(37.436998685442084, 126.69327612453377),
			new kakao.maps.LatLng(places.y, places.x)
		]
	});
	var suwonline = new kakao.maps.Polyline({
		path: [
			new kakao.maps.LatLng(37.2997302532973, 127.009772045935),
			new kakao.maps.LatLng(places.y, places.x)
		]
	});
	var daejeonline = new kakao.maps.Polyline({
		path: [
			new kakao.maps.LatLng(36.3170804578898, 127.429163729933),
			new kakao.maps.LatLng(places.y, places.x)
		]
	});
	var gwangjuline = new kakao.maps.Polyline({
		path: [
			new kakao.maps.LatLng(35.16820922209541, 126.88911206152956),
			new kakao.maps.LatLng(places.y, places.x)
		]
	});
	var daeguline = new kakao.maps.Polyline({
		path: [
			new kakao.maps.LatLng(35.8410595632468, 128.681659448344),
			new kakao.maps.LatLng(places.y, places.x)
		]
	});
	var changwonline = new kakao.maps.Polyline({
		path: [
			new kakao.maps.LatLng(35.22242918856418, 128.58209037232203),
			new kakao.maps.LatLng(places.y, places.x)
		]
	});
	var sajikline = new kakao.maps.Polyline({
		path: [
			new kakao.maps.LatLng(35.1940192576625, 129.061550650471),
			new kakao.maps.LatLng(places.y, places.x)
		]
	});
	var lengthlist = [
		jamsilline.getLength(),
		gocheokline.getLength(),
		incheonline.getLength(),
		suwonline.getLength(),
		daejeonline.getLength(),
		gwangjuline.getLength(),
		daeguline.getLength(),
		changwonline.getLength(),
		sajikline.getLength(),
	];
	// 계산된 거리를 배열에 담은 후 최소값 구한다
	var minlength = Math.min.apply(null, lengthlist);
	// 최소값을 switch 조건문에 넣고 인접구장을 번호로 리턴
	switch(minlength) {
		case jamsilline.getLength():
			var nearsta = 1;
			break;
		case gocheokline.getLength():
			nearsta = 2;
			break;
		case incheonline.getLength():
			nearsta = 3;
			break;
		case suwonline.getLength():
			nearsta = 4;
			break;
		case daejeonline.getLength():
			nearsta = 5;
			break;
		case gwangjuline.getLength():
			nearsta = 6;
			break;
		case daeguline.getLength():
			nearsta = 7;
			break;
		case changwonline.getLength():
			nearsta = 8;
			break;
		case sajikline.getLength():
			nearsta = 9;
			break;
		default:
			break;
	}
//	console.log('가까운 구장과의 거리:' + minlength);
//	console.log('가까운 구장 번호:' + nearsta);
	
    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div id="sikdanglist'+ (index+1) + '" class="info">' +
                '   <h5>' + places.place_name + '</h5>';
    


    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';   
      itemStr +='<form class="cta" method="post" action="/sikdang/create">' +
      '<input type="hidden" name="sikid" value="' + places.id + '">' +
      '<input type="hidden" name="sikname" value="' + places.place_name + '">' +
      '<input type="hidden" name="sikphone" value="' + places.phone + '">' +
      '<input type="hidden" name="roadadd" value="' + places.road_address_name + '">' +
      '<input type="hidden" name="jibunadd" value="' + places.address_name + '">' +
      '<input type="hidden" name="sikurl" value="' + places.place_url + '">' +
      '<input type="hidden" name="cox" value="' + places.x + '">' +
      '<input type="hidden" name="coy" value="' + places.y + '">' +
      '<input type="hidden" name="distance" value="' + minlength + '">' +
      '<input type="hidden" name="nearsta" value="' + nearsta + '">' +
      '<button class="mainBtn">' + places.place_name +
      ' 후기 작성하기</button></form>';

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
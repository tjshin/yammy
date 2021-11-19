var container = document.getElementById('map');
			var mapOption = {
				center : new kakao.maps.LatLng(37.51226, 127.07190),
				level : 4
			};
			var map = new kakao.maps.Map(container, mapOption);//지도 생성

			var jamsil = new kakao.maps.LatLng(37.51226, 127.07190), gocheok = new kakao.maps.LatLng(
					37.49818, 126.86698), incheon = new kakao.maps.LatLng(
					37.43674, 126.69331), suwon = new kakao.maps.LatLng(
					37.29976, 127.00967), daejeon = new kakao.maps.LatLng(
					36.31725, 127.42908), gwangju = new kakao.maps.LatLng(
					35.16808, 126.88894), daegu = new kakao.maps.LatLng(
					35.84100, 128.68205), changwon = new kakao.maps.LatLng(
					35.22239, 128.58244), sajik = new kakao.maps.LatLng(
					35.19402, 129.06151);

			$("#to-jamsil").on("click", function(e) {
				e.preventDefault();

				map.setCenter(jamsil);
				map.setLevel(4);
			});
			$("#to-gocheok").on("click", function(e) {
				e.preventDefault();

				map.setCenter(gocheok);
				map.setLevel(4);
			});
			$("#to-incheon").on("click", function(e) {
				e.preventDefault();

				map.setCenter(incheon);
				map.setLevel(4);
			});
			$("#to-suwon").on("click", function(e) {
				e.preventDefault();

				map.setCenter(suwon);
				map.setLevel(4);
			});
			$("#to-daejeon").on("click", function(e) {
				e.preventDefault();

				map.setCenter(daejeon);
				map.setLevel(4);
			});
			$("#to-gwangju").on("click", function(e) {
				e.preventDefault();

				map.setCenter(gwangju);
				map.setLevel(4);
			});
			$("#to-daegu").on("click", function(e) {
				e.preventDefault();

				map.setCenter(daegu);
				map.setLevel(4);
			});
			$("#to-changwon").on("click", function(e) {
				e.preventDefault();

				map.setCenter(changwon);
				map.setLevel(4);
			});
			$("#to-sajik").on("click", function(e) {
				e.preventDefault();

				map.setCenter(sajik);
				map.setLevel(4);
			});

			var lgSrc = '/images/map/emblem_LG.png', lgSize = new kakao.maps.Size(
					64, 41), lgOption = {
				offset : new kakao.maps.Point(32, 20)
			};
			var lgImage = new kakao.maps.MarkerImage(lgSrc, lgSize, lgOption);
			var lg = new kakao.maps.Marker({
				position : new kakao.maps.LatLng(37.51226, 127.07090),
				image : lgImage
			});
			lg.setMap(map);

			var obSrc = '/images/map/emblem_OB.png', obSize = new kakao.maps.Size(
					64, 41), obOption = {
				offset : new kakao.maps.Point(32, 20)
			};
			var obImage = new kakao.maps.MarkerImage(obSrc, obSize, obOption);
			var ob = new kakao.maps.Marker({
				position : new kakao.maps.LatLng(37.51226, 127.07290),
				image : obImage
			});
			ob.setMap(map);

			var woSrc = '/images/map/emblem_WO.png', woSize = new kakao.maps.Size(
					64, 41), woOption = {
				offset : new kakao.maps.Point(32, 20)
			};
			var woImage = new kakao.maps.MarkerImage(woSrc, woSize, woOption);
			var wo = new kakao.maps.Marker({
				position : gocheok,
				image : woImage
			});
			wo.setMap(map);

			var skSrc = '/images/map/emblem_SK.png', skSize = new kakao.maps.Size(
					64, 41), skOption = {
				offset : new kakao.maps.Point(32, 20)
			};
			var skImage = new kakao.maps.MarkerImage(skSrc, skSize, skOption);
			var sk = new kakao.maps.Marker({
				position : incheon,
				image : skImage
			});
			sk.setMap(map);

			var ktSrc = '/images/map/emblem_KT.png', ktSize = new kakao.maps.Size(
					64, 41), ktOption = {
				offset : new kakao.maps.Point(32, 20)
			};
			var ktImage = new kakao.maps.MarkerImage(ktSrc, ktSize, ktOption);
			var kt = new kakao.maps.Marker({
				position : suwon,
				image : ktImage
			});
			kt.setMap(map);

			var hhSrc = '/images/map/emblem_HH.png', hhSize = new kakao.maps.Size(
					64, 41), hhOption = {
				offset : new kakao.maps.Point(32, 20)
			};
			var hhImage = new kakao.maps.MarkerImage(hhSrc, hhSize, hhOption);
			var hh = new kakao.maps.Marker({
				position : daejeon,
				image : hhImage
			});
			hh.setMap(map);

			var htSrc = '/images/map/emblem_HT.png', htSize = new kakao.maps.Size(
					64, 41), htOption = {
				offset : new kakao.maps.Point(32, 20)
			};
			var htImage = new kakao.maps.MarkerImage(htSrc, htSize, htOption);
			var ht = new kakao.maps.Marker({
				position : gwangju,
				image : htImage
			});
			ht.setMap(map);

			var ssSrc = '/images/map/emblem_SS.png', ssSize = new kakao.maps.Size(
					64, 41), ssOption = {
				offset : new kakao.maps.Point(32, 20)
			};
			var ssImage = new kakao.maps.MarkerImage(ssSrc, ssSize, ssOption);
			var ss = new kakao.maps.Marker({
				position : daegu,
				image : ssImage
			});
			ss.setMap(map);

			var ncSrc = '/images/map/emblem_NC.png', ncSize = new kakao.maps.Size(
					64, 41), ncOption = {
				offset : new kakao.maps.Point(32, 20)
			};
			var ncImage = new kakao.maps.MarkerImage(ncSrc, ncSize, ncOption);
			var nc = new kakao.maps.Marker({
				position : changwon,
				image : ncImage
			});
			nc.setMap(map);

			var ltSrc = '/images/map/emblem_LT.png', ltSize = new kakao.maps.Size(
					64, 41), ltOption = {
				offset : new kakao.maps.Point(32, 20)
			};
			var ltImage = new kakao.maps.MarkerImage(ltSrc, ltSize, ltOption);
			var lt = new kakao.maps.Marker({
				position : sajik,
				image : ltImage
			});
			lt.setMap(map);
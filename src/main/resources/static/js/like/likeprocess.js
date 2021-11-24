$(function () {//페이지가 로딩될때

	if(sessionid === '') {
		likeTotal();		
	} else if (sessionid !== ''){
		idCheck();
	}   
});//page loading function end 

class LikeService {
	
	getLikeTotal(param) {
		return new Promise((resolve, reject) => {
			var bbsno = param.bbsno;
			
			$.getJSON("/bbs/like/total/" + bbsno ,
				function (data) {
					resolve(data);
				}
			);
		});
	}
	
	getIdCheck(param) {
		return new Promise((resolve, reject) => {
			var bbsno = param.bbsno;
			var id = param.id;
			
			$.getJSON("/bbs/like/idcheck/" + bbsno + "/" + id ,
				function (data) {
					resolve(data);
				}
			);
		});
	}
	
	add(like) {
        return new Promise((resolve, reject) => {
            console.log("like up...............");
 
            $.ajax({
                type: 'post',
                url: '/bbs/like/create',
                data: JSON.stringify(like),
                contentType: "application/json; charset=utf-8",
                success: function (result, status, xhr) {
 
                    resolve(result);
 
                },
                error: function (xhr, status, er) {
 
                    reject(er);
 
                }
            });
        });
    }
    
    remove(like) {
        return new Promise((resolve, reject) => {
            $.ajax({
                type: 'delete',
                url: '/bbs/like/' + like.bbsno + "/" +  like.id,
                success: function (deleteResult, status, xhr) {
                    resolve(deleteResult);
 
                },
                error: function (xhr, status, er) {
                    reject(er);
 
                }
            });
        });
    }
	
}

const likeService = new LikeService();

function idCheck() {	
	likeService.getIdCheck({ bbsno: bbsno, id: sessionid })
		.then(idCnt => {
			if (idCnt > 0) {
				likeService.getLikeTotal({ bbsno: bbsno })
					.then(likeCnt => {
						let str = "<button class='bbslikeBtn' type='button' id='bbslikeBtn'";
							str += "style='background-color:#00a8d6;";
							str += "border-radius: 50%;";
							str += "width:100px;height:100px;'>";
							str += likeimage + "</button>";
							str += "<div class='like-count'>";
							str += "<h3 style='color:#00a8d6;'>" + likeCnt + "</h3>";
							str += "<br><h3 style='color:#00a8d6;'>추천하셨습니다</h3></div>";
						$(".bbs-like").html(str);
					});			
			} else {
				likeTotal();
			}
		});
}

function likeTotal() {	
	likeService.getLikeTotal({ bbsno: bbsno })
		.then(likeCnt => {
			let str = "<button class='bbslikeBtn' type='button' id='bbslikeBtn'";
				str += "style='background-color:#ffffff;";
				str += "border-radius: 50%;";
				str += "width:100px;height:100px;'>";
				str += likeimage + "</button>";
				str += "<div class='like-count'>";;
				str += "<h3 style='color:#000000;'>" + likeCnt + "</h3><br></div>";
			$(".bbs-like").html(str);
		});
}




$(document).on('click', '.bbslikeBtn', function() {
	var bbslikeBtn = $(this);
	var bgc = bbslikeBtn.css('background-color');
	if (sessionid === '') {
		alert ('로그인이 필요합니다');
	} else {
		if(bgc === 'rgb(255, 255, 255)') {
			
			likeService.add({ bbsno: bbsno, id: sessionid })
					.then(result => {
						if(sessionid === '') {
							likeTotal();		
						} else if (sessionid !== ''){
							idCheck();
						} 
					});			
			alert('추천하셨습니다.');
		
		} else if(bgc === 'rgb(0, 168, 214)') {
			
			likeService.remove({ bbsno: bbsno, id: sessionid })
					.then(result => {
						if(sessionid === '') {
							likeTotal();		
						} else if (sessionid !== ''){
							idCheck();
						} 
					});			
			alert('추천을 취소하셨습니다.');
		
		}	
	}
		
});


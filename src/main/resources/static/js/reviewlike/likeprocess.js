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
			var hugino = param.hugino;
			
			$.getJSON("/review/like/total/" + hugino ,
				function (data) {
					resolve(data);
				}
			);
		});
	}
	
	getIdCheck(param) {
		return new Promise((resolve, reject) => {
			var hugino = param.hugino;
			var id = param.id;
			
			$.getJSON("/review/like/idcheck/" + hugino + "/" + id ,
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
                url: '/review/like/create',
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
                url: '/review/like/' + like.hugino + "/" +  like.id,
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
	likeService.getIdCheck({ hugino: hugino, id: sessionid })
		.then(idCnt => {
			if (idCnt > 0) {
				likeService.getLikeTotal({ hugino: hugino })
					.then(likeCnt => {
						let str = "<button class='reviewlikeBtn' type='button' id='reviewlikeBtn'";
							str += "style='background-color:#00a8d6;";
							str += "border-radius: 50%;";
							str += "width:100px;height:100px;'>";
							str += likeimage + "</button>";
							str += "<div class='like-count'>";
							str += "<h3 style='color:#00a8d6;'>" + likeCnt + "</h3>";
							str += "<br><h3 style='color:#00a8d6;'>추천하셨습니다</h3></div>";
						$(".review-like").html(str);
					});			
			} else {
				likeTotal();
			}
		});
}

function likeTotal() {	
	likeService.getLikeTotal({ hugino: hugino })
		.then(likeCnt => {
			let str = "<button class='reviewlikeBtn' type='button' id='reviewlikeBtn'";
				str += "style='background-color:#ffffff;";
				str += "border-radius: 50%;";
				str += "width:100px;height:100px;'>";
				str += likeimage + "</button>";
				str += "<div class='like-count'>";;
				str += "<h3 style='color:#000000;'>" + likeCnt + "</h3><br></div>";
			$(".review-like").html(str);
		});
}




$(document).on('click', '.reviewlikeBtn', function() {
	var reviewlikeBtn = $(this);
	var bgc = reviewlikeBtn.css('background-color');
	if (sessionid === '') {
		alert ('로그인이 필요합니다');
	} else {
		if(bgc === 'rgb(255, 255, 255)') {
			
			likeService.add({ hugino: hugino, id: sessionid })
					.then(result => {
						if(sessionid === '') {
							likeTotal();		
						} else if (sessionid !== ''){
							idCheck();
						} 
					});			
			alert('추천하셨습니다.');
		
		} else if(bgc === 'rgb(0, 168, 214)') {
			
			likeService.remove({ hugino: hugino, id: sessionid })
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


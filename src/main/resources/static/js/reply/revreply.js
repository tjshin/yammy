console.log("*****Reply Module........");
class ReplyService {
    getList(param) {
        return new Promise((resolve, reject) => {
            var bbsno = param.bbsno;
            var sno = param.sno;
            var eno = param.eno;
            //alert(param.bbsno);
            $.getJSON("/bbs/reply/list/" + bbsno + "/" + sno + "/" + eno ,
                function (data) {
                    //alert(data);
                    resolve(data); // 댓글 목록만 가져오는 경우 
                    //callback(data.total, data.list); //댓글 숫자와 목록을 가져오는 경우 
                }
            );
        });
    }
    
    getTotal(param) {
		return new Promise((resolve, reject) => {
			var bbsno = param.bbsno;
			
			$.getJSON("/bbs/reply/total/" + bbsno ,
				function (data) {
					resolve(data);
				}
			);
		});
	}

    getPage(param) {
        return new Promise((resolve, reject) => {
            $.ajax({
                type: 'get',
                url: "/bbs/reply/page",
                data: param,
                contentType: "application/text; charset=utf-8",
                success: function (result, status, xhr) {
                    resolve(result);

                },
                error: function (xhr, status, er) {
                    reject(er);
                }
            });
        });
    }
    
    add(reply) {
        return new Promise((resolve, reject) => {
            console.log("add reply...............");
 
            $.ajax({
                type: 'post',
                url: '/bbs/reply/create',
                data: JSON.stringify(reply),
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
 
    get(reno) {
        return new Promise((resolve, reject) => {
            $.get("/bbs/reply/" + reno + "", function (result) {
                resolve(result);
            }).fail(function (xhr, status, err) {
                reject(err);
            });
        });
    }
    
    update(reply) {
        return new Promise((resolve, reject) => {
//            console.log("reno: " + reply.reno);
            $.ajax({
                type: 'put',
                url: '/bbs/reply/' + reply.reno,
                data: JSON.stringify(reply),
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
    remove(reno) {
        return new Promise((resolve, reject) => {
            $.ajax({
                type: 'delete',
                url: '/bbs/reply/' + reno,
                success: function (deleteResult, status, xhr) {
                    resolve(deleteResult);
 
                },
                error: function (xhr, status, er) {
                    reject(er);
 
                }
            });
        });
    }

} //class end
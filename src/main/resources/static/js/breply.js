console.log("*****Reply Module........");
class ReplyService {
    getList(param) {
        return new Promise((resolve, reject) => {
            var bbsno = param.bbsno;
            var sno = param.sno;
            var eno = param.eno;
            //alert(param.bbsno);
            $.getJSON("./reply/list/" + bbsno + "/" + sno + "/" + eno ,
                function (data) {
                    //alert(data);
                    resolve(data); // 댓글 목록만 가져오는 경우 
                    //callback(data.replyCnt, data.list); //댓글 숫자와 목록을 가져오는 경우 
                }
            );
        });
    }

    getPage(param) {
        return new Promise((resolve, reject) => {
            $.ajax({
                type: 'get',
                url: "./reply/page",
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
                url: './reply/create',
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
 
    get(rnum) {
        return new Promise((resolve, reject) => {
            $.get("./reply/" + rnum + "", function (result) {
                resolve(result);
            }).fail(function (xhr, status, err) {
                reject(err);
            });
        });
    }
    
    update(reply) {
        return new Promise((resolve, reject) => {
            console.log("rnum: " + reply.rnum);
            $.ajax({
                type: 'put',
                url: './reply/' + reply.rnum,
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
    remove(rnum) {
        return new Promise((resolve, reject) => {
            $.ajax({
                type: 'delete',
                url: './reply/' + rnum,
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
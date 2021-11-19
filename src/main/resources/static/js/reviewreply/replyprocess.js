$(function () {//페이지가 로딩될때
   showList();
   showPage();
});//page loading function end  

let replyUL = $(".chat");
let replyPageFooter = $(".comments-footer");

let param = "nPage=" + nPage;
    param += "&hugino=" + hugino;
    param += "&col=" + colx;
    param += "&word=" + wordx;
    param += "&nowPage=" + nowPage;

const replyService = new ReplyService();

function showList() {
  replyService
    .getList({ hugino: hugino, sno: sno, eno: eno })
    .then(list => {
      let str = ""

      for (var i = 0; i < list.length ; i++) {
        str += "<div class='media-body' data-hugireno='" + list[i].hugireno + "'>";
        str += "<div class='media-heading'><h4>" + list[i].nick + "</h4>";
        str += "<a href='#'><span>" + list[i].hredate + "</span><span>댓글</span></a></div><p>";
        str += replaceAll(list[i].hrecontents, '\n', '<br>') + "</p></div>";
      }

      replyUL.html(str);
    })

}//showList() end

function replaceAll(str, searchStr, replaceStr) {
  return str.split(searchStr).join(replaceStr);
}

function showPage(){
    replyService
   .getPage(param)
   .then(paging => {
      console.log(paging);
      let str = "<div><small class='text-muted'>" + paging + "</small></div>";

      replyPageFooter.html(str);
	});
}



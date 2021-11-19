$(function () {//페이지가 로딩될때
   showList();
   showPage();
});//page loading function end  

let replyUL = $(".blog-comments-content");
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
        str += "<div class='media' data-hugireno='" + list[i].hugireno + "'>";
        str += "<div class='media-body'>";
        str += "<div class='media-heading'><h4>" + list[i].nick + "</h4>";
        str += "<span>" + list[i].hredate + "</span></div><p>";
        str += replaceAll(list[i].hrecontents, '\n', '<br>') + "</p></div></div>";
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
      let str = "<div><small class='text-muted'>" + paging + "</small></div>";

      replyPageFooter.html(str);
	});
}


let widget = $(".widget-inner");
let hrecontents = widget.find("textarea[name='hrecontents']");
let mainBtn = $("#mainBtn");
//댓글 생성
mainBtn.on("click", function (e) {
 
  if (hrecontents.val() == '') {
    alert("댓글을 입력하세요")
    return;
  }
 
  let reply = {
    hrecontents: hrecontents.val(),
    id: id,
    hugino: hugino
  };
  replyService
    .add(reply)
    .then(result => {
 
      //alert(result);
 
      //modal.find("input").val("");
      //modal.modal("hide");
 
      showList();
      showPage();
 
    }); //end add
 
}); //end modalRegisterBtn.on




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
        str += "<span>" + list[i].hredate + "</span>";
        str += "<span>&nbsp;&nbsp;</span>";
        str += "<div id='removeBtn' name='removeBtn' data-hugireno='" + list[i].hugireno + "'>";
        str += "<button id='removeBtn' class='pull-right' style='background-color:transparent;'>";
        str += deleteimage + "</button></div></div><p>";
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

let modal = $(".modal");
let media = $(".media");
let widget = $(".widget-inner");
let hrecontents = widget.find("textarea[name='hrecontents']");
let mainBtn = $("#mainBtn");
let modalRemoveBtn = $("#modalRemoveBtn");
let modalModBtn = $("#modalModBtn");

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
    document.getElementById("hrecontents").value='';
}); //end modalRegisterBtn.on

$("#addReplyBtn").on("click", function(e) {
	alert("테스트!");

});


replyUL.on("click", "button", function (e) {
	alert("리스트 버튼 테스트ㅠ");
});













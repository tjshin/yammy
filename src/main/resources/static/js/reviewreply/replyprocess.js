$(function () {//페이지가 로딩될때
   showList();
   showPage();
   showTotal();
});//page loading function end  

let replyUL = $(".blog-comments-content");
let replyPageFooter = $(".comments-footer");

let param = "nPage=" + nPage;
    param += "&hugino=" + hugino;
    param += "&col=" + colx;
    param += "&word=" + wordx;
    param += "&nowPage=" + nowPage;
    
var modifyButton = "<button type='button' id='modifyBtn' class='btn pull-right' data-toggle='modal' style='background-color:transparent;'>"
					+ modifyimage + "</button>";
var deleteButton = "<button type='button' id='removeBtn' class='btn pull-right' data-toggle='modal' style='background-color:transparent;'>"
					+ deleteimage + "</button>";
    
const replyService = new ReplyService();

function showList() {
  replyService
    .getList({ hugino: hugino, sno: sno, eno: eno })
    .then(list => {
      let str = ""

      for (var i = 0; i < list.length ; i++) {
		
        str += "<div class='media' data-hugireno='" + list[i].hugireno + "'>";
        
        if(sessionid != null && sessionid == list[i].id) {
			str += deleteButton;
			str += modifyButton;			
		}
        
        str += "<div class='media-body'>";        
        str += "<div class='media-heading'><h4>" + list[i].nick + "</h4>";
        str += "<span>" + list[i].hredate + "</span>";
        str += "<span>&nbsp;&nbsp;</span></div><p>";
        str += replaceAll(list[i].hrecontents, '\n', '<br>') + "</p></div></div>";
      }

      replyUL.html(str);
    })

}//showList() end

function showTotal() {
	replyService
		.getTotal({ hugino: hugino })
		.then(replyCnt => {
			let str = "<h3>댓글 수: " + replyCnt + "</h3>";
			
			$(".comments-count").html(str);
		});
}

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
let modalInputContent = modal.find("textarea[name='hrecontents']");

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
    id: sessionid,
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
      showTotal();
 
    }); //end add
    document.getElementById("hrecontents").value='';
    
}); //end modalRegisterBtn.on

replyUL.on("click", ".media button", function (e) {
	
	var hugireno = $(this).parent().attr("data-hugireno");
	
	replyService
		.get(hugireno)
		.then(reply => {

			modalInputContent.val(reply.hrecontents);
			modal.data("hugireno", reply.hugireno);

			$(".modal").modal("show");

		});
});


$("#modalCloseBtn").on("click", function(e) {
	modal.modal('hide');
});

//댓글 수정
modalModBtn.on("click", function(e) {

	let reply = { hugireno: modal.data("hugireno"), hrecontents: modalInputContent.val() };
	//alert(reply.rnum);
	replyService
		.update(reply)
		.then(result => {

			//alert(result);
			modal.modal("hide");
			showList();
			showPage();
			showTotal();
		});

});//modify 

//댓글 삭제
modalRemoveBtn.on("click", function(e) {
	
	let hugireno = modal.data("hugireno");
	
	replyService
		.remove(hugireno)
		.then(result => {

			//alert(result);
			modal.modal("hide");
			showList();
			showPage();
			showTotal();
		});

});//remove

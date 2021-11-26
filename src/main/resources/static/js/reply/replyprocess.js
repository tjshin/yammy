$(function () {//페이지가 로딩될때
   showList();
   showPage();
   showTotal();
});//page loading function end  

let replyUL = $(".blog-comments-content");
let replyPageFooter = $(".comments-footer");

let param = "nPage=" + nPage;
    param += "&bbsno=" + bbsno;
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
    .getList({ bbsno: bbsno, sno: sno, eno: eno })
    .then(list => {
      let str = ""

      for (var i = 0; i < list.length ; i++) {
		
        str += "<d0iv class='media' data-reno='" + list[i].reno + "'>";
        
        if(sessionid != null && sessionid == list[i].id) {
			str += deleteButton;
			str += modifyButton;			
		}
        
        str += "<div class='media-body'>";        
        str += "<div class='media-heading'><h4>" + list[i].nick + "</h4>";
        str += "<span>" + list[i].redate + "</span>";
        str += "<span>&nbsp;&nbsp;</span></div><p>";
        str += replaceAll(list[i].recontents, '\n', '<br>') + "</p></div></div>";
      }

      replyUL.html(str);
    })

}//showList() end

function showTotal() {
	replyService
		.getTotal({ bbsno: bbsno })
		.then(replyCnt => {
			let str = "<h5>댓글 수: " + replyCnt + "</h5>";
			
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
let modalInputContent = modal.find("textarea[name='recontents']");

let widget = $(".widget-inner");
let recontents = widget.find("textarea[name='recontents']");

let mainBtn = $("#mainBtn");
let modalRemoveBtn = $("#modalRemoveBtn");
let modalModBtn = $("#modalModBtn");

//댓글 생성
mainBtn.on("click", function (e) {
 
  if (recontents.val() == '') {
    alert("댓글을 입력하세요")
    return;
  }
 
  let reply = {
    recontents: recontents.val(),
    id: sessionid,
    bbsno: bbsno
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
    document.getElementById("recontents").value='';
    
}); //end modalRegisterBtn.on

replyUL.on("click", ".media button", function (e) {
	
	var reno = $(this).parent().attr("data-reno");
	
	replyService
		.get(reno)
		.then(reply => {

			modalInputContent.val(reply.recontents);
			modal.data("reno", reply.reno);

			$(".modal").modal("show");

		});
});


$("#modalCloseBtn").on("click", function(e) {
	modal.modal('hide');
});

//댓글 수정
modalModBtn.on("click", function(e) {

	let reply = { reno: modal.data("reno"), recontents: modalInputContent.val() };
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
	
	let reno = modal.data("reno");
	
	replyService
		.remove(reno)
		.then(result => {

			//alert(result);
			modal.modal("hide");
			showList();
			showPage();
			showTotal();
		});

});//remove

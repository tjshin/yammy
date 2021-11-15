<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html> 
<html> 
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  

  <title>조회</title>
  <meta charset="utf-8">
 
</head>

<script type="text/javascript">
	function updateM() {
		var url = "/bbs/update";
		url += "?bbsno=${dto.bbsno}";
		location.href = url;
	}
	function deleteM() {
		var url = "/bbs/delete";
		url += "?bbsno=${dto.bbsno}";
		location.href = url;
	}

	function listM() {
		var url = "/bbs/list";
		url += "?nowPage=${param.nowPage}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		location.href = url;
	}
	
    function before(){
        var url = "/bbs/read";
        url += "?bbsno="+ bbsno -"1";
        url += "&col=${col}";
        url += "&word=${word}";
        url += "&nowPage=${nowPage}";
        location.href=url;
  
      }     function next(){
          var url = "/bbs/read";
          url += "?bbsno="+ bbsno +"1";
          url += "&col=${col}";
          url += "&word=${word}";
          url += "&nowPage=${nowPage}";
          location.href=url;
    
        }
	}
	$(function(){
		// 추천버튼 클릭시(추천 추가 또는 추천 제거)
		$("#rec_update").click(function(){
			$.ajax({
				url: "/expro/RecUpdate.do",
                type: "POST",
                data: {
                    no: ${content.board_no},
                    id: '${id}'
                },
                success: function () {
			        recCount();
                },
			})
		})
		
		// 게시글 추천수
	    function bcnt() {
			$.ajax({
				url: "/expro/RecCount.do",
                type: "POST",
                data: {
                    no: ${bbs.bbsno}
                },
                success: function (count) {
                	$(".bcnt").html(count);
                },
			})
	    };
	    recCount(); // 처음 시작했을 때 실행되도록 해당 함수 호출
	
	
</script>


</head>
<body>

<div class="first-widget parallax"></div>
	<div class="container">

		<h2>게시글</h2>
        <header>
            <div class="panel panel-default">
                <div class="panel-heading">
                <!-- 모바일에서 작성 icon_write_mbl -->
                <h3 class="title ub-word"><span class="title_headtext"></span> <span class="title_subject">${dto.btitle}</span><span class="title_device"></span></h3>
        
                    <div align="right">
                        <span class='nickname' title=''>${dto.nick}<span></span>																<span class="gall_date" title="2021-11-03 22:35:02">${dto.bdate}</span>
                                                    </div>
                                                    <div align="right">
                        <span class="gall_count">조회수: ${dto.bview}</span>
                        <span class="gall_reply_num">추천수: </span>
                        <span class="gall_comment"><a href="#focus_cmt">댓글수: </a></span>
                    </div>
                </div>
            </div>
        </header>
      
	
        
		<div class="panel panel-default">
           

			<div class="panel-heading">내용</div>
			<div class="panel-body">${dto.bcontents}</div>

			
		</div>   
    <!-- 추천 기능 -->
		<div>
			<div class="w3-border w3-center w3-padding">
				<c:if test="${ id == null }">
					추천 기능은 <button type="button" id="newLogin"><b class="w3-text-blue">로그인</b></button> 후 사용 가능합니다.<br />
					<i class="fa fa-heart" style="font-size:16px;color:red"></i>
					<span class="rec_count"></span>					
				</c:if>
				<c:if test="${ id != null }">
					<button class="w3-button w3-black w3-round" id="rec_update">
						<i class="fa fa-heart" style="font-size:16px;color:red"></i>
						&nbsp;<span class="bcnt"></span>
					</button> 
				</c:if>
			</div>
		</div>
     
            
        <div>
            <br>
			<button type="button" class="btn" onclick="location.href='/bbs/create'">등록</button>
			<button type="button" class="btn" onclick="updateM()">수정</button>
			<button type="button" class="btn" onclick="deleteM()">삭제</button>
			<button type="button" class="btn" onclick="listM()">목록</button>
						<a href="javascript:before('${dto.bbsno}')">이전글</a>
				<a href="javascript:next('${dto.bbsno}')">다음글</a>
		</div>
		<div>
 
	<div class="col-lg-12">



<br>
<br>

<!-- panel start-->
<div class="panel panel-default">

<div class="panel-heading">
        <i class="fa fa-comments fa-fw"></i> 댓글
        <button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New
                Reply</button>
</div>


<div class="panel-body">

        <ul class="chat list-group">
                <li class="left clearfix" data-rno="12">
                        <div>
                                <div class="header">
                            
                                </div>
                   
                        </div>
                </li>
        </ul>
        <!-- ul end  -->
</div>


</div>
<!-- panel end-->
</div>
<!--  col-lg-12 end -->
</div>
<!-- row end -->
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
  <div class="modal-content">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal"
        aria-hidden="true">&times;</button>
      <h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
    </div>
    <div class="modal-body">
      <div class="form-group">
        <label>내용</label> 
        <textarea cols="10" rows="3" class="form-control" name='content'>New Reply!!!!</textarea> 
      </div>      
    </div>
<div class="modal-footer">
<button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
<button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
<button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
<button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
</div>          </div>
  <!-- /.modal-content -->
</div>
<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!-- 댓글처리 관련 Javascript 파일 추가-->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/breply.js"></script>

 <!-- 페이지 로딩시 댓글 목록 처리-->
 <!-- jstl는 internal javascript에서 사용가능 -->
 <script type="text/javascript">
  var bbsno = "${dto.bbsno}"; 
  var sno = "${sno}";
  var eno = "${eno}";
 <!-- 댓글용 paging, 게시판 검색 -->
  var nPage = "${nPage}";
  var nowPage = "${param.nowPage}";
  var colx = "${param.col}";
  var wordx = "${param.word}";
 </script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/replyprocess.js"></script>


</body> 
</html> 

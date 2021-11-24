<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="util" uri="/ELFunctions"%>

<c:set var="root" value="${pageContext.request.contextPath }" />


<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>받은 쪽지함</title>
<meta charset="utf-8">

<script src="/resources/jquery/jquery-3.3.1.min.js"></script>

<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>


<script type="text/javascript">
     function read(messageno){
       var url = "${root }/message/receread";
       url += "?messageno="+messageno;
       url += "&col=${col}";
       url += "&word=${word}";
       url += "&nowPage=${nowPage}";
       location.href=url;
 
     }
     
     function createM(){
         var url = "${root }/message/create";
         location.href=url;
       }
    
    
     //checkbox 함수
 	$(function(){
		var chkObj = document.getElementsByName("RowCheck");
		var rowCnt = chkObj.length;
		
		$("input[name='allCheck']").click(function(){
			var chk_listArr = $("input[name='RowCheck']");
			for (var i=0; i<chk_listArr.length; i++){
				chk_listArr[i].checked = this.checked;
			}
		});
		$("input[name='RowCheck']").click(function(){
			if($("input[name='RowCheck']:checked").length == rowCnt){
				$("input[name='allCheck']")[0].checked = true;
			}
			else{
				$("input[name='allCheck']")[0].checked = false;
			}
		});
	});
    
     
     // 체크 이후 삭제 버튼 클릭시
     function deleteValue(){
			var url = "/rcheckdelete";    // Controller로 보내고자 하는 URL (.dh부분은 자신이 설정한 값으로 변경해야됨)
			var valueArr = new Array();
		    var list = $("input[name='RowCheck']");
		    for(var i = 0; i < list.length; i++){
		        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
		            valueArr.push(list[i].value);
		        }
		    }
		    if (valueArr.length == 0){
		    	alert("선택된 글이 없습니다.");
		    }
		    else{
		    	if(confirm("정말 삭제하시겠습니까?")){			 
				$.ajax({
				    url : url,                    // 전송 URL
				    type : 'POST',                // GET or POST 방식
				    traditional : true,
				    data : {
				    	valueArr : valueArr        // 보내고자 하는 data 변수 설정
				    },
	                success: function(jdata){
	                    if(jdata = 1) {
	                        alert("삭제 성공");
	                        location.replace("recelist")
	                    }
	                    else{
	                        alert("삭제 실패");
	                    }
	                }
				});
		    }
 				else{
 					alert("취소되었습니다.");
 				}
			}
		}
     
  </script>
   
  
</head>

<body>

<div class="first-widget parallax" id="blog">
		<div class="parallax-overlay">
			<div class="container pageTitle">
				<div class="row">
					<div class="col-md-6 col-sm-6">
						<h2 class="page-title">받은 쪽지함</h2>
					</div> <!-- /.col-md-6 -->
					
				</div> <!-- /.row -->
			</div> <!-- /.container -->
		</div> <!-- /.parallax-overlay -->
	</div> <!-- /.pageTitle -->
<br/>
	<div class="container">
		<form class="form-inline" action="${root }/message/recelist">

			<div class="form-group">
				<select class="form-control" name="col">
					<option value="sendid"
						<c:if test= "${col=='sendid'}"> selected </c:if>>보낸 사람</option>
					<option value="total"
                <c:if test= "${col=='total'}"> selected </c:if>
                >전체출력</option>
				</select>
			</div>


			<div class="form-group">
				<input type="text" class="form-control" placeholder="Enter  검색어" name="word" value="${word}">
			</div>

			<button type="submit" class="btn btn-default">검색</button>
			<button type="button" class="btn btn-default" onclick="createM()">쪽지 보내기</button>
			<button type="button" class="btn btn-red" onclick="deleteValue();" >쪽지 삭제</button>
			
		</form>
	
		<table class="table table-striped">
			<thead>
				<tr>
					<th><label class="checkbox-inline">	<input id="allCheck" type="checkbox" name="allCheck"/></label></th>
					<th>보낸사람</th>
					<th>내용</th>
					<th>날짜/시간</th>

				</tr>
			</thead>
			<tbody>

				<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td colspan="6">쪽지함이 비어있습니다.</td>
					</c:when>
					<c:otherwise>

						<c:forEach var="dto" items="${list}">

							<tr>
							
								<td><input name="RowCheck" type="checkbox" value="${dto.messageno}"/></td>
														
								<td>${dto.sendid}

									<c:if test="${util:newImg(fn:substring(dto.mdate,0,10)) }">
										<!--<img src="./imagetest/new.gif">  --> <!-- shop/WebMvcConfiguration 추가해야함 -->
										 <img src="${root }/images/new.gif">  
									</c:if></td>
								<td><a href="javascript:read('${dto.messageno}')">${dto.mcontents}</a></td>
								<td>${dto.mdate}</td>

							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>

			</tbody>

		</table>
		
		<div>${paging}</div>
		
		</div>
		
	
</body>
</html>
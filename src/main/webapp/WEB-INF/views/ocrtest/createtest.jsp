<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 비동기 업로드, OCR test</title>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<script type="text/JavaScript">
        
 function checkIn(f){
         
         if (f.tickettitle.value == ""){
             alert("제목을 입력하세요");
             f.tickettitle.focus();
             return false;
        }
      	
         if (f.ticketcontents.value == ""){
             alert("내용을 입력하세요");
             f.ticketcontents.focus();
             return false;
        }
         
         if (f.filenameMF.value == ""){
             alert("사진을 등록하세요");
             f.filenameMF.focus();
             return false;
        } 
         
         if (f.gamedate.value == ""){
             alert("경기 일정을 등록하세요");
             f.gamedate.focus();
             return false;
        }
         
         if (f.location.value == ""){
             alert("거래/양도 장소를 등록하세요");
             f.location.focus();
             return false;
        } 
        
 }
 
 

 
 function goBack(){
     window.history.back();
             }


 
 $( function() { 
	 $( "#gamedate" ).datepicker({
		 dateFormat: "yy-mm-dd"
	 }); 
  });



</script>


</head>
<body>

<div class="first-widget parallax" id="blog">
		<div class="parallax-overlay">
			<div class="container pageTitle">
				<div class="row">
					<div class="col-md-6 col-sm-6">
						<h2 class="page-title">티켓 등록</h2>
					</div> <!-- /.col-md-6 -->
				</div> <!-- /.row -->
			</div> <!-- /.container -->
		</div> <!-- /.parallax-overlay -->
	</div> <!-- /.pageTitle -->
	
<div class="container"><br/>	

	<form class="form-horizontal" 
        action="/ticket/create"
        method="post"
        enctype="multipart/form-data"
        onsubmit="return checkIn(this)"
        id="addForm">
    
    <div class="form-group">
        <label class="control-label col-sm-2" for="stadium1"style="color: black; font-weight: bolder;" >구장 분류</label>
        <div class="col-sm-6">
<!--         선택시 dto.stadium 값을 초기화 할 수 있도록 하기 -->
        
        <select class="form-control" name="stadium">
            <option value="잠실(LG/두산)">잠실(LG/두산)</option>
            <option value="고척(키움)">고척(키움)</option>
            <option value="인천(SSG)">인천(SSG)</option>
            <option value="수원(KT)">수원(KT)</option>
            <option value="대전(한화)">대전(한화)</option>
            <option value="광주(KIA)">광주(KIA)</option>
            <option value="대구(삼성)">대구(삼성)</option>
            <option value="창원(NC)">창원(NC)</option>
            <option value="사직(롯데)">사직(롯데)</option>
        </select>
        </div>
        
        </div>       
        
        <div class="form-group">
        <label class="control-label col-sm-2" for="id" style="color: black; font-weight: bolder;">작성자</label>
        <div class="col-sm-8">
            <input type="text" name="id" id="id" class="form-control" value="${id}" readonly >
        </div>
        </div>
        
        <div class="form-group">
        <label class="control-label col-sm-2" for="tickettitle" style="color: black; font-weight: bolder;">글 제목</label>
        <div class="col-sm-8">
            <input type="text" name="tickettitle" id="tickettitle" class="form-control">
        </div>
        </div>
    
        <div class="form-group">
        <label class="control-label col-sm-2" for="ticketcontents" style="color: black; font-weight: bolder;">내용</label>
        <div class="col-sm-8" id="ocrresult">
        <textarea rows="12" cols="7" id="ticketcontents" name="ticketcontents" class="form-control">${ocrresult }</textarea></div>
        </div>
        
        	<script>
		    	var url = "${root}/admin/ocrtest";
		    </script>
	        <div class="form-group">                
	            <label class="control-label col-sm-2" for="filenameMF"
	            	style="color:black;font-weight:bolder;">티켓 이미지 추가
	            </label>
	            
	            <div class="col-sm-8" style="display:inline;">
	            	<input type="file" name="filenameMF" id="filenameMF"
	            	onchange="previewImage(this, 'View_area')">
	            	
	            	<span id='View_area' style='position:relative;color:black;
	            		border:0px solid black;'>
	        		</span>
	        		
	        		<input type="button" class="btn" style="background:#FF6491;
	            		color: #FFF2F6;" onclick="dataSubmit();" value="티켓 문자 인식">
		        		            	
	            	<br>
	            	<div id="resultDiv">
		            	<p>${log }</p></div>
	        		<code id="snippet" class="snippet">※주의: 이미지는 한 장만 등록해주세요!</code><br>
	        		<code id="snippet" class="snippet">※주의: 인식 결과에서 개인 정보(민감 정보)를 수정하세요!</code>
	        	</div>
	        </div>
        
    	<div class="form-group">
            <label class="control-label col-sm-2" for="gamedate" style="color: black; font-weight: bolder;">경기 날짜</label>
        <div class="col-sm-6">
            <input type="text" name="gamedate" id="gamedate" class="form-control">
        </div>
        </div>
        
        
        <div class="form-group">
            <label class="control-label col-sm-2" for="location" style="color: black; font-weight: bolder;">거래/양도 장소</label>
        <div class="col-sm-6">
            <input type="text" name="location" id="location" class="form-control">
        </div>
        </div>
        
    	
        <div class="form-group">
        <div class="col-sm-offset-2 col-sm-5">
        <button class="btn btn-default">등록</button>
        <button type="reset" class="btn btn-default2" onclick="goBack();">취소</button>
        </div>
    </div>
    </form>
    
    	<script src="${root }/js/ocrtest/storeDataSendAjax.js"></script>
   		<script src="${root }/js/ocrtest/imagePreview.js"></script>
    
    </div>


</body>
</html>
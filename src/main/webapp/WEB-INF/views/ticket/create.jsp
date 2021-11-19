<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
        
 }
 
 

 
 function goBack(){
     window.history.back();
             }




</script>


</head>
<body>

<div class = first-widget>  </div>

<div class="container">
    <h1 class="col-sm-offset-2 col-sm-10">티켓 등록</h1>
    <form class="form-horizontal" 
        action="/ticket/create"
        method="post"
        enctype="multipart/form-data"
        onsubmit="return checkIn(this)">
    
    <div class="form-group">
        <label class="control-label col-sm-2" for="stadium1"style="color: black; font-weight: bolder;" >구장 분류</label>
        <div class="col-sm-6">
        <!-- 선택시 dto.stadium 값을 초기화 할 수 있도록 하기 -->
        
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
        <div class="col-sm-8">
        <textarea rows="12" cols="7" id="ticketcontents" name="ticketcontents" class="form-control"></textarea>
        </div>
        </div>
    
        <div class="form-group">
            <label class="control-label col-sm-2" for="filenameMF" style="color: black; font-weight: bolder;">티켓이미지</label>
        <div class="col-sm-6">
            <input type="file" name="filenameMF" id="filenameMF" class="form-control">
        </div>
        </div>
    
        <div class="form-group">
        <div class="col-sm-offset-2 col-sm-5">
        <button class="btn btn-primary">등록</button>
        <button type="reset" class="btn" onclick="goBack();">취소</button>
        </div>
    </div>
    </form>
    </div>


</body>
</html>
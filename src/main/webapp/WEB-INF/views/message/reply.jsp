<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<c:set var="root" value="${pageContext.request.contextPath }" />    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<script type="text/JavaScript">
        
 function checkIn(f){
       
         if (f.mcontents.value == ""){
              alert("������ �Է��ϼ���");
              f.mcontents.focus();
              return false;
         }
    
        
 }
 
 

 
 function goBack(){
     window.history.back();
             }




</script>

<title>���� �ϱ�</title>

</head>

<body>

<div class = first-widget>  </div>
<div class="container">
    <h1 class="col-sm-offset-2 col-sm-10">���� ������</h1>
    <form class="form-horizontal" 
        action="${root }/message/reply"
        method="post"
        onsubmit="return checkIn(this)">
    
    	 <div class="form-group">
        <label class="control-label col-sm-2" for="sendid" style="color: black; font-weight: bolder;">���� ���</label>
        <div class="col-sm-8">
            <input type="text" name="sendid" id="sendid" class="form-control" value="${sendid}" readonly> <!--�α��ξ��̵� = sendid �Դϴ�. -->
        </div>
        </div>
    
    
        <div class="form-group">
        <label class="control-label col-sm-2" for="receid" style="color: black; font-weight: bolder;">�޴� ���</label>
        <div class="col-sm-8">
            <input type="text" name="receid" id="receid" class="form-control" value="${param.receid}" readonly> <!--read �κп���  �Ķ���ͷ� ���� (������� ���̵�)�� �����´�. (����������� ����) -->
        </div>
        </div>
    
        <div class="form-group">
        <label class="control-label col-sm-2" for="mcontents" style="color: black; font-weight: bolder;">����</label>
        <div class="col-sm-8">
        <textarea rows="12" cols="7" id="mcontents" name="mcontents" class="form-control"></textarea>
        </div>
        </div>
           
        <div class="form-group">
        <div class="col-sm-offset-2 col-sm-5">
        <button class="btn btn-primary">������</button>
        <button type="reset" class="btn" onclick="goBack();">���</button>
        </div>
    </div>
    </form>
    </div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<c:set var="root" value="${pageContext.request.contextPath }" />    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<script type="text/JavaScript">
        
 function checkIn(f){
         if (f.receid.value == ""){
              alert("��������� �Է��ϼ���");
              f.receid.focus()
              return false;
         }
         if (f.mcontents.value == ""){
              alert("������ �Է��ϼ���");
              f.mcontents.focus();
              return false;
         }
    
        
 }
 
 <%
	request.setCharacterEncoding("UTF-8");
String sendid= request.getParameter("sendid"); //��Ʈ�ѷ�(model.addAttribute("sendid", sendid);) ������ sendid ����  view �������� �����´�.
%>


</script>

<title>���� �ϱ�</title>

</head>

<body>

<div class = first-widget>  </div>
<div class="container">
    <h1 class="col-sm-offset-2 col-sm-10">���� ������</h1>
    <form class="form-horizontal" 
        action="${root }/message/create"
        method="post"
        onsubmit="return checkIn(this)">
    
    	 <div class="form-group">
        <label class="control-label col-sm-2" for="sendid" style="color: black; font-weight: bolder;">������ ���</label>
        <div class="col-sm-8">
       <input type="text" name="sendid" id="sendid" class="form-control" value="${sendid}" readonly> <!--�α��ξ��̵� = sendid �Դϴ�. -->
       		
        </div>
        </div>
    
    
        <div class="form-group">
        <label class="control-label col-sm-2" for="receid" style="color: black; font-weight: bolder;">�޴� ���</label>
        <div class="col-sm-8">
            
            <input type="text" name="receid" id="receid" class="form-control"> <!--read �κп��� �ۼ��� id ���� �����ش�. -->
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
        <button type="reset" class="btn">���</button>
        </div>
    </div>
    </form>
    </div>


<!-- body �κ� �� -->
    <!-- Scripts -->
	<script src="js/min/plugins.min.js"></script>
	<script src="js/min/medigo-custom.min.js"></script>


</body>
</html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />


<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no, maximum-scale=1">
<title>review delete test</title>
<script type="text/javascript">
	function goback() {
		window.history.back();
	}
</script>

</head>
<body>
<div class="first-widget parallax" id="blog">
        <div class="parallax-overlay">
            <div class="container pageTitle">
                <div class="row">
                    <div class="col-md-6 col-sm-6">
                        <h2 class="page-title">리뷰 삭제</h2>
                    </div> <!-- /.col-md-6 -->
                    <div class="col-md-6 col-sm-6 text-right">
                    </div> <!-- /.col-md-6 -->
                </div> <!-- /.row -->
            </div> <!-- /.container -->
        </div> <!-- /.parallax-overlay -->
    </div> <!-- /.pageTitle -->
    
    
    
    
    <section class="cta clearfix">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
				<form class="form-horizontal" action="/review/delete" method="post">
					<input type="hidden" name="hugino" value="${param.hugino}">
					<input type='hidden' name="col" value="${param.col}">
					<input type='hidden' name="word" value="${param.word}">
					<input type='hidden' name="nowPage" value="${param.nowPage}">
					<input type='hidden' name="mtest" value="${param.mtest}">
					<div>
					삭제하면 복구할 수 없습니다.<br><br>
					</div>
		
					<div class="form-group">
						<div>
							<button class="btn btn-red" type="submit">삭제</button>
							<button class="btn btn-default2" type="reset" onclick="goback();">
							취소</button>   
							
						</div>
					</div>
					
				</form>    
				             
						
                </div> <!-- /.col-md-12 -->
            </div> <!-- /.row -->
        </div> <!-- /.container -->
    </section> <!-- /.cta -->
    
    
</body>
</html>
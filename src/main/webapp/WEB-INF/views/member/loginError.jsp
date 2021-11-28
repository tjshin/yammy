<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />


<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no, maximum-scale=1">
<title>error</title>

<script type="text/javascript">
	function goback() {
		window.history.back();
	}
</script>

<style>
	#red{
		color:red;
		font-weight:bold;
	}
</style>

</head>
<body>
<div class="first-widget parallax" id="blog">
        <div class="parallax-overlay">
            <div class="container pageTitle">
                <div class="row">
                    <div class="col-md-6 col-sm-6">
                        <h2 class="page-title">로그인 에러</h2>
                    </div> <!-- /.col-md-6 -->
      
                </div> <!-- /.row -->
            </div> <!-- /.container -->
        </div> <!-- /.parallax-overlay -->
    </div> <!-- /.pageTitle -->
    
    <section class="cta clearfix">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                <p id="red">잘못된 계정을 입력하셨습니다.</p>
					<div class="form-group">
						<div>
							<button class="btn btn-default2" type="reset" onclick="goback();">뒤로</button>   
							
						</div>
					</div>
                </div> <!-- /.col-md-12 -->
            </div> <!-- /.row -->
        </div> <!-- /.container -->
    </section> <!-- /.cta -->
    
    
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>삭제</title>
<meta charset="utf-8">
<style type="text/css">
#red {
	color: red;
}
</style>
</head>

<body>


<div class="first-widget parallax" id="blog">
        <div class="parallax-overlay">
            <div class="container pageTitle">
                <div class="row">
                    <div class="col-md-6 col-sm-6">
                        <h2 class="page-title">게시물 삭제</h2>
                    </div> <!-- /.col-md-6 -->
                    <div class="col-md-6 col-sm-6 text-right">
                        <span class="page-location">게시판 /게시물 삭제</span>
                    </div> <!-- /.col-md-6 -->
                </div> <!-- /.row -->
            </div> <!-- /.container -->
        </div> <!-- /.parallax-overlay -->
    </div> <!-- /.pageTitle -->

	<div class="container">
		<form class="form-horizontal" action="./delete" method="post">
			<input type="hidden" name="bbsno" value="${param.bbsno}">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<p id="red" class="col-sm-offset-2 col-sm-6">삭제하면 복구할 수 없습니다</p>
						<div class="form-group">
							<div>
								<button class="mainBtn" type="submit">삭제</button>
								<button class="mainBtn" type="reset" onclick="goback();">
									취소</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
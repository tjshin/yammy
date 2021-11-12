<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>review read test</title>
</head>
<body>

<div class="first-widget parallax" id="blog">
        <div class="parallax-overlay">
            <div class="container pageTitle">
                <div class="row">
                    <div class="col-md-6 col-sm-6">
                        <h2 class="page-title">리뷰 조회</h2>
                    </div> <!-- /.col-md-6 -->
                    <div class="col-md-6 col-sm-6 text-right">
                        <span class="page-location">Home / 경기장 주변 맛집 / 리뷰 조회</span>
                    </div> <!-- /.col-md-6 -->
                </div> <!-- /.row -->
            </div> <!-- /.container -->
        </div> <!-- /.parallax-overlay -->
    </div> <!-- /.pageTitle -->

	<section class="cta clearfix">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <a href="${root }/sikdang/map_main" class="main-button accent-color">
                        <i class="icon-button fa fa-arrow-left"></i>
						&nbsp;&nbsp; 지도로 돌아가기</a>
                    <a href="${root }/review/list" class="main-button accent-color">
                        <i class="icon-button fa fa-arrow-left"></i>
						&nbsp;&nbsp; 목록으로 돌아가기
                    </a>
						
                </div> <!-- /.col-md-12 -->
            </div> <!-- /.row -->
        </div> <!-- /.container -->
    </section> <!-- /.cta -->

	<div class="container">	
		<div class="row">

			<div class="col-md-12 blog-posts">
				<div class="row">
					<div class="col-md-12">
						<div class="post-blog">
							<div class="blog-image">
								<img src="images/includes/blog2.jpg" alt="">
							</div> <!-- /.blog-image -->
							<div class="blog-content">
								<span class="meta-date"><a href="#">날짜</a></span>
								<span class="meta-comments"><a href="#blog-comments">댓글 수: #</a></span>
								<span class="meta-author"><a href="#blog-author">글쓴이 이름</a></span>
								<h3>리뷰 제목</h3>
								
								<p>리뷰 내용 ckeditor ckfinder 적용해야함</p>
								<div class="tag-items">
                                    <span class="small-text">Tags:</span>
                                    <a href="#" rel="tag">태그 누르면</a>
                                    <a href="#" rel="tag">해당 태그를 검색어로 하는</a>
                                    <a href="#" rel="tag">list로 넘어갈 수 있게 하는거 어떨까요</a>
                                </div>
							</div> <!-- /.blog-content -->
						</div> <!-- /.post-blog -->
					</div> <!-- /.col-md-12 -->
				</div> <!-- /.row -->
				<div class="row">
					<div class="col-md-12">
						<div id="blog-author" class="clearfix">
                            <a href="#" class="blog-author-img pull-left">
                                <img src="../template/images/includes/author.png" alt="">
                            </a>
                            <div class="blog-author-info">
                                <h4 class="author-name"><a href="#">글쓴이 이름</a></h4>
                                <p>프로필에는 어떤 내용을 노출시킬까요?</p>
                            </div>
                        </div>
					</div> <!-- /.col-md-12 -->
				</div> <!-- /.row -->

                <div class="row">
                    <br>
                    <div class="col-md-12">
                        <a href="${root }/review/list" class="main-button accent-color">리뷰 목록</a>
                        (등록은 interceptor로 로그인 유도하게)
                        <a href="${root }/sikdang/map_search" class="main-button accent-color">리뷰 등록</a>
                        (수정과 삭제 버튼을 회원id 활용해 글쓴 사람만 볼 수 있게)
                        <a href="${root }/review/update" class="main-button accent-color">리뷰 수정</a>
                        <a href="${root }/review/delete" class="main-button accent-color">리뷰 삭제</a>
                    </div>
                </div>


				<div class="row">
					<div class="col-md-12">
                        <div id="blog-comments" class="blog-post-comments">
                            <h3>댓글 수: #</h3>
                            <div class="blog-comments-content">
                                <div class="media">
                                    <div class="pull-left">
                                        <img class="media-object" src="images/includes/comment1.jpg" alt="">
                                    </div>
                                    <div class="media-body">
                                        <div class="media-heading">
                                        	<h4>Linda Wilson</h4> 
                                        	<a href="#"><span>4 weeks ago</span><span>Reply</span></a>
                                        </div>
                                        <p>Lorem ipsum dolor sit amet lorem, elit. Sequi, nam magni repellendus! <span class="label label-primary">New</span></p>
                                        <div class="media">
                                            <div class="pull-left">
                                                <img class="media-object" src="images/includes/comment2.jpg" alt="">
                                            </div>
                                            <div class="media-body">
                                                <div class="media-heading">
		                                        	<h4>Stephen</h4> 
		                                        	<a href="#"><span>5 weeks ago</span><span>Reply</span></a>
		                                        </div>
                                                <p>Temporibus, ea, praesentium eaque totam vel quos laboriosam quia sit dolore at consequatur beatae aliquam debitis porro quasi cupiditate quod!</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="media">
                                    <div class="pull-left">
                                        <img class="media-object" src="images/includes/comment3.jpg" alt="">
                                    </div>
                                    <div class="media-body">
                                        <div class="media-heading">
                                        	<h4>Marco New</h4> 
                                        	<a href="#"><span>6 weeks ago</span><span>Reply</span></a>
                                        </div>
                                        <p>Enim, iste numquam inventore reiciendis libero quidem quos voluptate? Thank you for visiting templatemo.</p>
                                    </div>
                                </div>
                            </div> <!-- /.blog-comments-content -->
                        </div> <!-- /.blog-post-comments -->
                    </div> <!-- /.col-md-12 -->
				</div> <!-- /.row -->
				<div class="row">
                    <div class="col-md-12">
                        <div class="comment-form">
                            <h3>댓글 남기기</h3>
                            <div class="widget-inner">
                            	<form action="#" method="post">
                                
                                <div class="row">
                                    <div class="col-md-12">
                                        <p>
                                            <label for="comment">댓글 내용:</label>
                                            <textarea name="comment" id="comment" rows="5"></textarea>
                                        </p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <input class="mainBtn" type="submit" name="submit" value="댓글 등록" id="submit">
                                    </div>
                                </div>
                                </form>
                            </div> <!-- /.widget-inner -->
                        </div> <!-- /.widget-main -->
                    </div> <!-- /.col-md-12 -->
                </div> <!-- /.row -->
			</div> <!-- /.col-md-8 -->

</body>
</html>
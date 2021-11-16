<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<c:set var="listurl" value="${root }/review/list?col=${param.col}&word=${param.word}&nowPage=${param.nowPage}"/>
<c:set var="urlhelper" value="&col=${param.col}&word=${param.word}&nowPage=${param.nowPage}"/>

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
                    <a href="${listurl }"
                    class="main-button accent-color">
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
							
							<div class="blog-content">
								<span class="meta-date">${dto.hdate }</span>
								<span class="meta-comments">댓글 수: 댓글 기능 추가해라</span>
								<span class="meta-author"><a href="#blog-author">${dto.nick }</a></span>
								<span>/</span>
								
								<c:if test="${dto.stadium == 1}"><span>서울 잠실</span></c:if>
								<c:if test="${dto.stadium == 2}"><span>서울 고척</span></c:if>
								<c:if test="${dto.stadium == 3}"><span>인천</span></c:if>
								<c:if test="${dto.stadium == 4}"><span>수원</span></c:if>
								<c:if test="${dto.stadium == 5}"><span>대전</span></c:if>
								<c:if test="${dto.stadium == 6}"><span>광주</span></c:if>
								<c:if test="${dto.stadium == 7}"><span>대구</span></c:if>
								<c:if test="${dto.stadium == 8}"><span>창원</span></c:if>
								<c:if test="${dto.stadium == 9}"><span>부산 사직</span></c:if>
								
								<h3>${dto.htitle }</h3>
								<div class="panel-heading"></div>
								<div class="panel-body">
								<p>${dto.hcontents }</p></div>
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
                            
                            <div class="blog-author-info">
                                <h4 class="author-name"><a href="#">${dto.nick }</a></h4>
                                <p>프로필에는 어떤 내용을 노출시킬까요?</p>
                            </div>
                        </div>
					</div> <!-- /.col-md-12 -->
				</div> <!-- /.row -->

                <div class="row">
                    <br>
                    <div class="col-md-12">
                        <a href="${listurl}" class="main-button accent-color">리뷰 목록</a>
                        (등록은 interceptor로 로그인 유도하게)
                        <a href="${root }/sikdang/map_search" class="main-button accent-color">리뷰 등록</a>
                        (수정과 삭제 버튼을 회원id 활용해 글쓴 사람만 볼 수 있게)
                        <a href="${root }/review/update?hugino=${dto.hugino}${urlhelper}" class="main-button accent-color">리뷰 수정</a>
                        <a href="${root }/review/delete?hugino=${dto.hugino}${urlhelper}" class="main-button accent-color">리뷰 삭제</a>
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
			</div>
			</div>

</body>
</html>
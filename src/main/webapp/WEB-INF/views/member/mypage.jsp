<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*,com.study.member.*"%>
<%@ taglib prefix="util" uri="/ELFunctions"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<c:set var="readurl1" value="${root}/review/read?hugino=" />
<c:set var="readurl2"
	value="&col=${col }&word=${word }&nowPage=${nowPage }" />
<c:set var="urlhelper"
	value="&col=${col}&word=${rword}&nowPage=${nowPage}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>회원 정보</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="templatemo">

<style>
table, th, tr {
	text-align: center;
	border-top: 1px solid lightgrey;
	border-bottom: 1px solid lightgrey;
}

#tbl {
	
}

#tr:nth-child(odd) {
	background-color: white;
	text-align: left;
}

#tr:nth-child(even) {
	background-color: white;
	text-align: left;
}

td {
	padding: 15px;
}
</style>

</head>
<body>




	<div class="first-widget parallax" id="blog">
		<div class="parallax-overlay">
			<div class="container pageTitle">
				<div class="row">
					<div class="col-md-6 col-sm-6">
						<h2 class="page-title">${mdto.mname}님의 마이페이지</h2>
					</div>
					<!-- /.col-md-6 -->

				</div>
				<!-- /.row -->
			</div>
			<!-- /.container -->
		</div>
		<!-- /.parallax-overlay -->
	</div>
	<!-- /.pageTitle -->

	<div class="container">
		<div class="row" style="text-align: center">
			<div class="col-sm-12">
				<h3>
					<span class="glyphicon glyphicon-user"></span>
				</h3>
				<img class="img-rounded" src="/member/storage/${mdto.filename}"
					style="width: 200px"><br />
				<br /> <a href="/member/updateFile?oldfile=${mdto.filename}"
					class="main-button accent-color">사진 수정</a> <a
					href="/member/download?filename=${mdto.filename}"
					class="main-button accent-color">다운로드</a>
				<div class="caption">
					<p></p>


					<table id="tbl" style="margin-left: auto; margin-right: auto;">
						<tr id="tr">
							<td style="font-weight: bold;">ID</td>
							<td>${mdto.id}</td>
						</tr>
						<tr id="tr">
							<td style="font-weight: bold;">성명</td>
							<td>${mdto.mname}</td>
						</tr>
						<tr id="tr">
							<td style="font-weight: bold;">닉네임</td>
							<td>${mdto.nick}</td>
						</tr>
						<tr id="tr">
							<td style="font-weight: bold;">이메일</td>
							<td>${mdto.email }</td>
						</tr>
						<tr id="tr">
							<td style="font-weight: bold;">연락처</td>
							<td>${mdto.phone }</td>
						</tr>
						<tr id="tr">
							<td style="font-weight: bold;">주소</td>
							<td>(${mdto.postcode })${mdto.address1 } ${mdto.address2}</td>
						</tr>
						<tr id="tr">
							<td style="font-weight: bold;">포인트</td>
							<td>${mdto.point }</td>
						</tr>
						<tr id="tr">
							<td style="font-weight: bold;">응원구단</td>
							<td>${mdto.favteam }</td>
					</table>
					<br />
				</div>
				<div class="col-sm-offset-0 col-sm-20">
					<a href="${root }/message/recelist"
						class="main-button accent-color">받은 쪽지함</a> <a
						href="${root }/message/sendlist" class="main-button accent-color">보낸
						쪽지함</a> <a href="${root }/message/create"
						class="main-button accent-color2">쪽지 쓰기</a>
				</div>
			</div>
		</div>



		<div class="row">
			<div class="col-md-12">

				<div class="post-blog"></div>
				<!-- /.post-blog -->

				<div class="post-blog">
					<div class="blog-content">
						<h3 style="font-weight: bold">내가 작성한 게시물</h3>

						<form class="form-inline" action="${root }/member/mypage">
							<div class="form-group">
								<select class="form-control" name="col">
									<option value="btitle"
										<c:if test= "${col=='btitle'}"> selected </c:if>>제목</option>
									<option value="bcontents"
										<c:if test= "${col=='bcontents'}"> selected </c:if>>내용</option>
									<option value="btitle_bcontents"
										<c:if test= "${col=='btitle_bcontents'}"> selected</c:if>>제목+내용</option>
									<option value="total"
										<c:if test= "${col=='total'}"> selected </c:if>>전체출력</option>
								</select>
							</div>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Enter 검색어"
									name="bword" value="${bword}">
							</div>
							<button type="submit" class="btn btn-default">검색</button>
							<br />
							<br />
						</form>

						<script></script>
						<table class="table table-striped">
							<thead>
								<tr>
									<th>제목</th>
									<th>등록 날짜</th>
									<th>조회수</th>
									<th>수정</th>
									<th>삭제</th>
								</tr>
							</thead>

							<tbody>


								<c:choose>

									<c:when test="${empty bdto}">
										<tr>
											<td colspan="6">작성하신 글이 없습니다.</td>
									</c:when>

									<c:otherwise>
										<c:forEach var="bdto" items="${bdto}">
											<tr>

												<td>[${bdto.bcate}] <a
													href="javascript:read('${bdto.bbsno}')">${bdto.btitle}</a>
													<c:if test="${util:newImg(fn:substring(bdto.bdate,0,10)) }">
														<img
															src="${pageContext.request.contextPath}/images/new.gif">
													</c:if>
												</td>
												<td>${bdto.bdate}</td>
												<td>${bdto.bview}</td>
												<td style="font-size: 20px;"><a
													href="${root }/bbs/update?bbsno=${bdto.bbsno }"><img
														src="${root }/images/edit-solid.svg" style="width: 15px;"></a></td>
												<td style="font-size: 20px;"><a
													href="${root }/bbs/delete?bbsno=${bdto.bbsno }"><img
														src="${root }/images/trash-alt-solid.svg"
														style="width: 13px;"></a></td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>

						</table>


						${mpaging}

					</div>
					<!-- /.blog-content -->
				</div>
				<!-- /.post-blog -->

			</div>
			<!-- /.col-md-12 -->

		</div>
		<!-- /.row -->



		<div class="row">
			<div class="col-md-12">

				<div class="post-blog"></div>
				<!-- /.post-blog -->

				<div class="post-blog">
					<div class="blog-content">
						<h3 style="font-weight: bold">내가 작성한 리뷰</h3>

						<form class="form-inline" action="${root }/member/mypage">
							<div class="form-group">
								<select class="form-control" name="col">
									<option value="htitle"
										<c:if test= "${col=='htitle'}"> selected </c:if>>제목</option>
									<option value="hcontents"
										<c:if test= "${col=='hcontents'}"> selected </c:if>>내용</option>
									<option value="htitle_hcontents"
										<c:if test= "${col=='htitle_hcontents'}"> selected</c:if>>제목+내용</option>
									<option value="total"
										<c:if test= "${col=='total'}"> selected </c:if>>전체출력</option>
								</select>
							</div>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Enter 검색어"
									name="rword" value="${rword}">
							</div>
							<button type="submit" class="btn btn-default">검색</button>
							<br />
							<br />
						</form>


						<table class="table table-striped">
							<thead>
								<tr>
									<th>경기장</th>
									<th>제목</th>
									<th>식당 이름</th>
									<th>등록 날짜</th>
									<th>내가 준 별점</th>
									<th>수정</th>
									<th>삭제</th>
								</tr>
							</thead>

							<tbody>


								<c:choose>

									<c:when test="${empty rdto}">
										<tr>
											<td colspan="7">작성하신 리뷰가 없습니다.</td>
									</c:when>

									<c:otherwise>
										<c:forEach var="rdto" items="${rdto}">
											<tr>
												<td>[ <c:if test="${rdto.stadium == 1}">서울 잠실</c:if> <c:if
														test="${rdto.stadium == 2}">서울 고척</c:if> <c:if
														test="${rdto.stadium == 3}">인천</c:if> <c:if
														test="${rdto.stadium == 4}">수원</c:if> <c:if
														test="${rdto.stadium == 5}">대전</c:if> <c:if
														test="${rdto.stadium == 6}">광주</c:if> <c:if
														test="${rdto.stadium == 7}">대구</c:if> <c:if
														test="${rdto.stadium == 8}">창원</c:if> <c:if
														test="${rdto.stadium == 9}">부산 사직</c:if> ]
												</td>
												<td><a
													href="${root }/review/read?hugino=${rdto.hugino}${urlhelper}">${rdto.htitle}</a>

												</td>
												<td><a href="${rdto.sikurl }">${rdto.sikname }</a></td>
												<td>${rdto.hdate}</td>
												<td><c:if test="${rdto.star == 1}">★</c:if> <c:if
														test="${rdto.star == 2}">★★</c:if> <c:if
														test="${rdto.star == 3}">★★★</c:if> <c:if
														test="${rdto.star == 4}">★★★★</c:if> <c:if
														test="${rdto.star == 5}">★★★★★</c:if></td>

												<td style="font-size: 20px;"><a
													href="${root }/review/update?hugino=${rdto.hugino }${urlhelper}&mtest=y">
														<img src="${root }/images/edit-solid.svg"
														style="width: 15px;">
												</a></td>

												<td style="font-size: 20px;"><a
													href="${root }/review/delete?hugino=${rdto.hugino }${urlhelper}&mtest=y">
														<img src="${root }/images/trash-alt-solid.svg"
														style="width: 13px;">
												</a></td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>

						</table>
						${rpaging}
					</div>
					<!-- /.blog-content -->
				</div>
				<!-- /.post-blog -->
			</div>
			<!-- /.col-md-12 -->
		</div>
		<!-- /.row -->









		<div class="row">
			<div class="col-md-12">

				<div class="post-blog"></div>
				<!-- /.post-blog -->

				<div class="post-blog">
					<div class="blog-content">
						<h3 style="font-weight: bold">내가 작성한 티켓 게시글</h3>

						<form class="form-inline" action="${root }/member/mypage">

							<!-- select으로 닉네임 , 구장 선택-->
							<div class="form-group">
								<select name="col" class="form-control">
									<option value="stadium"
										<c:if test="${col=='stadium' }">selected</c:if>>지역</option>
									<option value="total"
										<c:if test="${col=='total' }">selected</c:if>>전체출력</option>
								</select>
							</div>

							<!-- 검색 input + 등록 button-->
							<div class="form-group">
								<input type="text" class="form-control" name="tword"
									required="required" value="${tword}">
							</div>
							<button class="btn btn-default">검색</button>
							<button class="btn btn-default2" type="button"
								onclick="location.href='${root }/ticket/create'">등록</button>
							<br />
							<br />
						</form>
						<br />

						<!-- 참조 : contents/mainlist-->

						<c:choose>
							<c:when test="${empty tdto}">
								<!-- 목록이 비어 있을경우-->
								<div class="row">
									<div class="col-sm-5">
										<p>작성하신 티켓 게시글이 없습니다.</p>
									</div>

								</div>
							</c:when>

							<c:otherwise>
								<c:set var="tdto" value="${tdto}" />
								<div class="row">
									<c:forEach var="tdto" begin="0" end="3" items="${tdto}">
										<div class="col-sm-3">
											<a href="${root }/ticket/detail?ticketno=${tdto.ticketno}">
												<img src="/ticket/storage/${tdto.filename}"
												class="img-rounded" width="236" height="306">
											</a>

											<div>
												<li><b>${tdto.stadium}</b></li>
												<li>${tdto.tickettitle}</li> <a
													href="${root}/ticket/update/${tdto.ticketno}"><img
													src="${root }/images/edit-solid.svg" style="width: 15px;"></a>
												<a
													href="${root}/ticket/updateFile/${tdto.ticketno}/${tdto.filename}"><img
													src="${root }/images/camera-retro-solid.svg"
													style="width: 15px;"></a> <a
													href="${root}/ticket/delete?ticketno=${tdto.ticketno}&mtest=y"><img
													src="${root }/images/trash-alt-solid.svg"
													style="width: 13px;"></a>
											</div>
										</div>
									</c:forEach>
								</div>
								<br />

								<div class="row">
									<c:forEach var="tdto" begin="4" end="7" items="${tdto}">
										<div class="col-sm-3">

											<a href="${root }/ticket/detail?ticketno=${tdto.ticketno}">
												<img src="/ticket/storage/${tdto.filename}"
												class="img-rounded" width="236" height="306">
											</a>
											<div class="txt_line">

												<li><b>${tdto.stadium}</b></li>
												<li>${tdto.tickettitle}</li> <a
													href="${root}/ticket/update/${tdto.ticketno}"><img
													src="${root }/images/edit-solid.svg" style="width: 15px;"></a>
												<a
													href="${root}/ticket/updateFile/${tdto.ticketno}/${tdto.filename}"><img
													src="${root }/images/camera-retro-solid.svg"
													style="width: 15px;"></a> <a
													href="${root}/ticket/delete?ticketno=${tdto.ticketno}"><img
													src="${root }/images/trash-alt-solid.svg"
													style="width: 13px;"></a>

											</div>
										</div>
									</c:forEach>
								</div>
        ${tpaging}
        </c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
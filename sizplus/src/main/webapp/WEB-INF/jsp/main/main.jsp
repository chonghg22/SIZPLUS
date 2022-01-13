<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>시즈닝플러스</title>
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<meta content="Bootstrap News Template - Free HTML Templates" name="keywords">
	<meta content="Bootstrap News Template - Free HTML Templates" name="description">
	<link href="/lib/user/lib/slick/slick.css" rel="stylesheet">
	<link href="/lib/user/lib/slick/slick-theme.css" rel="stylesheet">
	<link rel="stylesheet" href="/lib/board/assets/css/fontawesome.css">
	<link rel="stylesheet" href="/lib/board/assets/css/templatemo-sixteen.css">
	<link rel="stylesheet" href="/lib/board/assets/css/owl.css">
	<script src="/lib/board/vendor/jquery/jquery.min.js"></script>
	<script src="/lib/board/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="/lib/board/assets/js/custom.js"></script>
	<script src="/lib/board/assets/js/owl.js"></script>
	<script src="/lib/board/assets/js/slick.js"></script>
	<script src="/lib/board/assets/js/isotope.js"></script>
	<script src="/lib/board/assets/js/accordions.js"></script>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/userLayout/top.jsp" %>
	<!-- Nav Bar End -->

	<!-- Top News Start-->
	<div class="top-news">
		<div class="container">
			<div class="row">
				<div class="col-md-6 tn-left">
					<div class="row tn-slider">
						<div class="col-md-6">
							<div class="tn-img">
								<img src="/lib/user/img/육개장_메인_350x223.jpg" />
								<div class="tn-title">
								
								<!-- text-align:center; 으로 가운데 정렬 하고싶음 !-->
								
									<a href="">"1등" 컵라면</a>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="tn-img">
								<img src="/lib/user/img/텐텐_메인_350x223.jpg" />
								<div class="tn-title">
									<a href="">아이 간식 걱정X 텐텐</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 tn-right">
					<div class="row tn-slider">
						<div class="col-md-6">
							<div class="tn-img">
								<img src="/lib/user/img/미역국밀키트_메인_350x223.jpg" />
								<div class="tn-title">
									<a href="">생일을 간단하게?</a>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="tn-img">
								<img src="/lib/user/img/던킨_디스카운트_350x223.jpg" />
								<div class="tn-title">
									<a href="">!오늘의 요기요 할인!</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Top News End-->

	<!-- Category News Start-->
	<div class="cat-news">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h2>오늘의 추천메뉴</h2>
					<div class="row cn-slider">
						<div class="col-md-6">
							<div class="cn-img">
								<img src="/lib/user/img/지코바_추천메뉴_350x223.jpg" />
								<div class="cn-title">
									<a href="">지코바 숯불 치킨</a>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="cn-img">
								<img src="/lib/user/img/빠네크림파스타_추천메뉴_350x223.jpg" />
								<div class="cn-title">
									<a href="">빠네 크림파스타</a>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="cn-img">
								<img src="/lib/user/img/닭가슴살볶음밥_추천메뉴_350x223.jpg" />
								<div class="cn-title">
									<a href="">닭가슴살 볶음밥</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<h2>이달의 BEST 조리도구</h2>
					<div class="row cn-slider">
						<div class="col-md-6">
							<div class="cn-img">
								<img src="/lib/user/img/베스트조리도구_에르메스_350x223.jpg" />
								<div class="cn-title">
									<a href="">명품 중 명품 에르메스 접시</a>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="cn-img">
								<img src="/lib/user/img/베스트조리도구_스타우브_350x223.jpg" />
								<div class="cn-title">
									<a href="">심이베! 스타우브</a>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="cn-img">
								<img src="/lib/user/img/베스트조리도구_더웨스턴포레스트_350x223.jpg" />
								<div class="cn-title">
									<a href="">두툼한 향균 도마를 찾는다면</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Category News End-->

	<!-- Category News Start-->
	<div class="cat-news">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h2>HOT한 먹방 영상</h2>
					<div class="row cn-slider">
						<div class="col-md-6">
							<div class="cn-img">
								<img src="/lib/user/img/핫먹방_사치닭_350x223.jpg" />
								<div class="cn-title">
									<a href="">편스토랑 류수영 "사치닭"</a>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="cn-img">
								<img src="/lib/user/img/핫먹방_해방타운_육합_350x223.jpg" />
								<div class="cn-title">
									<a href="">해방타운 백지영 "육합"</a>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="cn-img">
								<img src="/lib/user/img/핫먹방_나혼산_간장국수_350x223.jpg" />
								<div class="cn-title">
									<a href="">나혼산 화사 "간장국수"</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<h2>HOT한 요리 영상</h2>
					<div class="row cn-slider">
						<div class="col-md-6">
							<div class="cn-img">
								<img src="/lib/user/img/유튜버_고기남자_썸네일_350x223.jpg"/>
								<div class="cn-title">
									<a href="">"유튜브"<br>고기남자의 오마카세 </a>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="cn-img">
								<img src="/lib/user/img/유튜버_육식맨_양갈비썸네일_350x223.jpg" />
								<div class="cn-title">
									<a href="">"유튜브"<br>육식맨 양갈비</a>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="cn-img">
								<img src="/lib/user/img/유튜버_승우아빠_황금볶음밥썸네일_350x223.jpg" />
								<div class="cn-title">
									<a href="">"유튜브"<br>승우아빠 황금볶음밥</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Category News End-->

	<!-- Tab News Start-->
	<form name="listForm" id="listForm" method="post">
		<input type="hidden" name="bbsId" value="" />
	</form>
	<div class="tab-news">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<ul class="nav nav-pills nav-justified">
						<li class="nav-item">
							<a class="nav-link active" data-toggle="pill" href="#featured">자유게시판</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" data-toggle="pill" href="#popular">라이프 스타일</a>
							</li>
						<li class="nav-item">
							<a class="nav-link" data-toggle="pill" href="#latest">나만 알면 억울해</a>
						</li>
					</ul>

					<div class="tab-content">
						<div id="featured" class="container tab-pane active">
							<a href="#" onclick="fn_goBoard('free')" style="padding-left: 415px;">더보기 <i class="fa fa-angle-right"></i></a><br>
							<c:forEach var="free" items="${freeBoardList}" varStatus="status">
							<div class="tn-news" style="margin-bottom: 19.5px;">
								<div class="tn-title">
									<c:choose>
						           <c:when test="${fn:length(free.title) > 35}">
						            <a href="#" onclick="fn_goView('<c:out value="${free.seq}"/>','<c:out value="${free.bbs_id}"/>')" style="text-decoration: none;color: #000;"><c:out value="${fn:substring(free.title,0,35)}"/>....</a>
						           </c:when>
						           <c:otherwise>
						            <a href="#" onclick="fn_goView('<c:out value="${free.seq}"/>','<c:out value="${free.bbs_id}"/>')" style="text-decoration: none;color: #000;"><c:out value="${free.title}"/></a>
						           </c:otherwise> 
						          </c:choose>
								</div>
							</div>
							</c:forEach>
						</div>
						<div id="popular" class="container tab-pane fade">
							<a href="#" onclick="fn_goBoard('life')" style="padding-left: 415px;">더보기 <i class="fa fa-angle-right"></i></a><br>
							<c:forEach var="life" items="${lifeBoardList}" varStatus="status">
							<div class="tn-news" style="margin-bottom: 19.5px;">
								<div class="tn-title">
									<c:choose>
						           <c:when test="${fn:length(life.title) > 35}">
						            <a href="#" onclick="fn_goView('<c:out value="${life.seq}"/>','<c:out value="${life.bbs_id}"/>')" style="text-decoration: none;color: #000;"><c:out value="${fn:substring(life.title,0,35)}"/>....</a>
						           </c:when>
						           <c:otherwise>
						            <a href="#" onclick="fn_goView('<c:out value="${life.seq}"/>','<c:out value="${life.bbs_id}"/>')" style="text-decoration: none;color: #000;"><c:out value="${life.title}"/></a>
						           </c:otherwise> 
						          </c:choose>
								</div>
							</div>
							</c:forEach>
						</div>
						<div id="latest" class="container tab-pane fade">
							<a href="#" onclick="fn_goBoard('userTip')" style="padding-left: 415px;">더보기 <i class="fa fa-angle-right"></i></a><br>
							<div class="tn-news">
								<div class="tn-img">
									<img src="/lib/user/img/불고기맛집_350x223.jpg" />
								</div>
								
                <!-- // 여기서 [지역]은 말머리나 카테고리로 -->

								<div class="tn-title">
									<a href="">[서울] 불고기맛집 "OOO"</a>
								</div>
							</div>
							<div class="tn-news">
								<div class="tn-img">
									<img src="/lib/user/img/제주해장국맛집_350x223.jpg" />
								</div>
								<div class="tn-title">
									<a href="">[제주] 해장국은 여기 "OOO"</a>
								</div>
							</div>
							<div class="tn-news">
								<div class="tn-img">
									<img src="/lib/user/img/인천조개구이맛집_350x223.jpg" />
								</div>
								<div class="tn-title">
									<a href="">[인천] 조개구이 원조 "OOO"</a>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-6">
					<ul class="nav nav-pills nav-justified">
						<li class="nav-item">
							<a class="nav-link active" data-toggle="pill" href="#m-viewed">공지사항</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" data-toggle="pill" href="#m-recent">자주묻는질문</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" data-toggle="pill" href="#m-read">Q&A</a>
						</li>
					</ul>

					<div class="tab-content">
						<div id="m-viewed" class="container tab-pane active">
							<a href="products.html" style="padding-left: 415px;">더보기 <i class="fa fa-angle-right"></i></a><br>
							<div class="tn-news" style="margin-bottom: 19.5px;">
								<div class="tn-title">
									<a href="">1.그만물어봐</a>
								</div>
							</div>
							<div class="tn-news" style="margin-bottom: 19.5px;">
								<div class="tn-title">
									<a href="">1.그만물어봐</a>
								</div>
							</div>
							<div class="tn-news" style="margin-bottom: 19.5px;">
								<div class="tn-title">
									<a href="">1.그만물어봐</a>
								</div>

							</div>
							<div class="tn-news" style="margin-bottom: 19.5px;">
								<div class="tn-title">
									<a href="">1.그만물어봐</a>
								</div>

							</div>
							<div class="tn-news" style="margin-bottom: 19.5px;">
								<div class="tn-title">
									<a href="">1.그만물어봐</a>
								</div>
							</div>
						</div>
						<div id="m-read" class="container tab-pane fade">
							<a href="products.html" style="padding-left: 415px;">더보기 <i class="fa fa-angle-right"></i></a><br>
							<div class="tn-news" style="margin-bottom: 19.5px;">
								<div class="tn-title">
									<a href="">1.공지사항</a>
								</div>
							</div>
							<div class="tn-news" style="margin-bottom: 19.5px;">
								<div class="tn-title">
									<a href="">2.공지사항</a>
								</div>
							</div>
							<div class="tn-news" style="margin-bottom: 19.5px;">
								<div class="tn-title">
									<a href="">3.공지사항</a>
								</div>

							</div>
							<div class="tn-news" style="margin-bottom: 19.5px;">
								<div class="tn-title">
									<a href="">4.공지사항</a>
								</div>

							</div>
							<div class="tn-news" style="margin-bottom: 19.5px;">
								<div class="tn-title">
									<a href="">5.공지사항</a>
								</div>
							</div>
						</div>
						<div id="m-recent" class="container tab-pane fade">
							<a href="products.html" style="padding-left: 415px;">더보기 <i class="fa fa-angle-right"></i></a><br>
							<div class="tn-news" style="margin-bottom: 19.5px;">
								<div class="tn-title">
									<a href="">자주 묻겠습니다.</a>
								</div>
							</div>
							<div class="tn-news" style="margin-bottom: 19.5px;">
								<div class="tn-title">
									<a href="">자주 묻겠습니다.</a>
								</div>
							</div>
							<div class="tn-news" style="margin-bottom: 19.5px;">
								<div class="tn-title">
									<a href="">자주 묻겠습니다.</a>
								</div>

							</div>
							<div class="tn-news" style="margin-bottom: 19.5px;">
								<div class="tn-title">
									<a href="">자주 묻겠습니다.</a>
								</div>

							</div>
							<div class="tn-news" style="margin-bottom: 19.5px;">
								<div class="tn-title">
									<a href="">자주 묻겠습니다.</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Tab News Start-->
	<!--  -->
	<div class="latest-products">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="section-heading">
						<h2>Best 레시피</h2>
						<a href="products.html">더 많은 레시피 보기 <i class="fa fa-angle-right"></i></a>
					</div>
				</div>
				<div class="col-md-4">
					<div class="product-item">
						<a href="#">
							<img src="/lib/board/assets/images/product_01.jpg" alt="">
						</a>
						<div class="down-content">
							<a href="#"><h4>Tittle goes here</h4></a>
							<h6>$25.75</h6>
							<p>Lorem ipsume dolor sit amet, adipisicing elite. Itaque,
								corporis nulla aspernatur.</p>
							<ul class="stars">
								<li><i class="fa fa-star"></i></li>
								<li><i class="fa fa-star"></i></li>
								<li><i class="fa fa-star"></i></li>
								<li><i class="fa fa-star"></i></li>
								<li><i class="fa fa-star"></i></li>
							</ul>
							<span>Reviews (24)</span>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="product-item">
						<a href="#">
							<img src="/lib/board/assets/images/product_02.jpg" alt="">
						</a>
						<div class="down-content">
							<a href="#"><h4>Tittle goes here</h4></a>
							<h6>$30.25</h6>
							<p>Lorem ipsume dolor sit amet, adipisicing elite. Itaque,
								corporis nulla aspernatur.</p>
							<ul class="stars">
								<li><i class="fa fa-star"></i></li>
								<li><i class="fa fa-star"></i></li>
								<li><i class="fa fa-star"></i></li>
								<li><i class="fa fa-star"></i></li>
								<li><i class="fa fa-star"></i></li>
							</ul>
							<span>Reviews (21)</span>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="product-item">
						<a href="#">
							<img src="/lib/board/assets/images/product_03.jpg" alt="">
						</a>
						<div class="down-content">
							<a href="#"><h4>Tittle goes here</h4></a>
							<h6>$20.45</h6>
							<p>Sixteen Clothing is free CSS template provided by TemplateMo.</p>
							<ul class="stars">
								<li><i class="fa fa-star"></i></li>
								<li><i class="fa fa-star"></i></li>
								<li><i class="fa fa-star"></i></li>
								<li><i class="fa fa-star"></i></li>
								<li><i class="fa fa-star"></i></li>
							</ul>
							<span>Reviews (36)</span>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="product-item">
						<a href="#">
							<img src="/lib/board/assets/images/product_04.jpg" alt="">
						</a>
						<div class="down-content">
							<a href="#"><h4>Tittle goes here</h4></a>
							<h6>$15.25</h6>
							<p>Lorem ipsume dolor sit amet, adipisicing elite. Itaque,
								corporis nulla aspernatur.</p>
							<ul class="stars">
								<li><i class="fa fa-star"></i></li>
								<li><i class="fa fa-star"></i></li>
								<li><i class="fa fa-star"></i></li>
								<li><i class="fa fa-star"></i></li>
								<li><i class="fa fa-star"></i></li>
							</ul>
							<span>Reviews (48)</span>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="product-item">
						<a href="#">
							<img src="/lib/board/assets/images/product_05.jpg" alt="">
						</a>
						<div class="down-content">
							<a href="#"><h4>Tittle goes here</h4></a>
							<h6>$12.50</h6>
							<p>Lorem ipsume dolor sit amet, adipisicing elite. Itaque,
								corporis nulla aspernatur.</p>
							<ul class="stars">
								<li><i class="fa fa-star"></i></li>
								<li><i class="fa fa-star"></i></li>
								<li><i class="fa fa-star"></i></li>
								<li><i class="fa fa-star"></i></li>
								<li><i class="fa fa-star"></i></li>
							</ul>
							<span>Reviews (16)</span>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="product-item">
						<a href="#">
							<img src="/lib/board/assets/images/product_06.jpg" alt="">
						</a>
						<div class="down-content">
							<a href="#"><h4>Tittle goes here</h4></a>
							<h6>$22.50</h6>
							<p>Lorem ipsume dolor sit amet, adipisicing elite. Itaque,
								corporis nulla aspernatur.</p>
							<ul class="stars">
								<li><i class="fa fa-star"></i></li>
								<li><i class="fa fa-star"></i></li>
								<li><i class="fa fa-star"></i></li>
								<li><i class="fa fa-star"></i></li>
								<li><i class="fa fa-star"></i></li>
							</ul>
							<span>Reviews (32)</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/userLayout/bottom.jsp" %>
	<!--  -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="/lib/user/lib/easing/easing.min.js"></script>
<script src="/lib/user/lib/slick/slick.min.js"></script>
<script src="/lib/user/js/main.js"></script>
<script>
function fn_goBoard(bbsId) {
	var frm = document.listForm;
	frm.bbsId.value = bbsId;
	frm.action = "/board/board_list.do";
	frm.submit();
}
</script>
</body>
</html>

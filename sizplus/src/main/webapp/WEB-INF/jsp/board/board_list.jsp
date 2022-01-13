<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
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
	<link rel="stylesheet" href="/lib/board/assets/css/fontawesome.css">
	<link rel="stylesheet"href="/lib/board/assets/css/templatemo-sixteen.css">
	<link rel="stylesheet" href="/lib/board/assets/css/owl.css">
	<script src="/lib/board/vendor/jquery/jquery.min.js"></script>
	<script src="/lib/board/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="/lib/board/assets/js/custom.js"></script>
	<script src="/lib/board/assets/js/owl.js"></script>
	<script src="/lib/board/assets/js/slick.js"></script>
	<script src="/lib/board/assets/js/isotope.js"></script>
	<script src="/lib/board/assets/js/accordions.js"></script>
	<style>
	.works_table thead th {
    padding: 15px 10px;
    font-size: 16px;
    color: #333;
    font-weight: bold;
	}
	.works_table thead tr {
    border-top: solid 2px #000000;
    border-bottom: solid 1px #000000;
	}
	</style>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/userLayout/top.jsp" %>
	<form name="listForm" id="listForm" method="post">
	<input type="hidden" name="viewCount" value="<c:out value="${map.viewCount}" />" />
	<input type="hidden" name="page" value="<c:out value="${map.page}" />" />
	<input type="hidden" name="seq" value="" />
	<input type="hidden" name="bbsId" value="" />
	<div class="products">
		<div class="container">
			<div class="col-md-12">
				<div class="filters">
					<ul>
						<li class="" data-filter="*" style="float: left;">
						<h3>
							<c:if test="${commandMap.get('bbsId') eq 'free' }">
							<span>자유게시판</span>
							</c:if>
							<c:if test="${commandMap.get('bbsId') eq 'life' }">
							<span>라이프스타일</span>
							</c:if> 
				  		</h3>
						</li>
						<li class="active" data-filter="*" ></li>
					</ul>
				</div>
			</div>
			<div class="row">
				<table class="works_table" style="width: 100%;">
					<colgroup>
						<col width="10%">
						<col width="50%">
						<col width="10%">
						<col width="20%">
						<col width="5%">
						<col width="5%">
					</colgroup>
					<thead>
						<tr style="border-top: solid 2px #000000; border-bottom: solid 1px #000000;">
							<th style="text-align: center;">번호</th>
							<th style="text-align: center;">제목</th>
							<th style="text-align: center;">글쓴이</th>
							<th style="text-align: center;">작성일</th>
							<th style="text-align: center;">조회</th>
							<th style="text-align: center;">추천</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="result" items="${list}" varStatus="status">
						<tr style="cursor:default">
							<td style="text-align: center;"><c:out value="${listNo - status.index}"/></td>
							<td style="text-align: left;">
							 <c:choose>
					           <c:when test="${fn:length(result.title) > 35}">
					            <a href="#" onclick="fn_goView('<c:out value="${result.seq}"/>','<c:out value="${result.bbs_id}"/>')" style="text-decoration: none;color: #000;"><c:out value="${fn:substring(result.title,0,35)}"/>....[1]</a>
					           </c:when>
					           <c:otherwise>
					            <a href="#" onclick="fn_goView('<c:out value="${result.seq}"/>','<c:out value="${result.bbs_id}"/>')" style="text-decoration: none;color: #000;"><c:out value="${result.title}"/> [1]</a>
					           </c:otherwise> 
					          </c:choose>
							</td>
							<td style="text-align: center;">${result.input_nm }</td>
							<td style="text-align: center;">${fn:substring(result.input_date,5,16)}</td>
							<td style="text-align: center;">${result.hit }</td>
							<td style="text-align: center;">11</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<%@ include file="/WEB-INF/jsp/pagination/comm_pagination_include.jsp" %>
        	</div>
        	<div class="col-md-12">
				<div class="filters" style="border-bottom: 0px;">
					<br>
					<ul>
						<li class="active" data-filter="*" ></li>
						<li data-filter=".gra" class="" style="float: right;" onclick="fn_goInput('${commandMap.get('bbsId')}');">글쓰기</li>
					</ul>
				</div>
			</div>
		</div>
    </div>
	<%@ include file="/WEB-INF/jsp/userLayout/bottom.jsp" %>
</body>
<script type="text/javascript">
function fn_link_page(pageNo){
	if(pageNo == 1){
		if(${paginationInfo.currentPageNo} <2){
			alert("첫 페이지 입니다.");
			return;
		}
	}
	if(pageNo == ${paginationInfo.totalPageCount}){
		if(${paginationInfo.currentPageNo} == ${paginationInfo.totalPageCount}){
			alert("마지막 페이지 입니다.");
			return;
		}
	}
	var frm = document.listForm;
	frm.action = "/board/board_list.do";
	frm.page.value = pageNo;
	frm.submit();
}

//등록페이지 이동
function fn_goInput(bbsId){
	var frm = document.listForm;
	frm.bbsId.value = bbsId;
	frm.action = "/board/board_input.do";
	frm.submit();
}

/* 글 상세보기 화면 function */
function fn_goView(seq,bbsId) {
	var frm = document.listForm;
	frm.seq.value = seq;
	frm.bbsId.value = bbsId;
	frm.action = "/board/board_view.do";
	frm.submit();
}
</script>
</html>
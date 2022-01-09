<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<div class="products">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="filters-content">
                <div class="row grid" >
                    <div class="col-lg-12 col-md-12 all des" style="position: absolute; left: 0%; top: 0px;">
            	<table class="works_table">
						<colgroup>
							<col width="10%">
							<col width="50%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
						</colgroup>
						<thead>
							<tr style="border-top: solid 2px #000000; border-bottom: solid 1px #000000;">
								<th>번호</th>
								<th>제목</th>
								<th>글쓴이</th>
								<th>작성일</th>
								<th>조회</th>
								<th>추천</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="result" items="${list}" varStatus="status">
							<tr style="cursor:default">
								<td><c:out value="${listNo - status.index}"/></td>
								<td>
								<a href="#" style="text-decoration: none;color: #000;">${result.title } [1]</a>
								</td>
								<td style="text-align:left">${result.inpudId }</td>
								<td>${result.inputDate }</td>
								<td>${result.hit }</td>
								<td>11</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
                    </div>
                </div>
            </div>
          </div>
<!--           <div class="col-md-12"> -->
<!--             <ul class="pages"> -->
<!--               <li><a href="#">1</a></li> -->
<!--               <li class="active"><a href="#">2</a></li> -->
<!--               <li><a href="#">3</a></li> -->
<!--               <li><a href="#">4</a></li> -->
<!--               <li><a href="#"><i class="fa fa-angle-double-right"></i></a></li> -->
<!--             </ul> -->
<!--           </div> -->
		<%@ include file="/WEB-INF/jsp/pagination/comm_pagination_include.jsp" %>
        </div>
      </div>
    </div>
	<%@ include file="/WEB-INF/jsp/userLayout/bottom.jsp" %>
</body>
<script type="text/javascript">
/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
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
	frm.action = "/board/userTip_list.do";
	frm.page.value = pageNo;
	frm.submit();
}
</script>
</html>
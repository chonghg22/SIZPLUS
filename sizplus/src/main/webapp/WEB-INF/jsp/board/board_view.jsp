<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
	<input type="hidden" name="bbsId" value="" />
	<div class="products">
		<div class="container">
			<h4><span>모두의 꿀팁</span><button style="float: right;" onclick="fn_list()">목록</button></h4>
			<div class="row">
				<table class="works_table" style="width: 100%;">
					<colgroup>
						<col style="width:15%"/>
						<col/>
					</colgroup>
					<tbody>
						<tr style="border-top: solid 2px #000000; border-bottom: solid 1px #000000;">
							<th style="text-align: center;">닉네임</th>
							<td>${result.input_nm}</td>
						</tr>
						<tr style="border-top: solid 2px #000000; border-bottom: solid 1px #000000;">
							<th style="text-align: center;">제목</th>
							<td>${result.title}</td>
						</tr>
						<tr style="border-top: solid 2px #000000; border-bottom: solid 1px #000000;">
							<th style="text-align: center;">내용</th>
							<td>${result.contents}</td>
						</tr>
					</tbody>
				</table>
        	</div>
		</div>
    </div>
	<%@ include file="/WEB-INF/jsp/userLayout/bottom.jsp" %>
</body>
<script type="text/javascript">
/* pagination 페이지 링크 function */
function fn_list(){
	var frm = document.listForm;
	frm.action = "/board/userTip_list.do";
	frm.submit();
}
</script>
</html>
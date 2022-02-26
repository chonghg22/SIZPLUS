<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>시즈닝플러스</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Bootstrap News Template - Free HTML Templates"
	name="keywords">
<meta content="Bootstrap News Template - Free HTML Templates"
	name="description">
<link rel="stylesheet" href="/lib/board/assets/css/fontawesome.css">
<link rel="stylesheet"
	href="/lib/board/assets/css/templatemo-sixteen.css">
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
	<%@ include file="/WEB-INF/jsp/user/userLayout/top.jsp"%>
	<form name="listForm" id="listForm" method="post">
		<input type="hidden" name="bbsId" value="${result.bbs_id}" />
		<input type="hidden" name="boardSeq" value="${result.board_seq}" />
		<div class="products">
			<div class="container">
				<div class="col-md-12">
					<div class="filters">
						<ul>
							<li class="" data-filter="*" style="float: left;">
								<h3>
									<c:if test="${commandMap.get('bbsId') eq 'free' }">
										<span>
											<a href="/board/board_list.do?bbsId=${commandMap.get('bbsId')}" style="color: black;">자유게시판</a>
										</span>
									</c:if>
									<c:if test="${commandMap.get('bbsId') eq 'life' }">
										<span>
											<a href="/board/board_list.do?bbsId=${commandMap.get('bbsId')}" style="color: black;">라이프스타일</a>
										</span>
									</c:if>
									<c:if test="${commandMap.get('bbsId') eq 'notice' }">
										<span>
											<a href="/board/board_list.do?bbsId=${commandMap.get('bbsId')}" style="color: black;">공지사항</a>
										</span>
									</c:if>
									<c:if test="${commandMap.get('bbsId') eq 'faq' }">
										<span>
											<a href="/board/board_list.do?bbsId=${commandMap.get('bbsId')}" style="color: black;">FAQ</a>
										</span>
									</c:if>
									<c:if test="${commandMap.get('bbsId') eq 'qna' }">
										<span>
											<a href="/board/board_list.do?bbsId=${commandMap.get('bbsId')}" style="color: black;">자주묻는질문</a>
										</span>
									</c:if>
								</h3>
							</li>
							<li class="active" data-filter="*"></li>
						</ul>
					</div>
				</div>
				<div class="row">
					<table class="works_table" style="width: 100%;">
						<colgroup>
							<col style="width: 15%" />
							<col />
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
				<div class="col-md-12">
					<div class="filters" style="border-bottom: 0px;">
						<br>
						<ul>
							<li data-filter=".gra" class="" style="float: left;" onclick="fn_good();">
								추천[<span id="goodCnt">${result.good_cnt}</span>]
							</li>
							<li data-filter=".gra" class="" style="float: left;" onclick="fn_bad();">
								비추천[<span id="badCnt">${result.bad_cnt}</span>]
							</li>
							<li class="active" data-filter="*"></li>
							<li data-filter=".gra" class="" style="float: right;" onclick="fn_remove();">삭제</li>
							<li data-filter=".gra" class="" style="float: right;" onclick="fn_edit();">수정</li>
							<li data-filter=".gra" class="" style="float: right;" onclick="fn_list();">목록</li>
						</ul>
					</div>
				</div>
				<div class="row" style="margin-top: -80px;">
				<h4>댓글</h4>
				<div>
					<c:forEach var="result" items="${commentList}" varStatus="status">
					<c:if test="${result.recomment_no eq '0'}">
					<div>&nbsp; &nbsp; &nbsp; &nbsp;${result.nickname}</div>
					<div>&nbsp; &nbsp; &nbsp; &nbsp;${result.comment_contents}</div>
					<div style="border-bottom: solid 1px #000000;">&nbsp; &nbsp; &nbsp; &nbsp;
						<span>${result.reg_dt}</span>
						<span style="padding-left: 20px;">답글쓰기</span>
					</div>
					</c:if>
					<c:if test="${result.recomment_no ne '0'}">
					<div style="margin-left: 50px;">
						<div>&nbsp; &nbsp; &nbsp; &nbsp;${result.nickname}</div>
						<div>&nbsp; &nbsp; &nbsp; &nbsp;${result.comment_contents}</div>
						<div style="border-bottom: solid 1px #000000;">&nbsp; &nbsp; &nbsp; &nbsp;
						<span>${result.reg_dt}</span>
						<span style="padding-left: 20px;">답글쓰기</span>
						</div>
					</div>
					</c:if>
					</c:forEach>
				</div>
				<span>${commandMap.get('loginMemberNickName') }</span>
				<table class="works_table" style="width: 100%;">
					<tbody>
						<tr >
							<td><textarea name="commentContents" id="commentContents" style="width:100%; height:100px;"  title="상세내용"></textarea></td>
						</tr>
					</tbody>
				</table>
        		</div>
        		<div class="col-md-12">
					<div class="filters" style="border-bottom: 0px; margin-bottom: -25px;">
						<br>
						<ul>
							<li class="active" data-filter="*"></li>
							<li data-filter=".gra" class="" style="float: right;" onclick="fn_input();">등록</li>
						</ul>
					</div>
				</div>
				</table>
			</div>
		</div>
		<%@ include file="/WEB-INF/jsp/user/userLayout/bottom.jsp"%>
</body>
<script type="text/javascript">
//목록으로 이동
function fn_list(){
	var frm = document.listForm;
	frm.action = "/board/board_list.do";
	frm.submit();
}

//수정페이지 이동
function fn_edit(){
	var frm = document.listForm;
	frm.action = "/board/board_edit.do";
	frm.submit();
}

//게시글 삭제
function fn_remove(){
	var frm = document.listForm;
	frm.action = "/board/board_delete_proc.do";
	frm.submit();
}

//추천
function fn_good(){
	$.ajax({
		url : "/board/boardGoodCnt_update_proc.ajax"
		, data : $("#listForm").serialize()
		, type : "post"
		, dataType : "json"
		, success : function(data){
			alert(data.message);
			$("#goodCnt").html(${result.good_cnt}+1)
// 			if(data.result == "0"){
// 				alert(data.message);//
// 				checkFlag = false;
// 				return false;
// 			}else if(data.result == "1"){
// 				$("#idHelp").text("사용가능한 사업코드 입니다.");
// 				checkFlag = true;
// 			}else if(data.result == "2"){
// 				$("#idHelp").text("중복된 사업코드 입니다.");
// 				$("#bizCode").val("");
// 				return false;
// 				checkFlag = false;
// 			}else{
// 				$("#idHelp").text("사업코드를 다시 입력 해 주세요.");
// 				$("#bizCode").val("");
// 				return false;
// 				checkFlag = false;
// 			}
		}
		, error:function(request,status,error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

//추천
function fn_bad(){
	$.ajax({
		url : "/board/boardBadCnt_update_proc.ajax"
		, data : $("#listForm").serialize()
		, type : "post"
		, dataType : "json"
		, success : function(data){
			alert(data.message);
			$("#badCnt").html(${result.bad_cnt}+1)
// 			if(data.result == "0"){
// 				alert(data.message);//
// 				checkFlag = false;
// 				return false;
// 			}else if(data.result == "1"){
// 				$("#idHelp").text("사용가능한 사업코드 입니다.");
// 				checkFlag = true;
// 			}else if(data.result == "2"){
// 				$("#idHelp").text("중복된 사업코드 입니다.");
// 				$("#bizCode").val("");
// 				return false;
// 				checkFlag = false;
// 			}else{
// 				$("#idHelp").text("사업코드를 다시 입력 해 주세요.");
// 				$("#bizCode").val("");
// 				return false;
// 				checkFlag = false;
// 			}
		}
		, error:function(request,status,error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

//게시글 삭제
function fn_input(){
	var frm = document.listForm;
	frm.action = "/board/board_comment_input_proc.do";
	frm.submit();
}
</script>
</html>
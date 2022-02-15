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
	<link rel="stylesheet" href="/lib/board/assets/css/templatemo-sixteen.css">
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
	<form name="listForm" id="listForm">
	<input type="hidden" name="boardSeq" value="${result.board_seq} }" />
	<input type="hidden" name="bbsId" value="${result.bbs_id}" />
	<input type="hidden" name="openYn" value="Y"/>
	<div class="products">
		<div class="container">
			<div class="col-md-12">
				<div class="filters">
					<ul>
						<li class="" data-filter="*" style="float: left;">
						<h3>
							<c:if test="${commandMap.get('bbsId') eq 'free' }">
							<span><a href="/board/board_list.do?bbsId=${commandMap.get('bbsId')}" style="color: black;">자유게시판</a></span>
							</c:if>
							<c:if test="${commandMap.get('bbsId') eq 'life' }">
							<span><a href="/board/board_list.do?bbsId=${commandMap.get('bbsId')}" style="color: black;">라이프스타일</a></span>
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
						<col style="width:15%"/>
						<col/>
					</colgroup>
					<tbody>
						<tr style="border-top: solid 2px #000000; border-bottom: solid 1px #000000;">
							<th style="text-align: center;">닉네임</th>
							<td>${result.input_nm }</td>
						</tr>
						<tr style="border-top: solid 2px #000000; border-bottom: solid 1px #000000;">
							<th style="text-align: center;">비밀번호</th>
							<td><input type="password" name="password" id="password" maxlength="150"  style="width:100%" /></td>
						</tr>
						<tr style="border-top: solid 2px #000000; border-bottom: solid 1px #000000;">
							<th style="text-align: center;">제목</th>
							<td><input type="text" name="title" id="title" value="${result.title}" maxlength="150"  style="width:100%" /></td>
						</tr>
						<tr style="border-top: solid 2px #000000; border-bottom: solid 1px #000000;">
							<th style="text-align: center;">내용</th>
							<td><textarea name="contents" id="contents" class="required" style="width:100%; height:300px;"  title="상세내용">${result.contents}</textarea></td>
						</tr>
					</tbody>
				</table>
        	</div>
        	<div class="col-md-12">
				<div class="filters" style="border-bottom: 0px;">
					<br>
					<ul>
						<li class="active" data-filter="*" ></li>
						<li data-filter=".gra" class="" style="float: right;" onclick="fn_edit();">수정</li>
					</ul>
				</div>
			</div>
		</div>
    </div>
	<%@ include file="/WEB-INF/jsp/userLayout/bottom.jsp" %>
</body>
<!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인완료) -->
<script type="text/javascript" src="/lib/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<!-- 에디터 스킨 불러오기(경로 확인완료) -->
<script type="text/javascript" src="/lib/smartEditor/SmartEditor2Skin.html"></script>
<script type="text/javascript">
/* 스마트에디터 적용 스크립트*/
var oEditors = [];
$(function(){
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "contents", //textarea에서 지정한 id와 일치해야 합니다.
          //SmartEditor2Skin.html 파일이 존재하는 경로
          sSkinURI: "/lib/smartEditor/SmartEditor2Skin.html",
          htParams : {
              // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseToolbar : true,
              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseVerticalResizer : true,
              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
              bUseModeChanger : true,
              fOnBeforeUnload : function(){

              }
          },
          fOnAppLoad : function(){
              //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
              oEditors.getById["contents"].exec("PASTE_HTML", [""]);
          },
          fCreator: "createSEditor2"
      });
});
/* pagination 페이지 링크 function */
function fn_edit(){
	var frm = document.listForm;
	oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
	frm.action = "/board/board_edit_proc.do";
	frm.method = "post";
	frm.submit();
}
</script>
</html>
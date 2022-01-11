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
</head>
<body>
	<%@ include file="/WEB-INF/jsp/userLayout/top.jsp" %>
	<div class="products">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
          	<form name="inputForm" id="inputForm" method="post">
          	<div>
          		<span>닉네임</span><input type="text" name="nick_name" id="nick_name" value=""/>
          	</div>
          	<div>
          		<span>비밀번호</span><input type="password" name="password" id="password" value=""/>
          	</div>
          	<div>
				<span>제목</span><input type="text" name="title" id="title" value=""/>
			</div>
			<div>
				<span>내용</span><textarea type="text" name="contents" id="contents" value="">123</textarea>
			</div>			
			<button onclick="fn_input()">등록</button>
			</form>			
          </div>
        </div>
      </div>
    </div>
	<%@ include file="/WEB-INF/jsp/userLayout/bottom.jsp" %>
</body>
<script type="text/javascript">
function fn_input(){
	var frm = document.inputForm;
	frm.action = "/board/board_input_proc.do";
	frm.submit();
} 
</script>
</html>

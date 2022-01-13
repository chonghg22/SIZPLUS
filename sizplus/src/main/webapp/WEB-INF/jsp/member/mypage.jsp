<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
	<h1>회원 가입</h1>
	<div class="join-form-box">
		<form action="/member/member_edit_proc.do" method="POST" class="join-form form2"	onsubmit="submitJoinForm(this); return false;">
		
			<input type="hidden" name="loginPwReal">
			<div class="form-row">
				<div class="label">아이디</div>
				<div class="input">
					<!-- member_id(박스) 라는 명칭으로 사용자가 입력한 값(물품)을 자바로 넘겨줄꺼임 -->
					<input type="text" name="member_id" value="chonghg55" maxlength="20"  placeholder="id 입력">
				</div>
			</div>
			<div class="form-row">
				<div class="label">비밀번호</div>
				<div class="input">
					<input type="password" name="member_pw" value="" maxlength="20"
						placeholder="password 입력">
				</div>
			</div>
<!-- 			<div class="form-row"> -->
<!-- 				<div class="label">비밀번호 확인</div> -->
<!-- 				<div class="input"> -->
<!-- 					<input type="password" name="loginPwConfirm" maxlength="20" -->
<!-- 						placeholder="password 확인 입력"> -->
<!-- 				</div> -->
<!-- 			</div> -->
			<div class="form-row">
				<div class="input flex-jc-c">
					<button type="submit" value="완료">완료</button>
					<button type="button" value="취소" onClick="alert('회원가입이 취소되었습니다.')">
						<a href="/blog/s/home/main">취소</a>
					</button>
				</div>
			</div>
		</form>
	</div>

	<!-- 비밀번호 암호화 등 -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>
	<script>

	var joinFormSubmitted = false;

	function submitJoinForm(form) {
		if (joinFormSubmitted) {
			alert('처리 중입니다.');
			return;
		}

		form.loginPw.value = form.loginPw.value.trim();
		if (form.loginPw.value.length == 0) {
			alert('비밀번호를 입력해주세요.');
			form.loginPw.focus();

			return;
		}

		<!-- 입력된 비밀번호(loginPw)와 확인(loginPwConfirm) 일치하는지 체크 )-->
		form.loginPwConfirm.value = form.loginPwConfirm.value.trim();
		if (form.loginPwConfirm.value.length == 0) {
			alert('비밀번호를 입력해주세요.');
			form.loginPw.focus();

			return;
		}
		
		if (form.loginPwConfirm.value != form.loginPw.value ) {
			alert('로그인 비밀번호 확인이 일치하지 않습니다.');
			form.loginPwConfirm.focus();

			return;
		}
		
		<!-- 패스워드 함호화 -->
		form.loginPwReal.value = sha256(form.loginPw.value);
		form.loginPw.value = '';
		form.loginPwConfirm.value = form.loginPw.value;

		form.submit();
		joinFormSubmitted = true;
	}
    
</script>

</body>

</html>
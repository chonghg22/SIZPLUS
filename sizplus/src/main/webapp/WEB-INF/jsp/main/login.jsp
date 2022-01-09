<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Login V1</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="lib/login/css/main.css">
	<link rel="stylesheet" type="text/css" href="lib/login/css/user_bottom.css">
</head>
<body>
	<%@ include file="/WEB-INF/jsp/userLayout/top.jsp" %>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-pic js-tilt" data-tilt style="height: 450px;">
				<!--  -->
				<div class="loginType">
						<div>
							<ul>
								<li class="login1"><a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&amp;client_id=ysbAfLi3W9Mm7YW2JJI6&amp;redirect_uri=https%3A%2F%2Fwww.dlibrary.go.kr%2Flogin%2FnaverLogin.do&amp;state=a10e4265-e00c-434d-b273-461622d5abf8"><span>네이버로 로그인</span></a></li>
								<li class="login2"><a href="https://accounts.google.com/o/oauth2/auth?client_id=408940939198-br1j9glvab253mbqth2l0af4u1bbvdta.apps.googleusercontent.com&amp;response_type=code&amp;scope=profile&amp;redirect_uri=https%3A%2F%2Fwww.dlibrary.go.kr%2Flogin%2FgoogleLogin.do"><span>구글로 로그인</span></a></li>
								<li class="login3"><a href="https://kauth.kakao.com/oauth/authorize?client_id=36f5f533cb3751bd1446fb5886420d52&amp;redirect_uri=https://www.dlibrary.go.kr/login/kakaoLogin.do&amp;response_type=code"><span>카카오로 로그인</span></a></li>
								<li class="login4"><a href="https://www.facebook.com/v2.5/dialog/oauth?client_id=372462813427840&response_type=code&scope=email&redirect_uri=https%3A%2F%2Fwww.dlibrary.go.kr%2Flogin%2FfacebookLogin.do"><span>페이스북으로 로그인</span></a></li>
							</ul>
						</div>
					</div>
				<!--  -->
				</div>
				
				<form class="login100-form validate-form" action="/login_proc.do">
					<span class="login100-form-title">
						회원 로그인
					</span>
					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" name="member_id" placeholder="아이디">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" type="password" name="member_pw" placeholder="비밀번호">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					
					<div class="container-login100-form-btn">
						<button class="login100-form-btn">로그인</button>
					</div>

					<div class="text-center p-t-12">
						<span class="txt1">잊으셨나요</span>
						<a class="txt2" href="#">아이디 / 비밀번호?</a>
					</div>

					<div class="text-center p-t-136">
						<a class="txt2" href="/member/member_input.do">회원가입
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/userLayout/bottom.jsp" %>
</body>
</html>
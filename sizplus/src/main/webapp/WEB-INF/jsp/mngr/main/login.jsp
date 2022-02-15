<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<style>
body {
  margin: 0;
  padding: 0;
  height: 100vh;
}
#login .container #login-row #login-column #login-box {
  margin-top: 120px;
  max-width: 600px;
  height: 320px;
  border: 1px solid #9C9C9C;
  background-color: #EAEAEA;
}
#login .container #login-row #login-column #login-box #login-form {
  padding: 20px;
}
#login .container #login-row #login-column #login-box #login-form #register-link {
  margin-top: -85px;
}
</style>
</head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<body style="background-color: #17a2b8;">
    <div id="login">
        <h3 class="text-center text-white pt-5">시즈닝플러스</h3>
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="login_form" class="form" method="post" name="login_form">
                            <h3 class="text-center text-info">로그인</h3>
                            <div class="form-group">
                                <label for="username" class="text-info">아이디:</label><br>
                                <input type="text" name="mng_id" id="mng_id" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="password" class="text-info">비밀번호:</label><br>
                                <input type="text" name="mng_pass" id="mng_pass" class="form-control">
                            </div>
                            <div class="form-group">
                                <input type="submit" class="btn btn-info btn-md" value="로그인" onclick="fn_login()">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
  	//검색
    function fn_login(){
    	var frm = document.login_form;
    	frm.action = "/mngr/main/login_proc.do";
    	frm.submit();
    }
    </script>
</body>
</html>
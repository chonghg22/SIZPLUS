<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Resto - Restaurant Bootstrap 4 Template by GetTemplates.co</title>
    <meta name="description" content="Resto">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="lib/user/img/favicon.ico" rel="icon">
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,600&display=swap" rel="stylesheet">
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
	<link href="/lib/user/css/style.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
	<link href="/lib/board/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<div class="brand">
	<div class="container">
		<div class="row align-items-center">
			<div class="col-lg-6 col-md-4">
				<div class="b-logo">
					<a href="/index.do"> <img src="/lib/user/img/logo.png" alt="Logo">
					</a>
				</div>
			</div>
			<div class="col-lg-6 col-md-4">
				<div class="b-search">
					<input type="text" placeholder="Search">
					<button>
						<i class="fa fa-search"></i>
					</button>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="nav-bar">
	<div class="container">
		<nav class="navbar navbar-expand-md bg-dark navbar-dark">
			<a href="#" class="navbar-brand">MENU</a>
			<button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
				<div class="navbar-nav mr-auto">
					<a href="/index.do" class="nav-item nav-link active">Home</a>
					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">모두의 게시판</a>
						<div class="dropdown-menu">
							<a href="/board/board_list.do?bbsId=free" class="dropdown-item">자유게시판</a>
							<a href="/board/board_list.do?bbsId=life" class="dropdown-item">라이프 스타일</a>
							<a href="/recipe/recipe_list.do" class="dropdown-item">모두의 레시피</a>
						</div>
					</div>
					<a href="single-page.html" class="nav-item nav-link">Single Page</a>
					<a href="/login.do" class="nav-item nav-link">로그인</a>
					<a href="/member/mypage.do" class="nav-item nav-link">마이페이지</a>
				</div>
			</div>
		</nav>
	</div>
</div>
  
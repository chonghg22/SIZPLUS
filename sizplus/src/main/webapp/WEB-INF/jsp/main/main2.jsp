<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>SIZPLUS</title>
	<meta name="description" content="Resto">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="lib/user/vendor/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="lib/user/css/style.min.css">
	<link rel="stylesheet" type="text/css" href="lib/slick/slick.css">
  	<link rel="stylesheet" type="text/css" href="lib/slick/slick-theme.css">
	<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
  	<script src="lib/slick/slick.js" type="text/javascript" charset="utf-8"></script>
	<style>
	
    .main-cs .section {
    border: 1px solid red;
    float: left;
    width: 31.3%;
    margin-right: 3%;
    position: relative;
}
.main-cs .notice {
    margin-right: 0;
}
.main-cs .notice .more-btn {
    position: absolute;
    top: 0;
    right: 0;
    color: #005b9e;
}

	</style>
	<style type="text/css">
    html, body {
      margin: 0;
      padding: 0;
    }

    * {
      box-sizing: border-box;
    }

    .slider {
        width: 90%;
         margin: 100px auto; 
    }

    .slick-slide {
      margin: 0px 20px;
    }

    .slick-slide img {
      width: 100%;
    }

/*     .slick-prev:before, */
    .slick-next:before {
/*         background-color: black; */
/*    		border-radius: 23px; */
/*    	 	color: white; */
		background-image: url(lib/slick/nextImg.png);

    }

    .slick-slide {
      transition: all ease-in-out .3s;
      opacity: .2;
    }
    
    .slick-active {
      opacity: .5;
    }

    .slick-current {
      opacity: 1;
    }
  </style>
</head>
<body data-spy="scroll" data-target="#navbar" class="static-layout">
	<div class="boxed-page">
		<nav id="navbar-header" class="navbar navbar-expand-lg">
			<div class="container">
				<div class="collapse navbar-collapse justify-content-between" id="navbarSupportedContent">
					<ul class="navbar-nav d-flex justify-content-between">
						<li class="nav-item only-desktop">
							<a class="nav-link" id="side-nav-open" href="#">
								<span class="lnr lnr-menu"></span>
							</a>
						</li>
						<div class="d-flex flex-lg-row flex-column">
							<li class="nav-item active">
								<a class="nav-link" href="/">Home<span class="sr-only">(current)</span></a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="about.html">About</a>
							</li>
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown">Special Dishes </a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="special-dishes.html">Beef Steak Sauce</a>
									<a class="dropdown-item" href="special-dishes.html">Salmon Zucchini</a>
								</div>
							</li>
						</div>
					</ul>
					<a class="navbar-brand navbar-brand-center d-flex align-items-center only-desktop" href="#">
						<img src="lib/user/img/logo.png" alt="">
					</a>
					<ul class="navbar-nav d-flex justify-content-between">
						<div class="d-flex flex-lg-row flex-column">
							<li class="nav-item active">
								<a class="nav-link" href="menu.html">Menu</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="team.html">Team</a>
							</li>
							<li class="nav-item dropdown">
								<a class="nav-link" href="reservation.html">Reservation</a>
							</li>
							<li class="nav-item dropdown">
								<c:if test="${empty memberSession}">
									<a class="nav-link" href="/login.do">login</a>
								</c:if>
								<c:if test="${not empty memberSession}">
									<a class="nav-link" href="/logout_proc.do">logout</a>
								</c:if>
							</li>
						</div>
						<li class="nav-item">
							<a id="side-search-open" class="nav-link" href="#">
								<span class="lnr lnr-magnifier"></span>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		<section class="lazy slider" data-sizes="50vw">
		    <div>
		      <img src="lib/user/img/f20201021PIN4.jpg" alt=""/>
		    </div>
		    <div>
		      <img src="lib/user/img/f20201021wd9x.jpg" alt=""/>
		    </div>
		  </section>
		<div class="main-cs">
			<div class="section cs-banner mypage" >
				<h2>오늘의 추천 메뉴</h2>
				<ul class="notice-list">
				<li><span>밥</span></a></li>
				<li><span>국</span></a></li>
				<li><span>김치</span></a></li>
				<li><span>치킨</span></a></li>
				</ul>
			</div><!--guide-->
			<div class="section cs-banner faq" style="text-align: center;">
				<h2>이 달의 Best 조리법</h2>
				<section class="vertical-center slider">
				    <div>
				      <img src="lib/user/img/f20201021PIN4.jpg" alt=""/>
				    </div>
				    <div>
				      <img src="lib/user/img/f20201021wd9x.jpg" alt=""/>
				    </div>
				  </section>
				<br>
				홍길동님의 따끈 매콤 어묵탕
			</div><!--faq-->
			<div class="section notice">
				<h2>공지사항</h2>
				<ul class="notice-list">
				<li><a class="climp" href="/web/sub/board/notice_view.do?seq=300"><strong>시범운영 고지(11월 1일~)</strong><span class="date">2020-10-26</span></a></li>
				<li><a class="climp" href="/web/sub/board/notice_view.do?seq=278"><strong>공연장 안전관리의무_재해대처계획 관련법령</strong><span class="date">2020-10-22</span></a></li>
				<li><a class="climp" href="/web/sub/board/notice_view.do?seq=277"><strong>공연장 무대시설 안전진단 주기 안내</strong><span class="date">2020-10-22</span></a></li>
				<li><a class="climp" href="/web/sub/board/notice_view.do?seq=276"><strong>공연장안전정보시스템 이용안내_공연장 담당자 FAQ</strong><span class="date">2020-10-22</span></a></li>
				</ul>
				<a href="/web/sub/board/notice_list.do" class="more-btn">MORE +</a>
			</div><!--notice-->
		</div>
		</section>
		<section id="gtco-welcome" class="bg-white section-padding" style="margin-top: 30%;">
			<div class="container">
				<div class="section-content">
					<div class="row">
						<div
							class="col-sm-5 img-bg d-flex shadow align-items-center justify-content-center justify-content-md-end img-2"
							style="background-image: url(lib/user/img/hero-2.jpg);"></div>
						<div class="col-sm-7 py-5 pl-md-0 pl-4">
							<div class="heading-section pl-lg-5 ml-md-5">
								<span class="subheading"> About </span>
								<h2>Welcome to Resto</h2>
							</div>
							<div class="pl-lg-5 ml-md-5">
								<p>On her way she met a copy. The copy warned the Little
									Blind Text, that where it came from it would have been
									rewritten a thousand times and everything that was left from
									its origin would be the word "and" and the Little Blind Text
									should turn around and return to its own, safe country. A small
									river named Duden flows by their place and supplies it with the
									necessary regelialia. It is a paradisematic country, in which
									roasted parts of sentences fly into your mouth.</p>
								<h3 class="mt-5">Special Recipe</h3>
								<div class="row">
									<div class="col-4">
										<a href="#" class="thumb-menu"> <img
											class="img-fluid img-cover" src="lib/user/img/hero-1.jpg" />
											<h6>Australian Organic Beef</h6>
										</a>
									</div>
									<div class="col-4">
										<a href="#" class="thumb-menu"> <img
											class="img-fluid img-cover" src="lib/user/img/hero-1.jpg" />
											<h6>Australian Organic Beef</h6>
										</a>
									</div>
									<div class="col-4">
										<a href="#" class="thumb-menu"> <img
											class="img-fluid img-cover" src="lib/user/img/hero-1.jpg" />
											<h6>Australian Organic Beef</h6>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End of Welcome Section -->
		<!-- Special Dishes Section -->
		<section id="gtco-special-dishes" class="bg-grey section-padding">
			<div class="container">
				<div class="section-content">
					<div class="heading-section text-center">
						<span class="subheading"> Specialties </span>
						<h2>Special Dishes</h2>
					</div>
					<div class="row mt-5">
						<div class="col-lg-5 col-md-6 align-self-center py-5">
							<h2 class="special-number">01.</h2>
							<div class="dishes-text">
								<h3>
									<span>Beef</span><br> Steak Sauce
								</h3>
								<p class="pt-3">Lorem ipsum dolor sit amet, consectetur
									adipisicing elit. Cupiditate, ea vero alias perferendis quas
									animi doloribus voluptates. Atque explicabo ea nesciunt
									provident libero qui eum, corporis esse quos excepturi soluta?</p>
								<h3 class="special-dishes-price">$15.00</h3>
								<a href="#" class="btn-primary mt-3">book a table</a>
							</div>
						</div>
						<div
							class="col-lg-5 offset-lg-2 col-md-6 align-self-center mt-4 mt-md-0">
							<img src="lib/user/img/steak.jpg" alt=""
								class="img-fluid shadow w-100">
						</div>
					</div>
					<div class="row mt-5">
						<div
							class="col-lg-5 col-md-6 align-self-center order-2 order-md-1 mt-4 mt-md-0">
							<img src="lib/user/img/salmon-zucchini.jpg" alt=""
								class="img-fluid shadow w-100">
						</div>
						<div
							class="col-lg-5 offset-lg-2 col-md-6 align-self-center order-1 order-md-2 py-5">
							<h2 class="special-number">02.</h2>
							<div class="dishes-text">
								<h3>
									<span>Salmon</span><br> Zucchini
								</h3>
								<p class="pt-3">Lorem ipsum dolor sit amet, consectetur
									adipisicing elit. Blanditiis, accusamus culpa quam amet ipsam
									odit ea doloremque accusantium quo, itaque possimus eius. In a
									quis quibusdam omnis atque vero dolores!</p>
								<h3 class="special-dishes-price">$12.00</h3>
								<a href="#" class="btn-primary mt-3">book a table <span><i
										class="fa fa-long-arrow-right"></i></span></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End of Special Dishes Section -->
		<!-- Menu Section -->
		<section id="gtco-menu" class="section-padding">
			<div class="container">
				<div class="section-content">
					<div class="row mb-5">
						<div class="col-md-12">
							<div class="heading-section text-center">
								<span class="subheading"> Specialties </span>
								<h2>Our Menu</h2>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-4 menu-wrap">
							<div class="heading-menu">
								<h3 class="text-center mb-5">Breakfast</h3>
							</div>
							<div class="menus d-flex align-items-center">
								<div class="menu-img rounded-circle">
									<img class="img-fluid" src="lib/user/img/breakfast-1.jpg"
										alt="">
								</div>
								<div class="text-wrap">
									<div class="row align-items-start">
										<div class="col-8">
											<h4>Egg Sandwich</h4>
										</div>
										<div class="col-4">
											<h4 class="text-muted menu-price">$30</h4>
										</div>
									</div>
									<p>Meat Ball, Mie</p>
								</div>
							</div>
							<div class="menus d-flex align-items-center">
								<div class="menu-img rounded-circle">
									<img class="img-fluid" src="lib/user/img/breakfast-1.jpg"
										alt="">
								</div>
								<div class="text-wrap">
									<div class="row align-items-start">
										<div class="col-8">
											<h4>Egg Sandwich</h4>
										</div>
										<div class="col-4">
											<h4 class="text-muted menu-price">$30</h4>
										</div>
									</div>
									<p>Meat Ball, Mie</p>
								</div>
							</div>
							<div class="menus d-flex align-items-center">
								<div class="menu-img rounded-circle">
									<img class="img-fluid" src="lib/user/img/breakfast-1.jpg"
										alt="">
								</div>
								<div class="text-wrap">
									<div class="row align-items-start">
										<div class="col-8">
											<h4>Egg Sandwich</h4>
										</div>
										<div class="col-4">
											<h4 class="text-muted menu-price">$30</h4>
										</div>
									</div>
									<p>Meat Ball, Mie</p>
								</div>
							</div>
						</div>

						<div class="col-lg-4 menu-wrap">
							<div class="heading-menu">
								<h3 class="text-center mb-5">Breakfast</h3>
							</div>
							<div class="menus d-flex align-items-center">
								<div class="menu-img rounded-circle">
									<img class="img-fluid" src="lib/user/img/breakfast-1.jpg"
										alt="">
								</div>
								<div class="text-wrap">
									<div class="row align-items-start">
										<div class="col-8">
											<h4>Egg Sandwich</h4>
										</div>
										<div class="col-4">
											<h4 class="text-muted menu-price">$30</h4>
										</div>
									</div>
									<p>Meat Ball, Mie</p>
								</div>
							</div>
							<div class="menus d-flex align-items-center">
								<div class="menu-img rounded-circle">
									<img class="img-fluid" src="lib/user/img/breakfast-1.jpg"
										alt="">
								</div>
								<div class="text-wrap">
									<div class="row align-items-start">
										<div class="col-8">
											<h4>Egg Sandwich</h4>
										</div>
										<div class="col-4">
											<h4 class="text-muted menu-price">$30</h4>
										</div>
									</div>
									<p>Meat Ball, Mie</p>
								</div>
							</div>
							<div class="menus d-flex align-items-center">
								<div class="menu-img rounded-circle">
									<img class="img-fluid" src="lib/user/img/breakfast-1.jpg"
										alt="">
								</div>
								<div class="text-wrap">
									<div class="row align-items-start">
										<div class="col-8">
											<h4>Egg Sandwich</h4>
										</div>
										<div class="col-4">
											<h4 class="text-muted menu-price">$30</h4>
										</div>
									</div>
									<p>Meat Ball, Mie</p>
								</div>
							</div>
						</div>

						<div class="col-lg-4 menu-wrap">
							<div class="heading-menu">
								<h3 class="text-center mb-5">Breakfast</h3>
							</div>
							<div class="menus d-flex align-items-center">
								<div class="menu-img rounded-circle">
									<img class="img-fluid" src="lib/user/img/breakfast-1.jpg"
										alt="">
								</div>
								<div class="text-wrap">
									<div class="row align-items-start">
										<div class="col-8">
											<h4>Egg Sandwich</h4>
										</div>
										<div class="col-4">
											<h4 class="text-muted menu-price">$30</h4>
										</div>
									</div>
									<p>Meat Ball, Mie</p>
								</div>
							</div>
							<div class="menus d-flex align-items-center">
								<div class="menu-img rounded-circle">
									<img class="img-fluid" src="lib/user/img/breakfast-1.jpg"
										alt="">
								</div>
								<div class="text-wrap">
									<div class="row align-items-start">
										<div class="col-8">
											<h4>Egg Sandwich</h4>
										</div>
										<div class="col-4">
											<h4 class="text-muted menu-price">$30</h4>
										</div>
									</div>
									<p>Meat Ball, Mie</p>
								</div>
							</div>
							<div class="menus d-flex align-items-center">
								<div class="menu-img rounded-circle">
									<img class="img-fluid" src="lib/user/img/breakfast-1.jpg"
										alt="">
								</div>
								<div class="text-wrap">
									<div class="row align-items-start">
										<div class="col-8">
											<h4>Egg Sandwich</h4>
										</div>
										<div class="col-4">
											<h4 class="text-muted menu-price">$30</h4>
										</div>
									</div>
									<p>Meat Ball, Mie</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End of menu Section -->
		<!-- Testimonial Section-->
		<section id="gtco-testimonial"
			class="overlay bg-fixed section-padding"
			style="background-image: url(lib/user/img/testi-bg.jpg);">
			<div class="container">
				<div class="section-content">
					<div class="heading-section text-center">
						<span class="subheading"> Testimony </span>
						<h2>Happy Customer</h2>
					</div>
					<div class="row">
						<!-- Testimonial -->
						<div class="testi-content testi-carousel owl-carousel">
							<div class="testi-item">
								<i class="testi-icon fa fa-3x fa-quote-left"></i>
								<p class="testi-text">Excepteur sint occaecat cupidatat non
									proident, sunt in culpa qui officia deserunt mollit anim id est
									laborum.</p>
								<p class="testi-author">John Doe</p>
								<p class="testi-desc">
									CEO of <span>GetTemplates</span>
								</p>
							</div>
							<div class="testi-item">
								<i class="testi-icon fa fa-3x fa-quote-left"></i>
								<p class="testi-text">Lorem ipsum dolor sit amet,
									consectetur adipisicing elit. Adipisci non doloribus ut, alias
									doloremque perspiciatis.</p>
								<p class="testi-author">Mary Jane</p>
								<p class="testi-desc">
									CTO of <span>Unidentity Inc</span>
								</p>
							</div>
						</div>
						<!-- End of Testimonial -->
					</div>
				</div>
			</div>
		</section>
		<!-- End of Testimonial Section-->
		<!-- Team Section -->
		<section id="gtco-team" class="bg-white section-padding">
			<div class="container">
				<div class="section-content">
					<div class="heading-section text-center">
						<span class="subheading"> Specialties </span>
						<h2>Our Team</h2>
					</div>
					<div class="row">
						<div class="col-md-4">
							<div class="team-card mb-5">
								<img class="img-fluid" src="lib/user/img/chef-1.jpg" alt="">
								<div class="team-desc">
									<h4 class="mb-0">Aaron Patel</h4>
									<p class="mb-1">CEO</p>
									<ul class="list-inline mb-0 team-social-links">
										<li class="list-inline-item"><a href="#"> <i
												class="fab fa-facebook-f"></i>
										</a></li>
										<li class="list-inline-item"><a href="#"> <i
												class="fab fa-twitter"></i>
										</a></li>
										<li class="list-inline-item"><a href="#"> <i
												class="fab fa-instagram"></i>
										</a></li>
										<li class="list-inline-item"><a href="#"> <i
												class="fab fa-google-plus-g"></i>
										</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="team-card mb-5">
								<img class="img-fluid" src="lib/user/img/chef-2.jpg" alt="">
								<div class="team-desc">
									<h4 class="mb-0">Daniel Tebas</h4>
									<p class="mb-1">Chef</p>
									<ul class="list-inline mb-0 team-social-links">
										<li class="list-inline-item"><a href="#"> <i
												class="fab fa-facebook-f"></i>
										</a></li>
										<li class="list-inline-item"><a href="#"> <i
												class="fab fa-twitter"></i>
										</a></li>
										<li class="list-inline-item"><a href="#"> <i
												class="fab fa-instagram"></i>
										</a></li>
										<li class="list-inline-item"><a href="#"> <i
												class="fab fa-google-plus-g"></i>
										</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="team-card mb-5">
								<img class="img-fluid" src="lib/user/img/chef-3.jpg" alt="">
								<div class="team-desc">
									<h4 class="mb-0">Jon Snow</h4>
									<p class="mb-1">Chef</p>
									<ul class="list-inline mb-0 team-social-links">
										<li class="list-inline-item"><a href="#"> <i
												class="fab fa-facebook-f"></i>
										</a></li>
										<li class="list-inline-item"><a href="#"> <i
												class="fab fa-twitter"></i>
										</a></li>
										<li class="list-inline-item"><a href="#"> <i
												class="fab fa-instagram"></i>
										</a></li>
										<li class="list-inline-item"><a href="#"> <i
												class="fab fa-google-plus-g"></i>
										</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End of Team Section -->
		<!-- Reservation Section -->
		<section id="gtco-reservation"
			class="bg-fixed bg-white section-padding overlay"
			style="background-image: url(lib/user/img/reservation-bg.jpg);">
			<div class="container">
				<div class="row">
					<div class="col-lg-5">
						<div class="section-content bg-white p-5 shadow">
							<div class="heading-section text-center">
								<span class="subheading"> Reservation </span>
								<h2>Book Now</h2>
							</div>
							<form method="post" name="contact-us" action="">
								<div class="row">
									<div class="col-md-12 form-group">
										<input type="text" class="form-control" id="name" name="name"
											placeholder="Name">
									</div>
									<div class="col-md-12 form-group">
										<input type="text" class="form-control" id="email"
											name="email" placeholder="Email">
									</div>
									<div class="col-md-12 form-group">
										<input type="number" class="form-control" id="phoneNumber"
											name="phoneNumber" placeholder="Phone">
									</div>
									<div class="col-md-6 form-group">
										<div class="input-group date" id="datetimepicker4"
											data-target-input="nearest">
											<input type="text" class="form-control datetimepicker-input"
												data-target="#datetimepicker4" placeholder="Date" />
											<div class="input-group-append"
												data-target="#datetimepicker4" data-toggle="datetimepicker">
												<div class="input-group-text">
													<span class="lnr lnr-calendar-full"></span>
												</div>
											</div>
										</div>
									</div>

									<div class="col-md-6 form-group">
										<div class="input-group date" id="datetimepicker3"
											data-target-input="nearest">
											<input type="text" class="form-control datetimepicker-input"
												data-target="#datetimepicker3" placeholder="Time" />
											<div class="input-group-append"
												data-target="#datetimepicker3" data-toggle="datetimepicker">
												<div class="input-group-text">
													<span class="lnr lnr-clock"></span>
												</div>
											</div>
										</div>
									</div>

									<div class="col-md-12 form-group">
										<select class="form-control" id="selectPerson">
											<option></option>
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
											<option>5</option>
										</select>
									</div>

									<div class="col-md-12 form-group">
										<textarea class="form-control" id="message" name="message"
											rows="6" placeholder="Your Message ..."></textarea>
									</div>
									<div class="col-md-12 text-center">
										<button class="btn btn-primary btn-shadow btn-lg"
											type="submit" name="submit">Send Message</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>

			</div>
		</section>
		<!-- End of Reservation Section -->
		<footer class="mastfoot pb-5 bg-white section-padding pb-0">
			<div class="inner container">
				<div class="row">
					<div class="col-lg-4">
						<div class="footer-widget pr-lg-5 pr-0">
							<img src="lib/user/img/logo.png"
								class="img-fluid footer-logo mb-3" alt="">
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Et obcaecati quisquam id sit omnis explicabo voluptate aut
								placeat, soluta, nisi ea magni facere, itaque incidunt modi?
								Magni, et voluptatum dolorem.</p>
							<nav class="nav nav-mastfoot justify-content-start">
								<a class="nav-link" href="#"> <i class="fab fa-facebook-f"></i>
								</a> <a class="nav-link" href="#"> <i class="fab fa-twitter"></i>
								</a> <a class="nav-link" href="#"> <i class="fab fa-instagram"></i>
								</a>
							</nav>
						</div>

					</div>
					<div class="col-lg-4">
						<div class="footer-widget px-lg-5 px-0">
							<h4>Open Hours</h4>
							<ul class="list-unstyled open-hours">
								<li class="d-flex justify-content-between"><span>Monday</span><span>9:00
										- 24:00</span></li>
								<li class="d-flex justify-content-between"><span>Tuesday</span><span>9:00
										- 24:00</span></li>
								<li class="d-flex justify-content-between"><span>Wednesday</span><span>9:00
										- 24:00</span></li>
								<li class="d-flex justify-content-between"><span>Thursday</span><span>9:00
										- 24:00</span></li>
								<li class="d-flex justify-content-between"><span>Friday</span><span>9:00
										- 02:00</span></li>
								<li class="d-flex justify-content-between"><span>Saturday</span><span>9:00
										- 02:00</span></li>
								<li class="d-flex justify-content-between"><span>Sunday</span><span>
										Closed</span></li>
							</ul>
						</div>

					</div>

					<div class="col-lg-4">
						<div class="footer-widget pl-lg-5 pl-0">
							<h4>Newsletter</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
							<form id="newsletter">
								<div class="form-group">
									<input type="email" class="form-control" id="emailNewsletter"
										aria-describedby="emailNewsletter" placeholder="Enter email">
								</div>
								<button type="submit" class="btn btn-primary w-100">Submit</button>
							</form>
						</div>

					</div>
					<div class="col-md-12 d-flex align-items-center">
						<p class="mx-auto text-center mb-0">
							Copyright 2019. All Right Reserved. Design by <a
								href="https://gettemplates.co" target="_blank">GetTemplates</a>
						</p>
					</div>

				</div>
			</div>
		</footer>
	</div>
	</div>
<script type="text/javascript">
    $(document).on('ready', function() {
      $(".lazy").slick({
        lazyLoad: 'ondemand', // ondemand progressive anticipated
        infinite: true
      });
      $(".vertical-center").slick({
          dots: true,
          vertical: true,
          centerMode: true,
        });
    });
</script>
</body>


</html>

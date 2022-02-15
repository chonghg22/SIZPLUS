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
	<link href="lib/user/lib/slick/slick.css" rel="stylesheet">
	<link href="lib/user/lib/slick/slick-theme.css" rel="stylesheet">
	<link rel="stylesheet" href="lib/board/assets/css/fontawesome.css">
	<link rel="stylesheet"href="lib/board/assets/css/templatemo-sixteen.css">
	<link rel="stylesheet" href="lib/board/assets/css/owl.css">
	<script src="lib/board/vendor/jquery/jquery.min.js"></script>
	<script src="lib/board/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="lib/board/assets/js/custom.js"></script>
	<script src="lib/board/assets/js/owl.js"></script>
	<script src="lib/board/assets/js/slick.js"></script>
	<script src="lib/board/assets/js/isotope.js"></script>
	<script src="lib/board/assets/js/accordions.js"></script>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/userLayout/top.jsp" %>
	<!-- Nav Bar End -->

	<!-- Breadcrumb Start -->
        <div class="breadcrumb-wrap">
            <div class="container">
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item active">Contact</li>
                </ul>
            </div>
        </div>
        <!-- Breadcrumb End -->
        
        <!-- Contact Start -->
        <div class="contact">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-8">
                        <div class="contact-form">
                            <form>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <input type="text" class="form-control" placeholder="Your Name" />
                                    </div>
                                    <div class="form-group col-md-6">
                                        <input type="email" class="form-control" placeholder="Your Email" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Subject" />
                                </div>
                                <div class="form-group">
                                    <textarea class="form-control" rows="5" placeholder="Message"></textarea>
                                </div>
                                <div><button class="btn" type="submit">Send Message</button></div>
                            </form>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="contact-info">
                            <h3>Get in Touch</h3>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in. Vivamus tempor hendrerit finibus.
                            </p>
                            <h4><i class="fa fa-map-marker"></i>123 News Street, NY, USA</h4>
                            <h4><i class="fa fa-envelope"></i>info@example.com</h4>
                            <h4><i class="fa fa-phone"></i>+123-456-7890</h4>
                            <div class="social">
                                <a href=""><i class="fab fa-twitter"></i></a>
                                <a href=""><i class="fab fa-facebook-f"></i></a>
                                <a href=""><i class="fab fa-linkedin-in"></i></a>
                                <a href=""><i class="fab fa-instagram"></i></a>
                                <a href=""><i class="fab fa-youtube"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	<%@ include file="/WEB-INF/jsp/userLayout/bottom.jsp" %>
	<!--  -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<script src="lib/user/lib/easing/easing.min.js"></script>
	<script src="lib/user/lib/slick/slick.min.js"></script>
	<script src="lib/user/js/main.js"></script>
</body>
</html>

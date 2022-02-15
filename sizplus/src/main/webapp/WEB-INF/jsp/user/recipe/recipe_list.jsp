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
            <div class="filters">
              <ul>
                  <li class="active" data-filter="*">한식</li>
                  <li data-filter=".des" class="">중식</li>
                  <li data-filter=".dev" class="">일식</li>
                  <li data-filter=".gra" class="">양식</li>
              </ul>
            </div>
          </div>
          <div class="col-md-12">
            <div class="filters-content">
                <div class="row grid" style="position: relative; height: 768.562px;">
                    
                    <div class="col-lg-3 col-md-3 all des" style="position: absolute; left: 0%; top: 0px;">
                      <div class="product-item">
                        <a href="#"><img src="/lib/board/assets/images/product_01.jpg" alt="" style="height: 200px;"></a>
                        <div class="down-content">
                          <a href="#"><h4>Tittle goes here</h4></a>
                          <h6>$18.25</h6>
                          <p>그렇다그렇다그렇다그렇다그렇다그렇다그렇다그렇다그렇다그렇다</p>
                          <ul class="stars">
                            <li><i class="fa fa-star"></i></li>
                            <li><i class="fa fa-star"></i></li>
                            <li><i class="fa fa-star"></i></li>
                            <li><i class="fa fa-star"></i></li>
                            <li><i class="fa fa-star"></i></li>
                          	<li><i class="fa">12</i></li>
                          </ul>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-3 col-md-3 all dev" style="position: absolute; left: 33.3333%; top: 0px;">
                      <div class="product-item">
                        <a href="#"><img src="/lib/board/assets/images/product_01.jpg" alt="" style="height: 200px;"></a>
                        <div class="down-content">
                          <a href="#"><h4>Tittle goes here</h4></a>
                          <h6>$16.75</h6>
                          <p>Lorem ipsume dolor sit amet, adipisicing elite. Itaque, corporis nulla aspernatur.</p>
                          <ul class="stars">
                            <li><i class="fa fa-star"></i></li>
                            <li><i class="fa fa-star"></i></li>
                            <li><i class="fa fa-star"></i></li>
                            <li><i class="fa fa-star"></i></li>
                            <li><i class="fa fa-star"></i></li>
                          </ul>
                          <span>Reviews (24)</span>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-3 col-md-3 all gra" style="position: absolute; left: 66.6667%; top: 0px;">
                      <div class="product-item">
                        <a href="#"><img src="/lib/board/assets/images/product_01.jpg" alt="" style="height: 200px;"></a>
                        <div class="down-content">
                          <a href="#"><h4>Tittle goes here</h4></a>
                          <h6>$32.50</h6>
                          <p>Lorem ipsume dolor sit amet, adipisicing elite. Itaque, corporis nulla aspernatur.</p>
                          <ul class="stars">
                            <li><i class="fa fa-star"></i></li>
                            <li><i class="fa fa-star"></i></li>
                            <li><i class="fa fa-star"></i></li>
                            <li><i class="fa fa-star"></i></li>
                            <li><i class="fa fa-star"></i></li>
                          </ul>
                          <span>Reviews (36)</span>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-3 col-md-3 all gra" style="position: absolute; left: 66.6667%; top: 0px;">
                      <div class="product-item">
                        <a href="#"><img src="/lib/board/assets/images/product_01.jpg" alt="" style="height: 200px;"></a>
                        <div class="down-content">
                          <a href="#"><h4>Tittle goes here</h4></a>
                          <h6>$32.50</h6>
                          <p>Lorem ipsume dolor sit amet, adipisicing elite. Itaque, corporis nulla aspernatur.</p>
                          <ul class="stars">
                            <li><i class="fa fa-star"></i></li>
                            <li><i class="fa fa-star"></i></li>
                            <li><i class="fa fa-star"></i></li>
                            <li><i class="fa fa-star"></i></li>
                            <li><i class="fa fa-star"></i></li>
                          </ul>
                          <span>Reviews (36)</span>
                        </div>
                      </div>
                    </div>
                   
                   
                </div>
            </div>
          </div>
          <div class="col-md-12">
            <ul class="pages">
              <li><a href="#">1</a></li>
              <li class="active"><a href="#">2</a></li>
              <li><a href="#">3</a></li>
              <li><a href="#">4</a></li>
              <li><a href="#"><i class="fa fa-angle-double-right"></i></a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
	<%@ include file="/WEB-INF/jsp/userLayout/bottom.jsp" %>
</body>
</html>
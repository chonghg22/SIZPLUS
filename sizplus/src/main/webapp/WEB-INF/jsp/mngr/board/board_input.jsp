<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>시즈닝플러스 - 공지사항</title>
    <link href="/lib/mngr/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="/lib/mngr/css/sb-admin-2.min.css" rel="stylesheet">
    <link href="/lib/mngr/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body id="page-top">
    <div id="wrapper">
        <%@ include file="/WEB-INF/jsp/mngr/mngrLayout/left.jsp" %>
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
				<%@ include file="/WEB-INF/jsp/mngr/mngrLayout/top.jsp" %>
				<form id="insertForm" name="insertForm" method="post" encType="multipart/form-data">
				<input type="hidden" name="bbsId" value="${commandMap.bbsId }"/>
				<input type="hidden" name="file_count" value="1" />
                <div class="container-fluid">
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">공지사항 - 등록</h6>
                        </div>
                        <div class="card-body">
							<div class="mb-3 row">
								<label class="col-sm-2 col-form-label" for="staticEmail">제목</label>
								<div class="col-sm-10">
										<input class="form-control" id="title" type="text" name="title" />
							  		<div class="mb-3 row"></div>
								</div>
								<label class="col-sm-2 col-form-label" for="inputPassword">내용</label>
								<div class="col-sm-10">
							  		<div class="mb-3">
							  			<textarea class="form-control" id="contents" name="contents" rows="3"></textarea>
							  		</div>
							  		<div class="mb-3 row"></div>
								</div>
								<label class="col-sm-2 col-form-label" for="inputPassword">공개여부</label>
								<div class="col-sm-10">
									<div class="form-check form-check-inline">
										<input class="form-check-input" id="openYn1" type="radio" name="openYn" value="Y" checked="checked" />
										<label class="form-check-label" for="inlineRadio1">공개</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" id="openYn2" type="radio" name="openYn" value="N" />
										<label class="form-check-label" for="inlineRadio2">비공개</label>
									</div>
									<div class="mb-3 row"></div>
								</div>
								<label class="col-sm-2 col-form-label" for="inputPassword">첨부파일</label>
								<div class="col-sm-10">
									<input class="form-control" id="formFileMultiple" type="file" multiple="multiple" name="bbsFile" />
									<div class="mb-3 row"></div>
								</div>
							</div>
							<button class="btn btn-primary" type="button" style="float: right;" onclick="fn_input();">등록</button>
                        </div>
                    </div>
                </div>
                </form>
            </div>
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
        </div>
    </div>
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
    <script src="/lib/mngr/vendor/jquery/jquery.min.js"></script>
    <script src="/lib/mngr/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/lib/mngr/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script>
    function fn_input(){
    	var frm = document.insertForm;
    	frm.action = "/mngr/board/${commandMap.bbsId}_input_proc.do";
    	frm.method = "post";
    	if($("#title").val() == ''){
    		alert("제목을 입력 해 주세요.");
    		return false;
    	}
    	
    	if($("#contents").val() == ''){
    		alert("내용을 입력 해 주세요.");
    		return false;
    	}
    	frm.submit();
    }
    </script>
    
</body>
</html>
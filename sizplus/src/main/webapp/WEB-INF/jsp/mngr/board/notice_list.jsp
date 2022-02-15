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
</head>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">
		
        <!-- Sidebar -->
        <%@ include file="/WEB-INF/jsp/mngr/mngrLayout/left.jsp" %>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
				<%@ include file="/WEB-INF/jsp/mngr/mngrLayout/top.jsp" %>
				<form action="" name="listForm" id="listForm">
				<input type="hidden" name="bbsId" value="notice"/>
				<input type="hidden" name="boardSeq" value="" />
				
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">공지사항</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                        	<th><input type="checkBox" name="chkAll" id="chkAll" value="Y" title="전체선택/해제" onclick="fn_checkAll(this);" /></th>
                                            <th>NO</th>
                                            <th>제목</th>
                                            <th>등록자</th>
                                            <th>등록일</th>
                                            <th>공개여부</th>
                                            <th>조회수</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="result" items="${list}" varStatus="status">
											<tr>
												<td><input type="checkbox" name="chkSeq" id="chkSeq" value="<c:out value="${result.board_seq }" />" title="선택" /></td>
												<td><c:out value="${status.index}"/></td>
												<td>
												<a href="#" onclick="fn_goView('<c:out value="${result.board_seq}"/>','<c:out value="${result.bbs_id}"/>')" style="text-decoration: none;color: #000;"><c:out value="${result.title}"/><c:out value="${result.title}"/></a>
												</td>
												<td><c:out value="${result.input_nm}"/></td>
												<td><c:out value="${fn:substring(result.input_date,0,10)}"/></td>
												<td>
												<c:if test="${result.open_yn eq 'Y'}">공개</c:if>
												<c:if test="${result.open_yn eq 'N'}">비공개</c:if>
												</td>
												<td><c:out value="${result.hit}"/></td>
											</tr>
										</c:forEach>
                                    </tbody>
                                </table>
                            </div>
						<button class="btn btn-primary" type="button" onclick="fn_chkDel()">삭제</button>
						<button class="btn btn-primary" type="button" style="float: right;" onclick="fn_input()">등록</button>
                        </div>
                    </div>

                </div>
                </form>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
    <script src="/lib/mngr/vendor/jquery/jquery.min.js"></script>
    <script src="/lib/mngr/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/lib/mngr/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="/lib/mngr/js/sb-admin-2.min.js"></script>
    <script src="/lib/mngr/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="/lib/mngr/vendor/datatables/dataTables.bootstrap4.min.js"></script>
    <script src="/lib/mngr/js/demo/datatables-demo.js"></script>
    
    <script>
  //검색
    function fn_input(){
    	var frm = document.listForm;
    	frm.action = "/mngr/board/notice_input.do";
    	frm.submit();
    }
  
    function fn_checkAll(obj) {
    	$("input[name=chkSeq]").each(function() {
    		$(this).prop("checked", obj.checked);
    	});
    }
    /*선택 항목 삭제*/
    function fn_chkDel(){
    	if($("input[name=chkSeq]:checked").length == 0){
    		alert("삭제할 항목을 선택 해 주세요.");
    		return false;
    	}else{
    		if(confirm("선택한 항목을 삭제하시겠습니까?")){
    			var frm = document.listForm;
    			frm.action = "/mngr/board/notice_delete_chkProc.do";
    			frm.submit();
    		}
    	}
    }
    
    /* 글 상세보기 화면 function */
    function fn_goView(boardSeq,bbsId) {
    	var frm = document.listForm;
    	frm.boardSeq.value = boardSeq;
    	frm.bbsId.value = bbsId;
    	frm.action = "/mngr/board/notice_view.do";
    	frm.submit();
    }
    </script>
    

</body>

</html>
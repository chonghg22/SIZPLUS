<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
					<c:if test="${ not empty paginationInfo.totalRecordCount and paginationInfo.totalRecordCount ne 0 }">
					<script>
					function fn_page_prev(page) {
												
						if (page > 1){
							fn_link_page(page - 1);
						}
						else {
							alert("첫페이지 입니다.");
							return;
						}
					}
					function fn_page_next(page) {
						if (page < ${ paginationInfo.totalPageCount}){
							fn_link_page(page + 1);
						}else {
							alert("마지막 페이지 입니다.");
							return;
						}
					}
					function fn_page_move() {
						var page = $(".paginate_input").val();
						if (isNaN(page)) {
							$(".paginate_input").val('');
							alert("숫자만 입력하세요.");
							$(".paginate_input").focus();
							return;
						}
						if (page == "" || page < 1) {
							$(".paginate_input").val('1');
							alert("1페이지 부터 입력할 수 있습니다.");
							$(".paginate_input").focus();
							return;
						}
						if (page > ${ paginationInfo.totalPageCount}) {
							$(".paginate_input").val('${ paginationInfo.totalPageCount}');
							alert("총 페이지수 초과할 수 없습니다.");
							$(".paginate_input").focus();
							return;
						}
						fn_link_page(page);
					}
					</script>
					<div class="col-md-12">
			            <ul class="pages">
			            <li><a href="#" onclick="fn_link_page(1);"><i class="fa fa-angle-double-left"></i></a></li>
						  <c:forEach var="p" begin="${paginationInfo.firstPageNoOnPageList}" step="1" end="${paginationInfo.lastPageNoOnPageList}">
							<c:choose>
							  	<c:when test="${paginationInfo.currentPageNo eq p }"><li class="active"><a href="#" onClick="fn_link_page('${p }')">${p }</a></li></c:when>
							   	<c:otherwise><li><a href="#" onClick="fn_link_page('${p }')">${p }</a></li></c:otherwise>
							</c:choose>
						</c:forEach>			            
			              <li><a href="#" onclick="fn_link_page(${paginationInfo.totalPageCount});"><i class="fa fa-angle-double-right"></i></a></li>
			            </ul>
			        </div>
					</c:if>

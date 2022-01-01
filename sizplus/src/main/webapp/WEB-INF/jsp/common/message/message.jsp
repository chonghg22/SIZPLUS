<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
  /**
  * @Class Name : message.jsp
  * @Description : alert 내용 출력
  * @Modification Information
  *
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  */
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><c:out value="${message.title }"/></title>
<script type="text/javascript">
//<![CDATA[
<c:choose>
  <c:when test="${message.type eq 'alert'}">
		<c:if test="${message.msg != ''}">
		alert("<c:out value="${message.msg}"/>");
		</c:if>
		<c:out value="${message.script}" escapeXml="false" />
  </c:when>
  <c:when test="${message.type eq 'confirm'}">
	  <c:if test="${message.msg != ''}">
	  if(confirm("<c:out value="${message.msg}"/>")){
		  <c:out value="${message.okUrl}" escapeXml="false" />
	  }else{
		  <c:out value="${message.cancelUrl}" escapeXml="false" />
	  }
	  </c:if>
	  <c:out value="${message.script}" escapeXml="false" />
  </c:when>
  <c:otherwise>
	  <c:if test="${message.msg != ''}">
	  alert("<c:out value="${message.msg}"/>");
	  </c:if>
	  <c:out value="${message.script}" escapeXml="false" />
  </c:otherwise>
</c:choose>
//]]>
</script>
</head>
<body>

</body>
</html>
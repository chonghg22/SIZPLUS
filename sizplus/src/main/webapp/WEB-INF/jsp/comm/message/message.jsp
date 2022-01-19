<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><c:out value="${message.title }"/></title>
<script type="text/javascript">
//<![CDATA[
		<c:if test="${message.msg != ''}">
		alert("<c:out value="${message.msg}"/>");
		</c:if>
		<c:out value="${message.scriptName}" escapeXml="false" />
//]]>
</script>
</head>
<body>

</body>
</html>
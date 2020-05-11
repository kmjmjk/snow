<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>p.371</title>
<style type="text/css">
* {
	font-size: 16pt;
}
</style>

<script type="text/javascript">
	
</script>
</head>
<body>

<!-- forTokens는 문자열을 구분자로 분리해서 출력하는 것이다 -->
<c:forTokens var="city" items="서울,인천,대구!부산" delims="!">
  ${city} <br>
</c:forTokens>

<hr>

<c:forTokens var="city" items="서울@인천,대구.부산" delims="@.">
  ${city} <br>
</c:forTokens>
	
</body>
</html>


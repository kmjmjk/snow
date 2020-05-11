<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>p.372 import</title>
<style type="text/css">
* {
	font-size: 16pt;
}
</style>

<script type="text/javascript">
	
</script>
</head>
<body>
	<c:import url="index.jsp" var="data" /> <!-- var를 생략하면 바로 url로 넘어간다 -->	
	<!-- ${data} -->

	<c:url value="images/aaa.gif" var="img" />
	${img}  <!-- value를 그대로 출력 -->
	<br>
	<img src="${img}" width="150" height="150">  <!-- url태그의 좋은점은 한번 변수 설정 후 여기저기서 값을 불러올 수 있다(여러변 주소를 사용해야 할 경우 편리) -->
	<img src="${img}" width="150" height="150">
</body>
</html>


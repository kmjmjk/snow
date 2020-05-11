<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>booking_process4.jsp</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
<style>

#info-card {
	margin: 50px auto;
	padding: 20px;
	width: 800px;
	border: 2px solid gray;
	border-radius: 10px;
	font-size: 1.5em;
	line-height: 1.5em;
}

</style>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	setTimeout("location.href='main.jsp'", 5000);
</script>

</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>

	<div id="info-card">
		<p>
		${id}님, 성공적으로 예약되었습니다. <br>
		예약 확인 및 취소는 마이페이지에서 하실 수 있습니다. <br> 
		5초 후 홈으로 이동합니다. 
		</p>
	</div>
	
</body>
</html>
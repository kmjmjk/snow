<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<c:if test="${id eq 'admin'}">
		<!-- 관리자 로그인시 관리자헤더 -->
		<jsp:include page="admin_header.jsp"></jsp:include>
	</c:if>

	<c:if test="${id == null || id !='admin'}">
		<jsp:include page="header.jsp"></jsp:include>
	</c:if>
</head>
<body>
<br><br>
	
	<% int Qnum = Integer.parseInt(request.getParameter("qnum")); %>
	<div class="card"
		style="margin: auto; width: 580px; height: 610px; background-color: #EEEEEE">
		<form method="get" name="myform"
			action="qna_replyInsert.jsp" style="text-align: center">
			<br><input type="hidden" name="anum" value="<%= Qnum %>">
			<input type="text" name="atitle" style="width: 520px; height: 40px"
				placeholder="답글 제목입력"><br> <br>
			<textarea name="acontent" style="width: 520px; height: 450px;"> </textarea>
			<br>
			<p></p>		
		<input type="submit" value="등록"> <input type="reset"
			value="취소">
			</form>
	</div>	
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
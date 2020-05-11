<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice</title>

<c:if test="${id eq 'admin'}">
	<!-- 관리자 로그인시 관리자헤더 -->
	<jsp:include page="admin_header.jsp"></jsp:include>
</c:if>

<c:if test="${id == null || id !='admin'}">
	<jsp:include page="header.jsp"></jsp:include>
</c:if>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

</head>
<body>
	<br>
	<table class="table table-striped table-hover"
		style="width: 900px; margin: auto; margin-top: 100px; border: 1px solid #dddddd">
		<tr
			style="background-color: #F5F5F5; border-bottom: 2px solid #808080;">
			<td style="text-align: center; width: 130px;">글번호</td>
			<td style="text-align: center; width: 450px;">제목</td>
			<td style="text-align: center; width: 220px;">날짜</td>
			<td style="text-align: center;">조회수</td>
		</tr>

		<c:forEach var="list" items="${list}">
			<tr style="text-align: center">
				<td>${list.nnum }</td>
				<td style="text-align: left"><a href="notice_detail.jsp?nnum=${list.nnum}">${list.ntitle }</a></td>
				<td>${list.ndate }</td>
				<td>${list.nhit }</td>
			</tr>
		</c:forEach>

		<tr align="center">
			<td colspan="4"><c:if test="${startpage!=1}">
					<a href="notice.do?pageNum=${startpage-10}">[이전]</a>
				</c:if> <c:forEach var="i" begin="${startpage}" end="${endpage}">
					<c:choose>
						<c:when test="${i==pageNUM}">
							<a href="notice.do?pageNum=${i}"><font
								style="color: red; font-size: 16pt;">[${i}]</font></a>
						</c:when>
						<c:otherwise>
							<a href="notice.do?pageNum=${i}">[${i}]</a>
						</c:otherwise>
					</c:choose>
				</c:forEach> <c:if test="${endpage<pagecount}">
					<a href="notice.do?pageNum=${startpage+10}">[다음]</a>
				</c:if></td>
		</tr>

		<c:if test="${id eq 'admin'}">
			<td colspan="4"
				style="text-align: center; background-color: #F5F5F5; border-top: 2px solid #808080;">
				<input type="button" class="btn btn-outline-secondary" value="글쓰기"
				onclick="location.href='notice_write.jsp'">
			</td>
		</c:if>
	</table>
	<br>
	<br>
	<br>
	<br>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
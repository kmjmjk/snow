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

</head>
<body>
	<c:if test="${id == null}">
		<script lang="javascript">
			alert("로그인이 필요합니다");
			location.href = "login.jsp";
		</script>
	</c:if>

	<c:if test="${id eq 'admin'}">
		<!-- 관리자 로그인시 관리자헤더 -->
		<jsp:include page="admin_header.jsp"></jsp:include>
	</c:if>

	<c:if test="${id == null || id !='admin'}">
		<jsp:include page="header.jsp"></jsp:include>
	</c:if>

	<table class="table table-striped table-hover"
		style="width: 950px; margin: auto; margin-top: 100px;">
		<tr
			style="background-color: #F5F5F5; border-bottom: 2px solid #808080;">
			<td style="text-align: center; width: 80px;">글번호</td>
			<td style="text-align: center; width: 450px;">제목</td>
			<td style="text-align: center; width: 150px;">작성자</td>
			<td style="text-align: center; width: 150px;">날짜</td>
			<td style="text-align: center;">조회수</td>
		</tr>

		<c:forEach var="list" items="${qlist}">
			<tr>
				<td style="text-align: center">${list.qnum}</td>
				<td style="text-align: left"><a
					href="qna_detail.jsp?qnum=${list.qnum}">${list.qtitle}</a></td>
				<td style="text-align: center">${list.qid}</td>
				<td style="text-align: center">${list.qdate}</td>
				<td style="text-align: center">${list.qhit}</td>
			</tr>
			
			<tr >
			
				<jsp:include page="qna_replyShow.jsp">
					<jsp:param value="${ list.qnum }" name="qnum" />
				</jsp:include>

			</tr>
			
	</c:forEach>
			
	
		<%-- <c:if test="${qlist.qnum == adto.anum}">
			<td>${qlist.qnum}</td>
				<td><a href="qna_detail.jsp?qnum=${qlist.qnum}">${qlist.qtitle}</a></td>
				<td>${qlist.qid}</td>
				<td>${qlist.qdate}</td>
				<td>${qlist.qhit}</td>
		</c:if>
		 --%>
		<td colspan="5"
			style="text-align: center; background-color: #F5F5F5; border-top: 2px solid #808080">
			<input type="button" class="btn btn-outline-secondary" value="글쓰기"
			onclick="location.href='qna_write.jsp'">
		</td>
	</table>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
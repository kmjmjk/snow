<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<jsp:include page="admin_header.jsp"></jsp:include>
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
	<br>
	<br>


	<table class="table table-bordered table-sm"
		style="width: 1350px; margin: auto">

		<tr bgcolor="#eeeeee" align="center">
			<td width="90px">아이디</td>
			<td width="90px">이름</td>
			<td width="150px">전화번호</td>
			<td width="160px">이메일</td>
			<td width="70px">성별</td>
			<td width="500px">주소</td>
			<td width="150px">생년월일</td>
			<td width="150px">가입일</td>
			<td width="80px">관리</td>
		</tr>

		<%
			String msg = "select * from s_member order by name";
			ST = CN.createStatement();
			RS = ST.executeQuery(msg);
			while (RS.next() == true) {
				String Nid = RS.getString("id");
				String Nname = RS.getString("name");
				String Ntel = RS.getString("tel");
				String Nemail = RS.getString("email");
				String Ngender = RS.getString("gender");
				String Nadd1 = RS.getString("add1");
				String Nadd2 = RS.getString("add2");
				String Nzipcode = RS.getString("zipcode");
				String Nbirth = RS.getString("birth");
				Date Njoindate = RS.getDate("joindate");
		%>

		<tr align="center">
			<td><%=Nid%></td>
			<td><%=Nname%></td>
			<td><%=Ntel%></td>
			<td><%=Nemail%></td>
			<td><%=Ngender%></td>
			<td>(<%=Nzipcode%>) <%=Nadd1%> <%=Nadd2%></td>
			<td><%=Nbirth%></td>
			<td><%=Njoindate%></td>
			<td class=""><a href="memDelete.do?id=<%=Nid%>">삭제</a></td>
		</tr>

		<%
			}
		%>
	</table>
	<br>
	<br>
	<br>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
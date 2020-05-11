<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>project 1st</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
</style>
<style>
.bigletter {
	font-size: 15pt;
}

.bigletter:hover {
	font-size: 15pt;
}
</style>
</head>
<body>
	<div class="container">
		<div class="card" style="width: 100%; margin: auto; ">
			<div class="card-header">
				<%
					String a = request.getParameter("active");
					if (a == null)
						a = "0";
					int active = Integer.parseInt(a);

					String ss = (String) session.getAttribute("id");

					boolean loginchk;
					if (ss == null) {
						loginchk = false;
					} else {
						loginchk = true;
					}
				%>
				<ul class="nav nav-tabs nav-justified">
					<li class="nav-item"><a
						class="nav-link <%=(active == 1) ? "active bigletter" : ""%>"
						href="blist.jsp">목록보기</a></li>
					<li class="nav-item"><a
						class="nav-link <%=(active == 2) ? "active bigletter" : ""%>"
						href="bwrite.jsp">글쓰기</a></li>
					<li class="nav-item"><a
						class="nav-link <%=(active == 3) ? "active bigletter" : ""%>"
						href="bprofile.jsp">프로필</a></li>

					<%
						if (loginchk) {
					%>
					<!-- 로그인 했을때 -->
					<li class="nav-item"><a
						class="nav-link <%=(active == 4) ? "active bigletter" : ""%>"
						href="#"> <%=session.getAttribute("id")%>님 로그인 <img
							src="images/loginheader.png" width="26px" height="26px"></a>
					<li class="nav-item"><a
						class="nav-link <%=(active == 5) ? "active bigletter" : ""%>"
						href="blogout.jsp"> 로그아웃 <img src="images/logout.png"
							width="22px" height="22px"></a> <%
 	} else {
 %> <!-- 로그인 안했을때 -->
					<li class="nav-item"><a
						class="nav-link <%=(active == 6) ? "active bigletter" : ""%>"
						href="blogin.jsp">로그인</a>
					<li class="nav-item"><a
						class="nav-link <%=(active == 7) ? "active bigletter" : ""%>"
						href="b_join.jsp">회원가입</a> <%
 	}
 %></li>
				</ul>
			</div>
			<div class="card-body">
</body>
</html>
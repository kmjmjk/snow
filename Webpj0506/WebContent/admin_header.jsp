<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin header</title>
<style type="text/css">

ul {
	list-style: none;
}

.navmain {
	display: flex;
	justify-content: center;
	align-items: center;
	padding: .25em;
	height: 55px;
	background-color: #495057;
}

.nav_menu{
	flex: 1;
	display: flex;
	justify-content: flex-end;
	align-items: center;
	margin: 0;
}

.navbar_a {
	padding: 1em;
	font-size: 0.85em;
	display: flex;
	align-items: flex-end;
	color: #ffffff;
	text-decoration:none;
}

nav ul li a:hover {
	color: #ff6b6b;
	border-bottom: 3px solid #ff6b6b;
}

.navname{
	color: #ffffff;
	font-size: 18pt;
	font-weight: bold;
	text-decoration:none;
}

</style>
</head>
<body>
	<nav class="navmain">
	<a class="navname" href="main.jsp">&nbsp;Shop Kim</a>
		<ul class="nav_menu">
		<li><a class="navbar_a" href="notice.do">공지사항</a></li>
			<li><a class="navbar_a" href="slist.do">디자이너</a></li>  <!-- 디자이너 입력 수정 -->
			<li><a class="navbar_a" href="#">예약관리</a></li>
			<li><a class="navbar_a" href="admin_member.jsp">회원관리</a></li>
	  <%
       	String a = (String)session.getAttribute("id");
       boolean logincheck;
       if(a==null){logincheck=false;}
       else{logincheck=true;}
       %>
       <%if(logincheck){ %>  <!-- 로그인 했을 경우 -->
       <li><a class="navbar_a" href="member_page.jsp">내정보</a></li>
        <li><a class="navbar_a" href="logout.jsp">로그아웃</a></li>
         <li><a class="navbar_a" href="qnalist.do">Q&A</a></li>
        <%} else{ %>
         <li><a class="navbar_a" href="login.jsp">로그인</a></li>
         <li><a class="navbar_a" href="qnalist.do">Q&A</a></li>
        <%} %>
		
		</ul>
	</nav>
</body>
</html>
<%@page import="java.io.PrintWriter"%>
<%@page import="join.BlogDAO"%>
<%@page import="join.BlogBean"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./ssi.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>profile</title>
<jsp:include page="b_header.jsp"></jsp:include>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700">

<style>
.pricingdiv {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	font-family: 'Source Sans Pro', Arial, sans-serif;
}

.pricingdiv ul.theplan {
	list-style: none;
	margin-top: 40px;
	padding: 0;
	display: flex;
	flex-direction: column;
	border-top-left-radius: 50px;
	border-bottom-right-radius: 50px;
	color: black;
	background: #E6E6FA;
	position: relative;
	width: 300px; /* width of each table */
	margin-right: 10px; /* spacing between tables */
	margin-bottom: 1em;
	transition: all .5s;
}

.pricingdiv ul.theplan li {
	margin: 10px 20px;
	position: relative;
}

.pricingdiv ul.theplan li.title {
	font-size: 150%;
	font-weight: bold;
	text-align: center;
	margin-top: 20px;
	text-transform: uppercase;
	border-bottom: 5px solid white;
}

.pricingdiv a.pricebutton {
	background: white;
	text-decoration: none;
	padding: 10px;
	display: inline-block;
	margin: 10px auto;
	border-radius: 5px;
	color: navy;
	text-transform: uppercase;
}

@media only screen and (max-width: 500px) {
	.pricingdiv ul.theplan {
		border-radius: 0;
		width: 100%;
		margin-right: 0;
	}
	.pricingdiv ul.theplan:hover {
		transform: none;
		box-shadow: none;
	}
	.pricingdiv a.list {
		display: block;
	}
}
</style>

</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
	<%

	  String path=application.getRealPath("storage");
	  System.out.println("경로 " + path);
	  int size=1024*1024*7;
	 
	  DefaultFileRenamePolicy dfr = new  DefaultFileRenamePolicy( );
	  MultipartRequest mr=new MultipartRequest(request,path,size,"UTF-8", dfr);
	  
	  id=mr.getParameter("id");
	  msg="select * from bmember where id=";
	  PST = CN.prepareStatement(msg);
	  PST.setString(1, id);
	  RS = PST.executeQuery();
	  RS.next();
	  if(RS.next()==true){
		  id=mr.getParameter("id");
		  name1=mr.getParameter("name1");
		   pass1=mr.getParameter("pass1");
		   tel = mr.getParameter("tel");
		   gender = mr.getParameter("gender");
		   job = mr.getParameter("job");
		   age = mr.getParameter("age");
		   file = mr.getFilesystemName("file1");
		  	 
	%>
	
	
	<div class="pricingdiv">
		<ul class="theplan">
			<li class="title"><b><%=mr.getParameter("id") %>의 개인정보</b></li>
			<li><b>프로필:</b><%=file%></li>
			<li><b>ID:</b> <%= id %></li>
			<li><b>PWD:</b><%=name1%></li>
			<li><b>이름:</b> <%=pass1%></li>
			<li><b>전화번호:</b> <%=tel%></li>
			<li><b>성별:</b> <%=gender%></li>
			<li><b>직업:</b> <%=job%></li>
			<li><b>연령:</b><%=age%></li>

			<li><a class="list" href="./blist.jsp" rel="nofollow"><span
					class="icon-tag"></span>목록으로</a></li>
		</ul>
	</div>
	<%
		} else {
	%>
	<script language=javascript>
		alert("로그인이 필요합니다");
	</script>
	<%
		response.sendRedirect("blogin.jsp");
		}
	%>


</body>

</html>
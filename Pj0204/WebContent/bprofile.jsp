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
	padding: 10px;
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
	color: #454545;
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
<jsp:include page="b_header.jsp">
	<jsp:param value="3" name="active"/>
	</jsp:include>

	<%
		String msg = "select * from bmember where id='" + session.getAttribute("id") + "'";
		ST = CN.createStatement();
		RS = ST.executeQuery(msg);
		if (RS.next() == true) {
			id = RS.getString("id");
			pass1 = RS.getString("pass1");
			name1 = RS.getString("name1");
			tel = RS.getString("tel");
			gender = RS.getString("gender");
			job = RS.getString("job");
			age = RS.getString("age");
			file = RS.getString("file1");
	%>
	<div class="pricingdiv">
		<ul class="theplan">
			<li class="title"><b><%=RS.getString("id")%>님의 개인정보</b></li>
			<li style="text-align:center;"> <img src="./storage/<%= file %>"  class="mr-3 mt-3 rounded-circle" style="width:120px; height:120px"></li>
			<li><b>ID:</b> <%=RS.getString("id")%></li>
			<li><b>PWD:</b><%=RS.getString("pass1")%></li>
			<li><b>이름:</b> <%=RS.getString("name1")%></li>
			<li><b>전화번호:</b> <%=RS.getString("tel")%></li>
			<li><b>성별:</b> <%=RS.getString("gender")%></li>
			<li><b>직업:</b> <%=RS.getString("job")%></li>
			<li><b>연령:</b><%=RS.getString("age")%></li>

			<li style="text-align:right;"><a class="list" href="./blist.jsp" rel="nofollow" ><span
					class="icon-tag" ></span>목록으로</a></li>
		</ul>
	</div>
	<%
		} else {
	%>
	<script language=javascript>
		alert("로그인이 필요합니다");
		location.href="blogin.jsp";
	</script>
	<%
		}
	%>
<jsp:include page="bottom.jsp"></jsp:include>
</body>

</html>
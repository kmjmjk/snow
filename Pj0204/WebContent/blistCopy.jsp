<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>blog listpage</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<style>
table {
	margin-left: auto;
	margin-right: auto;
	border-collapse: collapse;
	width: 60%;
}

th, td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

tr:hover {
	background-color: #f5f5f5;
}
</style>

</head>
<body>

	<jsp:include page="b_header.jsp"></jsp:include>

	<br>
	<table>
		<tr bgcolor="hsl(217, 43%, 93%)">
			<td style="text-align: center; width: 100px;">No.</td>
			<td style="text-align: center; width: 520px;">Title</td>
			<td style="text-align: center; width: 130px;">Writer</td>
			<td style="text-align: center; width: 180px;">Date</td>
			<td style="text-align: center;">Hits</td>
		</tr>

		<%
			//Gnum = request.getParameter("num");//////////////////////////////////////í•´ê²°
			ST = CN.createStatement();

			String a = "select * from (";
			String b = "select rownum rn, num, title, name, wdate, hit ";
			String z = "from (select * from blog)";
			String c = ")where rn between 1 and 666 order by wdate desc";

			msg = a + b + z + c;
			RS = ST.executeQuery(msg);
			while (RS.next() == true) {
				Qnum = RS.getInt("num");
				Gtitle = RS.getString("title");
				//Gid=RS.getString("id");
		%>
	
		<tr>
			<td><%=Qnum%></td>
			<td><a href="bDetail.jsp?num=<%=Qnum%>"> <%=Gtitle%></a></td>
			<td><%=RS.getString("name")%></td>
			<td><%=RS.getDate("wdate")%></td>
			<td><%=RS.getInt("hit")%></td>
		</tr>
		<%
			}
		%>
			
		</table>
				<!-- <div class="container" >
					<ul class="pagination">
						<li class="page-item"><a class="page-link" href="#">Previous</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item active"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">Next</a></li>
					</ul>
				</div> -->
</body>
</html>
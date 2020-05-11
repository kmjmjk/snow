<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[bbsDetail.jsp]</title>
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
.table{
	 background-color:#F7F7F7;
}

.txt{
	 color: gray;
}

.txt2{
	font-size: x-large;
}
</style>	
</head>
<body>
	<jsp:include page="b_header.jsp">
		<jsp:param value="1" name="active" />
	</jsp:include>
	<%
		String userid = (String) session.getAttribute("id");
		if (userid == null)
			userid = "";
		
		Qnum = Integer.parseInt(request.getParameter("num"));

		msg = "update blog set hit=hit+1 where num =  " + Qnum;
		ST = CN.createStatement();
		int ok = ST.executeUpdate(msg);

		msg = "select * from blog  where num = " + Qnum;
		//System.out.println(msg); 
		ST = CN.createStatement();
		RS = ST.executeQuery(msg);
		if (RS.next() == true) {
			Gnum = RS.getInt("num");
			Gname = RS.getString("name");
			Gtitle = RS.getString("title");
			Gwdate = RS.getDate("wdate");
			Gcontent = RS.getString("content");
		} //end
	%>
	<br>
	<table class="table"
		style="margin-left: auto; margin-right: auto; width: 60%;">
		<tr>
			<td class="txt2" align="center" height=50 colspan="2"><%=Gtitle%>
			</td>
		</tr>
		<tr class="txt">
			<td><%=Gwdate%>
			</td>
			<td style="text-align:right">ID : <%=Gname%>
			</td>
		</tr>
		<%-- <tr>
			<td align="right">날짜 : <%=Gwdate%>
			</td>
		</tr>  --%>
		<tr align="center" height=400>
			<td  colspan="2">
			<%=Gcontent%></td>
		</tr>
	</table>
	<p></p>
	<% if (Gname.equals(userid)) { %>   <!--  userid(로그인 한 id) 와 Gname(작성자 이름)이 같을 경우에만 수정 삭제 버튼이 나오도록 권한을 주었다  -->
	<div align="center" >
		<input type="button" class="btn btn-outline-primary" value="삭제"
			onclick="location.href='bDelete.jsp?num=<%=Qnum%>'"> &nbsp; <input
			type="button" class="btn btn-outline-primary" value="수정"
			onclick="location.href='bEdit.jsp?num=<%=Qnum%>'">
	</div>
	<% } %>
	<P>
		<jsp:include page="b_reply.jsp">
			<jsp:param value="<%=Qnum%>" name="comments" />
		</jsp:include>
	</P>
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>





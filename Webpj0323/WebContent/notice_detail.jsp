<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="ssi.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice</title>
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
	<%
		Dnum = Integer.parseInt(request.getParameter("nnum"));

	    msg="update s_notice set nhit=nhit+1 where nnum="+Dnum;
	    ST=CN.createStatement();
	    ST.executeUpdate(msg);
	        
		String msg = "select * from s_notice where nnum=" + Dnum;
		ST = CN.createStatement();
		RS = ST.executeQuery(msg);
		while (RS.next() == true) {
			String Ntitle = RS.getString("ntitle");
	%>
	<script>
		function deleteAlert(){  //true 와 false로 구분 -> if문 안에 들어오는 것이 확인(예)일 경우라고 보면 된다
		 if(confirm("삭제를 원하시면 확인을 눌러주세요"))
 		  {
			 location.href='notice_delete.jsp?nnum=<%= Dnum %>'
 		  }
 		else
 		 {alert('취소되었습니다');}
	}
</script>
	<br><br><br><br>
	<table class="table"
		style="margin-left: auto; margin-right: auto; width: 45%; background-color: #eeeeee">
		<tr>
			<td class="txt2" align="center" height=50><%=RS.getString("ntitle")%>
			</td>
		</tr>
		<tr class="txt" align="right">
			<td>게시일 : <%=RS.getDate("ndate")%></td>
		</tr>
		<tr align="center" height=400>
		<td><img src="./storage/<%= RS.getString("nfile") %>" width="400" height="300">
 			<br><br><%=RS.getString("ncontent")%></td>
		</tr>
	</table>
	<c:if test="${id == null || id !='admin'}">
	<div class="deletebnt" style="text-align: center">
	<button type="button" class="btn btn-outline-secondary" onclick="location.href='notice.do'">목록으로</button>
	</div></c:if>
	
	<c:if test="${id=='admin'}">
	<div class="deletebnt" style="text-align: center">
	<button type="button" class="btn btn-outline-secondary" onclick="location.href='notice.do'">목록</button>
	<button type="button" class="btn btn-outline-secondary" onclick="location.href='notice_edit.jsp?nnum=<%= Dnum %>'" >수정</button>
	<button type="button" class="btn btn-outline-secondary" onclick="deleteAlert()">삭제</button>
	</div></c:if>

	<%
		}
	%>

<jsp:include page="footer.jsp"></jsp:include>	
</body>
</html>
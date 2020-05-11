<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA reply</title>

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
		int Qnum = Integer.parseInt(request.getParameter("qnum"));
	String userid = (String) session.getAttribute("id");
	if(userid == null){userid="";}

	    msg="update q_board set qhit=qhit+1 where qnum="+Qnum;
	    ST=CN.createStatement();
	    ST.executeUpdate(msg);
	        
		String msg = "select * from q_board where qnum=" + Qnum;
		ST = CN.createStatement();
		RS = ST.executeQuery(msg);
		while (RS.next() == true) {
			String Qtitle = RS.getString("qtitle");
			String qid = RS.getString("qid");
			Qnum = RS.getInt("qnum");
	%>
	
	
	<script>
		function deleteAlert(){  //true 와 false로 구분 -> if문 안에 들어오는 것이 확인(예)일 경우라고 보면 된다
		 if(confirm("삭제를 원하시면 확인을 눌러주세요"))
 		  {
			 location.href='qna_delete.jsp?qnum=<%= Qnum %>'
 		  }
 		else
 		 {alert('취소되었습니다');}
	}
</script>

	<br><br><br><br>
	<table class="table"
		style="margin-left: auto; margin-right: auto; width: 45%; background-color: #eeeeee">
		<tr>
			<td class="txt2" align="center" height=50 colspan="2"><%=RS.getString("qtitle")%>
			</td>
		</tr>
		<tr class="txt">
		<td>게시일 :<%=RS.getDate("qdate")%>
			</td>
			<td style="text-align:right">ID : <%=RS.getString("qid")%>
			</td>
		</tr>
		<tr align="center" height=400>
		<td colspan="2"><%=RS.getString("qcontent")%></td>
		</tr>
	</table>
	
	
	
	
	
	
	
	<c:if test="${id == null || id !='admin'}">
	<div class="deletebnt" style="text-align: center">
	<button type="button" class="btn btn-outline-secondary" onclick="location.href='qnalist.do'">목록</button>
	<% if(qid.equals(userid)){ %>
	<button type="button" class="btn btn-outline-secondary" onclick="deleteAlert()">삭제</button></div>
	<% } %>
	</c:if>
	
	<c:if test="${id=='admin'}">
	<div class="deletebnt" style="text-align: center">
	<button type="button" class="btn btn-outline-secondary" onclick="location.href='qnalist.do'">목록</button>
	<button type="button" class="btn btn-outline-secondary" onclick="location.href='qna_reply.jsp?qnum=<%= Qnum %>'">답글</button>
	<button type="button" class="btn btn-outline-secondary" onclick="deleteAlert()">삭제</button>
	</div></c:if>

	<%
		}
	%>

<jsp:include page="footer.jsp"></jsp:include>	
</body>
</html>
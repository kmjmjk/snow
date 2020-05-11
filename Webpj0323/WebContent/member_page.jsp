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

<style>
  table {
    margin : auto; 
    width: 45%;
    border: 1px solid #444444;
    border-collapse: collapse;
  }
  th{
  	text-align : center;
    border: 1px solid #444444;
    background-color:#F5F5F5;
    padding: 10px;
  }
  td {
  	border: 1px solid #444444;
    padding: 10px;
  	text-align: left;
  }

</style>

</head>
<body>
	<%
		
	String userid = (String) session.getAttribute("id");
	if(userid == null){userid="";}

	        
		String msg = "select * from s_member where id='"+userid+"'";
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
	<script>
		function deleteAlert(){  //true 와 false로 구분 -> if문 안에 들어오는 것이 확인(예)일 경우라고 보면 된다
		 if(confirm("탈퇴를 원하시면 확인을 눌러주세요"))
 		  {
			 location.href='member_delete.jsp?id=<%= Nid %>'
 		  }
 		else
 		 {alert('취소되었습니다');}
	}
</script>
	
	<br><br><br><br><br><br>
	<table>
			<tr><th colspan="2"><img alt="login" src="./images/member.jpg" width="60px" height="60px"><br><%= Nname %>님의 회원정보</tr>
			<tr><th>아이디</th><td><%=Nid%></td></tr>
			<tr><th>이름</th><td><%=Nname%></td></tr>
			<tr><th>전화번호</th><td><%=Ntel%></td></tr>
			<tr><th>이메일</th><td><%=Nemail%></td></tr>
			<tr><th>성별</th><td><%=Ngender%></td></tr>
			<tr><th>주소</th><td>(<%=Nzipcode%>) <%=Nadd1%> <%=Nadd2%></td></tr>
			<tr><th>생년월일</th><td><%=Nbirth%></td></tr>
			<tr><th>가입일</th><td><%=Njoindate%></td></tr>
			<tr><td colspan="2" style="text-align:center;">
			<button type="button" class="btn btn-outline-secondary" onclick="location.href='member_edit.jsp?id=<%= Nid %>'" >정보수정</button>
	<button type="button" class="btn btn-outline-secondary" onclick="deleteAlert()">회원탈퇴</button>
	</td></tr>
	</table>
	
	<% } %>
	
	<br><br><br><br>
<jsp:include page="footer.jsp"></jsp:include>	
</body>
</html>
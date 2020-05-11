<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>b_replyInsert.jsp</title>
<script type="text/javascript">
	
</script>
</head>
<body>
	<%
		Qnum = Integer.parseInt(request.getParameter("num"));
		Rnick = request.getParameter("nick");
		Rcomments = request.getParameter("comments");

		String msg = "insert into breply values (" + Qnum + ", ?, ?, sysdate,breply_seq.nextval)";
		PST = CN.prepareStatement(msg);
		PST.setString(1, Rnick);
		PST.setString(2, Rcomments);
		PST.executeUpdate();
		
		response.sendRedirect("bDetail.jsp?num="+Qnum);
	%>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[guest_reply.jsp]</title>

<script type="text/javascript">
	
</script>
</head>
<body>
	<%
		Qnum = Integer.parseInt(request.getParameter("num"));
		System.out.println("bDetail.jsp?num=" + Qnum);
		Renum = Integer.parseInt(request.getParameter("r_num"));
		Rnick = request.getParameter("nick");
		Rcomments = request.getParameter("comments");

		msg = "update breply set nick=?, comments=? where r_num=" + Renum;
		PST = CN.prepareStatement(msg);
		PST.setString(1, Rnick);
		PST.setString(2, Rcomments);
		PST.executeUpdate();
		response.sendRedirect("bDetail.jsp?num=" + Qnum);
	%>
</body>
</html>







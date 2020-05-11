<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./ssi.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join_save</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<%
		String path = application.getRealPath("storage");
		System.out.println("경로 " + path);
		int size = 1024 * 1024 * 7;

		DefaultFileRenamePolicy dfr = new DefaultFileRenamePolicy();
		MultipartRequest mr = new MultipartRequest(request, path, size, "UTF-8", dfr);

		id = mr.getParameter("id");
		pass1 = mr.getParameter("pass1");
		name1 = mr.getParameter("name1");
		tel = mr.getParameter("tel");
		gender = mr.getParameter("gender");
		job = mr.getParameter("job");
		age = mr.getParameter("age");
		file = mr.getFilesystemName("file1");

		msg = "insert into bmember values(?,?,?,?,?,?,?,?)";
		PST = CN.prepareStatement(msg);
		PST.setString(1, id);
		PST.setString(2, pass1);
		PST.setString(3, tel);
		PST.setString(4, gender);
		PST.setString(5, job);
		PST.setString(6, age);
		PST.setString(7, file);
		PST.setString(8, name1);
		PST.executeUpdate();

		response.sendRedirect("blist.jsp");
	%>
</body>
</html>
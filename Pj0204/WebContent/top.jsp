<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%
		String ss = (String) session.getAttribute("id");

		boolean loginchk;
		if (ss == null) {
			loginchk = false;
		} else {
			loginchk = true;
		}
	%>

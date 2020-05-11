<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
	Cookie[] cook=request.getCookies();
	if(cook != null){
		for(int i=0; i<cook.length; i++){
%>
			Cookie Name: <%=cook[i].getName()%><br>
			Cookie Value: <%=cook[i].getValue()%><br><br>
<%			
			if(cook[i].getName().equals("logId1"))
			{
				cook[i].setMaxAge(0); //쿠키 설정시간 0으로 변경(쿠키 제거)
				response.addCookie(cook[i]);
			}
		}
	}
%>
<a href="testCookie2.jsp">testCookie2</a>
</body>
</html>
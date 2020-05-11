<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<% int Qnum = Integer.parseInt(request.getParameter("qnum"));%>
	<form name="reply_form" action="qna_replyInsert.jsp">
		<table class="table" 
			style="margin-left: auto; margin-right: auto; width:60%; ">
			
			<tr>
				<td><input type="hidden" name="anum" value="<%=Qnum%>">&nbsp;이 름
				
				</td>
				<td><input type="text" name="nick" size=35>&emsp;&emsp;&emsp;&emsp;&emsp;
				<input type='button'
					onclick="re_save('<%=Qnum%>');" name="bt_save" value="댓글등록"
					id="rsave">
				</td>

			</tr>
			<tr>
				<td>&nbsp;댓 글 </td>
				<td><textarea cols=55 rows=3 name="comments"></textarea></td>
			</tr>

			
		</table>
	</form>

</body>
</html>
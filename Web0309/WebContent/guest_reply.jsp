<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[guest_reply.jsp]</title>
<style type="text/css">
* {
	font-size: 14pt;
	font-family: Comic Sans MS;
}

#btnEdit {
	font-size: 16pt;
	background: #00FF00;
}
</style>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
	function replyEdit(num, writer, content) {
		frm.num.value = num;
		frm.writer.value = writer;
		frm.content.value = content;
		frm.bt_save.value = "댓글수정"
		//자바스크립트에서 greplyUpdate.tis접근
		frm.action = "greplyUpdate.tis";
	}//end

	function replyEdit2(num, writer, content, sabun) {
		//alert(num+" "+writer+" "+content+" "+sabun);
		$("#writer" + num).html(
				"<input type=text  id='writer' value="+writer+">");
		$("#content" + num).html(
				"<input type=text id='content' value="+content+">");
		$("#bt" + num).html(
				"<input type='button' onclick=\"editSave(" + num + "," + sabun
						+ ")\"  value='등록'>" + "<a href='#'>[취소]</a>");
	}//end

	function editSave(num, sabun) {
		var wt = $("#writer").val();
		var ct = $("#content").val();
		//alert("editSave함수 num="+num+"&writer="+wt+"&content="+ct+"&sabun="+sabun);
		location.href = "greplyUpdate.tis?num=" + num + "&writer=" + wt
				+ "&content=" + ct + "&sabun=" + sabun;
	}//end
</script>
</head>
<body>

	<table width="700" border='0' cellspacing="0">
		<form name="frm" method="get" action="greplyInsert.tis">
			<img src="images/x1.gif"> Gidx: <input type="text" name="sabun"
				value="${rsabun}"> <input type="hidden" name="num" value=""><br>
			<tr>
				<td><img src="images/x1.gif">글쓴이: <input type="text"
					name="writer" size=30> <input type="submit" name="bt_save"
					value="등록 " style="height: 30pt;"></td>
			</tr>

			<tr>
				<td><img src="images/x1.gif">내 용 : <textarea
						name="content" cols="60" rows=3></textarea></td>
			</tr>
		</form>
	</table>

	<p>
	<table width="700" border='0' cellspacing="0">
		<tr bgcolor="pink" height='30' align="right">
			<td colspan=4><c:if test="${Rtotal>0}">댓글 수:${Rtotal}</c:if></td>
		</tr>

		<c:forEach var="rdto" items="${rLG}">
			<tr>
				<td width=70>${rdto.num}</td>
				<td width=100 id="writer${rdto.num}">${rdto.writer}</td>
				<td width=100 id="content${rdto.num}">${rdto.content}</td>
				<td width=330 align="right" id="bt${rdto.num}"><input
					type="button"
					onclick="location.href='greplyDelete.tis?Gidx=${rsabun}&Gnum=${rdto.num}'"
					value="삭제">
					<button
						onClick="replyEdit('${rdto.num}','${rdto.writer}','${rdto.content}' )">수정1</button>
					<button
						onClick="replyEdit2('${rdto.num}','${rdto.writer}','${rdto.content}', '${rdto.sabun}' )">수정2</button>
				</td>
			</tr>
		</c:forEach>
	</table>

	<br>
	<br>
	<br>
	<br>
	<br>
	<p>
	<hr>
</body>
</html>










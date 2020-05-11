<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>[guest_reply.jsp]</title>
<script type="text/javascript">
	var Qnum; //전역변수
	var Renum;

	function re_edit(num, r_num, nick, comments) { //3페이지 19번라인
		Qnum = num;
		Renum = r_num;
		reply_form.nick.value = nick;
		reply_form.comments.value = comments;
		reply_form.bt_save.value = "댓글수정";
	}//end
	function re_save() {//3페이지 26번라인
		var bt = reply_form.bt_save.value; //댓글등록
		var rw = reply_form.nick.value;
		var rc = reply_form.comments.value;

		if (bt == "댓글등록") {

			if (rw == null || rw == "" || rc==null || rc=="") {
				alert("내용을 입력해 주세요");
				reply_form.nick.focus();
				return false;
			}
			document.reply_form.submit();
		} else if (bt == "댓글수정") {
			reply_form.bt_save.value = "댓글등록";
			document.reply_form.action = "b_replyEdit.jsp?num=" + Qnum
					+ "&nick=" + rw + "&comments=" + rc + "&r_num=" + Renum;
			document.reply_form.method = "post";
			document.reply_form.submit();
		}
	}//end
</script>


</head>
<body>
	<%
		Qnum = Integer.parseInt(request.getParameter("num"));
		System.out.print(Qnum);
	%>
	<p>
	<form name="reply_form" action="b_replyInsert.jsp">
		<table class="table" 
			style="margin-left: auto; margin-right: auto; width:60%; ">
			
			<tr>
				<td><input type="hidden" name="num" value="<%=Qnum%>">&nbsp;이 름
				
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
	<table style="width:60%; margin:auto; ">
		<tr bgcolor="lightblue">
			<td colspan="4">글번호 <%=Qnum%>댓 글 
			</td>
		</tr>
		<%
			String a = "select rownum rn, b.num, r.nick, r.comments, r.wdate, r.r_num from blog b";
			String b = " inner join breply r";
			String z = " on b.num = r.num";
			String c = " and r.num = " + Qnum; //Qnum = request.getParameter("num")
			msg = a + b + z + c;
			ST = CN.createStatement();
			RS = ST.executeQuery(msg);
			while (RS.next() == true) {
				Qnum = RS.getInt("num");
				System.out.println(Qnum);
				Rnick = RS.getString("nick");
				Rcomments = RS.getString("comments");
				Renum = RS.getInt("r_num");
				//Rdate = RS.getInt("date");
		%>
		<tr onmouseover="style.backgroundColor='lightgray'"
			onmouseout="style.backgroundColor='' ">
			<!-- <td width=70><%=Qnum%></td>  지워도 됨-->
			<td width=70><%=Renum%></td>
			<td width=150><%=Rnick%></td>
			<td width=200><%=Rcomments%></td>


			<td align="right">
				<div style="font-size: 10pt"><%=RS.getDate("wdate")%></div> <a
				class='bt' href="b_replyDelete.jsp?num=<%=Qnum%>&r_num=<%=Renum%>">
				<span class="badge badge-pill badge-light">삭제</span></a>
				<a class='bt' href="#"
				onClick="re_edit('<%=Qnum%>','<%=Renum%>','<%=Rnick%>','<%=Rcomments%>')">
				<span class="badge badge-pill badge-light">수정</span></a>
			</td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>







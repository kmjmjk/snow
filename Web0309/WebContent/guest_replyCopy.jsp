<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [guest_reply.jsp] </title>
	<style type="text/css">
	   *{font-size:14pt; font-family: Comic Sans MS; }
	 
	   	#LOG-IN{
		 font-size:26pt; font-weight: bold; 
		 background:#FFFF00; height:550; 
		}
		
		#btnEdit{font-size:16pt;background: #00FF00; }   
	</style>
	
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <script type="text/javascript">
		 
	 function replyEdit(num,writer,content){
		 frm.num.value=num;
		 frm.writer.value=writer;
		 frm.content.value=content;
		 frm.bt_save.value="수정";  //댓글 수정
		 frm.action="greplyUpdate.tis"
	 }
	 
	 function replyEdit2(num,writer,content,sabun){
		alert(num+" "+writer+" "+content+" "+sabun);
		$("#writer"+num).html("<input type='text' id='writer' value="+writer+">");
		$("#content"+num).html("<input type='tex't id='content' value="+content+">");
		$("#bt"+num).html(
			"<input type='button' id='btnEdit' onclick='\"editSave("+num+","+sabun+")\"' value='수정'><a href='#'>[취소]</a>"
		);		
	 }
	 
	 function editSave(num,sabun){
		var wt=$("#writer").val();
		var ct=$("#content").val();
		alert("num="+num+"&writer="+wt+"&content="+ct+"&sabun="+sabun);
		//location.href="greplyUpdate.tis?num="+num+"&writer="wt+"&content="+ct+"&sabun="+sabun;
	 }//end
  </script>
</head>
<body>
  
<table width="700"  border='0' cellspacing="0">
 <form name="frm" method="get" action="greplyInsert.tis" >
   <!--  flag: <input type="text"  name="flag"  value="1"><br>  --> 
 	Gidx(사번): <input type="text"  name="sabun"  value="${rsabun}"><br>
 	<!--  num : <input type=text" name="num" vlaue=""><br>  -->
 	<tr>
 	  <td><img src="images/x1.gif">작성자:
 		<input type="text"  name="writer" size=30>
 		<input type="submit" name="bt_save" value="등록 "  style="height:25pt;">
 		     
 	  </td>
 	</tr>
 	
 	<tr>
 	  <td>
 		<img src="images/x1.gif">메모글: <textarea  name="content" cols="60" rows=3></textarea>
 	  </td>
 	</tr>
 </form>
</table>
  
 <p>
  <table width="700"  border='0' cellspacing="0">
   <tr  bgcolor="pink"  height='30'  align="center">
 	   <td colspan=5 align="right"><c:if test="${Rtotal>0}">댓글 수 : ${Rtotal}</c:if></td>       
   </tr>
   
  <c:forEach var="rdto" items="${rLG}">
	  <tr>
	  	<td width=70> ${rdto.rrn}  </td>
  		<td width=150 id="writer${rdto.num}"> ${rdto.writer}  </td>
  		<td width=200 id="content${rdto.num}"> ${rdto.content} </td>
  		<td width=70 id="bt${rdto.num}"> ${rdto.num}  </td>
	 	<td width=280 align="right" id="bt${rdto.num}"> 
	 	   <input type="button" onclick="location.href='greplyDelete.tis?Gidx=${rsabun}&Gnum=${rdto.num}'" value="삭제">
		   <input type="button" onClick="replyEdit('${rdto.num}','${rdto.writer}','${rdto.content}')" value="수정">    
		    <input type="button" onClick="replyEdit2('${rdto.num}','${rdto.writer}','${rdto.content}','${rdto.sabun}')" value="수정">    <!-- 수정 방법 두번째 -->
	 	 </td>       
	  </tr>
  </c:forEach>

</table>	
</body>
</html>
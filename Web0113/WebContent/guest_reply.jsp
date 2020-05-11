<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [guest_reply.jsp] </title>
	<style type="text/css">
	  *{ font-size: 14pt; font-weight: bold; }
	  a{ font-size: 14pt; text-decoration:none; color:blue ; font-family: Comic Sans MS; }
	  a:hover{ font-size: 16pt; text-decoration:underline; color:green ; font-family: Comic Sans MS; }
	  
	  
	</style>

	<script type="text/javascript">
	  var gr_num; //전역변수
	  
	  function re_edit(num, writer, content){ //3페이지 19번라인
		gr_num=num;
	  	reply_form.writer.value=writer;
	  	reply_form.content.value=content;
	  	reply_form.bt_save.value="댓글수정";
	  }//end
	  
	  function re_save(){//3페이지 26번라인
	    var bt=reply_form.bt_save.value;
	    var rw=reply_form.writer.value;
	    var rc=reply_form.content.value;
	    var rsabun=reply_form.sabun.value;
	  
	  if(bt=="댓글저장"){
		  if(rw==null || rw==""){
			  alert("이름을 입력해 주세요");
			  reply_form.writer.focus();
			  return false;
		  }
		  document.reply_form.submit();
	  }else if(bt=="댓글수정"){
		  reply_form.bt_save.value="댓글저장";
		  
		  document.reply_form.action="guest_replyEdit.jsp?Gidx="+rsabun+"&writer="+rw+"&content="+rc+"&num="+gr_num;
		  document.reply_form.method="post";
		  document.reply_form.submit();
	     }
	  }//end
	</script>
</head>
<body>
   
 <%
  //guest_reply.jsp단독실행하면 에러발생
  String Rdata = request.getParameter("Gidx") ;
  System.out.println("guest_reply.jsp댓글문서 넘어온  Gidx="+ Rdata);
  //out.println("guest_reply.jsp댓글문서 넘어온 Gidx="+ Rdata + "<br>"); 
 %>
 	
 	<form name="reply_form" action="guest_replyInsert.jsp">
 	 <table width=700 border=1 cellspacing=0>
 	  Gidx: <input type="text" name="sabun" value="<%= Rdata %>">
 	  <tr>
 	    <td> <img src="images/z1.gif">이 름<img src="images/z1.gif"></td>
 	    <td> <input type="text" name="writer" size=25></td>
 	    
 	    <td rowspan=2 align="center">
 	    <input type="button" name="bt_save" onClick="re_save();" value="댓글저장" id="rsave">
 	    </td>
 	  </tr>
 	   <tr>
 	    <td><img src="images/z1.gif">내 용<img src="images/z1.gif"></td>
 	    <td>
 	    <textarea cols=27 rows=3 name="content"></textarea>
 	   </td>
 	  </tr>
 	 </table>
 	</form>
 	
 <table width=700 border=0 cellspacing=0>
  <tr bgcolor="pink">
  	<td colspan="4"> 댓 글 </td> 
  </tr>
<%
  StringBuffer sb = new StringBuffer( );//미사용 , StringBuilder
  sb.append("");
  
 String a="select rownum rn,g.sabun,r.num,r.writer,r.content from guest g" ; 
 String b=" inner join guestreply r " ;
 String z=" on g.sabun = r.sabun  " ; 
 String c=" and r.sabun =  " + Rdata ; //Rdata=request.getParameter("Gidx")
 msg = a+b+z+c;
 ST=CN.createStatement();
 RS=ST.executeQuery(msg); //msg대신 sb.toString()변환
 while(RS.next()==true) {
	 Rrn=RS.getInt("rn");
	 Rnum=RS.getInt("num");
	 Rwriter=RS.getString("writer");
	 Rcontent=RS.getString("content");
	 Rsabun=RS.getInt("sabun");
%>
  <tr onmouseover="style.backgroundColor='yellow'" onmouseout="style.backgroundColor='' ">
  	<td width=70>  <%= Rrn %> </td>
  	<td width=150> <%= Rwriter %> </td>
  	<td width=200> <%= Rcontent %> </td>
  	<td align="right">
  		<a href="guest_replyDelete.jsp?Gidx=<%= Rsabun %>&Gnum=<%= Rnum %>">[삭제]</a>
  		<a href="#" onClick="re_edit('<%= Rnum %>', '<%= Rwriter %>','<%= Rcontent %>')">[수정]</a> 
  	</td>
  </tr>
  <% } %>
 </table>	
</body>
</html>







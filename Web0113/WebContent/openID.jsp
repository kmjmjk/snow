<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> openID.jsp </title>
	<style type="text/css">
	  *{ font-size: 12pt; font-weight: bold; }
	  a{ font-size: 12t; text-decoration:none; color:blue ; font-family: Comic Sans MS; }
	  a:hover{ font-size: 12pt; text-decoration:underline; color:green ; font-family: Comic Sans MS; }
	</style>

	<script type="text/javascript">
	   function first( ){ document.subform.userID.focus();}
	   
	   function nullCheck( ){
		  var a=document.subform.userID.value;  
		  if( a==null || a==""){
			 alert("중복사번 데이터를 입력하세요");
			 subform.userID.focus();
			 return ;
		  }
		  document.subform.submit(); //input type=submit역할
	   }
	</script>
</head>
<body bgcolor="yellow"  onload="first();">
	<div align="center">
	   <img src="images/bar.gif" width=400> <p>
	   <form  name="subform"  action="openIDSave.jsp">
	     ID: <input type="text" name="userID" value="">
	         <input type="button" onClick="nullCheck( )"  value="중복체크">
	   </form>
	</div>
	
</body>
</html>


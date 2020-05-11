<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guestWriteCopy</title>
	<style type="text/css">
		*{font-size:12pt; font-weight:bold;}
		a{font-size:12pt; text-decoration:none; color:blue; front-family:Comic Sanc MS;}	
		a:hover{font-size:12pt; text-decoration:underline; color:purple; front-family:Comic Sanc MS;}						
	</style>

	<script type="text/javascript">
	var flag=false;  //자바스크립트 전역변수 자바스크립트에서는 int,double 같은거 쓸 수 없고 변수는 무조건 var라고 쎠야한다
	
	function nullCheck(){	
		var a=document.myform.sabun.value;
		var b=document.myform.name.value;
		var size=document.myform.sabun.value.length;
		
		if(a=="" || a==null){alert("사번을 입력해주세요");
		document.myform.sabun.focus();
		return;}
		else {document.myform.sabun.focus();}
		
		if(b=="" || b==null){alert("이름을 입력해주세요");
		document.myform.name.focus();
		return;}
		else {document.myform.name.focus();}	
	
        if (size!=4){
        alert("네자리수만 입력가능합니다");
        //document.myform.sabun.value = "";
        return;}
        else {document.myform.sabun.focus();}
         
        document.myform.submit();   //submit을 써서 guestSave로 넘어갈 수 있도록 해줌
        
        if(flag==false){
			alert("사번 중복체크를 해주세요");
			return;
		  }
        }	
		
	function numberCheck(){
		var c=document.myform.sabun.value;
		var csize=document.myform.sabun.value.length;
		for(var i=0; i<csize; i++)
		  if(c.charAt(i)<'0' || c.charAt(i)>'9'){
		     alert("숫자만 입력가능합니다");
		     myform.sabun.value = c.substring(0,i);
		     return;}
		     else {document.myform.sabun.focus();
		     }
		  }	
	
	function first(){
		document.myform.sabun.focus();
	  }
	
	function info(){
		//flag=true;  //onclick 이벤트가 실행이 되면 flag의 값이 true로 바뀐다는걸 정의
		var a=document.myform.sabun.value;	
		if(a=="" || a==null){alert("중복체크 사번을 입력해주세요");
		document.myform.sabun.focus();  //myform 앞에 document.  을 써도되고 안써도됨
		return;  //다음문장 처리하지않고 빠져나가기
		}
		window.open("openID.jsp?idx="+a,"bc","width=400, height=200,left=300, top=250")  //openID.jsp를 불러오기위해 입력해준문/bc는 창이 이미떠있다는 것을 알리기위한 임의 이름(쓰지 않으면 창이 여러개 중복으로 뜰 수가있다)	
	}	
	</script>
</head>
<body onload="first">
	guestWrite.jsp<p>	
	<form method="get" name="myform" action="guestWriteSave.jsp">
	  사번:<input type="text" name="sabun" onkeyup="numberCheck()" readyonly placeholder="IDsabun입력">
	  	<input type="button" onclick="info()" value="사번중복" ><br>
	  이름:<input type="text" name="name"><br>
	  제목:<input type="text" name="title" value="snow"><br>
	  급여:<input type="text" name="pay" value=79><br>
	  &nbsp;&nbsp;&nbsp; 
	  <input type="button" onclick="nullCheck()" value="버튼 데이터저장"> &nbsp;
	  <input type="reset" value="입력취소">
	</form>
	
	<p>
	 <a href="index.jsp">[Index]</a>
	 <a href="guestWrite.jsp">[신규등록]</a>
	 <a href="guestList.jsp">[전체출력]</a>
</body>
</html>
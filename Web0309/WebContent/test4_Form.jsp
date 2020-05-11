<%@ page language="java" contentType="text/html; charset=UTF-8"   %>
<!DOCTYPE html>
<html>
<head>  
<title> [test4_Form.jsp]</title>
   <style type="text/css">
      * {
         font-size: 20pt; 
         font-weight: bold; 
         font-family: Comic Sans MS ; 
         margin-left:10px;
        }
      
   </style>
   
   
 <script type="text/javascript">
 	function  move(){ 	   
 	   //좋아하는동물체크 도전 
 	   var chk=false;
 	   var size=myform.hobby.length;
 	   for(var i=0; i<size; i++){
 		   if(myform.hobby[i].checked==true){
 			   chk=true;break;
 		   }
 	   }
 	   
 	   if(chk==false){
 		 alert("취미생활 하나선택은 필수옵션입니다");
 		 myform.hobby[0].focus();
 		 return false; 
 	   }
 	   
 	   if(confirm("선택한 데이터 내용이 맞습니까")==true){
 		  document.myform.submit();   
 	   }
 	}//end===================================================
 </script>
</head>

<body>
<div>
 <form name="myform"  action="test4_Save.jsp">
   <fieldset>
   	<legend>test4_Form.jsp</legend>   	   	
   	<div class="input_group">
   		<label>좋아하는 동물을 선택하세요</label><br>
   		<label> <input type="checkbox" name="hobby" value="zebra" >얼룩말</label>
   		<label> <input type="checkbox" name="hobby" value="pig" >돼지</label>
   		<label> <input type="checkbox" name="hobby" value="chick">치킨</label>
   		<label> <input type="checkbox" name="hobby" value="crab">크랩</label>
   		<label> <input type="checkbox" name="hobby" value="tiger">호랑이</label>
   		<label> <input type="checkbox" name="hobby" value="whale">돌고래</label>
   	</div>
   	
  	<div class="input_group">
   		<label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  </label>
   		<input type="button" onclick="move();" value="버튼전송" >
   		<input type="reset" value="입력취소" >
   	</div>
   </fieldset>
 </form>
</div>
  
</body>
</html>








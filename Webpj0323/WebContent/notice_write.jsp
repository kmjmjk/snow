<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice_write</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<jsp:include page="admin_header.jsp"></jsp:include>
</head>
<body>
<br><br><br>

<!-- 	<script type="text/javascript">
	  function FileSelect(){
			var files = document.getElementById('file').files[0]; 
	   		var reader = new FileReader();  
	                 
	        reader.onload = (function(theFile) {
	          return function(e) {
	          alert(theFile.name);
	          
	          //원본 var img_view = ['<img src="', e.target.result, '" name="', escape(theFile.name),'"   width="450" height="250"  alt="tis" />'].join('');
	          var img_view = ['<img src=', e.target.result + '  width="120" height="70" />'].join('');
	          alert(img_view);
	          //내껏 var img_view = "[<img src="+theFile.name+" width='450' height='250'  alt='tis' >]" + join("");  
	          document.getElementById('preview').innerHTML = img_view ;
	          };
	       })(files);
	     reader.readAsDataURL(files);  //file로 읽어들이는 부분    
	  }//end	
	  
	  
	  function previewFiles() { //새로만든함수
		  var preview = document.querySelector('#preview');
		  var files   = document.querySelector('input[type=file]').files;
		  //var files = document.getElementById('file').files[0];
		  //document.getElementById('preview')
		  
		  function readAndPreview(file) {
		    //file.name` 형태의 확장자 규칙에 주의하세요
		    if ( /\.(jpe?g|png|gif)$/i.test(file.name) ) {
		      var reader = new FileReader();

		      //reader.onload = (function(theFile) { 코드기술 } ).(files)
		      reader.addEventListener("load", function () {
		        var image = new Image();
		        image.width = 100;
		        image.height = 50;
		        //image.title = file.name;
		        image.src = this.result;
		        preview.appendChild( image );
		      }, false);

		      reader.readAsDataURL(file);
		    } //정규식end
		  }

		  if (files) {
		    [].forEach.call(files, readAndPreview);
		  }

		}
	</script> -->

<div class="card" style="margin: auto; width:580px; height:650px; background-color:	#EEEEEE">
	<form method="post" enctype="multipart/form-data" name="myform" action="noticeWrite.do"
		style="text-align: center">
		<br>
		<input type="text" name="ntitle" style="width: 520px; height:40px" placeholder="글제목"><br>
		<br>
		<textarea name="ncontent" style="width: 520px; height: 450px;"> </textarea>
		<br>
		<p></p>
		
		이미지 첨부 <input type="file" id="file" name="nfile"><div id="preview"></div>
		<p></p>
		
		<input type="submit" value="등록"> 
		<input type="reset" value="취소">
		
</form>

</div>
<br>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
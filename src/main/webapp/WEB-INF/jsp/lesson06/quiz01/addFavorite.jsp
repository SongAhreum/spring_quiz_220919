<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <!-- bootstrap CDN link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <%-- AJAX를 사용하려면 더 많은 함수가 있는 js를 포함해야 한다. --%>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


<title>즐겨찾기 추가하기</title>
</head>
<body>
	<div class="container">
		<h1>즐겨 찾기 추가하기</h1>
		<div class="form-group">
			<label for="name">제목</label>
			<input type="text" name="name" id="name" class="form-control">
		</div>
		<div class="form-group">
			<label for="url">주소</label>
			<input type="text" name="url" id="url" class="form-control">
		</div>
		
		<input id="addBotton" type="botton" class="btn btn-success" value="추가">
	
	</div>
	
	<script>
	$(document).ready(function(){
		//validation test
		$('#addBotton').on('click',function(){
			let name = $('#name').val().trim();
			let url = $('#url').val().trim();
			
			if(name == ''){
				alert('제목을 입력하세요');
				return;
			}
			if(url.length < 1){
				alert('주소를 입력하세요');
				return;
			}
			//http로 시작하지도 않고 https로 시작하지도 않을 경우 alert
			if(url.startsWith('http') == false && url.startsWith('https') == false ){
				alert('주소를 형식이 잘못되었습니다.');
				return;
			}
			$.ajax({
				//요청,다시돌아오는 함수=>콜백함수(success함수,error함수)
				//request
				type:"POST"
				,url:"/lesson06/quiz01/add_favorite"
				,data:{"name":name,"url":url}
				
				//response
				//ajax이 string으로 내려온 json 파싱해서 object로 내부적으로 변환.객체로서 사용(ajax은 무조건 string을 내리는구나~(json이라 key로 value꺼내려고해도 안됨)) 
				,success:function(data){ //String JSON => Object(헤더에서 응답값이 text json이라고 내려줌,ajax이 파싱해서 object로 변환해 받음)
					alert(data);//(object object)로 넘어옴
					
					if(data.result == "성공"){
					location.href="/lesson06/quiz01/after_add_favorite_view"
					}
				}
				,error:function(e){
					alert("에러"+ e);
				}
			})
		})		
	})
	</script>
</body>
</html>
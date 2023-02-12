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
	
  <link rel="stylesheet" type="text/css" href="/css/lesson06/style.css">	
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
		
		<jsp:include page="header.jsp"/>
		
		<jsp:include page="main.jsp"/>
		
		<jsp:include page="footer.jsp"/>
	
	</div>
	
	<script>
	$(document).ready(function(){
		$(".check-btn").on('click',function(){
			let name = $('.name').val().trim();
			let phoneNumber = $('.phoneNumber').val().trim();
			//validation test
			//비어있는값
			if(name == ''){
				alert('이름을 입력하세요');
				return;
			}
			if(phoneNumber  == ''){
				alert('전화번호를 입력하세요');
				return;
			}	
			
		$.ajax({
			//request
			type:"Post"
			,url:"/lesson06/check_booking"
			,data:{"name":name,"phoneNumber":phoneNumber}
			//response
			,success:function(data){
				if(data.result == "성공"){
					let booking = data.booking;
					let message = "이름: "+booking.name
									+"\n날짜: "+booking.date.slice(0, 10)
									+"\n일수: "+booking.day
									+"\n인원: "+booking.headcount
									+"\n상태: "+booking.state;
					
					alert(message);
				} else{
					alert('예약내역이 없습니다')
				}
			}
			,error:function(e){
				alert('조회에 실패하였습니다');
			}
		})	
		})
	})
	
	</script>
</body>
</html>
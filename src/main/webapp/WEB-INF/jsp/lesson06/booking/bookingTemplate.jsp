<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  		<!-- jquery : bootstrap, datepicker -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>  

        <!-- bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

		<!-- datepicker -->
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

  <link rel="stylesheet" type="text/css" href="/css/lesson06/style.css">	

<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
	
		<jsp:include page="header.jsp"/>
		
		<section>
			<div class="contents">
				<h1 class="text-center m-4">예약하기</h1>
				<div class="mt-3">
				이름
				<input type="text" class="form-control mt-1" id="name">
				<small id="nameStatusArea"></small>
				</div>
				<div class="mt-3">
				예약날짜 
				<input type="text" class="form-control mt-1" id="date">
				<small id="dateStatusArea"></small>
				</div>
				<div class="mt-3">
				숙박일수
				<input type="text" class="form-control mt-1" id="day">
				<small id="dayStatusArea"></small>
				</div>
				<div class="mt-3">
				숙박인원
				<input type="text" class="form-control mt-1" id="headcount">
				<small id="headcountStatusArea"></small>
				</div>			
				<div class="mt-3">
				전화번호
				<input type="text" class="form-control mt-1" placeholder=" - 을 포함해서 입력하세요" id="phoneNumber">
				<small id="phoneNumberStatusArea"></small>
				</div>

				<button type="button" class="bookingBtn btn btn-warning col-12 mt-4" >예약하기</button>
			</div>		
		</section>
		
		
		<jsp:include page="footer.jsp"/>
		
	</div>	
	
	<script>
		$(document).ready(function(){
			$('#date').datepicker({
				//$('input[name=date]') 도 가능	
					changeMonth : true,
					changeYear : true,
					dateFormat : "yy-mm-dd",
					minDate: 0 // 오늘부터 그 뒤 선택
				});
			 
			
			$(".bookingBtn").on('click',function(){
				let name = $("#name").val().trim();
				let date = $("#date").val()
				let day = $("#day").val().trim();
				let headcount = $("#headcount").val().trim();
				let phoneNumber = $("#phoneNumber").val().trim()
				
				$("#nameStatusArea").empty();
				$("#dateStatusArea").empty();
				$("#dayStatusArea").empty();
				$("#headcountStatusArea").empty();
				$("#phoneNumberStatusArea").empty();
				
				
				//validation test
					//비어있는지
				if(name == ""){
					$("#nameStatusArea").append('<span class="text-danger">이름을 입력하세요</span>');
					return;
				}
				if(date == ""){
					$("#dateStatusArea").append('<span class="text-danger">날짜를 선택하세요</span>');
					return;
				}
				if(day == ""){
					$("#dayStatusArea").append('<span class="text-danger">숙박일수를 입력하세요</span>');
					return;
				}
				if(headcount == ""){
					$("#headcountStatusArea").append('<span class="text-danger">숙박인원을 입력하세요</span>');
					return;
				}
				if(isNaN(headcount)){
					$("#headcountStatusArea").append('<span class="text-danger">숙박인원은 숫자로 입력하세요</span>');
					return;
				}
				if(phoneNumber1 == "" || phoneNumber2 == "" || phoneNumber3 == ""){
					$("#phoneNumberStatusArea").append('<span class="text-danger">전화번호를 입력하세요</span>');
					return;
				}
	
				$.ajax({
					//request
					type:"POST"
					,url:"/lesson06/add_booking"
					,data:{"name":name,"date":date,"day":day,"headcount":headcount,"phoneNumber":phoneNumber}
					
					//response
					,success:function(data){
						if(data.result == "성공"){
							alet("예약되었습니다");
							location.href="/lesson06/booking_list_view"
						}
					}				
					,error:function(e){
						alert("실패"+e);
					}
				})
								
			})			
		})
	
	</script>
</body>
</html>
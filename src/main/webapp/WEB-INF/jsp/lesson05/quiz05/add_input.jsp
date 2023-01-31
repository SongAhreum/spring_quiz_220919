<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<section class="col-10 m-3">
	<h1>날씨 입력</h1>
	<form method="post" action="/lesson05/weather_add">
		
		<div class="d-flex justify-content-between mt-5">
			<div class="form-group d-flex align-items-center">
				<label for="date">날짜</label>
				<input type="text" id="date" name="date" class=" date form-control m-1">
			</div>
			<div class="form-group d-flex align-items-center">
				<label for="weather">날씨</label>
				<select class="form-control m-1 weather" name="weather">				
					<option value='' selected>-- 선택 --</option>
					<option>맑음</option>
					<option>구름조금</option>
					<option>흐림</option>
					<option>비</option>
				</select> 
			</div>
			<div class="form-group d-flex align-items-center">
				<label for="microDust">미세먼지</label>
				<select class="form-control m-1 microDust" name="microDust">				
					<option value='' selected>-- 선택 --</option>
					<option>좋음</option>
					<option>보통</option>
					<option>나쁨</option>
					<option>최악</option>
				</select> 
			</div>		
		</div>
		
		<div class="d-flex justify-content-between mt-5">
			<div class="input-group d-flex align-items-center mr-5">
				<label for="temperatures">기온</label>
	  			<input type="text" class="form-control temperatures" name="temperatures">
	 			 <div class="input-group-append">
	   			 <span class="input-group-text">℃</span>
	  			</div>
			</div>
			<div class="input-group d-flex align-items-center ml-5 mr-5">
				<label for="precipitation">강수량</label>
	  			<input type="text" class="form-control precipitation" name="precipitation">
	 			 <div class="input-group-append">
	   			 <span class="input-group-text">mm</span>
	  			</div>
			</div>
			<div class="input-group d-flex align-items-center ml-5">
				<label for="windSpeed">풍속</label>
	  			<input type="text" class="form-control windSpeed" name="windSpeed">
	 			 <div class="input-group-append">
	   			 <span class="input-group-text">km/h</span>
	  			</div>
			</div>				
		</div>
		<div class="mt-5 text-right">
		<input type="submit" class="btn btn-success" value="저장">
		</div>		
	</form>
	<script>
	$(document).ready(function(){
		$('#date').datepicker({
		//$('input[name=date]') 도 가능	
			changeMonth : true,
			changeYear : true,
			dateFormat : "yy-mm-dd",
		});
		$('form').on('submit',function(e){
			//e.preventDefault();
			
			if($('.date').val().length == ''){
				alert('날짜를 선택하세요')
				return false;
			}
			if($('.weather').val() == ''){
				alert('날씨를 선택하세요')
				return false;
			}
			if($('.microDust').val() == ''){
				alert('미세먼지 상태를 선택하세요')
				return false;
			}
			if($('.temperatures').val() == ''){
				alert('온도를 입력하세요')
				return false;
			}			
			if($('.precipitation').val() == ''){
				alert('강수량을 입력하세요')
				return false;
			}			
			if($('.windSpeed').val() == ''){
				alert('풍속을 입력하세요')
				return false;
			}
			
		})
		
	});
	</script>
</section>

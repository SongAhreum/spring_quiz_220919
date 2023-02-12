<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- 메인 -->
<section>
<!-- contents사진 -->
	<article>
		<img alt="메인배너" src="/img/lesson06/test06_banner1.jpg">
	</article>
	<!-- 예약확인창 -->
	<article class="bottom">
		<div class="col-4 b-side"><div class="l-text">실시간<br>예약하기</div></div>
				
		<div class="col-4 check-box">
		<div class="m-3">
			<div class="input-text1">예약확인</div>
				<div>
					<div class="input-group"><label for="name">이름:</label><input type="text" name="name" class="name form-control col-8 ml-2 mt-3"></div>
					<div class="input-group"><label for="phoneNumber">전화번호:</label><input type="text" name="phoneNumber" class="phoneNumber form-control col-8 ml-2 mt-3"></div>
				</div>
				<button type="button"class="form-control btn btn-success check-btn col-3 mt-3">조회하기</button>
			</div>
		</div>
				
		<div class="col-4 b-side"><div class="r-text">예약문의:<br>010-<br>0000-1111</div></div>			
	</article>			
</section>
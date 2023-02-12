<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
		
		<section>
			<h1 class="m-5">예약 목록 보기</h1>
			<table class="table text-center">
				<thead>
					<tr>
						<th><b>이름</b></th>
						<th><b>예약날짜</b></th>
						<th><b>숙박일수</b></th>
						<th><b>숙박인원</b></th>
						<th><b>전화번호</b></th>
						<th><b>예약상태</b></th>
						<th><b></b></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${bookingList}">
					<tr>
						<td>${list.name}</td>
						<td><fmt:formatDate value="${list.date}" pattern="yyyy년 MM월 dd일"/></td>
						<td>${list.day}</td>
						<td>${list.headcount}</td>
						<td>${list.phoneNumber}</td>
						<td>
							<c:choose>
								<c:when test="${list.state eq '확정' }"><sapn class="text-success">확정</sapn></c:when>
								<c:when test="${list.state eq '대기중' }"><sapn class="text-info">대기중</sapn></c:when>
							</c:choose>
						</td>
						<td><button type="button" class="form-control btn btn-danger deletBtn" data-booking-id="${list.id}">삭제</button><td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</section>
		
		<jsp:include page="footer.jsp"/>
		
		<script>
			$(document).ready(function(){
				$('.deletBtn').on('click',function(){
					let deleteBookingId = $(this).data('booking-id');
					$.ajax({
						//request
						type:'delete'
						,url:"/lesson06/delete_booking"
						,data:{"id":deleteBookingId}
						//response
						,success:function(data){
							if(data.code=="200"){
								//성공
								document.location.reload(true); 
							} else if (data.result == "500"){
								alert(data.error_message); 
							}
						}
						,errer:function(e){
							alert("삭제하는데 통신이 실패하였습니다"+e);
						}	
					});
				});
			});	
		
		
		</script>
		
	</div>	
</body>
</html>
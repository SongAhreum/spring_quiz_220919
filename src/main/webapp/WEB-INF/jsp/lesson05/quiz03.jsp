<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<title>fmt라이브러리 사용</title>
</head>
<body>
	<div class="container">
		<h1>1.후보자 득표율</h1>
		<table class="table">
			<thead>
				<tr>
					<th><b>기호</b></th>
					<th><b>득표 수</b></th>
					<th><b>득표율</b></th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="candidate" items="${candidates}" varStatus="status">
				<tr>
				
					<td>${status.count}</td>
					<td><fmt:formatNumber value="${candidate}" /></td>
					<td><fmt:formatNumber value="${candidate/totalCount}" type="percent" /> </td>
					
					<%-- 뷰만 나타내도록 나눠야하기때문에 이렇게 하지말자
					<td><fmt:formatNumber var="per" value="${candidate/1000000}" pattern="#.##"/> 
					<fmt:formatNumber value="${per}" type="percent"/>
					</td>
					--%>
				</tr>
			</c:forEach>	
			</tbody>
		</table>
		
		<h1>2.카드명세서</h1>
		<table class="table">
			<thead>
				<tr>
					<th><b>사용처</b></th>
					<th><b>가격</b></th>
					<th><b>사용 날짜</b></th>
					<th><b>할부</b></th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="cardBill" items="${cardBills}" >
				<tr>
				
					<td>${cardBill.store}</td>
					<td><fmt:formatNumber value="${cardBill.pay}" type="currency"/> </td>
					<td><fmt:parseDate var="date" value="${cardBill.date}" pattern="yyyy-MM-dd"/> 
						<fmt:formatDate value="${date}" pattern="yyyy년 MM월 dd일"/>
					</td>
					<td>${cardBill.installment}</td>
				
				</tr>
			</c:forEach>	
			</tbody>
		</table>
	</div>
</body>
</html>
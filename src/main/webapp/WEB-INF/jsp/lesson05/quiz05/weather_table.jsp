<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<section class="col-10 m-3">
				<div>
					<h1>과거날씨</h1>
					<table class="table text-center">
						<thead>
							<tr>
								<th><b>날짜</b></th>
								<th><b>날씨</b></th>
								<th><b>기온</b></th>
								<th><b>강수량</b></th>
								<th><b>미세먼지</b></th>
								<th><b>풍속</b></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="weather" items="${weatherHistoryList}">
							<tr>
								<td><fmt:formatDate value="${weather.date}" pattern="yyyy년 MM월 dd일"/></td>
								<td>
									<c:choose>
										<c:when test="${weather.weather eq '비'}">
											<img alt="비" src="/img/lesson05/rainy.jpg">
										</c:when>
										<c:when test="${weather.weather eq '흐림'}">
											<img alt="흐림" src="/img/lesson05/cloudy.jpg">
										</c:when>
										<c:when test="${weather.weather eq '구름조금'}">
											<img alt="구름조금" src="/img/lesson05/partlyCloudy.jpg">
										</c:when>
										<c:when test="${weather.weather eq '맑음'}">
											<img alt="맑음" src="/img/lesson05/sunny.jpg">
										</c:when>
										<c:otherwise>
											${weather.weather}
										</c:otherwise>
									</c:choose>
								</td>
								
								<td>${weather.temperatures}℃</td>
								<td>${weather.precipitation}mm</td>
								<td>${weather.microDust}</td>
								<td>${weather.windSpeed}km/h</td>
							</tr>
							</c:forEach> 
						</tbody>
					</table>
				</div>
			</section>
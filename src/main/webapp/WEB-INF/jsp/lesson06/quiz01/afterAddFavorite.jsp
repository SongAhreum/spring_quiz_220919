<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	
<title>결과페이지</title>
</head>
<body>
	<div class="container">
		<h1>즐겨 찾기 목록</h1>
		<table class="table text-center">
			<thead>
				<tr>
					<td><b>No.</b></td>
					<td><b>이름</b></td>
					<td><b>주소</b></td>
					<td></td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="favorite" items="${favoriteList}" varStatus="status">
				<tr>
					<td class="selectedId" style="display:none">${favorite.id}</td>
					<td>${status.count}</td>
					<td>${favorite.name}</td>
					<td>${favorite.url}</td>
					<td><button class="btn btn-danger deleteBtn">삭제</button></td>
					<%-- 1)name속성+value속성삭제 --%>
					<%-- 2)data를 이용해서 태그에 임시저장하기(무조건소문자+하이픈) --%>
					<%-- <td><button class="btn btn-danger deleteBtn" data-favoriteid="${favorite.id}">삭제</button></td>--%>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<script>
		$(document).ready(function(){
			$('.deleteBtn').on('click',function(){
								
				let deleteBtn = $(this);
				let tr = deleteBtn.parent().parent();
				let td = tr.children();
				
				console.log(tr.text());
				let selectedId = td.eq(0).text();
				
				//alert(selectedId);
				$.ajax({
					//request
					type:"get"
					,url:"/lesson06/quiz01/delet_favorite"
					,data:{"id":selectedId}
					//response
					,success:function(data){
						//alert('삭제하였습니다.');
						if(data.result){
							location.href="/lesson06/quiz01/after_add_favorite_view"
						}
					}
					,error:function(e){
						alert('실패'+e);
					}
					
				})		
			})
		})
		//학원풀이
		/*
		
		
		
			
		//<td><button name="delBtn" class="btn btn-danger" value="${favorite.id}">삭제</button></td>일때
		1)name속성+value속성삭제
		$(document).ready(function(){	
			$('delBtn=[name=delBtn]').on('click',function(){
				let id = $(this).val();
					//OR
				let id = $(this).attr('value');
					//OR
				let id = e.target.value; //$(document).ready(function(e){}로 하여야함
			}
			
		//<td><button class="btn btn-danger deleteBtn" data-favoriteid="${favorite.id}">삭제</button></td>
	  **2)data를 이용해서 태그에 임시저장하기(무조건소문자+하이픈)
		$(document).ready(function(){
			//태그: data-favorite-id data-뒤에 우리가 이름정함,대문자 절대안됨
			//스크립트: $(this).data('favorite-id'); 
			$('.deleteBtn').on('click',function(){			
				$.ajax({
					//request
					type:"delete"
					,url:"/lesson06/quiz01/delet_favorite"
					,data:{"id":id}
					//response
					,success:function(data){
						if(data.code == 1){
							//성공
							window.location.reload(ture); //새로고침 (window대신 document해도됨 스크롤이올라가서 리로드하자)
						}
					}
				
					,error:function(e){
						alert('실패'+e);
					}				
				})		
			
			});			
		});
		
		*/
	</script>
</body>
</html>
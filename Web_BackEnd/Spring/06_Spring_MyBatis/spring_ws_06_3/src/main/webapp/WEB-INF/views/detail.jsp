<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 상세보기</title>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div class="container">
		<h2>글 상세보기</h2>
		<hr>
		<div class="card">
			<div class="card-body">
				<h5 class="card-title">${book.title}</span></h5>
				<div class="d-flex justify-content-between">
					<div class="card-subtitle">${book.author}</div>
					<div class="card-subtitle">${book.price}</div>
				</div>
				<p class="card-text">${book.content}</p>
				<div>
					<a href="delete?isbn=${book.isbn}" class="btn btn-info">삭제</a> 
					<a href="updateform?isbn=${book.isbn}" class="btn btn-success">수정</a> 
					<a href="list" class="btn btn-warning">목록</a> 
				</div>
			</div>
		
		</div>
	</div>
</body>
</html>
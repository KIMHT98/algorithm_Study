<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div class="container">
		<h2>글수정</h2>
		<form action="update" method="POST">
			<input type="hidden" name="isbn" value="${book.isbn}">
			<div class="mb-3">
				<label for="title" class="form-label">제목</label>
				<input type="text" class="form-control" id="title" name="title" value="${book.title}">
			</div>
			<div class="mb-3">
				<label for="author" class="form-label">작가</label>
				<input type="text" class="form-control" id="author" name="author" readonly value="${book.author}">
			</div>
			<div class="mb-3">
				<label for="price" class="form-label">가격</label>
				<textarea class="form-control"  rows="10" cols="10" id="price" name="price">${book.price}</textarea>
			</div>
			<div class="mb-3">
				<label for="content" class="form-label">내용</label>
				<textarea class="form-control"  rows="10" cols="10" id="content" name="content">${book.content}</textarea>
			</div>
			<button class="btn btn-primary">수정</button>
		</form>
	</div>
</body>
</html>
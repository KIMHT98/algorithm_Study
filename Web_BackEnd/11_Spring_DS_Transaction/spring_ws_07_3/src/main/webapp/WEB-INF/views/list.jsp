<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%-- jstl의 core 라이브러리를 사용하기 위해 taglib를 이용한다. --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
form>label, form>select, form>input {
	margin-right: 10px !important;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div class="container">
		<h1>도서 목록</h1>

		<form method="get" action="${root }/list" id="searchForm" class="row">
			<div>
				<label>검색조건</label> <select name="key">
					<option value="none" selected="selected">없음</option>
					<option value="title">도서명</option>
					<option value="author">저자</option>
				</select> <input type="text" name="word"> <label>정렬조건</label> <select
					name="orderBy">
					<option value="none" selected="selected">없음</option>
					<option value="title">도서명</option>
					<option value="author">저자</option>
					<option value="price">가격</option>
				</select> <label>정렬방향</label> <select name="orderByDir">
					<option value="asc">오름차순</option>
					<option value="desc">내림차순</option>
				</select> <input type="submit" value="검색">
			</div>
		</form>
		<br>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>번호</th>
					<th>ISBN</th>
					<th>제목</th>
					<th>저자</th>
					<th>가격</th>
				</tr>
			</thead>
			<tbody>
				<%-- request 영역에 books로 등록된 자료를 반복문을 이용해 출력한다. --%>
				<c:forEach items="${books }" var="book" varStatus="vs">
					<tr>
						<td>${vs.count }</td>
						<td>${book.isbn }</td>
						<td>${book.title }</td>
						<td>${book.author }</td>
						<td>${book.price }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br> <a href="${root }/regist">도서 등록</a>
	</div>
	<footer style="width: 100%; display: flex; justify-content: center;">
		<%@ include file="/WEB-INF/views/include/paging.jsp"%>
	</footer>
</body>
</html>
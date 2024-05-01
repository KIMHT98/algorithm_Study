<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%-- jstl의 core 라이브러리를 사용하기 위해 taglib를 이용한다. --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#user-list {
	border-collapse: collapse;
	width: 100%;
}

#user-list td, #user-list th {
	border: 1px solid black;
}
</style>
</head>
<body>
<%--분리한 header.jsp 가져오기 --%>
	<h1>등록된 사용자 목록</h1>
	<%-- 사용자 수 등록되어있다면 출력하기 --%>
	<c:if test="${!empty requestScope.userCount }">
		<h2>지금까지 등록한 사용자 수 : ${requestScope.userCount} </h2>
	</c:if>
	<table id="user-list">
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
			<%-- request 영역에 등록된 자료를 반복문을 이용해 출력한다. 테이블의 구성은 위 thead 참고 --%>
			<c:forEach var="book" items="${books}" >
				<tr>
					<td>${book.id}</td>
					<td>${book.getIsbn()}</td>
					<td>${book.getTitle()}</td>
					<td>${book.getAuthor()}</td>
					<td>${book.getPrice()}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<a href="./index">홈으로</a>
	<a href="./regist">도서 등록</a>
</body>
</html>
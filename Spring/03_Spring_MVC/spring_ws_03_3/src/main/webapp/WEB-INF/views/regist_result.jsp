<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%-- jstl의 core 라이브러리를 사용하기 위해 taglib를 이용한다. --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 등록 결과</title>
</head>
<body>
	<h2>도서 등록 결과</h2>
	<table>
		<thead>
			<th>항목</th>
			<th>내용</th>
		</thead>
		<tbody>
			<tr>
				<td>도서번호</td>
				<td>${book.getIsbn() }</td>
			</tr>
			<tr>
				<td>도서명</td>
				<td>${book.getTitle() }</td>
			</tr>
			<tr>
				<td>저자</td>
				<td>${book.getAuthor() }</td>
			</tr>
			<tr>
				<td>가격</td>
				<td>${book.getPrice()}</td>
			</tr>
			<tr>
				<td>설명</td>
				<td>${book.getDesc() }</td>
			</tr>
		</tbody>
	</table>
	<a href="./regist.jsp">추가 등록</a>
	<a href="./list.jsp">추가 등록</a>
	
</body>
</html>
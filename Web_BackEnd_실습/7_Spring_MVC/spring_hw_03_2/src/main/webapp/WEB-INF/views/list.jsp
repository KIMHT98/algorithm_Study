<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SSAFY 사용자 관리</title>
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
	
	<table id="user-list">
		<thead>
			<tr>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>이메일</th>
				<th>나이</th>
			</tr>
		</thead>
		<tbody>
			<%-- request 영역에 등록된 자료를 반복문을 이용해 출력한다. 테이블의 구성은 위 thead 참고 --%>
			<c:forEach var="user" items="${users }" >
				<tr>
					<td>${user.id}</td>
					<td>${user.password}</td>
					<td>${user.name}</td>
					<td>${user.email}</td>
					<td>${user.age} 세</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<a href="./index">홈으로</a>
	<a href="./regist">추가등록</a>
</body>
</html>
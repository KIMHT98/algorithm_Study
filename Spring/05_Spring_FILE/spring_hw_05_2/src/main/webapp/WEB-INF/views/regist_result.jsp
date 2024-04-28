<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.ssafy.hw.model.dto.*"%>
<%-- jstl의 core 라이브러리를 사용하기 위해 taglib를 이용한다. --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 등록 결과</title>
<style>
img {
	width : 300px;
	height : 300px;
}
</style>
</head>
<body>
	<!-- 코드작성 -->
	<%@ include file="./include/header.jsp"%>
	<div class="container">
		<h1>사용자 등록 결과</h1>
		<h2>등록 사용자 정보</h2>
		<c:if test="${!empty user }">
		<table>
			<thead>
				<th>항목</th>
				<th>내용</th>
				<th>이미지</th>
			</thead>
			<tbody>
				<tr>
					<td>아이디</td>
					<td>${user.id }</td>
					<td rowspan="5"><img src="${pageContext.request.contextPath }/resources/upload/${user.img}"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>${user.password }</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>${user.name }</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>${user.email }</td>
				</tr>
				<tr>
					<td>나이</td>
					<td>${user.age }</td>
				</tr>
			</tbody>
		</table>
		</c:if>
		<a href="./regist">[추가등록]</a> <a href="./list">[목록보기]</a>
		
	</div>
</body>
</html>
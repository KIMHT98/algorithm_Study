<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.ssafy.ws.model.dto.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛집 리스트</title>
<style>
#restaurant-list {
	border-collapse: collapse;
	width: 100%;
}

#restaurant-list td, #restaurant-list th {
	border: 1px solid black;
}
</style>
</head>
<body>
	<%-- header.jsp를 include해서 재사용하기 --%>
	<%@ include file="../includes/header.jsp"%>
	<h1>맛집 목록</h1>
	<table id="restaurant-list">
		<thead>
			<tr>
				<th>맛집이름</th>
				<th>맛집주소</th>
				<th>시그니처메뉴</th>
				<th>별점</th>
			</tr>
		</thead>
		<tbody>
			<%-- request 영역에 restaurants로 등록된 자료를 반복문을 이용해 출력한다. --%>
			<c:forEach items="${resList }" var="restaurant" varStatus="vs">
				<tr>
					<td><a
						href="${pageContext.request.contextPath}/res/detail?resId=${restaurant.resId }">${restaurant.name }</a></td>
					<td>${restaurant.address }</td>
					<td>${restaurant.signatureMenu }</td>
					<td>${restaurant.rate }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div>
		<a href="${pageContext.request.contextPath}/res/regist">맛집등록</a>
	</div>
</body>
</html>
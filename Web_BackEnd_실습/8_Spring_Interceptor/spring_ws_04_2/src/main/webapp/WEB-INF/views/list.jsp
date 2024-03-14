<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%-- jstl의 core 라이브러리를 사용하기 위해 taglib를 이용한다. --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SSAFY 영화 관리</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div class="container">
		<h1>영화 목록</h1>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>번호</th>
					<th>자동차등록번호</th>
					<th>모델명</th>
					<th>색상</th>
					<th>주행 거리</th>
				</tr>
			</thead>
			<tbody>
				<%-- request 영역에 books로 등록된 자료를 반복문을 이용해 출력한다. --%>
				<c:forEach items="${movies }" var="movie" varStatus="vs">
					<tr>
						<td>${vs.count }</td>
						<td>${movie.title }</td>
						<td>${movie.director }</td>
						<td>${movie.genre }</td>
						<td>${movie.runningTime }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<br> <a href="${root }/regist">추가 등록</a>
	</div>
</body>
</html>
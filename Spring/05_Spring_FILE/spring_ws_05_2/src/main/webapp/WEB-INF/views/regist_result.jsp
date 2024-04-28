<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.ssafy.ws.model.dto.*"%>
<%-- jstl의 core 라이브러리를 사용하기 위해 taglib를 이용한다. --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 등록 결과</title>
<style>
table {
	border-collapse: collapse; /* 셀 사이의 간격을 없애기 위해 */
}

/* 테이블의 테두리 스타일 설정 */
table, th, td {
	border: 1px solid black; /* 모든 테이블 요소에 대해 테두리를 지정 */
}

/* 선택적으로 헤더 셀과 데이터 셀의 스타일을 따로 지정할 수 있습니다. */
th {
	background-color: #f2f2f2; /* 헤더 셀 배경색 */
	font-weight: bold; /* 헤더 셀 텍스트 굵게 */
}

td {
	padding: 8px; /* 셀 안의 내용과 테두리 사이의 간격 설정 */
}

/* 이미지 크기 조정을 위한 스타일 */
img {
	width: 300px;
	height: 300px;
}
</style>
</head>
<body>
	<!-- 코드작성 -->
	<%@ include file="./include/header.jsp"%>
	<div class="container">
		<h1>영화 등록 결과</h1>
		<c:if test="${!empty movie }">
			<table>
				<thead>
					<th>항목</th>
					<th>내용</th>
					<th></th>
				</thead>
				<tbody>
					<tr>
						<td>제목</td>
						<td>${movie.title }</td>
						<td rowspan="5"><img
							src="${pageContext.request.contextPath }/resources/upload/${movie.img}"></td>
					</tr>
					<tr>
						<td>감독</td>
						<td>${movie.director }</td>
					</tr>
					<tr>
						<td>장르</td>
						<td>${movie.genre}</td>
					</tr>
					<tr>
						<td>상영 시간</td>
						<td>${movie.runningTime}</td>
					</tr>
					<tr>
						<td>이미지</td>
						<td>${movie.orgImg}</td>
					</tr>
				</tbody>
			</table>
		</c:if>
		<a href="./regist">[추가등록]</a> <a href="./list">[목록보기]</a>
	</div>
</body>
</html>
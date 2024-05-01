<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 등록 결과</title>
<style>
table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	border: 1px solid black;
}

th:nth-child(1) {
	width: 120px;
}
</style>
</head>
<body>
	<h1>영화 등록 결과</h1>

	<h2>등록 영화 정보</h2>

		<table>
			<thead>
				<tr>
					<th>항목</th>
					<th>내용</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>영화 제목</td>
					<td>${movie.getTitle() }</td>
				</tr>
				<tr>
					<td>감독</td>
					<td>${movie.getDirector() }</td>
				</tr>
				<tr>
					<td>장르</td>
					<td>${movie.getGenre() }</td>
				</tr>
				<tr>
					<td>상영 시간</td>
					<td>${movie.getRunningTime() }</td>
				</tr>
			</tbody>
		</table>
	</c:if>

	<a href="./regist.jsp">추가등록</a>
</body>
</html>
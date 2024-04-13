<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SSAFY 영화 관리</title>
<style>
label {
	display: inline-block;
	width: 130px;
}
</style>
</head>
<body>
	<h1>영화 등록 결과</h1>
	<form action="regist" method = "POST">
		<fieldset>
			<legend>영화 입력 정보</legend>
			<label for="title">제목</label>
			<input type="text" name = "title" id="title"><br>
			<label for="director">감독</label>
			<input type="text" name = "director" id="director"><br>
			<label for="genre">장르</label>
			<input type="text" name = "genre" id="genre"><br>
			<label for="runningTime">상영 시간</label>
			<input type="number" name = "runningTime" id="runningTime"><br>
			<input type="submit" value="등록">
			<input type="reset" value="초기화">
		</fieldset>
	</form>

</body>
</html>
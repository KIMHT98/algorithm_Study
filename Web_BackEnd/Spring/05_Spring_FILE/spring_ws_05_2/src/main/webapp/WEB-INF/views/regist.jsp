<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SSAFY 영화 관리</title>
<style>
label {
	display: inline-block;
	width: 80px;
}

textarea {
	width: 100%;
}

.input-image {
	margin: 10px 0px 10px 0px;
}
</style>
</head>
<body>
	<%@ include file="include/header.jsp" %>
	<h1>SSAFY 영화 관리</h1>
	<form method="post" action="regist" enctype="multipart/form-data">
		<fieldset>
			<legend>영화 정보 입력</legend>
			<label for="title">제목</label>
			<input type="text" id="title" name="title"><br>
			<label for="director">감독</label>
			<input type="text" id="director" name="director"><br>
			<label for="genre">장르</label>
			<input type="text" id="genre" name="genre"><br>
			<label for="runningTime">상영 시간</label>
			<input type="number" id="runningTime" name="runningTime"><br>
			<div>
			<label for="file">이미지</label>
			<input type="file" id="file" name="file" class="input-image" accept="img/*">
			</div>
			<input type="submit" value="등록"> <input type="reset"
				value="초기화">
		</fieldset>
	</form>
</body>
</html>
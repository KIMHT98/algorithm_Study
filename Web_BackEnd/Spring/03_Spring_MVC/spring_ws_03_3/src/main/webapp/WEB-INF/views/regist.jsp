<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SSAFY 도서 관리</title>
<style>
label {
	display: inline-block;
	width: 80px;
}
</style>
</head>
<body>
	<form action="regist" method="POST">
		<fieldset>
			<legend>도서 등록</legend>
			<label for="isbn">도서 번호</label> <input type="text" name="isbn"
				id="isbn"><br> <label for="title">도서명</label> <input
				type="text" name="title" id="title"><br> <label
				for="author">저자명</label> <input type="text" name="author"
				id="author"><br> <label for="price">가격</label> <input
				type="text" name="price" id="price"><br> <label
				for="desc">설명</label><br>
			<textarea name="desc" id="desc" rows="5" cols="70"></textarea>
			<br> <input type="submit" value="등록"> <input
				type="reset" value="초기화">

		</fieldset>
	</form>
</body>
</html>
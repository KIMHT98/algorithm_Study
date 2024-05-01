<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<h1>회원가입</h1>
	<hr>
	${msg }
	<form action="#" method="post" enctype="multipart/form-data">
		아이디 : <input type="text" name="id"><br> 
		비밀번호 : <input type="password" name="pw"><br> 
		이름 : <input type="text" name="name"><br> 
		이메일 : <input type="email" name="email"><br> 
		전화번호 : <input type="tel" name="phone"><br> 
		프로필 이미지 : <input type="file" name="file"><br> 
		<input type="submit" value="회원가입">
	</form>
</body>
</html>
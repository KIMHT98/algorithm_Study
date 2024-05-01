<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 프로필</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp" %>

	<h1>사용자 프로필</h1>
	<form>
		<div>
			<label for="id">아이디</label> <input type="text" id="id" name="id"
				value="${user.id}" readonly>
		</div>
		<div>
			<label for="pw">비밀번호</label> <input type="password" id="pw" name="pw"
				value="${user.pw}">
		</div>
		<div>
			<label for="name">이름</label> 
			<input type="text" id="name" name="name"
				value="${user.name}">
		</div>
		<div>
			<label for="email">이메일</label> 
			<input type="email" id="email"
				name="email" value="${user.email}">
		</div>
		<div>
			<label for="phone">전화번호</label> 
			<input type="tel" id="phone"
				name="phone" value="${user.phone}">
		</div>
		<div>
		    <!--  리소스 경로를 사용하여 프로필 이미지를 불러온다. -->
			<img src="${pageContext.request.contextPath }/resources/profile/${user.profileImg}" alt="프로필 이미지">
		</div>
		<div>
			<label for="profileImg">프로필 이미지</label> 
			<input type="file"
				id="profileImg" name="profileImg">
		</div>
	</form>
	<a href="${root }">메인으로</a>
</body>
</html>
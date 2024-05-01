<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업로드 기능 테스트</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<h1>업로드 결과</h1>
	<p>업로드된 파일명 : ${fileName}</p>
	<p>
		다운로드 
		<a href="${root}/resources/upload/${fileName}">링크1</a>
		<a href="${root}/download?filename=${fileName}">링크2</a>
	</p>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>SSAFY 맛집관리 사이트</title>
</head>
<body>
	<%-- header.jsp를 include해서 재사용하기 --%>
	<%@ include file="./includes/header.jsp"%>
	<ul>
		<li><a href="${root }/res/list">맛집목록</a></li>
		<li><a href="${root }/res/regist">맛집등록</a></li>
	</ul>
</body>
</body>
</html>

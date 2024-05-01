<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SSAFY 맛집 관리</title>
<style>
	label{
		display: inline-block;
		width: 100px;
	}
	textarea{
		width: 100%;
	}
</style>
</head>
<body>
	<%-- header.jsp를 include해서 재사용하기 --%>
	<%@ include file="../includes/header.jsp"%>
	<h1>SSAFY 맛집 관리</h1>
	<form method="post" action="${root }/res/update">
		<fieldset>
		<legend>맛집 수정</legend>
		<input type="hidden" name="resId" value="${restaurant.resId }">
		<label for="name">맛집 이름</label>
		<input type="text" id="resName" name="resName" value="${restaurant.resName}"><br><br>
		<label for="address">맛집 주소<br>(지역)</label>
		<input type="text" id="address" name="address" value="${restaurant.address }"><br><br>
		<label for="signatureMenu">시그니쳐메뉴</label>
		<input type="text" id="signatureMenu" name="signatureMenu" value="${restaurant.signatureMenu }"><br><br>
		<label for="rate">별점</label>
		<input type="number" id="rate" name="rate" value="${restaurant.rate }"><br><br>
		<input type="submit" value="완료">
		<input type="reset" value="취소">
		</fieldset>
	</form>
</body>
</html>
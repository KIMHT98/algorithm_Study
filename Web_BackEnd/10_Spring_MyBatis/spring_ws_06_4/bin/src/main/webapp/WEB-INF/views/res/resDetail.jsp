<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.ssafy.ws.model.dto.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SSAFY 맛집관리 사이트</title>
<style>
	.res{
		border: 2px solid black;
		border-radius: 50px 50px 50px 50px;
	}
	.res > ul{
		list-style-type: none;
	}
	li span {
		border-bottom: 2px solid skyblue;
		padding-bottom: 10px;
	}
</style>
</head>
<body>
	<%-- header.jsp를 include해서 재사용하기 --%>
	<%@ include file="../includes/header.jsp"%>
	<div class="res">
		<ul>
			<li><h2><span>맛집 이름 : ${restaurant.getName() }</span></h2></li>
			<li><h4><span>맛집 주소 : ${restaurant.getAddress() }</span></h4></li>
			<li><h4><span>대표 메뉴 : ${restaurant.getSignatureMenu()}</span></h4></li>
			<li><h4>⭐${restaurant.getRate() }/10</h4></li>
			<li><a href="${pageContext.request.contextPath}/download?fileName=${restaurant.fileName}">첨부파일</a></li>
		</ul>
	</div>
	<hr>
		<button onclick="location.href='${pageContext.request.contextPath}/res/delete?resId=${restaurant.getResId()}'">삭제</button>
		<button onclick="location.href='${pageContext.request.contextPath}/res/update?resId=${restaurant.getResId()}'">수정</button>
		<button onclick="location.href='${pageContext.request.contextPath}/res/list'">맛집 목록</button>
	<hr>
	<h4>리뷰</h4>
	<c:if test="${empty reviews}">
		<h5>등록된 리뷰가 없습니다</h5>
	</c:if>
	<c:forEach items="${reviews}" var="review" varStatus="vs">
		<div>
			<h5>${review.content}  by ${review.writer}</h5>
			<input type="button" value="삭제"
				onclick="location.href='${pageContext.request.contextPath}/review/delete?reviewId=${review.reviewId}&resId=${restaurant.resId }'" />
		</div>
	</c:forEach>
	<form method="post"
		action="${pageContext.request.contextPath}/review/regist">
		<fieldset>
			<legend>리뷰 작성</legend>
			<table>
				<tr>
					<td><label for="writer">작성자</label></td>
					<td><input type="text" id="writer" name="writer"></td>
				</tr>
				<tr>
					<td><label for="content">내 용</label></td>
					<td><textarea cols="50" id="content" name="content"></textarea></td>
				</tr>
			</table>
			<input type="submit" value="등록">
		</fieldset>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.ssafy.hw.model.dto.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#nav-header {
	display: flex;
	justify-content: space-between;
}

.nav-search {
	width: 50%;
}

.nav-search span {
	margin-left: 10px;
	border: solid black 1px;
	padding: 5px;
}
</style>
<div id="nav-header">
	<%-- session에서 loginUser를 가져와서 존재 여부에 따라 로그인 폼 또는 사용자 정보를 출력한다. --%>
	<div class="nav-search">
		<form action="search" method="get">
			<!-- 검색 기능 목록 작성 -->
				<span>검색기준
				<select name="key">
					<option value="none" selected="selected">없음</option>
					<option value="id">아이디</option>
					<option value="name">이름</option>
				</select>
				</span>
				
				<span>검색기준
				<select name="orederBy">
					<option value="none" selected="selected">없음</option>
					<option value="id">아이디</option>
					<option value="name">이름</option>
				</select>
				</span>
				
				<span>정렬방향
				<select name="orderByDir">
					<option value="none" selected="selected">없음</option>
					<option value="asc">오름차순</option>
					<option value="desc">내림차순</option>
				</select>
				</span>
				
				<span>검색내용
				<input type="text" name="word">
				<input type="submit" value="검색">
				</span>
				
		</form>
	</div>
	<div class="nav-login">
		<c:if test="${empty loginUser }">
			<form method="post" action="login">
				<input type="text" name="id" placeholder="아이디"> <input
					type="password" name="password" placeholder="비밀번호"> <input
					type="submit" value="로그인">
			</form>
		</c:if>
		<c:if test="${!empty loginUser }">
			<div>
				${loginUser.name } 님 반갑습니다. <a href="./logout">로그아웃</a>
			</div>
		</c:if>
	</div>
</div>
<hr>
<script>
	// request 영역에 msg라는 이름의 attribute가 있다면 화면에 alert으로 출력한다.
	let msg = "${msg}";
	if (msg) {
		alert(msg)
	}
</script>
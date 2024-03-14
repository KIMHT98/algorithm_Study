<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.ssafy.hw.model.dto.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#user-info {
	text-align: right;
}
</style>
<div class="container">
	<div id="user-info">
		<c:if test="${empty loginUser}">
			<form method="POST" action="login">
				<div>
					<input type="text" name="id" placeholder="아이디"> <input
						type="password" name="password" placeholder="비밀번호"> <input
						type="submit" class="btn btn-primary" value="로그인">
				</div>
			</form>
		</c:if>
		<c:if test="${!empty loginUser }">
			<div>
				${loginUser.id }님 반갑습니다. <a href="logout">로그아웃</a>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%
		//세션 끊기
		//session.removeAttribute("userId");
		//세션에 대한 정보 모두 한 번에 끊기
		session.invalidate();
	%>
	<form action="login_result.jsp" method="post">
		<div>
			<label>아이디 : <input type="text" name="userId"></label>
		</div>
		<div>
			<label>패스워드 : <input type="password" name="pwd"></label>
		</div>
		<input type="submit" value="로그인">
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
</head>
<body>
	<form action="join_result.jsp" method="get">
		<div>아이디: <input type="text" name="userId"></div>
		<div>패스워드: <input type="password" name="userPwd"></div>
		<div>이름: <input type="text" name="userName"></div>
		<div>
			<label><input type="radio" name="userGender" value="M">남자</label>
			<label><input type="radio" name="userGender" value="F">여자</label>
		</div>
		<button type="submit">회원가입</button>
		<input type="submit" value="회원가입2">
	</form>
</body>
</html>
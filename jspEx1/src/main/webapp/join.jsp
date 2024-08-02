<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
</head>
<body>
	<form action="join_result.jsp" method="get" name="login">
		<div>아이디: <input type="text" name="userId"></div>
		<div>패스워드: <input type="password" name="userPwd"></div>
		<div>이름: <input type="text" name="userName"></div>
		<div>
			<label><input type="radio" name="userGender" value="M">남자</label>
			<label><input type="radio" name="userGender" value="F">여자</label>
		</div>
		<div>
			<label>
				<input type="checkbox" value="coding" name="hobby">코딩
			</label>
			<label>
				<input type="checkbox" value="game" name="hobby">게임
			</label>
			<label>
				<input type="checkbox" value="soccer" name="hobby">축구
			</label>
		</div>
		<!-- <button onclick="fnJoin()">회원가입</button> -->
		<input type="button" value="회원가입2" onclick="fnJoin()">
	</form>
</body>
</html>
<script>
	function fnJoin(){
		var form = document.login;
		if(form.userId.value == "" || form.userId.value == undefined) {
			alert("아이디를 입력하세요.");
			form.userId.focus();
			return;
		}
		form.submit();
	}
</script>
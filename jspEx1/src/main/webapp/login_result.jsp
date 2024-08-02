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
		String id = request.getParameter("userId");
		String pwd = request.getParameter("userPwd");
		
		if(id.equals("test") && pwd.equals("1234")) {
			out.println("로그인 성공!");
		} else {
			out.println("로그인 실패!");
		}
	%>
</body>
</html>
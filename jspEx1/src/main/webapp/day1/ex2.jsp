<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%!
		int i = 0;
		String name = "홍길동";
	%>
	<!-- html 주석(웹 화면에 나옴) -->
	<%-- jsp 주석(웹 화면에 안나옴) --%>
	<%
		for(i = 1; i <= 10; i++){
			/* System.out.println(i); */
			out.println("<h2>" + i + "</h2>");
		}
	%>
	<h1><%= name %></h1>
</body>
</html>
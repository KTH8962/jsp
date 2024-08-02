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
		String id = request.getParameter("userName");
		String[] hobby = request.getParameterValues("hobby");
		/* out.println(id + "님 환영합니다."); */
		for(String h : hobby) {
			out.println(h + "<br>");	
		}
		/* for(int i=0; i < hobby.length; i++) {
			out.println(hobby[i]);
		} */
	%>
	<p><%= id + "님 환영합니다." %></p>
</body>
</html>
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
		int sum(int x, int y){
			return x+y;
		}
		void message(){
			System.out.println("안녕");
		}
	%>

	<%
		int a = sum(2,3); // a = 5;	
		out.println(a);
		message();
	%>
</body>
</html>
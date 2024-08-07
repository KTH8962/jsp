<%@page import="java.util.List"%>
<%@page import="java.lang.reflect.AccessFlag.Location"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%@include file="db.jsp"%>
	<%
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		out.println(title + contents);
		
		Statement stmt = null; // 오라클에 접속해 쿼리를 호출할 객체
		String userId = (String) session.getAttribute("userId");
		
		try{
			stmt = conn.createStatement();
			String querytext = 
					/* "INSERT INTO TBL_BOARD (title, contents, cnt, userId, kind, cdatetime, udatetime) VALUES('" + title + "','" + contents + "', 0, 'user1', 'number', NOW(), NOW())"; */
					"INSERT INTO TBL_BOARD VALUES(NULL, '" + title + "','" + contents + "', 0, '" + userId + "', 'number', NOW(), NOW())";
			stmt.executeUpdate(querytext);
			out.println("저장되었습니다.");
			
			response.sendRedirect("list2.jsp");
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>
</body>
</html>
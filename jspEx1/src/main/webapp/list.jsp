<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		table, tr, th, td {
			border: 1px solid black;
			border-collapse: collapse;
			padding: 10px;
		}
	</style>
</head>
<body>
	<%@include file="db.jsp"%>	
	<%
		ResultSet rs = null; // 결과물을 받을 객체
		Statement stmt = null; // 오라클에 접속해 쿼리를 호출할 객체
		
		try{
			stmt = conn.createStatement();
			/* String querytext = "select * from student"; */
			rs = stmt.executeQuery("SELECT * FROM STUDENT");
			
			out.println("<table><tr><th>선택</th><th>이름</th><th>학번</th></tr>");
			while (rs.next()) {				
				out.println("<tr><td><input type='radio' name='ra' id=" + rs.getString("stu_no") + "></td><td>" + rs.getString("stu_name") + "</td><td>" + rs.getString("stu_no") + "</td></tr>"); 
			}
			out.println("</table>");
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="db.jsp"%>	
	<%
		ResultSet rs = null; // 결과물을 받을 객체
		Statement stmt = null; // 오라클에 접속해 쿼리를 호출할 객체
		String stuNo = request.getParameter("stuNo");
		
		try{
			stmt = conn.createStatement();
			/* String querytext = "select * from student"; */
			rs = stmt.executeQuery("SELECT * FROM STUDENT WHERE STU_NO = '" + stuNo + "'");
			
			if(rs.next()) {
				out.println("학번 : " + rs.getString("STU_NO") + ", 이름 : " + rs.getString("STU_NAME") + ", 학과 : " + rs.getString("STU_DEPT") + ", 성별 : " + rs.getString("STU_GENDER"));
			} else {
				out.println("해당 학생이 존재하지 않습니다.");
			}
	
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>
</body>
</html>
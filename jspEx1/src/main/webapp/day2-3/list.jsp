<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			/* String querytext = "select * from tbl_board"; */
			rs = stmt.executeQuery("SELECT * FROM TBL_BOARD");
			
			out.println("<table><tr><th>번호</th><th>제목</th><th>작성자</th><th>조회수</th><th>작성일</th></tr>");
			while (rs.next()) {
				String cdate = rs.getString("cdatetime");
				cdate = cdate.substring(0, cdate.indexOf("."));
				out.println("<tr><td>" + rs.getString("boardNo") + "</td><td>" + rs.getString("title") + "</td><td>" + rs.getString("userId") + "</td><td>" + rs.getString("cnt") + "</td><td>" + cdate + "</td></tr>"); 
			}
			out.println("</table>");
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>
</body>
</html>
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
		Statement stmt = null;
		String userId = (String) session.getAttribute("userId");
		String boardNo = request.getParameter("boardNo");
		String comment = request.getParameter("comment");
		try{
			stmt = conn.createStatement();
			String querytext = "INSERT INTO TBL_COMMENT VALUES(NULL, " + boardNo + ", '" + userId + "', '" + comment + "', NULL, NOW(), NOW())";
			stmt.executeUpdate(querytext);
			response.sendRedirect("board-view.jsp?boardNo=" + boardNo);
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>

</body>
</html>
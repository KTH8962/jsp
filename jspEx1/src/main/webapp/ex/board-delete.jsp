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
		String boardNo = request.getParameter("boardNo");
		try{
			stmt = conn.createStatement();
			String querytext = "DELETE FROM TBL_BOARD_EX WHERE boardNo = " + boardNo;
			stmt.executeUpdate(querytext);
			response.sendRedirect("board-list.jsp");
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>
</body>
</html>
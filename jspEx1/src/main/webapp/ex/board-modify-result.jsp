<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		div + div {
			margin-top: 5px;
		}
		div label > * {
			vertical-align: top;
		}
	</style>
</head>
<body>
	<%@include file="db.jsp"%>	
	<%
		String boardNo = null;
		Statement stmt = null;
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		stmt = conn.createStatement();
		String querytext = "";
		try{
			boardNo = request.getParameter("boardNo");
			if(boardNo != null){				
				querytext = "UPDATE TBL_BOARD_EX SET title = '" + title + "', contents = '" + contents + "' WHERE boardNo = " + boardNo;
			} else {
				querytext = "INSERT INTO TBL_BOARD_EX VALUES(NULL, '" + title + "', '" + contents + "', 0, '" + session.getAttribute("userId") + "', 'number', NOW(), NOW())";				
			}
			stmt.executeUpdate(querytext);
			response.sendRedirect("board-list.jsp");
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>
	<div><label>제목 : <input type="text" value="<%= title %>"></label></div>
	<div><label>내용 : <textarea rows="10" cols="50"><%= contents %></textarea></label></div>
	<div><button type="submit">저장</button></div>
	
</body>
</html>
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
	<form action="board-modify-result.jsp">
		<%@include file="db.jsp"%>	
		<%
			String boardNo = "";
			ResultSet rs = null;
			Statement stmt = null;
			String title = "";
			String contents = "";
			if(boardNo != null){
				try{
					boardNo = request.getParameter("boardNo");
					stmt = conn.createStatement();
					String querytext = "SELECT * FROM TBL_BOARD_EX WHERE boardNo = " + boardNo;
					rs = stmt.executeQuery(querytext);
					if(rs.next()){
						title = rs.getString("title");
						contents = rs.getString("contents");
					}
				} catch(SQLException ex) {
					out.println("SQLException : " + ex.getMessage());
				}
			}
		%>
		<%
			if(boardNo != null){
		%>
			<input type="hidden" name="boardNo" value= <%= boardNo %>>
		<%
			}
		%>
		<div><label>제목 : <input type="text" name="title" value="<%= title %>"></label></div>
		<div><label>내용 : <textarea rows="10" name="contents" cols="50"><%= contents %></textarea></label></div>
		<div><button type="submit">저장</button></div>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<style>
		table, th,  tr,  td {
			border : 1px solid black ;
			border-collapse: collapse;
			padding: 10px;
		}
		a {
			text-decoration: none;
			color: inherit;
			font-weight: bold;
		}
	</style>

</head>
<body>
	<%@include file="db.jsp"%>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>작성일</th>
		</tr>
	<%
		ResultSet rs = null;
		Statement stmt = null;
		
		try{
			stmt = conn.createStatement();
			String querytext = "SELECT * FROM TBL_BOARD_EX";
			rs = stmt.executeQuery(querytext);
			while(rs.next()){
	%>
			<tr>
				<td><%= rs.getString("boardNo") %></td>
				<td><a href="javascript:fnView(<%= rs.getString("boardNo") %>)"><%= rs.getString("title") %></a></td>
				<td><%= rs.getString("userId") %></td>
				<td><%= rs.getString("cnt") %></td>
				<td><%= rs.getString("cdatetime") %></td>
			</tr>	
	<%
			}
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>
	</table>
	<div>
		<button type="button" onclick="location.href='board-modify.jsp'">글쓰기</button>
	</div>
</body>
</html>

<script type="text/javascript">
	function fnView(boardNo) {
		location.href = "board-view.jsp?boardNo=" + boardNo;
	}

</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	table, th,  tr,  td{
	 border : 1px solid black ;
	 border-collapse: collapse;
	 padding: 10px;
	}
	a {
		text-decoration: none;
		color: inherit;
	}
</style>

</head>
<body>
	<div><button type="button" onclick="location.href='login.jsp'">로그아웃</button></div>
	<%@include file="db.jsp"%>	
	<%
	ResultSet rs = null;
	Statement stmt = null;
	/* System.out.println(session.getAttribute("userId")); */
	try{
		stmt = conn.createStatement();
		String querytext = 
				"SELECT B.*, U.*, COM_CNT FROM TBL_BOARD B INNER JOIN TBL_USER U ON B.userId = U.userID "
						+ "LEFT JOIN (SELECT boardNo, COUNT(*) AS COM_CNT FROM TBL_COMMENT GROUP BY boardNo) CNT ON B.boardNo = CNT.boardNo";
		rs = stmt.executeQuery(querytext);
	%>
		<table>
		<tr>
			<th> 번호 </th>
			<th> 제목 </th>
			<th> 작성자 </th>
			<th> 조회수 </th>
			<th> 작성일 </th>
		</tr>			
	<%
	while (rs.next()) {
	%>
		<tr>
			<td> <%= rs.getString("B.boardNo") %></td>
			<td>
				<a href="javascript:fnView(<%= rs.getString("B.boardNo") %>)">
					<%= rs.getString("title") %>
					<% if(rs.getString("COM_CNT") != null) {%>
						(<%= rs.getString("COM_CNT") %>)
					<%}%>
				</a>
			</td>
			<td> <%= rs.getString("name") %></td>
			<td> <%= rs.getString("cnt") %></td>
			<td> <%= rs.getString("cdatetime") %></td>
		</tr>
	<%
	}
	%>
	
	</table>
	<button type="button" onclick="location.href='insert.jsp'">글쓰기</button>
	<%
	} catch(SQLException ex) {
		out.println("SQLException : " + ex.getMessage());
	}
	%>

</body>
</html>
<script>
	function fnView(boardNo) {
		location.href="board-view.jsp?boardNo=" + boardNo;
	}
</script>
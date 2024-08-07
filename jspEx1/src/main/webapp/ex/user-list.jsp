<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	</style>
</head>
<body>
	<div><button type="button" onclick="location.href='board-list.jsp'">리스트 페이지</button></div>
	<table>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>권한</th>
			<th>비밀번호</th>
		</tr>
	<%@include file="db.jsp"%>	
	<%
		ResultSet rs = null;
		Statement stmt = null;
		
		try{
			stmt = conn.createStatement();
			String querytext = "SELECT * FROM TBL_USER_EX";
			rs = stmt.executeQuery(querytext);
			while(rs.next()){
				String status = rs.getString("status").equals("A") ? "관리자" : "일반회원";
	%>
		<tr>
			<td><%= rs.getString("userId") %></td>
			<td><%= rs.getString("name") %></td>
			<td><%= status %></td>
			<td>
				<% if(rs.getInt("cnt") >= 5){ %>
				<button type="button" onclick="fnReset('<%= rs.getString("userId") %>')">초기화</button>
				<% } %>
			</td>
		</tr>
	<%
			}
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>
	</table>
</body>
</html>
<script>
	function fnReset(userId) {
		//location.href = "user-reset.jsp?userId=" + userId;
		window.open("user-reset.jsp?userId=" + userId, "reset", "width=500, height=500");		
	}
	function fnRelaod() {
		location.reload();
	}
</script>
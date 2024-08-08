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
	
</style>

</head>
<body>
	<table>
		<tr>
			<th>분류번호</th>
			<th>수업명</th>
			<th>시작일</th>
			<th>종료일</th>
			<th>시작시간</th>
			<th>종료시간</th>
		</tr>
	<%@include file="db.jsp"%>	
	<%
		ResultSet rs = null;
		Statement stmt = null;
		
		try{
			stmt = conn.createStatement();
			String querytext = "SELECT * FROM TEST_TIME";
			rs = stmt.executeQuery(querytext);
			while(rs.next()){
	%>
	
		<tr>
			<td><%= rs.getInt("class_id") %></td>
			<td><%= rs.getString("name") %></td>
			<td><%= rs.getString("start_day") %></td>
			<td><%= rs.getString("end_day") %></td>
			<td><%= rs.getString("start_time") %></td>
			<td><%= rs.getString("end_time") %></td>
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
​
<%@page import="java.awt.Checkbox"%>
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
	div + div {
		margin-top : 5px;
	}
	div label > * {
		vertical-align: top;
	}

</style>

</head>
<body>
	<form action="board-update-result.jsp">	
		<%@include file="db.jsp"%>	
		<%
			ResultSet rs = null;
			Statement stmt = null;
			String boardNo = request.getParameter("boardNo");
		%>
		<%
			try{
				stmt = conn.createStatement();
				String querytext = "SELECT * FROM TBL_BOARD WHERE boardNo = " + boardNo;
				rs = stmt.executeQuery(querytext);
				if(rs.next()){
		%>
		<div><input type="hidden" name="boardNo" value="<%= rs.getString("boardNo") %>"></div>
		<div><label>제목 : <input type="text" name="title" value="<%= rs.getString("title") %>"></label></div>
		<div><label>내용 : <textarea rows="10" cols="50" name="contents"><%= rs.getString("contents") %></textarea></label></div>
		<div><button type="submit">저장</button></div>
		<%
			}
		} catch(SQLException ex) {
				out.println("SQLException : " + ex.getMessage());
			}
		%>
	</form>
</body>
</html>
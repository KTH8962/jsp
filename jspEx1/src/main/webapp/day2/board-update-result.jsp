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

}
	
</style>

</head>
<body>
	<%@include file="db.jsp"%>	
	<%
		Statement stmt = null;
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		String boardNo = request.getParameter("boardNo");
		try{
			stmt = conn.createStatement();
			String querytext = "UPDATE TBL_BOARD SET title = '"+ title +"', contents = '"+ contents +"' WHERE boardNo = " + boardNo;
			stmt.executeUpdate(querytext);
		
			response.sendRedirect("list2.jsp");
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>

</body>
</html>
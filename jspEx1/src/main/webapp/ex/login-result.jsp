<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%@include file="db.jsp"%>	
	<%
		ResultSet rs = null;
		Statement stmt = null;
		String id = request.getParameter("userId");
		String pwd = request.getParameter("userPwd");
		
		try{
			stmt = conn.createStatement();
			String querytext = "SELECT * FROM tbl_user_ex WHERE userId = '" + id + "' AND pwd = '" + pwd + "'";
			rs = stmt.executeQuery(querytext);
			
			if(rs.next()) {
				session.setAttribute("userId", rs.getString("userId"));
				response.sendRedirect("board-list.jsp");
			} else {
				out.println("<script>alert('아이디 및 비밀번호를 확인해주세요'); history.go(-1);</script>");
			}
		
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>

</body>
</html>
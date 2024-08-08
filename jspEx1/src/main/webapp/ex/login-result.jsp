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
	<%!
		String cntQeury(String type, String id){
			if(type.equals("success")) {
				return "UPDATE tbl_user_ex SET cnt = 0 WHERE userId = '" + id + "'";
			} else if (type.equals("fail")) {
				return "UPDATE tbl_user_ex SET cnt = cnt + 1 WHERE userId = '" + id + "'";
			}
			return null;
		}
	%>
	<%@include file="db.jsp"%>	
	<%
		ResultSet rs = null;
		Statement stmt = null;
		String id = request.getParameter("userId");
		String pwd = request.getParameter("userPwd");
		
		try{
			stmt = conn.createStatement();
			String querytext = "SELECT * FROM tbl_user_ex WHERE userId = '" + id + "'";
			rs = stmt.executeQuery(querytext);
			
			if(rs.next()) {
				if(rs.getInt("cnt") >= 5) {
					out.println("<script>alert('관리자에게 문의해주세요.'); history.go(-1);</script>");
				} else if(rs.getString("pwd").equals(pwd)) {
					String status = (String) rs.getString("status");
					session.setAttribute("userId", rs.getString("userId"));
					session.setAttribute("status", rs.getString("status"));
					String queryCnt = cntQeury("success", id);
					stmt.executeUpdate(queryCnt);
					if(status.equals("A")) {
						response.sendRedirect("user-list.jsp");
					} else {
						response.sendRedirect("board-list.jsp");
					}
				} else {
					String queryCnt = cntQeury("fail", id);
					stmt.executeUpdate(queryCnt);
					out.println("비밀번호를 확인해주세요.");
	%>
					<div>
						<button type="button" onclick="location.href='login.jsp'">로그인 페이지로 이동</button>
					</div>
	<%
				}
			} else {
				out.println("<script>alert('아이디 및 비밀번호를 확인해주세요'); history.go(-1);</script>");
			}
		
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>

</body>
</html>
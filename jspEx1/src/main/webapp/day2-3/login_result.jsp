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
	<%!
		String cntQuery(String type, String id){
			if(type.equals("success")) {
				return "UPDATE TBL_USER SET cnt = 0 WHERE userId = '" + id + "'";
			} else if(type.equals("fail")) {
				return "UPDATE TBL_USER SET cnt = cnt+1 WHERE userId = '" + id + "'";
			}
			return null;
		}
	%>
	<%
		ResultSet rs = null;
		Statement stmt = null;
		String id = request.getParameter("userId");
		String pwd = request.getParameter("pwd");
		
		try{
			stmt = conn.createStatement();
			/* String querytext = "SELECT * FROM TBL_USER WHERE userId = '" + id + "' AND pwd = '" + pwd + "'"; */
			String querytext = "SELECT * FROM TBL_USER WHERE userId = '" + id + "'";
			rs = stmt.executeQuery(querytext);
			if(rs.next()){
				// 5번 이상 실패
				String status = rs.getString("status");
				if(rs.getInt("cnt") >= 5){
					out.println("<script>alert('관리자에게 문의해주세요'); history.go(-1);</script>");
				} else if (rs.getString("pwd").equals(pwd)){					
					session.setAttribute("userId", rs.getString("userId"));
					session.setAttribute("status", rs.getString("status"));
					String cntQuery = cntQuery("success", id);
					stmt.executeUpdate(cntQuery);
					if(status.equals("A")) {
						response.sendRedirect("user-list.jsp");
					} else {
						response.sendRedirect("list2.jsp");
					}
				} else {
					String cntQuery = cntQuery("fail", id); 	
					stmt.executeUpdate(cntQuery);
					out.println("비밀번호를 확인해주세요");								
	%>
				<div><button type="button" onclick="location.href='login.jsp'">로그인으로 이동</button></div>
	<%
				}
				// 버튼 추가 -> login.jsp로 이동
			} else {
				out.println("<script>alert('존재하지 않는 아이디입니다.'); history.go(-1);</script>");
			}
		
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>

</body>
</html>
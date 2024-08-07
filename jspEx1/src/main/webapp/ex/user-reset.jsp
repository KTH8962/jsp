<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="db.jsp"%>	
	<%
		Statement stmt = null;
		String userId = request.getParameter("userId");
		try{
			stmt = conn.createStatement();
			String querytext = "UPDATE TBL_USER_EX SET cnt = 0 WHERE userId = '" + userId + "'";
			stmt.executeUpdate(querytext);
		
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>
</body>
</html>
<script>
	alert("초기화 되었습니다.");
	window.close();
	window.opener.fnRelaod();
</script>
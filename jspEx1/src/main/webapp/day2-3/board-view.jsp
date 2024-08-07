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
	.comment {
		width: 330px; height: 20px;
		padding: 5px; margin: 10px 0;
	}
	
</style>

</head>
<body>
	<form action="" name="form">
		<%@include file="db.jsp"%>
		<%
			ResultSet rs = null;
			Statement stmt = null;
			
			String boardNo = request.getParameter("boardNo");
			try{
				stmt = conn.createStatement();
				String querytext = "SELECT * FROM TBL_BOARD WHERE boardNo =" + boardNo;
				rs = stmt.executeQuery(querytext);
				if(rs.next()) {
		%>
			<input type="hidden" name="boardNo" value="<%= rs.getString("boardNo") %>">
			<div>제목 : <%= rs.getString("title") %></div>
			<div>내용 : <%= rs.getString("contents") %></div>
			<hr>
			<div>
				댓글 : <input type="text" name="comment" placeholder="댓글을 입력하세요" class="comment">
				<button type="button" onclick="fnComment()">등록</button>	
			</div>
			<hr>
			<%
				String querytexts = "SELECT * FROM TBL_COMMENT C INNER JOIN TBL_USER U ON C.userId = U.userId WHERE boardNo =" + boardNo;
				rs = stmt.executeQuery(querytexts);
			
				while(rs.next()){
			%>		
				<div>
					
					<span><%= rs.getString("name") %></span><small>(<%= rs.getString("cdatetime") %>)</small> : <span><%= rs.getString("comment") %></span>
					<%-- <div><input type="text" name="comment" placeholder="댓글을 입력하세요" class="comment"><button type="button" onclick="fnComment(<%= rs.getString("commentNo") %>)">등록</button></div> --%>
				</div>
			<%}%>
		<%
			String sessionId = (String) session.getAttribute("userId");
			String sessionStatus = (String) session.getAttribute("status");
			
			if(sessionStatus.equals("A") || rs.getString("userId").equals(sessionId)){
		%>
			<button type="submit" onclick="fnFunc('D')">삭제</button>
			<button type="submit" onclick="fnFunc('U')">수정</button>
		<%		
			}
				} else {
					out.println("삭제된 게시글 입니다.");
				}
			} catch(SQLException ex) {
				out.println("SQLException : " + ex.getMessage());
			}
		%>
	</form>
</body>
</html>

<script>
	function fnFunc(type) {
		var form = document.form;
		if(type == "D") {
			form.action = "board-delete.jsp";
		} else if(type == "U") {
			form.action = "board-update.jsp";
		}
		form.submit();
	}
	
	function fnComment() {
		var form = document.form;
		form.action = "board-comment.jsp";
		form.submit();
	}
</script>
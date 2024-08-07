<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<form name="form">
	
		<%@include file="db.jsp"%>	
		<%
			ResultSet rs = null;
			Statement stmt = null;
			String boardNo = request.getParameter("boardNo");
			
			try{
				stmt = conn.createStatement();
				String querytext = "SELECT * FROM TBL_BOARD_EX WHERE boardNo = " + boardNo;
				rs = stmt.executeQuery(querytext);
				if(rs.next()){
		%>
			<input type="hidden" name="boardNo" value="<%= rs.getString("boardNo") %>">
			<div>제목 : <%= rs.getString("title") %></div>
			<div>내용 : <%= rs.getString("contents") %></div>
			<hr>
			<div>
				<input type="text" name="comment" placeholder="댓글을 등록하세요.">
				<button type="button" onclick="fnComment()">등록</button>
			</div>
			<hr>
		<%
			String queryComment = "SELECT * FROM TBL_COMMENT_EX";
			rs = stmt.executeQuery(queryComment);
			while(rs.next()) {			
		%>
			<div>
				<span><%= rs.getString("userId") %><small>(<%= rs.getString("cdatetime") %>)</small></span> : <span><%= rs.getString("comment") %></span>
			</div>
		<%
			}
			String userId = (String) session.getAttribute("userId");
			String status = (String) session.getAttribute("status");
			if(status.equals("A") || rs.getString("userId").equals(userId)) {
		%>
			<div>
				<button type="submit" onclick="fnModify('U')">수정</button>
				<button type="submit" onclick="fnModify('D')">삭제</button>
			</div>
		<%
			}
				} else {
					out.println("게시글이 없습니다.");
				}
			
			} catch(SQLException ex) {
				out.println("SQLException : " + ex.getMessage());
			}
		%>
	</form>
</body>
</html>
<script type="text/javascript">
	function fnModify(type) {
		if(type == "U"){
			form.action = "board-modify.jsp";
		} else if(type == "D") {
			form.action = "board-delete.jsp";
		}
		
		<%-- form.action = "board-modify.jsp?type=" + type + "&boardNo=" + <%= rs.getString("boardNo") %>; --%>
	}
	function fnComment() {
		var form = document.form;
		location.href = "board-comment.jsp?&boardNo=" + form.boardNo.value + "&comment=" + form.comment.value;
	}
</script>
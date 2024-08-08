<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
table, th, tr, td {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 10px;
}
</style>

</head>
<body>
	<div><button type="button" onclick="location.href='list2.jsp'">게시판으로 이동</button></div>
	<%@include file="db.jsp"%>	
	<sql:query var="result" dataSource="${dataSource}">
        SELECT * FROM TBL_USER
    </sql:query>
    
    <table>
        <tr>
            <th>아이디</th>
			<th>이름</th>
			<th>권한</th>
			<th>비밀번호</th>
        </tr>
        <c:forEach var="row" items="${result.rows}">
            <tr>
                <td>${row.userId}</td>
                <td>${row.name}</td>
                <td>
                	<c:choose>
                		<c:when test="${row.status == 'A'}">관리자</c:when>
                		<c:otherwise>일반회원</c:otherwise>
                	</c:choose>
                	<%-- <c:if test="${row.status == 'A'}">관리자</c:if>
                	<c:if test="${row.status == 'C'}">일반회원</c:if> --%>
                </td>
                <td>
                	<c:if test="${row.cnt >= 5}">
                		<button type="button" onclick="fnReset('${row.userId}')">초기화</button>
                	</c:if>
                </td>
            </tr>
        </c:forEach>
    </table>
    
    
		<%-- <tr>
			<td><%= rs.getString("userId") %></td>
			<td><%= rs.getString("name") %></td>
			<td><%= status %></td>
			<td>
				<%if(rs.getInt("cnt") >= 5) {%>
					<button type="button" onclick="fnReset('<%= rs.getString("userId") %>')">초기화</button>
				<%}%>
			</td>
		</tr> --%>
</body>
</html>

<script>
	function fnReset(userId) {
		/* location.href="user-reset.jsp?userId=" + userId; */
		window.open("user-reset.jsp?userId=" + userId, "reset", "width=500, height=500");
	}
	function fnRelaod() {
		location.reload();
	}
</script>
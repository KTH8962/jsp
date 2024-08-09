<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    a:visited, a:link {
        color: black;
        text-decoration: none;
        font-weight: bold;
    }
</style>

</head>
<body>
    <div><button onclick="location.href='login.jsp'">로그아웃</button></div>
    <table>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>조회수</th>
            <th>작성일</th>
        </tr>
        <c:forEach var="row" items="${boardList}">
            <tr>
                <td>${row.boardNo}</td>
                <td>
                    <a href="#" onclick="fnView('${row.boardNo}')">
                    	${row.title}
                    	<c:if test="${row.cmtCnt != null}">(${row.cmtCnt})</c:if>
                    </a>
                </td>
                <td>${row.name}</td>
                <td>${row.cnt}</td>
                <td>${row.cdatetime}</td>
            </tr>
        </c:forEach>
    </table>

    <button onclick="location.href='insert.jsp'">글쓰기</button>

</body>
</html>

<script>
    function fnView(boardNo){
        location.href="board-view.jsp?boardNo="+boardNo;
    }
</script>
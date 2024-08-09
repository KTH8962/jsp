<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>스크립 틀릿: <%= request.getParameter("userName") %></p>
<p>EL: ${param.userName}</p>
<p>1: ${user.name}</p>
<p>2: ${user.getName()}</p>
    <c:choose>
        <c:when test="${user != null}">
            <p>하이! ${user.name}</p>
        </c:when>
        <c:otherwise>
            <p>없음</p>
        </c:otherwise>
    </c:choose>
</body>
</html>
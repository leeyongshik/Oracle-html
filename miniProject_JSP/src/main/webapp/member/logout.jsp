<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
 	//session.removeAttribute("memName");
 	session.invalidate(); // 모든 세션 없애기 - 무효화
 %>
 로그아웃
 <br>
 <input type="button" value="메인페이지" onclick="location.href='../index.jsp'">
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
//전역변수, 1번만 처리된다.
String name = "홍길동";
int age = 25;
%>
<%
//스크립트릿,요청시 마다 호출된다.
age++;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Hello JSP!! <br> -->

<%-- 안녕하세요 JSP!!<br> --%>

나의 이름은 name 입니다.<br>

나의 이름은 <%= name %> 입니다.<br>

나의 이름은 <% out.print(name); %> 입니다.<br>

<!-- 내 나이는 <%= age %> 입니다.<br> -->
<%-- 내 나이는 <%= age %> 입니다.<br> --%>
</body>
</html>
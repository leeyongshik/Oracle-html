<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 포함 후 컴파일 ( 변수명이 동일 할 경우 에러 발생  -->
<h3>** include directive **</h3>
<%@ include file="today.jsp" %>
 
<!-- 각 파일에서 컴파일 후 합치기( 변수명이 동일해도 진행가능) -->
<h3>** include JSP tag **</h3>
<jsp:include page="image.jsp"></jsp:include><br>
 
<% String name =  "홍길동";%>
main.jsp의 name = <%= name %>
</body>
</html>
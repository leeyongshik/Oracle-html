<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 @import url("../css/css.css");
</style>
</head>
<body>
<div id="header">
<jsp:include page="../main/header.jsp"></jsp:include>
</div>


아이디 : <input type="text"  placeholder="아이디 입력"> <br>
비밀번호 : <input type="text" placeholder="비밀번호 입력">
<br><br>
<input type="button" value="로그인">
<input type="button" value="회원가입" onClick="location.href='./member_1.jsp'">

</body>
</html>
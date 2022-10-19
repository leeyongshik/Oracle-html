<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="member.bean.MemberDTO"%>
<%@page import="member.dao.MemberDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 로그인 성공 여부</title>
</head>
<body>
		<%
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		
		//DB
		MemberDAO memberDAO = MemberDAO.getInstance(); // 싱글톤
		String name = memberDAO.memberLogin(id, pwd);
		 %>
		

		
		<% 
		if(name == null){%>
			아이디 또는 비밀번호가 틀렸습니다.
		<%}else {%>
			<%= name %>님 로그인에 성공하셨습니다.
			
		<%}%>
</body>
</html>
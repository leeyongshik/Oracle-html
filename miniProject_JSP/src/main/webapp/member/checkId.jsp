<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.dao.MemberDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="checkId.jsp" method="get">
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
MemberDAO memberDAO = MemberDAO.getInstance();
boolean exist = memberDAO.isExistId(id);  
%> 

<% if(exist) { %>
<%= id %> 는 사용 불가능
<br>
<input type="text" name = "id">
<input type="submit" value="중복체크">
<% }else { %>
<%= id %> 는 사용 가능
<br>
<input type="button" value="사용하기" onclick="checkIdClose('<%= id %>')">
<%} %>
</form>

<script type="text/javascript">
	
	function checkIdClose(id) {
		
		opener.writeForm.id.value=id;
		opener.writeForm.check.value=id;
		opener.writeForm.pwd.focus();
		window.close();
		
	}
	
</script>
</body>
</html>
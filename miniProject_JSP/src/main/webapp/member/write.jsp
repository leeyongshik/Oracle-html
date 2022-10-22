<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.bean.MemberDTO"%>
<%@page import="member.dao.MemberDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 성공 여부</title>
</head>
<body>
	<% request.setCharacterEncoding("utf-8"); %>
	<%
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String gender = request.getParameter("gender");
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String zipcode = request.getParameter("zipcode");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		
		//DB
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setName(name);
		memberDTO.setId(id);
		memberDTO.setPwd(pwd);
		memberDTO.setGender(gender);
		memberDTO.setTel1(tel1);
		memberDTO.setTel2(tel2);
		memberDTO.setTel3(tel3);
		memberDTO.setEmail1(email1);
		memberDTO.setEmail2(email2);
		memberDTO.setZipcode(zipcode);
		memberDTO.setAddr1(addr1);
		memberDTO.setAddr2(addr2);
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		int su = memberDAO.memberWrite(memberDTO);
		
	%>
		<%-- <%if(su ==1){%>
			회원가입 성공
		<%}	else { %>
			회원가입 실패
		<%} %> --%>
		
		<%if(su==1){ %>
		<script type="text/javascript">
		window.onload = function(){
			alert("회원가입 성공");
			location.href = 'loginForm.jsp';
		}
		</script>
		<%}else { %>
		<script type="text/javascript">
		window.onload = function(){
			alert("회원가입 실패");
			location.href = 'writeForm.jsp';
		}
		</script>
		<%} %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@page import="member.dao.MemberDAO"%>
<%@page import="member.bean.MemberDTO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.net.URLEncoder"%>
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
		MemberDAO memberDAO = MemberDAO.getInstance();// 싱글톤
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pwd",pwd);
		
		MemberDTO memberDTO = memberDAO.memberLogin(map);
		
		 %>
		

		//페이지 이동
 		<% 
		if(memberDTO != null){
			//response.sendRedirect("loginOk.jsp?name=" + URLEncoder.encode(name,"UTF-8"));
			//세션
			//HttpSession session = request.getSession(); // 세션 생성
			session.setAttribute("memId", memberDTO.getId());
			session.setAttribute("memName", memberDTO.getName());
			session.setAttribute("memEmail", memberDTO.getEmail1() + "@" + memberDTO.getEmail2());
			//페이지 이동
			response.sendRedirect("loginOk.jsp");
			//페이지 이동 
		}else {
			response.sendRedirect("loginFail.jsp");
		}%>  
</body>
</html>
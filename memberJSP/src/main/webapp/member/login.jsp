<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@page import="member.dao.MemberDAO"%>
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
		
		String name = memberDAO.memberLogin(map);
		 %>
		

		//페이지 이동
		<% 
		if(name == null){
			//페이지 이동 
			response.sendRedirect("loginFail.jsp");
		}else {
			//response.sendRedirect("loginOk.jsp?name=" + URLEncoder.encode(name,"UTF-8"));
			//세션
			//HttpSession session = request.getSession(); // 세션 생성
			
			//session.setAttribute("memName", name);
			
			//쿠키
			Cookie cookie = new Cookie("memName", name);
			cookie.setMaxAge(30 * 60 );//초 -> 30분
			response.addCookie(cookie);//클라이언트에게 보내기
			
			//쿠키
			Cookie cookie2 = new Cookie("memId", id);
			cookie2.setMaxAge(30*60);//초
			response.addCookie(cookie2);//클라이언트에게 보내기
			
			//페이지 이동
			response.sendRedirect("loginOk.jsp");
			
		}%> 
</body>
</html>
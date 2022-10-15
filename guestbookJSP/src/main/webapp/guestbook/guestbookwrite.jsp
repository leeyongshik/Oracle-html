<%@page import="javax.security.auth.Subject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="guestbook.bean.GuestbookDTO"%>
<%@page import="guestbook.dao.GuestbookDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>
<% String name = request.getParameter("name"); %>
<% String email = request.getParameter("email"); %>
<% String homepage = request.getParameter("homepage"); %>
<% String subject = request.getParameter("subject"); %>
<% String content = request.getParameter("content"); %>

<% GuestbookDTO guestbookDTO = new GuestbookDTO(); %>
<% guestbookDTO.setName(name); %>
<% guestbookDTO.setEmail(email); %>
<% guestbookDTO.setHomepage(homepage); %>
<% guestbookDTO.setSubject(subject); %>
<% guestbookDTO.setContent(content); %>

<% GuestbookDAO guestbookDAO = GuestbookDAO.getInstance(); %>
<% int su = guestbookDAO.guestbookWrite(guestbookDTO); %>

<% response.setContentType("text/html;charset=UTF-8");%>

<table>
	<tr>
		<td width="200px;" align="center">
			<% if(su==1)
				out.print("작성하신 글을 저장하였습니다."); 
			else
				out.print("실패");%>
		</td>
	</tr>
	<tr>
		<td width="200px;" align="center">
			<input type="button" value="글 목록" onclick="location.href='guestbookList.jsp';"/>
		</td>
	</tr>
</table>
</body>
</html>
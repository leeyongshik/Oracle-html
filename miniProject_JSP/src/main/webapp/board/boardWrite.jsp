<%@page import="board.dao.BoardDAO"%>
<%@page import="board.bean.BoardDTO"%>
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
request.setCharacterEncoding("utf-8");
String subject = request.getParameter("subject"); 
String content = request.getParameter("content");
String id = (String)session.getAttribute("memId");
String name = (String)session.getAttribute("memName");
String email = (String)session.getAttribute("memEmail");

BoardDTO boardDTO = new BoardDTO();
boardDTO.setId(id);
boardDTO.setName(name);
boardDTO.setEmail(email);
boardDTO.setSubject(subject);
boardDTO.setContent(content);



BoardDAO boardDAO = BoardDAO.getInstance();
int su = boardDAO.write(boardDTO);

if(su==1) out.print("작성하신 글을 저장하였습니다.");
else out.print("실패");
%>
<br>
<input type="button" value="메인페이지" onclick="location.href='../index.jsp'">
</body>
</html>
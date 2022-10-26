<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.bean.BoardDTO"%>
<%@page import="board.dao.BoardDAO"%>
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
boardDAO.write(boardDTO);

%>
<script type="text/javascript">
	window.onload=function(){
		
		alert("작성하신 글을 저장하였습니다.")
		location.href = "boardList.jsp?pg=1";
	}
</script>
</body>
</html>
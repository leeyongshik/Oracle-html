<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>메인화면</h3>
<hr>
<h5>
<a href="http://localhost:8080/miniProject_JSP/member/writeForm.jsp">회원가입</a><br>
<a href="http://localhost:8080/miniProject_JSP/member/loginForm.jsp">로그인</a><br>
<a href="http://localhost:8080/miniProject_JSP/member/logout.jsp">로그아웃</a><br>
<a href="http://localhost:8080/miniProject_JSP/board/boardWriteForm.jsp">글쓰기</a><br>
<a href="http://localhost:8080/miniProject_JSP/board/boardList.jsp">목록</a><br>
</h5>
</body>
</html>
<!-- 
1. 세션이 있을떄
	로그아웃 글쓰기 목록 뜬다.
	
   세션이 없을때 
   회원가입 로그인 목록 뜬다.
   
2. 세션 등록  - 로그인 성공하면
   memId
   memName
   memEmail => ~~@~~.com
   
3. 글쓰기
   Folder : board
   File : boardWriteForm.jsp
   	      boardWrite.jsp
   
   Package : board.dao
   Class : BoardDAO.java
   		   boardMapper.xml
   Package : board.bean
             BoardDTO.java -->
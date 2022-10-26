
<%@page import="board.bean.BoardDTO"%>
<%@page import="board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% int seq = Integer.parseInt(request.getParameter("seq")); 

BoardDAO boardDAO = BoardDAO.getInstance();
boardDAO.boardcount(seq);
BoardDTO boardDTO = boardDAO.boardListOne(seq);

int totalA = boardDAO.getTotalA() +1;//총글수
int totalPage = (totalA +4) /5;
int pg=0;

for(int i = 1; i <= totalPage; i++){
	if(seq<=totalA && seq>totalA-5) {
		pg=i; 
		break;
	}
	totalA = totalA-5;
}
%>


<table border="1">
	<tr>
				<td width="100px" align="center">작성자 / 아이디</td>
				<td width="150px" align="center"><%=boardDTO.getName() %> / <%=boardDTO.getId() %></td>
				<td width="100px" align="center">작성일 / 번호</td>
				<td width="200px" align="center"> <%=boardDTO.getLogtime()%> / <%=boardDTO.getSeq() %> </td>
			</tr>
			
			<tr>
				<td align="center">이메일</td>
				<td colspan="3"><%=boardDTO.getEmail() %></td>
			</tr>
			
			<tr>
				<td align="center">제목</td>
				<td colspan="3"><%=boardDTO.getSubject() %></td>
			</tr>
			
			<tr>
				<td colspan="4" height="150px" valign="top">
					<pre style="white-space: pre-wrap;"><%=boardDTO.getContent() %></pre>
				</td>
			</tr>
			<tr>
				<td>조회수</td>
				<td colspan="3"><%= boardDTO.getHit() %></td>
			</tr>

</table>
	<br>
	
	<input type="button" value="이전페이지" onclick="location.href='boardList.jsp?pg=<%= pg %>';">

	<br><br>
</body>
</html>
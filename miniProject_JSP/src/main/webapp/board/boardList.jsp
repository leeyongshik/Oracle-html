<%@page import="java.util.List"%>
<%@page import="board.bean.BoardDTO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
	border : 1px solid black;
	border-collapse : collapse;
	}
	#currentPaging{
		color : red;
		text-decoration: underline;
		font-size: 15pt;
	}
	#paging{
		color : black;
		text-decoration: none;
		font-size: 15pt;
	}
</style>
</head>
<body>
	<h1 align="left">글목록</h1>
	<input type="button" value="메인페이지" onclick="location.href='../index.jsp'">
	<br><br>
	<% 
	int pg = Integer.parseInt(request.getParameter("pg"));
	
	//페이징 처리 -1페이지당 3개씩
	int endNum = pg*5;
	int startNum = endNum -4;
	
	
	BoardDAO boardDAO = BoardDAO.getInstance();
	
	Map<String, Integer> map = new HashMap<String, Integer>();
	map.put("startNum", startNum);
	map.put("endNum", endNum);
	
	List<BoardDTO> list = boardDAO.boardList(map); 
	
	int totalA = boardDAO.getTotalA();//총글수
	int totalPage = (totalA +4) /5;
	 %>
	
<% if(list !=null) { %>
		<table border="1" style="align-self: center;">
			<tr>
				<td width = "100px" align="center">글번호</td>
				<td width = "350px" align="center">제목</td>
				<td width = "100px" align="center">작성자</td>
				<td width = "120px" align="center">작성일</td>
				<td width = "80px" align="center">조회수</td>
			</tr>
		
		<%
		for(int i=0; i<list.size();i++){
		%>
			<tr>
				<td align="center"><%=list.get(i).getSeq()%></td>
				<td ><a href="boardcount.jsp?seq=<%=list.get(i).getSeq()%>"><%=list.get(i).getSubject()%></a></td>
				<td align="center"><%=list.get(i).getId()%></td>
				<td align="center"><%=list.get(i).getLogtime()%> </td>
				<td align="center"><%=list.get(i).getHit()%> </td>
			</tr>
			
			
	
		
		<%
		}
		%>
		

<% } %>
			<tr>
				<td colspan="5" align="center">
					<!-- 페이지 번호 -->
					<% for ( int i = 1; i <= totalPage; i++){ %>
						<% if(i == pg) {  %>
							<a id="currentPaging" href="boardList.jsp?pg=<%=i %>"><%= i %></a>
						 <% }else { %>
						 	<a id="paging" href="boardList.jsp?pg=<%=i %>"><%= i %></a>
						<% } %>
					<% } %>
				</td>
			</tr>
		</table>
		<br>
		<br>
</body>
</html>
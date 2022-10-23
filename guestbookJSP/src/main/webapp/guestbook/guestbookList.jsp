<%@page import="javax.naming.ldap.HasControls"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="guestbook.dao.GuestbookDAO"%>
<%@page import="guestbook.bean.GuestbookDTO"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글목록</title>
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
	<% 
	int pg = Integer.parseInt(request.getParameter("pg"));
	
	//페이징 처리 -1페이지당 3개씩
	int endNum = pg*3;
	int startNum = endNum -2;
	
	
	GuestbookDAO guestbookDAO = GuestbookDAO.getInstance();
	
	Map<String, Integer> map = new HashMap<String, Integer>();
	map.put("startNum", startNum);
	map.put("endNum", endNum);
	
	ArrayList<GuestbookDTO> list = guestbookDAO.guestbookList(map); 
	
	int totalA = guestbookDAO.getTotalA();//총글수
	int totalPage = (totalA +2) /3;
	 %>
	
<% if(list !=null) { %>
	
		<%
		for(int i=0; i<list.size();i++){
		%>
		<div align="center">
		<table border="1" style="align-self: center;">
			<tr>
				<td width="100px" align="center">작성자</td>
				<td width="150px" align="center"><%=list.get(i).getName()%></td>
				<td width="100px" align="center">작성일 / 번호</td>
				<td width="150px" align="center"><%=list.get(i).getLogtime()%> / <%=list.get(i).getSeq()%> </td>
			</tr>
			
			<tr>
				<td align="center">이메일</td>
				<td colspan="3"><%=list.get(i).getEmail()%></td>
			</tr>
			
			<tr>
				<td align="center">홈페이지</td>
				<td colspan="3"><%=list.get(i).getHomepage()%></td>
			</tr>
			
			<tr>
				<td align="center">제목</td>
				<td colspan="3"><%=list.get(i).getSubject()%></td>
			</tr>
			
			<tr>
				<td colspan="4" height="150px" valign="top">
					<pre style="white-space: pre-wrap;"><%=list.get(i).getContent()%></pre>
				</td>
			</tr>
			
	
		</table>
		<br>
		<hr>
		<br>
		
		<%
		}
		%>

<% } %>
<!-- 페이지 번호 -->
<% for ( int i = 1; i <= totalPage; i++){ %>
	<% if(i == pg) {  %>
		<a id="currentPaging" href="guestbookList.jsp?pg=<%=i %>"><%= i %></a>
	 <% }else { %>
	 	<a id="paging" href="guestbookList.jsp?pg=<%=i %>"><%= i %></a>
	<% } %>
<% } %>
		</div>
</body>
</html>
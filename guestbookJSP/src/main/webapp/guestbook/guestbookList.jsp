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
</style>
</head>
<body>
<h1 align="left">글목록</h1>
<% 
ArrayList<GuestbookDTO> list = new ArrayList<GuestbookDTO>();
GuestbookDAO guestbookDAO = GuestbookDAO.getInstance();
list =  guestbookDAO.guestbookList();


	for(int i=0; i<list.size();i++){
%>
	<div align="left">
	<table border="1" style="align-self: center">
		<tr>
			<td width="100px" align="center">작성자</td>
			<td width="150px" align="center"><%=list.get(i).getName()%></td>
			<td width="100px" align="center">작성일 / 번호</td>
			<td width="150px" align="center"><%=list.get(i).getLogtime()%> / <%=list.get(i).getKey()%> </td>
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
			<td colspan="4" height="150px" valign="top"><%=list.get(i).getContent()%></td>
		</tr>
		

	</table>
	</div>
	<br>
	<hr>
	<br>
<%
	}
%>




</body>
</html>
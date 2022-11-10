<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 @import url("../css/css.css");
</style>
</head>
<body>
<div id="header">
<jsp:include page="../main/header.jsp"></jsp:include>
</div>
		<table border="1" cellpadding="5" frame="hsides" rules="rows" id="boardListTable">
			
			<tr>
				<td width = "100px" align="center">글번호</td>
				<td width = "350px" align="center">제목</td>
				<td width = "100px" align="center">작성자</td>
				<td width = "80px" align="center">조회수</td>
				<td width = "120px" align="center">작성일</td>
			</tr>
			<tr>
				<td width = "100px" align="center">글번호</td>
				<td width = "350px" align="center">제목</td>
				<td width = "100px" align="center">작성자</td>
				<td width = "80px" align="center">조회수</td>
				<td width = "120px" align="center">작성일</td>
			</tr>
			<tr>
				<td width = "100px" align="center">글번호</td>
				<td width = "350px" align="center">제목</td>
				<td width = "100px" align="center">작성자</td>
				<td width = "80px" align="center">조회수</td>
				<td width = "120px" align="center">작성일</td>
			</tr>
			<tr>
				<td width = "100px" align="center">글번호</td>
				<td width = "350px" align="center">제목</td>
				<td width = "100px" align="center">작성자</td>
				<td width = "80px" align="center">조회수</td>
				<td width = "120px" align="center">작성일</td>
			</tr>
			<tr>
				<td width = "100px" align="center">글번호</td>
				<td width = "350px" align="center">제목</td>
				<td width = "100px" align="center">작성자</td>
				<td width = "80px" align="center">조회수</td>
				<td width = "120px" align="center">작성일</td>
			</tr>
			
			
			<!-- 동적처리 -->
			
			
			
		</table>
		<input type="button" value="글쓰기">

</body>
</html>
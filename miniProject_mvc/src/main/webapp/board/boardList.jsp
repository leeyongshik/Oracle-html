<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		border: 1px solid blue;
		padding: 2px 8px;
		margin: 5px;
		color : red;
		text-decoration: underline;
		cursor: pointer;
		font-size: 15pt;
	}
	#paging{
		cursor: pointer;
		padding : 2px 8px;
		margin : 5px;
		color : black;
		text-decoration: none;
		font-size: 15pt;
	}
 	.subjectA{
		color: black;
		text-decoration: none;
	}
	.subjectA:hover{
		color: green;
		text-decoration: underline;
		cursor: pointer;
	} 
	#pagingDiv{
		width: 800px; 
		text-align: center;
		margin-top: 10px;
	}
	#mainpage{
		float: left;
		margin-top: 5px;
	}
</style>
</head>
<body>
	
	
	<h3 align="left">글목록</h3>
	<input type="hidden" id="pg" value="${pg}">
	<input type="hidden" id="id" value="${id}">
		<table border="1" cellpadding="5" frame="hsides" rules="rows" id="boardListTable">
			
			<tr>
				<td width = "100px" align="center">글번호</td>
				<td width = "350px" align="center">제목</td>
				<td width = "100px" align="center">작성자</td>
				<td width = "80px" align="center">조회수</td>
				<td width = "120px" align="center">작성일</td>
			</tr>
			
			<!-- 동적처리 -->
			
			
			
		</table>
		
		<input type="button" value="메인페이지" id="mainpage" onclick="location.href='../index.jsp'">
		 <div id ="pagingDiv"></div>
	<script type="text/javascript">
		function boardPaging(pg) {location.href="boardList.do?pg=" + pg;}
		
		function isLogin(id,seq,pg){ 
			

			if(id=="null"){ 
				alert("로그인이 필요한 항목입니다."); 
				location.href="../member/loginForm.do";
			}
			else{
				/* const urlParameter = window.location.search;
				console.log(urlParameter); */
				location.href="boardView.do?pg="+pg+"&seq="+seq;
			}
		}  
		
	</script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
	<script type="text/javascript" src="../js/boardList.js"></script>
</body>
</html>
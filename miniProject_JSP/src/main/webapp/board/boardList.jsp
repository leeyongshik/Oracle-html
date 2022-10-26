<%@page import="board.bean.BoardPaging"%>
<%@page import="java.util.List"%>
<%@page import="board.bean.BoardDTO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

	BoardPaging boardPaging = new BoardPaging();
	boardPaging.setCurrentPage(pg);
	boardPaging.setPageBlock(3);
	boardPaging.setPageSize(5);
	boardPaging.setTotalA(totalA);

	boardPaging.makePagingHTML();

	 %>
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
		margin: 2px;
		color : red;
		text-decoration: underline;
		cursor: pointer;
	}
	#paging{
		cursor: pointer;
		padding : 2px 8px;
		margin : 2px;
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
	} 
	#pagingDiv{
		/* border: 1px solid red;  */
		width: 800px; 
		text-align: center;
	}
	#mainpage{
		float: left;
		margin-top: 5px;
	}
</style>
</head>
<body>
	<h1 align="left">글목록</h1>
	<hr>
	
<% if(list !=null) { %>
		<table border="1" cellpadding="5" frame="hsides" rules="rows">
			
			<tr>
				<td width = "100px" align="center">글번호</td>
				<td width = "350px" align="center">제목</td>
				<td width = "100px" align="center">작성자</td>
				<td width = "80px" align="center">조회수</td>
				<td width = "120px" align="center">작성일</td>
			</tr>
		
		<%
		
		for(int i=0; i<list.size();i++){
		%>
		<tr>
				<td align="center"><%=list.get(i).getSeq()%></td>
				<td ><a class="subjectA" onclick="isLogin('<%=list.get(i).getSeq()%>')"><%=list.get(i).getSubject()%></a></td>
				<td align="center"><%=list.get(i).getId()%></td>
				<td align="center"><%=list.get(i).getHit()%> </td>
				<td align="center"><%=list.get(i).getLogtime()%> </td>
			</tr>
		<% } %>
<% } %>
		</table>
		
		<input type="button" value="메인페이지" id="mainpage" onclick="location.href='../index.jsp'">
		<div id ="pagingDiv"><%=boardPaging.getPagingHTML() %></div>
		
	<script type="text/javascript">
		function boardPaging(pg) {location.href="boardList.jsp?pg=" + pg;}
		
		function isLogin(seq){ 
	         var id = '<%=(String)session.getAttribute("memId")%>';

	          if(id=="null"){ 
	             alert("로그인이 필요한 항목입니다."); 
	          }
	          else{
	        	  
	      			const urlParameter = window.location.search;
	      			console.log(urlParameter);
	      			location.href="boardcount.jsp" + urlParameter + "&seq="+seq;
	      		
	          }
	    }  
		
	</script>
</body>
</html>
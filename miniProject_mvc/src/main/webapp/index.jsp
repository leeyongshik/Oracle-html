<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
 body {
   margin: 0;
   padding: 0;
   height: 100%;
   width: auto;
} 
#wrap{
	margin: 0 auto;
	padding: 0;
	width: 1100px;
	height: 100%
}
#header {
   width: 1100px;
   height: 10%;
   text-align: center;
   
}

#container {
   margin: auto;
   width: 1100px;
   height: 500px;
}

#container:after {
   content: '';
   display: block;
   clear: both;
   float: none;
}

#nav {
   margin-left: 10px;
   /* width: 400px; */
   width: 250px;
   height: 100%;
   float: left;
}

#section {
   width: 70%;
   height: 100%;
   float: left;
}

#footer {
   width: 1100px;
   height: 10%;
}
</style>
</head>
<body>
<div id="wrap">
	<div id="header">
		<h1>
			<img src="/miniProject_mvc/img/naver.png" width="100" height="40" alt="로고" style="cursor: pointer;" onclick="location.href='/miniProject_mvc/index.jsp'"/> MVC를 이용한 미니 프로젝트
		</h1>
		<jsp:include page="./main/menu.jsp"/>
	</div>
	
	
	
	<div id="container">
		<div id="nav" align="center">
			<jsp:include page="./main/nav.jsp"/>
		</div>
		
		<div id="section">
			<c:if test="${empty display }">
			<h1>
				홈페이지를 방문해주셔서 감사합니다.<br>
				Have a nice day!!<br>
				<img alt="검은고양이" src="./img/white.gif">
			</h1>
			</c:if>
			
			<c:if test="${!empty display }">
				<jsp:include page="#{display}"/>
			</c:if>
		</div>
	</div>
	
	
	
	<div id="footer">
	
	</div>
</div>

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
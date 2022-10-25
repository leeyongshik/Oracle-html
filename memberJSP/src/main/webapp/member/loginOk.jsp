<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 
	//세션
	//String name = request.getParameter("name"); 
	//String name = (String)session.getAttribute("memName");
	
	//쿠키
	String name = null;
	String id=null;
	
	//특정 쿠키를 얻을 수 없으므로 모든 쿠키를 다 가져온다.
	Cookie[] ar = request.getCookies();
	if( ar != null){
	 	for(int i = 0; i<ar.length; i++){
	 		
	 		String cookieName = ar[i].getName();//쿠키명
	 		String cookieValue = ar[i].getValue();//쿠키값
	 		
	 		System.out.println("쿠키명 = " + cookieName);
	 		System.out.println("쿠키 = " + cookieValue);
	 		System.out.println();
	 		
	 		if(cookieName.equals("memName")) name= cookieValue;
	 		if(cookieName.equals("memId")) id= cookieValue;
	 		
	 	}
		
	}
	
%>

<%= name %>님 로그인에 성공하셨습니다.
<br>
<input type="button" value="로그아웃" onclick="location.href='logout.jsp'">
</body>
</html>
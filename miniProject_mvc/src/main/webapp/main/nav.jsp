<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>

	<c:if test="${memId == null }">
	<img alt="로그인" src="/miniProject_mvc/img/login.png" width="230" height="50" style="cursor: pointer;" onclick="location.href='/miniProject_mvc/member/loginForm.do'"><br>
	<!-- <input type="button" value="로그인" onclick="location.href='/miniProject_mvc/member/loginForm.do'"> -->
	<br>
	<a href="/miniProject_mvc/member/writeForm.do">회원가입</a>
	</c:if>
	
	<c:if test="${memId !=null }">
		<h3><a href="/miniProject_mvc/member/updateForm.do">${memName}</a>님 로그인</h3>
		<input type="button" value="로그아웃" id="logoutBtn">
	</c:if>
	
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
	
	<script type="text/javascript">
	$('#logoutBtn').click(function(){
		$.ajax({
			url : '/miniProject_mvc/member/logout.do',
			type : 'post',
			success : function(){
				alert("로그아웃");
		 		location.href="/miniProject_mvc/index.jsp";
			},
			error: function(err){
				console.log(err);
			}
		});
	});
	
	</script>
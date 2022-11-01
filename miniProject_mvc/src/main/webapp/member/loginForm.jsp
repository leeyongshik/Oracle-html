<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<style type="text/css">
	form[name="loginForm"] table{
		border : 1px solid black;
		border-collapse : collapse;
	}
	form[name="loginForm"] Div{
	color : red;
	font-size : 8pt;
	font-weight : bold;
	margin-left:10px;
	}
</style>
</head>
<body>
	<h1>로그인</h1>
	<form action="/mvcMember/member/login.do" name="loginForm" id="loginForm" method="post">
		<table border="1" cellpadding="5">
			<tr >
				<td width="100" align="center">아이디</td>
				<td width="200"> 
					<input type="text" name="id" id="id" style="width : 150px;"/>
					<div id="idDiv"></div>
			</tr>
			<tr>
				<td align="center">비밀번호</td>
				<td>
					<input type="password" name="pwd" id="pwd" style="width : 200px;"/>
					<div id="pwdDiv"></div>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="로그인" onclick="checkLogin()"/>
					<input type="button" value="회원가입" onClick="location.href='writeForm.do';"/>
				</td>
			</tr>
		</table>
		
	</form>
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
	<script type="text/javascript">
	$('#id').focusout(function(){
		if($('#id').val() == '') {
			$('#idDiv').text('아이디를 입력하세요.');
		}
	});
		
	$('#pwd').focusout(function(){
		if($('#pwd').val() == '') {
			$('#pwdDiv').text('비밀번호를 입력하세요.');
		}
	});

	
	</script>
</body>
</html>
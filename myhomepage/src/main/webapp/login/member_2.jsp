<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="writeForm" id="writeForm">
		<table border ="1" width="500" cellpadding="10">
			<tr>
				<td width="100" align="center">이름</td>
				<td>
					<input type="text" name="name" id="name" placeholder="이름 입력"/>
					<div id="nameDiv"></div>
				</td>
			</tr>
			<tr>
				<td width="100" align="center">아이디</td>
				<td>
					<input type="text" name="id" id="id" placeholder="아이디 입력"/>
					<input type="text" name="check" id="check">
					<div id="idDiv"></div>
				</td>
			</tr>
			<tr>
				<td width="100" align="center">비밀번호</td>
				<td>
					<input type="password" name="pwd" id="pwd"/>
					<div id="pwdDiv"></div>
				</td>
			</tr>
			<tr>
				<td width="100" align="center">재확인</td>
				<td>
					<input type="password" id="repwd"/>
					<div id="repwdDiv"></div>
				</td>
			</tr>
			<tr>
				<td width="100" align="center">성별</td>
				<td>
					<input type="radio" name="gender"  value="0" checked/>남
					<input type="radio" name="gender"  value="1" />여
				</td>
			</tr>
			<tr>
				<td width="100" align="center">핸드폰</td>
				<td>
					<select name="tel1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="019">019</option>
					</select>
					-
					<input type="tel" name="tel2" maxlength="4" style="width:50px;"/>
					-
					<input type="tel" name="tel3" maxlength="4" style="width:50px;"/>
				</td>
			</tr>
			<tr>
				<td align="center">이메일</td>
				<td>
					<input type="text" name="email1"/> @ 
					<input type="text" name="email2" list="email2" placeholder="직접입력"/>
					<datalist id=email2>
						<option value="gmail.com">gmail.com</option>
						<option value="naver.com">naver.com</option>
						<option value="daum.com">daum.com</option>
					</datalist>
					
<!-- 					<select id="email3" name="email3" onchange="change()">
						<option value="">직접입력</option>
						<option value="gmail.com">gmail.com</option>
						<option value="naver.com">naver.com</option>
						<option value="daum.com">daum.com</option>
					</select> -->
				</td>
			</tr>
			<tr>
				<td width="100" align="center">주소</td>
				<td>
					<input type="text" name="zipcode" id="zipcode" readonly style="margin-bottom:5px;"/>
					<input type="button" value="우편번호검색" onclick="checkPost()"/><br>
					<input type="text" id="addr1" name="addr1" readonly placeholder="주소" style="width:330px; margin-bottom:5px;"/><br>
					<input type="text" id="addr2" name="addr2" placeholder="상세주소" style="width:330px;"/>
					
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="회원가입" id="writeBtn"/>
					<input type="reset" value="다시작성">
				</td>
			</tr>
			
		</table>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	div{
	color : red;
	font-size: 8pt;
	margin-left: 3pt;
	}
	table{
	border : 1px solid black;
	border-collapse : collapse;
	}
</style>
</head>
<body>
<h3>글쓰기</h3>
<hr>
<form action="boardWrite.do" method="post" id="boardWriteForm" name="boardWriteForm">
	<table border="1">
		<tr>
			<td width="80" align="center">제목</td>
			<td width="150">
				<input type="text" name="subject" id="subject" style="width: 250px;">
				<div id="subjectDiv"></div>
			</td>
		</tr>
		<tr>
			<td align="center">내용</td>
			<td>
				<textarea cols="30" rows="15" name="content" id="content"></textarea>
				<div id="contentDiv"></div>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="글작성" onclick="boardWriteCheck()">
				<input type="reset" value="다시작성">
			</td>
			
		</tr>
	
	</table>
</form>
<script type="text/javascript">
	function boardWriteCheck() {
		document.getElementById("subjectDiv").innerText="";
		document.getElementById("contentDiv").innerText="";
		
		if(document.getElementById("subject").value==""){
			document.getElementById("subjectDiv").innerText="제목을 입력해주세요.";
			document.boardWriteForm.subject.focus();
		}
		else if(document.getElementById("content").value==""){
			document.getElementById("contentDiv").innerText="내용을 입력해주세요.";
			document.boardWriteForm.content.focus();
		}
		else document.boardWriteForm.submit();
		
	}
</script>
</body>
</html>
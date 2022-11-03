<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	form[name="boardWriteForm"] div{
	color : red;
	font-size: 8pt;
	margin-left: 3pt;
	}
	form[name="boardWriteForm"] table{
	border : 1px solid black;
	border-collapse : collapse;
	}
</style>
</head>
<body>
<h3>글쓰기</h3>
<form id="boardWriteForm" name="boardWriteForm">
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
				<input type="button" value="글작성" id="boardWriteBtn">
				<input type="reset" value="다시작성">
			</td>
			
		</tr>
	
	</table>
</form>
<script type="text/javascript">

$('#boardWriteBtn').click(function(){
	$('#subjectDiv').empty();
	$('#contentDiv').empty();
	
	if($('#subject').val() == ''){
			$('#subjectDiv').text('제목을 입력하세요.');
			$('#subject').focus;
	}else if($('#content').val() == ''){
			$('#contentDiv').text('내용를 입력하세요.');
			$('#content').focus;
	}else{
		
		$.ajax({
			url : '/miniProject_mvc/board/boardWrite.do',
			type : 'post',
			data : $('#boardWriteForm').serialize(),// 주소창과 같이 데이터 담기
			success: function(){
					alert("글작성 완료");
					location.href = '/miniProject_mvc/board/boardList.do?pg=1';
				},
				error : function(err){
					console.log(err);
				}
		});
		
	}
});
</script>
</body>
</html>